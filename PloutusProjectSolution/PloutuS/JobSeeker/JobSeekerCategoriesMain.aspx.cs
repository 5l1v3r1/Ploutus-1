using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Text;
using BA_Ploutos;

public partial class JS_jobcategoryandstate : System.Web.UI.Page
{
    DataSet ds;
    BA_jobseekercatandloc bajobloc = new BA_jobseekercatandloc();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                Filljobcat();
                Filljobloc();
            }

        }
        catch (Exception ex)
        {
            Response.Redirect("~/JobSeekerLogin.aspx", false);
        }

    }
    public void Filljobcat()
    {
        ds = bajobloc.Getjobseekercat();
        dlJobPosting.DataSource = ds.Tables[0];
        dlJobPosting.DataBind();
        dlJobPosting1.DataSource = ds.Tables[1];
        dlJobPosting1.DataBind();
    }
    public void Filljobloc()
    {
        ds = bajobloc.GetJSJobloc();
        dlJobPosting1.DataSource = ds.Tables[0];
        dlJobPosting1.DataBind();
    }
}