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
        if (!IsPostBack)
        {
            email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
             //email = "pmksunil@ymail.com";

            //email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
            int mode = 1;
            DataSet ds = new DataSet();
            ds = js.JSReview(email, mode);

            //rbPayType.SelectedItem.Text = ds.Tables[0].Rows[0]["paytype"].ToString();
            ddlEdu.SelectedValue = ds.Tables[0].Rows[0]["education"].ToString();
            ddlSecClear.SelectedValue = ds.Tables[0].Rows[0]["SecurityClear"].ToString();
            ddlWorkStatus.SelectedValue = ds.Tables[0].Rows[0]["workstatus"].ToString();
            txtJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
            txtPayRate.Text = ds.Tables[0].Rows[0]["rate"].ToString();
            txtLinkedIn.Text = ds.Tables[0].Rows[0]["LinkedIn"].ToString();
        }
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
        //email = "pmksunil@ymail.com";
        DataSet ds = new DataSet();

        ds = js.JSQues(email, txtJobTitle.Text, txtPayRate.Text, rbPayType.SelectedValue, ddlEdu.SelectedValue, ddlSecClear.SelectedValue, ddlWorkStatus.SelectedValue, txtLinkedIn.Text);
        Response.Redirect("JSReview.aspx?Parameter=" + Server.UrlEncode(email));
    }
}