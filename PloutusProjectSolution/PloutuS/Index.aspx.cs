using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void imgJsLogin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.Redirect("JobSeekerLogin.aspx", false);
        }
        catch (Exception ex)
        {
        }
    }
    protected void imgEnterprice_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("EmployerLogin.aspx", false);
    }
    protected void imgJSeach_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SearchCategoriesMain.aspx", false);
    }
}