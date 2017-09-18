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
 

public partial class Emplogin : System.Web.UI.Page
{

    string userid;
    string password;
    DataSet ds = new DataSet();
    BA_Employloginbyemailid1 ba_emplgnemailid = new BA_Employloginbyemailid1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtemailid.Focus();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        EncryptDecrypt enc = new EncryptDecrypt();       

        Session["PSEEMAIL"] = txtemailid.Text;
        password = txtPassword.Text;
        userid = txtemailid.Text;
        ds = ba_emplgnemailid.Getemploginbyemailid(userid, enc.EncryptDecryptString("£", password));
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["PSEName"] = ds.Tables[0].Rows[0]["firstname"].ToString()+" "+ ds.Tables[0].Rows[0]["middlename"].ToString()+" " + ds.Tables[0].Rows[0]["lastname"].ToString();

            Session["PSEID"] = ds.Tables[0].Rows[0]["id"].ToString();
            Session["PSLogin"] = "2";

            Response.Redirect("ploutos/UserHome.aspx",false);

        }
        else
        {

            lblMsg.Text = "Invalid Credentials...";
        }
    }

}

