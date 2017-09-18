using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BE_Ploutos;
using BA_Ploutos;


using Encrypt;
using System.Security.Cryptography;
using DA_Ploutos;


public partial class Marketing_AddClients : System.Web.UI.Page
{
  
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblsuccess.Visible = false;
            fillCategories();
            fillLocations();
        }
    }

    private void fillLocations()
    {
        try
        {
            BA_postjobs pst2 = new BA_postjobs();
            //code for selecting location
            DataSet dslocations = new DataSet(); ;
            dslocations = pst2.getLocations();
            ddlLocation.DataSource = dslocations;
            ddlLocation.DataTextField = "PreLoc";
            ddlLocation.DataValueField = "PreLoc";
            ddlLocation.DataBind();
            ddlLocation.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlLocation.Items.Insert(1, new ListItem("--OTHER--", "--OTHER--"));
        }
        catch (Exception ex)
        {
            
        }
    }
    private void fillCategories()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        try
        {
            ds = mar.fillcategory();
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataTextField = "indusname";
            ddlCategory.DataValueField = "indusname";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("----------Select----------", "----------Select----------"));

        }
        catch (Exception ex)
        {

        }
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        try
        {
            BE_Clients beviewselected = new BE_Clients();         
            BA_Clients baClnt = new BA_Clients();

                          
                beviewselected.Company = txtCompanyName.Text;

                if (ddlCategory.SelectedItem.Value == "----------Select----------")
                {
                    beviewselected.Category = "";
                }
                else
                {
                    beviewselected.Category = ddlCategory.SelectedItem.Text.ToString();
                }
                
                beviewselected.Website = txtWebSite.Text;
                beviewselected.Addressline1 = txtAdd1.Text;

                //beviewselected.City = txtCity.Text;
                if (ddlLocation.SelectedItem.Value == "--Select--")
                {
                    beviewselected.State = "";
                }
                else
                {
                    if (ddlLocation.SelectedItem.Value == "--OTHER--")
                    {
                        beviewselected.State = txtNewLoaction.Text.ToString();
                    }
                    else
                    {
                        beviewselected.State = ddlLocation.SelectedItem.Text.ToString();
                    }
                }

                if (beviewselected.State != "" || !string.IsNullOrEmpty(beviewselected.State))
                {
                    // beviewselected.State = ddlState.SelectedItem.Text;
                    beviewselected.Zip = txtZip.Text;
                    beviewselected.Contact = txtContact.Text;
                    beviewselected.Phone = txtContactNumber.Text;
                    beviewselected.Mobile = txtMobile.Text;
                    beviewselected.Email = txtEmail.Text;
                    beviewselected.Role = 1;
                    beviewselected.RefID = "";
                    beviewselected.pwd = "Welcome@123";
                    beviewselected.ActiveStatus = 1;
                    beviewselected.ClientRegBy = Session["PSMEMAIL"].ToString();
                    string ReturnMsg = baClnt.Clientreg(beviewselected);
                    if (ReturnMsg == "Company Already Exist")
                    {
                        lblsuccess.Visible = true;
                        lblsuccess.Text = "This Company Name Already Exist";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Client Name Already Exist')", true);
                    }
                    else
                    {
                        Clearinfo();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Client Registred successful.')", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter the Location.')", true);
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
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLocation.SelectedItem.Value == "--OTHER--".ToString())
        {
            txtNewLoaction.Text = string.Empty;
            txtNewLoaction.Visible = true;         

        }      
        else
        {
            txtNewLoaction.Text = string.Empty;
            txtNewLoaction.Visible = false;
        }
    }
    private void Clearinfo()
    {
        txtCompanyName.Text = string.Empty;
        txtWebSite.Text = string.Empty;
        txtAdd1.Text = string.Empty;
        //txtCity.Text = string.Empty;
        txtZip.Text = string.Empty;
        txtContact.Text = string.Empty;
        txtContactNumber.Text = string.Empty;
        txtMobile.Text = string.Empty;
        txtEmail.Text = string.Empty;
        fillLocations();
        fillCategories();
        lblsuccess.Visible = false;
        txtNewLoaction.Text = string.Empty;
        txtNewLoaction.Visible = false;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddClients.aspx", true);
        Clearinfo();
    }
    protected void SendMail()
    {
        //string password = "Welcome@123";
        ////string password = CreateRandomPassword(10);
        //string password1 = EncryptPassword_Client(password);
        //ViewState["password"] = password1;
        //string email = txtEmail.Text;
        //string email1 = EncryptPassword_Client(password);
        //BA_Employer baemp = new BA_Employer();
        //baemp.updateViamail(email, ViewState["password"].ToString());

        //string Message = "<P align='left'>Dear " + txtContact.Text + " </P>" +
        //           "<P align='left'><BR>We appreciate you choosing ploutuS to publish your job opportunities globally.</P>" +
        //           "<P align='left'><BR>You can verify your job postings immediately on our home page <A href='http://ploutosstaffing.co.nr/Ploutos/'>www.ploutosstaffing.co.nr/ploutos</A> - openings by company.</P>" +
        //           "<P align='left'>Please <A href='http://ploutusstaffing.co.nr/Ploutus/ploutus/Activation.aspx?id=" + txtEmail.Text + "&id1=" + password1 + "'>CLICK HERE</A> to activate your account </P>" +
        //           "<P align='left'>or</P>" +
        //           "<P align='left'>copy and paste the below link to your web browser to activate your account </P> " +
        //           "<P align='left'><A href='#'>http://ploutusstaffing.co.nr/Ploutus/Activation.aspx?id=" + txtEmail.Text + "&id1=" + password1 + "</A></P>" +
        //           "<P align='left'>Your Organization Details: </P>" +
        //           "<P align='left'>" + txtCompanyName.Text + "<BR>" + txtAdd1.Text + " UNITED STATES.<BR>(805)123-1452</P>" +
        //           "<P align='left'><BR>Please use your email address as your login and password:" + password + "</P>" +
        //           "<P align='left'><BR>You will have the option to reset your password upon login by clicking on Change Password on top right menu area of landing page.</P>" +
        //           "<P align='left'>Thank you<BR>ploutuS MEMBER SERVICES<BR>Toll Free - " + txtContactNumber.Text + "</P>";
        //string x = Message;
        //MailAddress from = new MailAddress(ConfigurationManager.AppSettings["ReceiverMail"].ToString());
        //MailAddress to = new MailAddress(txtEmail.Text);
        //MailMessage mailMessage = new MailMessage(from, to);
        //mailMessage.Subject = "Mail from Ploutus Regarding Registration ";
        //mailMessage.IsBodyHtml = true;
        //mailMessage.Body = x;
        //NetworkCredential networkCredentials = new
        //NetworkCredential(ConfigurationManager.AppSettings["ReceiverMail"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
        //SmtpClient smtpClient = new SmtpClient();
        //smtpClient.EnableSsl = true;
        //smtpClient.UseDefaultCredentials = false;
        //smtpClient.Credentials = networkCredentials;
        //smtpClient.Host = ConfigurationManager.AppSettings["host"].ToString();
        //smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"].ToString());
        //smtpClient.Send(mailMessage);

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