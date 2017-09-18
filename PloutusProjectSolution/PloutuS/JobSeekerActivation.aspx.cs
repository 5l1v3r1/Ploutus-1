using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE_Ploutos;
using BA_Ploutos;

public partial class JobSeekerActivation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            BE_JsAppliedJobs beactivate = new BE_JsAppliedJobs();
            beactivate.email = Request.QueryString["id"].ToString();
            beactivate.JId = Request.QueryString["id1"].ToString();
            BAJobSeeker baactivate = new BAJobSeeker();
            baactivate.ActivateJobSeeker(beactivate);
            
        }
        catch (Exception exe)
        {
            lblConfirmation.Text = "There is a problem in activating your account. Please<br /><a href=\"JobSeekerLogin.aspx\">click here</a> to register with ploutuS LLC.";
        }
        
    }
}