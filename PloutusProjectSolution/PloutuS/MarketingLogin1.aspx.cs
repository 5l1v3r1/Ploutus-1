using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Text;
using BA_Ploutos;
using Encrypt;


public partial class Marketing_MarketingLogin : System.Web.UI.Page
{
    string userid;
    string password;
    DataSet ds = new DataSet();
    BA_Marketing ba_emplgnemailid = new BA_Marketing();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        EncryptDecrypt enc = new EncryptDecrypt();

        //Session["PSEEMAIL"] = txtemailid.Text;
        password =enc.EncryptDecryptString("£", txtPassword.Text);
        userid = txtEmail.Text;
       
        ds = ba_emplgnemailid.Getmarketingloginbyemailid(userid, password);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["PSMEName"] = ds.Tables[0].Rows[0]["Fname"].ToString() + " " + ds.Tables[0].Rows[0]["Mname"].ToString() + " " + ds.Tables[0].Rows[0]["Lname"].ToString();
            Session["Fname"] = ds.Tables[0].Rows[0]["Fname"].ToString();
            Session["PSMEID"] = ds.Tables[0].Rows[0]["id"].ToString();

            Session["PSMEMAIL"] = ds.Tables[0].Rows[0]["Emailid"].ToString();

            Session["PSEName"] = Session["PSMEName"].ToString();
            Session["PSEID"] = Session["PSMEName"].ToString();
            Session["PSEEMAIL"] = txtEmail.Text;
            Session["PSLogin"] = "1";
            Session["UID"] = userid;
            Response.Redirect("marketing/MarketingHomePage.aspx", false);

        }
        else
        {

            lblMsg.Text = "Invalid Credentials...";
        }
    }
}