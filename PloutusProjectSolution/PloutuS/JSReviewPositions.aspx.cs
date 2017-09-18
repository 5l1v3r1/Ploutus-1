using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class JSReviewPositions : System.Web.UI.Page
{

    string email = string.Empty;
    JobSeeker js = new JobSeeker();

    protected void Page_Load(object sender, EventArgs e)
    {
        //email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
        email = Session["eid"].ToString();
        //email = "kumar@ymail.com";

        int mode = 1;
        DataSet ds = new DataSet();
        ds = js.JSReview(email, mode);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lvYourInfo.DataSource = ds.Tables[0];
            lvYourInfo.DataBind();
        }
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSRAck.aspx?Parameter=" + Server.UrlEncode(email));
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSReviewEmergency.aspx?Parameter=" + Server.UrlEncode(email));
    }
    protected void lbPositions_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditJSRPositions.aspx?Parameter=" + Server.UrlEncode(email));
    }
}