using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;
using BE_Ploutos;
using BA_Ploutos;
using System.Data;

public partial class JobSeekerForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlForgotpass.Visible = true;
        pnlMsg.Visible = false;
        lblFail.Visible = false;      
    }
    string Password = string.Empty;
    
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    bool messageconfirm = false;
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string EncryptedPwd = EncryptPassword_Client(Session.SessionID.ToString());
        DataSet ds = new DataSet();
        BEMemDetails beMem = new BEMemDetails();
        BAJobSeeker baMem = new BAJobSeeker();
        beMem.email = TextBox2.Text;
        beMem.password = EncryptedPwd;
        ds = baMem.getMemDetails(beMem);
        if (ds.Tables[0].Rows.Count != 0)
        {   
            string result = baMem.ResetPswJobSeeker(beMem);
            if (result == "success")
            {
                messageconfirm = SendMail();
            }
            else
            {
                lblFail.Text = "Your account is not verified. Please activate your account by clicking on the activation link sent to your email.";
            }
        }
        if (messageconfirm == true)
        {
            pnlForgotpass.Visible = false;
            pnlMsg.Visible = true;
            lblSuccess.Visible = true;
            lblFail.Visible = false;
        }
        else
        {
            pnlForgotpass.Visible = true;
            pnlMsg.Visible = true;
            lblSuccess.Visible = false;
            lblFail.Visible = true;
        }

        
    }

    protected Boolean SendMail()
    {
        try
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage(new MailAddress(ConfigurationManager.AppSettings["ReceiverMail"].ToString())
                                       , new MailAddress(TextBox2.Text));
            //System.Net.Mail.MailMessage mailMessage=new System.Net.Mail.MailMessage(new MailAddress("hr@ploutosllc.net"),new MailAddress("pmk.sunil@ymail.com"));

            mailMessage.Subject = "Thank You for Register at ploutuSllc.";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = getEmailBody();
            //mailMessage.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, txtFName.Text + txtPHN.Text + extension));
            System.Net.NetworkCredential networkCredentials = new
            System.Net.NetworkCredential(ConfigurationManager.AppSettings["ReceiverMail"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = ConfigurationManager.AppSettings["Host"].ToString();
            smtpClient.Port = int.Parse(ConfigurationManager.AppSettings["Port"].ToString());
            smtpClient.Send(mailMessage);
            smtpClient.Timeout = 120000;
            //Response.Redirect("EmployerLogin.aspx");
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    private string getEmailBody()
    {
        string body = "<P align='left'>Dear user,</P>" +
            "<p align='left'>Here are your email id and password:</p>" +
        "<p align='left'>Email ID: " + TextBox2.Text + "<br/>" +
        "New Password: " + Session.SessionID.ToString() + "</p>" +
        "<p align='left'>You can login with the above credentials by clicking this link <a href='http://ploutosstaffing.co.nr/ploutos/JobSeekerLogin.aspx'>www.ploutosstaffing.co.nr</a></p>" +
        "<b>NOTE:</b> You can login with the new password and you can change it in your home page."+
        "<br/><br/><hr/>" +
                    "<p align='left' style=\"font-family: calibri\"><b>Disclaimer:</b> If you didn't sign up for a ploutuS, please ignore this e-mail or you can delete the email.This is an auto generated e-mail and request you not to reply. You can contact us by sending an e-mail to <a href='#'>info@ploutuSllc.com</a> for any queries.</p>";
        return body;
    }

    public string EncryptPassword_Client(string pwd)
    {

        //Encrypt the given password, returning an encrypted string

        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        byte[] hashedBytes;
        UTF8Encoding encoder = new UTF8Encoding();

        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(pwd));
        md5Hasher.Clear();

        return System.Convert.ToBase64String(hashedBytes);
        // return hashedBytes.ToString();

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerLogin.aspx", false);
    }
}