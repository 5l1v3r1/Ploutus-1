using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Security.Cryptography;
using BA_Ploutos;
using BE_Ploutos;

public partial class ChangePassword : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    BAJobSeeker bareg = new BAJobSeeker();
    BE_JSUpdatePassword beJspass = new BE_JSUpdatePassword();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Visible = false;
            lblSuccess.Visible = false;
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        try
        {
            if (txtOldPassword.Text != txtNewPassword.Text)
            {
                beJspass.email = Session["PSJUID"].ToString();
                beJspass.oldpassword = EncryptPassword_Client(txtOldPassword.Text);
                beJspass.password = EncryptPassword_Client(txtNewPassword.Text);
                string ReturnMsg = bareg.UpdateJSpassword(beJspass);
                if (ReturnMsg == "Incorrect")
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Current Password is Invalid";
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Password has been Successfully updated";
                    txtNewPassword.Text = string.Empty;
                    txtOldPassword.Text = string.Empty;
                    txtRePassword.Text = string.Empty;
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Current password and New Password are same";

            }
        }
        catch (Exception)
        {
            Response.Redirect("JobseekerLogin.aspx", false);
        }
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx", false);
    }
    public string EncryptPassword_Client(string pwd)
    {
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        byte[] hashedBytes;
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(pwd));
        md5Hasher.Clear();
        return System.Convert.ToBase64String(hashedBytes);
    }
}