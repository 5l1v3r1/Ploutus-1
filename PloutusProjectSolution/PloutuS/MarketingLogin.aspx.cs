using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BE_Ploutos;
using BA_Ploutos;
using BA_Ploutos;
using Encrypt;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserId.Focus();

    }

    protected void Login_Click()
    {

    }

    string userid;
    string password;
    DataSet ds = new DataSet();
    BA_Marketing ba_emplgnemailid = new BA_Marketing();
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (txtUserId.Text != "" && txtPassword.Text != "")
            {
                EncryptDecrypt enc = new EncryptDecrypt();
                //Session["PSEEMAIL"] = txtemailid.Text;
                password = enc.EncryptDecryptString("£", txtPassword.Text);
                userid = txtUserId.Text;

                ds = ba_emplgnemailid.Getmarketingloginbyemailid(userid, password);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["PSMEName"] = ds.Tables[0].Rows[0]["Fname"].ToString() + " " + ds.Tables[0].Rows[0]["Mname"].ToString() + " " + ds.Tables[0].Rows[0]["Lname"].ToString();
                    Session["Fname"] = ds.Tables[0].Rows[0]["Fname"].ToString();
                    Session["PSMEID"] = ds.Tables[0].Rows[0]["id"].ToString();
                    Session["logintime"] = DateTime.Now.ToString();
                    Session["PSMEMAIL"] = ds.Tables[0].Rows[0]["Emailid"].ToString();
                    Session["PSEName"] = Session["PSMEName"].ToString();
                    Session["PSEID"] = Session["PSMEName"].ToString();
                    Session["PSEEMAIL"] = txtUserId.Text;
                    Session["PSLogin"] =  ds.Tables[0].Rows[0]["Role"].ToString();
                    Session["UID"] = userid;
                    Session["MarSessionID"] = ds.Tables[0].Rows[0]["sessionID"].ToString();
                    Response.Redirect("marketing/MarketingHomePage.aspx", false);

                }
                else
                {

                    lblMsg.Text = "Invalid Credentials...";
                }

            }
            else
            {

                lblMsg.Text = "Please enter Emailid & Password...";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NewHome.aspx", false);
    }
}