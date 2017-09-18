using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

public partial class EmployerLogin : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        txtUId.Focus();
    }

    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());


   
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtUId.Text = string.Empty;
        txtpassword.Text = string.Empty;
        txtUId.Focus();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string str, username, password, cmdstring;
        username = txtUId.Text;
        //password = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpassword.Text, "MD5");
        password = EncryptPassword_Client(txtpassword.Text);
       
        DataSet ds = new DataSet();
        string qry="select * from tblMerchantReg WHERE email ='" + username + "'  and Password = '" + password + "' and ActiveStatus=1 ";
        SqlDataAdapter da = new SqlDataAdapter(qry, conn);
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["PSEName"] = ds.Tables[0].Rows[0]["companyname"].ToString();
            Session["PSEId"] = ds.Tables[0].Rows[0]["id"].ToString();
            Session["PSEMail"] = ds.Tables[0].Rows[0]["email"].ToString();
            Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();

            cmdstring = "update tblMerchantReg set CurrentLogin= '" + DateTime.Now.ToString() + "' where email='" + txtUId.Text + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(cmdstring, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception)
            {
            }
            finally
            {
                conn.Close();
            }

            Response.Redirect("~/Employer/EmployerHomePage.aspx");

        }
        else
        {
            lblMsg.Text = "Invalid Login";

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
}