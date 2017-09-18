using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;
using Encrypt;
using BA_Ploutos;
using System.Web.Security;
using System.Net;
using BE_Ploutos;
using BA_Ploutos;
public partial class EmployerRegistrationPage : System.Web.UI.Page
{
    string  strQuery1;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    SqlCommand cmd;
    DataSet ds = new DataSet();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            lblsuccess.Visible = false;
            SqlDataAdapter da = new SqlDataAdapter("spGetCategories", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataValueField = "CategoryName";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("----------Select----------", "----------Select----------"));
        }
    }
   protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        try
        {
            BE_ViewSelected beviewselected = new BE_ViewSelected();
            BA_Employer baemp = new BA_Employer();

            beviewselected.Company = txtCompanyName.Text;
            beviewselected.Category= ddlCategory.SelectedValue.ToString();
            beviewselected.Website= txtWebSite.Text;
            beviewselected.Addressline1 = txtAdd1.Text;
            beviewselected.City= txtCity.Text;
            beviewselected.State = ddlState.SelectedItem.Text;
            beviewselected.Zip = txtZip.Text;
            beviewselected.Contact= txtContact.Text;
            beviewselected.Phone= txtContactNumber.Text;
            beviewselected.Mobile = txtMobile.Text;
            beviewselected.Email= txtEmail.Text;
            beviewselected.Role =1;
            beviewselected.RefID = "";
            beviewselected.pwd= "Welcome@123";
            beviewselected.ActiveStatus= 0;
            string ReturnMsg = baemp.empreg(beviewselected);
            if (ReturnMsg == "Email Already Exist")
            {
                lblsuccess.Visible = true;
                lblsuccess.Text = "This Email Already Exist";
            }
            else
            {
                
                strQuery1 = "insert into tblMerchantLastLogin values ( '" + txtEmail.Text + "','" + null + "','" + null + "')";
                cmd = new SqlCommand(strQuery1, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                
                lblsuccess.Visible = true;
                lblsuccess.Text = " Registration successful. Login credentials will send to your mail shortly";
                SendMail();
                Response.Redirect("EmployerRegSuccess.aspx");
                conn.Close();
            }
        }
        catch (Exception ex)
        {

        }
        //finally
        //{
        //    SendMail();
        //    Response.Redirect("EmployerRegSuccess.aspx");
        //    conn.Close();
        //}
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerLogin.aspx");
    }
    protected void SendMail()
    {
        string password="Welcome@123";
        //string password = CreateRandomPassword(10);
        string password1 = EncryptPassword_Client(password);
        ViewState["password"] = password1;
        string email = txtEmail.Text;
        string email1 = EncryptPassword_Client(password);
        BA_Employer baemp = new BA_Employer();
        baemp.updateViamail(email, ViewState["password"].ToString());

        string Message = "<P align='left'>Dear " + txtContact.Text + " </P>" +
                   "<P align='left'><BR>We appreciate you choosing ploutuS to publish your job opportunities globally.</P>" +
                   "<P align='left'><BR>You can verify your job postings immediately on our home page <A href='http://ploutosstaffing.co.nr/Ploutos/'>www.ploutosstaffing.co.nr/ploutos</A> - openings by company.</P>" +
                   "<P align='left'>Please <A href='http://ploutusstaffing.co.nr/Ploutus/ploutus/Activation.aspx?id=" + txtEmail.Text + "&id1=" + password1 + "'>CLICK HERE</A> to activate your account </P>" +
                   "<P align='left'>or</P>" +
                   "<P align='left'>copy and paste the below link to your web browser to activate your account </P> " +
                   "<P align='left'><A href='#'>http://ploutusstaffing.co.nr/Ploutus/Activation.aspx?id=" + txtEmail.Text + "&id1=" + password1 + "</A></P>" +
                   "<P align='left'>Your Organization Details: </P>" +
                   "<P align='left'>" + txtCompanyName.Text + "<BR>" + txtAdd1.Text + " UNITED STATES.<BR>(805)123-1452</P>" +
                   "<P align='left'><BR>Please use your email address as your login and password:" + password + "</P>" +
                   "<P align='left'><BR>You will have the option to reset your password upon login by clicking on Change Password on top right menu area of landing page.</P>" +
                   "<P align='left'>Thank you<BR>ploutuS MEMBER SERVICES<BR>Toll Free - " + txtContactNumber.Text + "</P>";
        string x = Message;
        MailAddress from = new MailAddress(ConfigurationManager.AppSettings["ReceiverMail"].ToString());
        MailAddress to = new MailAddress(txtEmail.Text);
        MailMessage mailMessage = new MailMessage(from, to);
        mailMessage.Subject = "Mail from Ploutus Regarding Registration ";
        mailMessage.IsBodyHtml = true;
        mailMessage.Body = x;
        NetworkCredential networkCredentials = new
        NetworkCredential(ConfigurationManager.AppSettings["ReceiverMail"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
        SmtpClient smtpClient = new SmtpClient();
        smtpClient.EnableSsl = true;
        smtpClient.UseDefaultCredentials = false;
        smtpClient.Credentials = networkCredentials;
        smtpClient.Host = ConfigurationManager.AppSettings["host"].ToString();
        smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"].ToString());
        smtpClient.Send(mailMessage);
       
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