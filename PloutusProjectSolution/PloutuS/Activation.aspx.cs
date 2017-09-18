using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using BA_Ploutos;
using Encrypt;
using System.Net;
using System.Security.Cryptography;
using System.Web.Security;


public partial class Activation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
            BA_Employloginbyemailid1 ba_emplgnemailid = new BA_Employloginbyemailid1();
            lnklogin.Visible = false;
            EncryptDecrypt ency = new EncryptDecrypt();
            DataSet ds = new DataSet();
            string id1 = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
            string pass = Request.QueryString["id1"].ToString();
            ds = ba_emplgnemailid.getloginforActivation(id1);
            string password = ds.Tables[0].Rows[0]["Password"].ToString();
            if (pass == password)
            {
                if (ds.Tables[0].Rows[0]["activestatus"].ToString() == "")
                {
                    ba_emplgnemailid.activeCom(id1);
                    lblmesg.Text = "Thanks For Activation";
                    lnklogin.Visible = true;
                }
                else if (ds.Tables[0].Rows[0]["activestatus"].ToString() == "True")
                {
                    lblmesg.Text = "Account Already Activated";
                    lnklogin.Visible = true;
                }
                else if (ds.Tables[0].Rows[0]["activestatus"].ToString() == "False")
                {
                    lblmesg.Text = "Your Account Deactivated";
                    lnklogin.Visible = false;
                }
            }
            else
            {
                lblmesg.Text = "Sorry Error Occured";
            }
        }
        

    }
    protected void lnklogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/employerlogin.aspx", false);
    }
}