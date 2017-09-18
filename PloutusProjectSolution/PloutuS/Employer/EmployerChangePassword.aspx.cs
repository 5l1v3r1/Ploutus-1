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

public partial class MerchantChangePassword : System.Web.UI.Page
{
    string pwdstring;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    SqlCommand cmd;
    DataSet ds = new DataSet();

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
            string name = Session["PSEmail"].ToString();
            //string password = FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPassword.Text, "MD5");
            string password = EncryptPassword_Client(txtOldPassword.Text);
            //string NewPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPassword.Text, "MD5");
            string NewPwd = EncryptPassword_Client(txtNewPassword.Text);
            cmd = new SqlCommand("spsEmployerChangePwd", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = name;
            cmd.Parameters.Add("@OldPassword", SqlDbType.VarChar, 100).Value = password;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = NewPwd;
            cmd.Parameters.Add("@Message", SqlDbType.VarChar, 200);
            cmd.Parameters["@Message"].Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            string ReturnMsg = (string)cmd.Parameters["@Message"].Value;
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
                Response.Redirect("UpdateSuccess.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("EmployerLogin.aspx", false);
        }


    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerHomePage.aspx");
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