using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSREmergency : System.Web.UI.Page
{
    JobSeeker js=new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // Session["eid"] = "pv.kumar08@yandex.com";
           
            if (Session["eid"].ToString() != "")
            {

                DataSet ds = js.GetFullDetails(Session["eid"].ToString());
                txtEmergencyName.Text = ds.Tables[0].Rows[0]["EmergencyName"].ToString();
                txtRelation.Text = ds.Tables[0].Rows[0]["EmergencyRelation"].ToString();
                txtEmergencyPhoneNum.Text = ds.Tables[0].Rows[0]["EmergencyPhone"].ToString();
               
            }
        }
             
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        SaveDetails();
        Response.Redirect("JSReviewEmergency.aspx?Parameter=" + Server.UrlEncode(Session["eid"].ToString()));
    }

    private void SaveDetails()
    {
        DataSet ds = js.UpdateEmergencyDetails(txtEmergencyName.Text, txtRelation.Text, txtEmergencyPhoneNum.Text, Session["eid"].ToString());
    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        SaveDetails();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSReviewEmergency.aspx?Parameter=" + Server.UrlEncode(Session["eid"].ToString()));
    }
}