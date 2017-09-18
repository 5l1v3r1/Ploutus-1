using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSRAcknowledgment : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {           
        }
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        int s = js.UpdateFirstUSer(Session["eid"].ToString(),txtsign.Text,Convert.ToDateTime(txtDate.Text));
        try
        {
            SendMailtoUser();
            Response.Redirect("Message.aspx", false);
        }
        catch(Exception ex)
        {
            Response.Redirect("NewHome.aspx", false);
        }
        
       
    }

    private void SendMailtoUser()
    {
        MailMessage mM = new MailMessage();

        //Mail Address
       mM.From = new MailAddress("helpdesk@pi-email.com");
        //receiver email id
       mM.To.Add(Session["eid"].ToString());     
        //subject of the email             
        //deciding for the attachment
        // mM.Attachments.Add(new Attachment(@"C:\\attachedfile.jpg"));
        //add the body of the email
        mM.Subject = "Activation Link";
        mM.Body = "Please click on below link to activate  www.ploutosstaffing.co.nr/ploutuspro/JSRActivation.aspx?Parameter=" + Server.UrlEncode(Session["eid"].ToString())+"";
        mM.IsBodyHtml = true;
        //SMTP client
        SmtpClient sC = new SmtpClient("mail.pi-email.com");
        //SmtpClient sC = new SmtpClient(dt.Rows[0]["client"].ToString());
        //port number for Gmail mail
        sC.Port = 2525;
        //credentials to login in to Gmail account
        sC.Credentials = new NetworkCredential("helpdesk@pi-email.com", "Welcome@123");
        // sC.Credentials = new NetworkCredential(dt.Rows[0]["userid"].ToString(), dt.Rows[0]["password"].ToString());
        //enabled SSL
        sC.EnableSsl = false;
        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        { return true; };
        //Send an email
        sC.Send(mM);
    }
    protected void chk1_CheckedChanged(object sender, EventArgs e)
    {
        if (chk1.Checked == true)
        {
            pnl.Visible = true;
        }
        else
        {
            pnl.Visible = false;
        }
    }
}