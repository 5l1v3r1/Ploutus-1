using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Web.Security;
using BA_Ploutos;
using Encrypt;

public partial class Js_JobCategories : System.Web.UI.Page
{
    DataSet ds;
    BA_JobSeekerCategories bajsjob = new BA_JobSeekerCategories();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                EncryptDecrypt ency = new EncryptDecrypt();
                string CatLoc = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());
                string Type = Request.QueryString["id1"].ToString().Trim();
                FillCategories(CatLoc, Type);
                Session["maincatJ"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());
                Session["maintypeJ"] = Request.QueryString["id1"].ToString().Trim();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("JobSeekerLogin.aspx", false);
        }

    }
    public void FillCategories(string CatLoc, string Type)
    {
        ds = bajsjob.Getjobseekercategories(CatLoc, Type);
        dlJobsBycat.DataSource = ds.Tables[0];
        dlJobsBycat.DataBind();
        dlJobsByState.DataSource = ds.Tables[1];
        dlJobsByState.DataBind();
    }
    protected void lnbtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerCategoriesMain.aspx", false);
    }
}