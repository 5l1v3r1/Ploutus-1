using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_Logout : System.Web.UI.Page
{
    Marketing marclass = new Marketing();
    protected void Page_Load(object sender, EventArgs e)
    {
       
       string MarSessionID=  Session["MarSessionID"].ToString();
       string EmailID = Session["PSMEMAIL"].ToString();
       marclass.UpdateLogout(MarSessionID, EmailID);
       Session.Abandon();
       Response.Redirect("../marketinglogin.aspx", false);

    }
}