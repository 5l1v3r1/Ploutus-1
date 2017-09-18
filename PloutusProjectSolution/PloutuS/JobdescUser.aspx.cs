using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Encrypt;
using BA_Ploutos;

public partial class JobdescUser : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    string rowid;
    BA_ViewDetails baview = new BA_ViewDetails();
    SqlCommand cmd;
    SqlDataAdapter daFill;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            EncryptDecrypt ency = new EncryptDecrypt();
            rowid = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());



            if (Request.UrlReferrer.Segments[2].ToString() == "JobSeekerAppliedJobs.aspx")
            {
                btnApply.Visible = false;
                btnback.Visible = false;
            }
            else
            {
                btnApply.Visible = true;
                btnback.Visible = true;
            }


            if (!IsPostBack)
            {
                fillGrid(rowid);
            }


        }
        catch (Exception ex)
        {

        }


    }
    public void fillGrid(string rowid)
    {
        ds = baview.GetDetails(rowid);
        rowid = ds.Tables[0].Rows[0]["ID"].ToString();

        dlJobPosting.DataSource = ds.Tables[0];
        dlJobPosting.DataBind();

        string Query = "select * from tbljobposting where Id= '" + rowid.ToString() + " '";

        daFill = new SqlDataAdapter(Query, conn);
        ds = new DataSet();
        daFill.Fill(ds);

        ViewState["id"] = ds.Tables[0].Rows[0]["ID"];
        string name = ViewState["id"].ToString();

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSearchMain.aspx", false);
    }
    protected void btnApply_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerLogin.aspx", false);
    }
    //protected void btnbackApplied_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("JobSeekerAppliedJobs.aspx", false);
    //}
}