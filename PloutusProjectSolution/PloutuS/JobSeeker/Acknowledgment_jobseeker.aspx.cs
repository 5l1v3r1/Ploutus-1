using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Acknowledgment_jobseeker : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
       // pnl.Visible = false;
       
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {


       // int s = js.UpdateFirstUSer(Session["PSJUID"].ToString());

        Response.Redirect("~/JobSeeker/UserHome.aspx", false);
    }
    protected void chk1_CheckedChanged(object sender, EventArgs e)
    {
        if (chk1.Checked == true)
        {
            pnl.Visible = true;
        }
        else
        {
            pnl.Visible = false;
        }
    }
}