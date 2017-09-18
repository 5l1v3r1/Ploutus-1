using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_InnerHeader : System.Web.UI.UserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        // lblTitle.Text = this.lblTitle.ToString();
        Response.AppendHeader("Pragma", "no-cache");
        Response.AppendHeader("Cache-Control", "no-cache");

        Response.CacheControl = "no-cache";
        Response.Expires = -1;

        Response.ExpiresAbsolute = new DateTime(1900, 1, 1);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Response.Cache.SetAllowResponseInBrowserHistory(false);
        Response.Cache.SetNoStore();
        if (!Page.IsPostBack)
        {


        }

      

    }
}