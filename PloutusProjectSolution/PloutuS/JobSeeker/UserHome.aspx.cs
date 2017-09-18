using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using Microsoft.Office.Interop.Word;
using BA_Ploutos;
using BE_Ploutos;
using System.Windows.Forms;

public partial class UserHome : System.Web.UI.Page
{
    DataSet ds, dsjob;
    BEJobAlerts beJobAlert = new BEJobAlerts();
    BA_JobAlerts bajob = new BA_JobAlerts();
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            lblResume.Visible = false;
            if (Session["PSJUID"].ToString() != "")
            {
                BEJobSeeker bemem = new BEJobSeeker();
                BAJobSeeker bamem = new BAJobSeeker();
                bemem.email = Session["PSJUID"].ToString();
                ds = new DataSet();
                ds = bamem.GetMemActivity(bemem);

                ViewState["filename"] = ds.Tables[0].Rows[0]["filename"].ToString();
                string username = ds.Tables[0].Rows[0]["username"].ToString();
                Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                ViewState["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                lblUsername.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                lblname.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                Session["LoginTime"] = ds.Tables[2].Rows[0]["LoginTime"].ToString();
                lblLastLoginTime.Text = ds.Tables[2].Rows[0]["LoginTime"].ToString();
                lblLogintime.Text = ds.Tables[1].Rows[0]["IntialLogin"].ToString();
                lblact.Text = ds.Tables[0].Rows[0]["AccountDt"].ToString();

                #region JobAlert
                beJobAlert.jobSeekerID = Session["PSJUID"].ToString();
                beJobAlert.type = 0;
                dsjob = new DataSet();
                dsjob = bajob.GetJobAlerts(beJobAlert);
                if (dsjob.Tables[0].Rows.Count == 0)
                {
                    dlJobAlerts.DataSource = null;
                    dlJobAlerts.DataBind();
                    hpkjobalert.Visible = false;
                }
                else
                {
                    dlJobAlerts.DataSource = dsjob;
                    dlJobAlerts.DataBind();
                }
                #endregion
            }
            else
            {
                Response.Redirect("JobSeekerLogin.aspx", false);
            }
        }
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
                    string path = ConfigurationManager.AppSettings["Resumes"].ToString()+filename;
                    System.IO.FileInfo file = new System.IO.FileInfo(path);
                    if (file.Exists)
                    {
                        try
                        {
                            Response.Redirect("Download.aspx?fName=" + path + "&id=" + ViewState["username"].ToString() + file.Extension, false);
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
    protected void lnkViewResume_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Resumes.aspx?id=" + ViewState["filename"], false);
        try
        {
            txtViewResume.Text = "";
            string connection = conn1 + ViewState["filename"].ToString();
            string connection1 = conn1 + ViewState["filename"].ToString();
            System.IO.FileInfo file2 = new System.IO.FileInfo(connection);
            System.IO.FileInfo file3 = new System.IO.FileInfo(connection1);
            if (file2.Exists)
            {
                ApplicationClass wordApp = new ApplicationClass();

                object file = connection;

                object nullobj = System.Reflection.Missing.Value;

                Microsoft.Office.Interop.Word.Document doc = wordApp.Documents.Open(

                ref file, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj);

                doc.ActiveWindow.Selection.WholeStory();

                doc.ActiveWindow.Selection.Copy();

                string sFileText = doc.Content.Text;

                doc.Close(ref nullobj, ref nullobj, ref nullobj);

                wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);


                txtViewResume.Text = sFileText;
                mpViewResume.Show();



            }
            else if (file3.Exists)
            {
                ApplicationClass wordApp = new ApplicationClass();

                object file = connection1;

                object nullobj = System.Reflection.Missing.Value;

                Microsoft.Office.Interop.Word.Document doc = wordApp.Documents.Open(

                ref file, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj);



                doc.ActiveWindow.Selection.WholeStory();

                doc.ActiveWindow.Selection.Copy();

                string sFileText = doc.Content.Text;

                doc.Close(ref nullobj, ref nullobj, ref nullobj);

                wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);


                txtViewResume.Text = sFileText;
                mpViewResume.Show();
            }
            else
            {
                mpViewResume.Show();
                lblresumeMsg.Text = "Resume Unavailable";
            }
        }
        catch (Exception ex)
        {
            mpViewResume.Show();
            lblresumeMsg.Text = "Error Reading File";
        }
    }
   
}