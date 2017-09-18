using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InnerMasterEmp : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/MarketingLogin.aspx", false);
    }
    protected void lnkChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Marketing/ChangePwd.aspx",false);
    }
}
