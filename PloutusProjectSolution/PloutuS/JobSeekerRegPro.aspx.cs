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
using System.Security.Cryptography;
using System.IO;
using BA_Ploutos;
using BE_Ploutos;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();

    protected void Page_Load(object sender, EventArgs e)
    {
   
        if(!IsPostBack)
        {

        }
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        string email = txtRegEmail.Text;
        string pwd = EncryptPassword_Client(txtRegPwd.Text);
        int mode = 1;

        //DataSet ds = marclass.GetLogsList(ddlEmailID.SelectedValue, txtFromDate.Text, txtToDate.Text);
        //DataSet ds = new DataSet();
      
        string ReturnMsg = js.JSReg(email, pwd, mode);
        if (ReturnMsg == "Already Exist")
        {
            lblMsg.Text = "This Email Already Exist";
        }
        else
        {
            Session["eid"] = txtRegEmail.Text;
            Response.Redirect("JSUploadCV.aspx?Parameter=" + Server.UrlEncode(ReturnMsg));         
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
           
            string LoginEmail = txtEmail.Text;
            string Loginpwd = EncryptPassword_Client(txtPwd.Text);
            string ReturnMsg = js.getLogin(LoginEmail, Loginpwd);
            if (ReturnMsg == "Invalid")
            {
                lblLogMsg.Text = "Invalid Credentials!";
            }
            else if (ReturnMsg == "Inactive")
            {
                lblLogMsg.Text = "Your account is not activated. Please activate your acount by clicking on the link sent to your email account and then try to login!";
            }
            else
            {
                Session["PSJUID"] = txtEmail.Text;
                if (ReturnMsg == "0")
                {
                    Response.Redirect("~/JobSeeker/ApplicationInfo.aspx", false);
                }
                else
                {
                   // Session["email"]=txt
                    Response.Redirect("~/JobSeeker/UserHome.aspx", false);
                }

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}