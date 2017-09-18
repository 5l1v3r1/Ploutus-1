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
    BA_jobcatandloc bajobloc = new BA_jobcatandloc();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                Filljobcat();
                //Filljobloc();
            }

        }
        catch (Exception ex)
        {
            Response.Redirect("Index.aspx", false);
        }

    }
    public void Filljobcat()
    {
        ds = bajobloc.getjobcat();
        dlJobPosting.DataSource = ds.Tables[0];
        dlJobPosting.DataBind();
        dlJobPosting1.DataSource = ds.Tables[1];
        dlJobPosting1.DataBind();
    }    
}