using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSREmailAct : System.Web.UI.Page
{
    string email = string.Empty;
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmesg.Visible = false;
        if(!IsPostBack)
        {
            email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
            js.UpdateActivation(email);
            lblmesg.Visible = true;
        }
    }
}