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
using BA_Ploutos;
using BE_Ploutos;
using System.Security.Cryptography;

public partial class JobSeekerLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtEmail.Focus();
        }
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
    protected void btnsubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            BELogin belogin = new BELogin();
            BAJobSeeker balogin = new BAJobSeeker();
            belogin.email = txtEmail.Text;
            belogin.password = EncryptPassword_Client(txtPassword.Text);
            string ReturnMsg = balogin.getLogin(belogin);
            if (ReturnMsg == "Invalid")
            {
                lblMsg.Text = "Invalid Credentials!";
            }
            else if (ReturnMsg == "Inactive")
            {
                lblMsg.Text = "Your account is not activated. Please activate your acount by clicking on the link sent to your email account and then try to login!";
            }
            else
            {
                Session["PSJUID"] = txtEmail.Text;
                Response.Redirect("~/JobSeeker/UserHome.aspx", false);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}