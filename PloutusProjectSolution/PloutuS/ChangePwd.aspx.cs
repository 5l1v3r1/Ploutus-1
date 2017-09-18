using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using Encrypt;
using System.Text;
using System.Data;
public partial class ChangePwd : System.Web.UI.Page
{
    string userid;
    string password;
    string newPwd;
    DataSet ds = new DataSet();
    BA_Marketing ba_emplgnemailid = new BA_Marketing();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        EncryptDecrypt enc = new EncryptDecrypt();
        password = enc.EncryptDecryptString("£", txtPwd.Text);
        userid = Session["UID"].ToString();
        ds = ba_emplgnemailid.Getmarketingloginbyemailid(userid, password);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (txtxNewPwd.Text != txtRePassword.Text)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('New Password and Re-Type Password Are Not Matched')", true);
            }
            else
            {
                try
                {
                    newPwd = enc.EncryptDecryptString("£", txtxNewPwd.Text);
                    ba_emplgnemailid.ChangePassword(userid, newPwd);
                    Response.Redirect("~/Marketing/MarketingHomePage.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Successfully')", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Failure')", true);
                }
            }
          

        }
        else 
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Enter Correct Old Password')", true);
        }
       
    }
}