using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;
using System.Security.Cryptography;
using System.Text; 

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    string Password = string.Empty;
    string EncryptedPwd = string.Empty;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //string allowedChars = "";
        //allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
        //allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
        //allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";

        //char[] sep = { ',' };

        //string[] arr = allowedChars.Split(sep);

        //string passwordString = "";

        //string temp = "";

        //Random rand = new Random();

        //for (int i = 0; i < 6; i++)
        //{
        //    temp = arr[rand.Next(0, arr.Length)];
        //    passwordString += temp;
        //}
        //Password = passwordString;
        Password = CreateRandomPassword(10);
        EncryptedPwd=EncryptPassword_Client(Password);

        SqlCommand cmd = new SqlCommand("Update tblMerchantReg set password='" + EncryptedPwd + "' where email='" + TextBox2.Text + "'", conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (SendMail())
        {
            //string message = "Thank You for your Registration. We will send login credentials to your mail shortly";
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append("<script type = 'text/javascript'>");
            //sb.Append("window.onload=function(){");
            //sb.Append("alert('");
            //sb.Append(message);
            //sb.Append("')};");
            //sb.Append("</script>");
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            //lblMsg.Text = "Successfully Uploaded";
            lblSuccess.Visible = true;
        }
        else
        {
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

            mailMessage.Subject = "Thank You for Register at ploutuSllc ";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = getEmailBody();
            //mailMessage.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, txtFName.Text + txtPHN.Text + extension));

            System.Net.NetworkCredential networkCredentials = new
            System.Net.NetworkCredential(ConfigurationManager.AppSettings["ReceiverMail"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = "pod51054.outlook.com";
            smtpClient.Port = 587;
            smtpClient.Send(mailMessage);


            /* Create a new blank MailMessage */
            //System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            //System.Net.Mail.MailAddress fromAddress = new System.Net.Mail.MailAddress("akula.venkateswarao@gmail.com", "venkat");
            //mailMessage.From = fromAddress;
            //mailMessage.To.Add(ConfigurationManager.AppSettings["ReceiverMail"].ToString());

            //mailMessage.Subject = "W2 - " + "" + txtFN.Text+txtLN.Text;
            //mailMessage.Body = getEmailBody();
            //mailMessage.IsBodyHtml = true;

            ///* Attach the newly created email attachment */
            //mailMessage.Attachments.Add(new System.Net.Mail.Attachment(strFileName));

            //System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();

            //smtp.Timeout = 120000;

            //smtp.Send(mailMessage);

            //Response.Redirect("EmployerLogin.aspx");
            return true;
        }
        catch (Exception ex)
        {

            return true;
        }
    }

    private string getEmailBody()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendLine("Your New Password is: "+EncryptedPwd+"<br/>");
        sb.AppendLine("<br/>");
        //sb.AppendLine("<table border='1' cellpadding='2' cellspacing='2'>");
        //sb.AppendLine("<tr><td colspan='2' align='center' style='font-weight: 700;' Height='30px'>Login Details</td></tr>");
        //sb.AppendLine("<tr><td style='width:150px'>User ID </td><td style='font-weight: 500;width:200px;'>" + txtEmail.Text + "</td></tr>");
        //sb.AppendLine("<tr><td style='width:150px'>Password </td><td style='font-weight: 500;width:200px;'>" + Password + "</td></tr>");

        //sb.AppendLine("</table>");


        return sb.ToString();
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
    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ!@#$&";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerLogin.aspx");
    }
}