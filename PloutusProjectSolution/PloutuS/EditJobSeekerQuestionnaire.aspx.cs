using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class JobSeekerQuestionnaire : System.Web.UI.Page
{
    string email = string.Empty;
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
       // Session["eid"] = "pv.kumar08@yandex.com";
        email = Session["eid"].ToString();
        //email = "sunil@xyz.com";
        DataSet ds = new DataSet();
        int mode = 1;
        ds = js.JSReview(email, mode);

        //rbPayType.SelectedItem.Text = ds.Tables[0].Rows[0]["paytype"].ToString();
        ddlEdu.SelectedValue = ds.Tables[0].Rows[0]["education"].ToString();
        ddlSecClear.SelectedValue = ds.Tables[0].Rows[0]["SecurityClear"].ToString();
        ddlWorkStatus.SelectedValue = ds.Tables[0].Rows[0]["workstatus"].ToString();
        txtJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
        txtPayRate.Text = ds.Tables[0].Rows[0]["rate"].ToString();
        txtLinkedIn.Text = ds.Tables[0].Rows[0]["LinkedIn"].ToString();
        rbPayType.SelectedValue = ds.Tables[0].Rows[0]["PayType"].ToString();
        }
    }
  
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = js.JSQues(Session["eid"].ToString(), txtJobTitle.Text, txtPayRate.Text, rbPayType.SelectedValue.ToString(), ddlEdu.SelectedValue.ToString(), ddlSecClear.SelectedValue.ToString(), ddlWorkStatus.SelectedValue.ToString(), txtLinkedIn.Text);
        Response.Redirect("JSReview.aspx", false);
    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = js.JSQues(Session["eid"].ToString(), txtJobTitle.Text, txtPayRate.Text, rbPayType.SelectedValue.ToString(), ddlEdu.SelectedValue.ToString(), ddlSecClear.SelectedValue.ToString(), ddlWorkStatus.SelectedValue.ToString(), txtLinkedIn.Text);
       
    }


    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSReview.aspx", false);
    }
}