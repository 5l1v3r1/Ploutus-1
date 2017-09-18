using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Office;
using System.Text.RegularExpressions;
using System.IO;
using System.Configuration;
 

public partial class JobSeekerInfo : System.Web.UI.Page
{
    
    JobSeeker js = new JobSeeker();
    string filename = string.Empty;
    string ext = string.Empty;
    string email = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
       // email = "pmksunil@ymail.com";

        //email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
        int mode = 1;
        DataSet ds = new DataSet();
        ds = js.JSReview(email, mode);

        txtFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
        txtLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
        ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
        txtZipCode.Text = ds.Tables[0].Rows[0]["zip"].ToString();
        txtHomePhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
        txtMobilePhone.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
        txtWorkPhone.Text = ds.Tables[0].Rows[0]["work"].ToString();
        txtAdd1.Text = ds.Tables[0].Rows[0]["addressline1"].ToString();
        txtAdd2.Text = ds.Tables[0].Rows[0]["addressline2"].ToString();
        txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
        }
    }
   



   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       // email = "pmksunil@ymail.com";
        email = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
        DataSet ds = new DataSet();
        ds = js.JSInfoUpdate(email, txtFName.Text, txtLName.Text, txtHomePhone.Text, txtMobilePhone.Text, txtWorkPhone.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, ddlState.SelectedValue.ToString(), txtZipCode.Text);
        Response.Redirect("JSReview.aspx?Parameter=" + Server.UrlEncode(email));
    }
}