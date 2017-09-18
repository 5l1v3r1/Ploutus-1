using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class JobSeeker_JSReview : System.Web.UI.Page
{
    string email = string.Empty;
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
       // email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
        email = Session["eid"].ToString();
        //email = "pv.kumar08@yandex.com";
       
        int mode = 1;
        DataSet ds = new DataSet();
        ds = js.JSReview(email, mode);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lvYourInfo.DataSource = ds.Tables[0];
            lvYourInfo.DataBind();
        }
     
        
    }
    protected void btnComApp_Click(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        int mode = 2;
     

        //Response.Redirect("Message.aspx");
    }
    protected void lbEditApp_Click(object sender, EventArgs e)
    {
        
    }
    protected void lbEditQues_Click(object sender, EventArgs e)
    {

        
    }
    protected void lbEditApp_Click1(object sender, EventArgs e)
    {
        Response.Redirect("EditJobSeekerInfo.aspx?Parameter=" + Server.UrlEncode(email));
    }
    protected void lbEditQues_Click1(object sender, EventArgs e)
    {
        Response.Redirect("EditJobSeekerQuestionnaire.aspx?Parameter=" + Server.UrlEncode(email));
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {

        Response.Redirect("JSReviewApplication.aspx?Parameter=" + Server.UrlEncode(email), false);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSRPositionRef.aspx", false);
    }
}