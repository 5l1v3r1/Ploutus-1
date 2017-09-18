using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Encrypt;
using System.Configuration;
using Microsoft.Office.Interop.Word;


public partial class Employer_ViewCandidates : System.Web.UI.Page
{

    SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    DataSet ds = new DataSet();
    string rowid;
    string s;
    DataSet ds1;
    string username;

    protected void Page_Load(object sender, EventArgs e)
    {
        s = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            //string cmdstring = "select * from tblJobPosting  where ID = '" + s + "'";
            SqlCommand cmd = new SqlCommand("spsViewHiring", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt16(s);
            //cmd.Parameters.Add("@company", SqlDbType.NVarChar, 50).Value = Session["PSEName"].ToString();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            ds1 = new DataSet();
            da.Fill(ds1);
            ViewState["username"] = ds1.Tables[0].Rows[0]["firstname"].ToString();
            ViewState["filename"] = ds1.Tables[0].Rows[0]["filename"].ToString();
            dlUserProfile.DataSource = ds1;
            dlUserProfile.DataBind();
          
            

        }

    }
    protected void btnBackSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("HireCandidates.aspx");
    }
    protected void lbAccept_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmdaccept = new SqlCommand("spsAccept", con);
        cmdaccept.CommandType = CommandType.StoredProcedure;
        cmdaccept.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt16(s);
        cmdaccept.ExecuteNonQuery();
        con.Close();
        Response.Redirect("HireCandidates.aspx");
    }
    protected void lbReject_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmdReject = new SqlCommand("spsReject", con);
        cmdReject.CommandType = CommandType.StoredProcedure;
        cmdReject.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt16(s);
        cmdReject.ExecuteNonQuery();
        con.Close();
        Response.Redirect("HireCandidates.aspx");

    }
    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        try
        {

            if (ViewState["filename"].ToString() != "")
            {
                string filename = ViewState["filename"].ToString();

                if (filename != "")
                {
                    string path = Server.MapPath("~/Jobseeker/MembersResumes/" + filename);
                    System.IO.FileInfo file = new System.IO.FileInfo(path);
                    if (file.Exists)
                    {
                        try
                        {
                            Response.Redirect("~/Jobseeker/Download.aspx?fName=" + path + "&id=" + ViewState["username"].ToString() + file.Extension, false);
                            HttpContext.Current.ApplicationInstance.CompleteRequest();
                            Response.Flush();
                        }
                        catch (Exception ex)
                        { }

                    }
                    else
                    {
                        lblResume.Visible = true;
                        lblResume.Text = "Please Upload New Resume as there is error downloading the file";
                    }
                }
            }
            else
            {
                lblResume.Visible = true;
            }
        }
        catch (Exception ex)
        { }
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        try
        {
            if (ViewState["filename"].ToString() != "")
            {
                string filename = ViewState["filename"].ToString();

                if (filename != "")
                {
                    string path = Server.MapPath("~/Jobseeker/MembersResumes/" + filename);
                    System.IO.FileInfo file = new System.IO.FileInfo(path);
                    if (file.Exists)
                    {
                        ApplicationClass wordApp = new ApplicationClass();
                        object file3 = path;
                        object nullobj = System.Reflection.Missing.Value;
                        Microsoft.Office.Interop.Word.Document docs = wordApp.Documents.Open(
                        ref file3, ref nullobj, ref nullobj,
                        ref nullobj, ref nullobj, ref nullobj,
                        ref nullobj, ref nullobj, ref nullobj,
                        ref nullobj, ref nullobj, ref nullobj,
                        ref nullobj, ref nullobj, ref nullobj, ref nullobj);

                        docs.ActiveWindow.Selection.WholeStory();
                        docs.ActiveWindow.Selection.Copy();
                        string sFileText = docs.Content.Text;
                        docs.Close(ref nullobj, ref nullobj, ref nullobj);
                        wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);
                        txtResume.Text = sFileText;
                        popsystem.Show();
                    }
                }
            }
            else
            {
                lblResume.Visible = true;
                lblResume.Text = "Sorry Resume not availble please upload resume new resume once again";
            }
        }
        catch (Exception ex)
        { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        btCancel.Visible = true;
        popsystem.Hide();
    }
}

