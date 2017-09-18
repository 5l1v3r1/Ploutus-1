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
using BE_Ploutos;

public partial class JobdescUser : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    string rowid;
    BA_JSViewDetails baview = new BA_JSViewDetails();
    BE_JsAppliedJobs  beview=new BE_JsAppliedJobs();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["PSJUID"].ToString() != "")
            {
                EncryptDecrypt ency = new EncryptDecrypt();
                rowid = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());
                string path = Request.UrlReferrer.ToString();
                string[] aray = path.Split('/');
                foreach (string name in aray)
                {
                    string[] temp = name.Split('.');
                    foreach (string pagename in temp)
                    {
                        if (pagename == "JobSeekerAppliedJobs")
                        {
                            btnApply.Visible = false;
                            btnback.Visible = false;
                            btnBackForApplied.Visible = true;
                            if (!IsPostBack)
                            {
                                ViewState["page"] = name;

                            }
                            break;
                        }
                        else if (pagename == "JobSeekerDetails")
                        {
                            btnApply.Visible = true;
                            btnback.Visible = true;
                            btnBackForApplied.Visible = false;
                            if (!IsPostBack)
                            {
                                ViewState["page"] = name;

                            }
                            break;
                        }
                    }
                }
                if (!IsPostBack)
                {
                    fillGrid(rowid);
                }
            }
            else
            {
                Response.Redirect("~/JobseekerLogin.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/JobseekerLogin.aspx", false);
        }
    }
    public void fillGrid(string rowid)
    {
        ds = baview.GetDetails(rowid);
        dlJobPosting.DataSource = ds.Tables[0];
        dlJobPosting.DataBind();
        ViewState["id"] = ds.Tables[0].Rows[0]["ID"];
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        if (ViewState["page"].ToString() == "JobSeekerSearch")
        {
            Response.Redirect("userhome.aspx", false);
        }
        else
        {
            Response.Redirect("JobSeekerCategoriesMain.aspx", false);
        }
    }
    protected void btnApply_Click(object sender, EventArgs e)
    {
        try
        {
            beview.email = Session["PSJUID"].ToString();
            beview.JId = ViewState["id"].ToString();
            string ReturnMsg = baview.GetAppliedJobs(beview);
            if (ReturnMsg == "Applied")
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Already applied for this job";
                btnApply.Enabled = false;
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Successfully applied for the job";
                btnApply.Enabled = false;
            }
        }
        catch
        {
 
        }
    }
    protected void btnbackApplied_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerAppliedJobs.aspx", false);
    }
}