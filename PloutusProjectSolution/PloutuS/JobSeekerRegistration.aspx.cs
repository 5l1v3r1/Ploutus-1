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
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    SqlCommand cmd;
    DataSet ds = new DataSet();
    BEJobSeeker bereg = new BEJobSeeker();
    BAJobSeeker bareg = new BAJobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session.SessionID.ToString();
        if (!Page.IsPostBack)
        {
            BindCategory();

        }

    }
    private void BindCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter("spsgetCategories", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlFieldExpertise.DataSource = ds.Tables[0];
        ddlFieldExpertise.DataTextField = "CategoryName";
        ddlFieldExpertise.DataValueField = "CategoryName";
        ddlFieldExpertise.DataBind();
        ddlFieldExpertise.Items.Insert(0, new ListItem("Select", "Select"));
        SqlDataAdapter da1 = new SqlDataAdapter("spsgetPreLoc", conn);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        lbPreLoc.DataSource = ds1.Tables[0];
        lbPreLoc.DataTextField = "preloc";
        lbPreLoc.DataValueField = "id";
        lbPreLoc.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (checkFileType(fpResume.FileName))
            {
                if (fpResume.PostedFile.ContentLength <= 1024000)
                {
                    string selectedItem = string.Empty;
                    bereg.tempId = Session.SessionID.ToString();
                    bereg.firstName = txtFName.Text;
                    bereg.middleName = txtMName.Text;
                    bereg.lastName = txtLName.Text;
                    bereg.address1 = txtAddr1.Text;
                    bereg.address2 = txtAddr2.Text;
                    bereg.city = txtCity.Text;
                    bereg.state = ddlState.Text;
                    bereg.zip = txtZip.Text;
                    bereg.phone = txtPhone.Text;
                    bereg.mobile = txtMobile.Text;
                    bereg.email = txtEmail.Text;
                    bereg.legallyUs = rbLegallyUs.SelectedValue.ToString();
                    bereg.mRecentEmp = txtMRecentEmployer.Text;
                    bereg.jobTitle = txtJobTitle.Text;
                    bereg.fieldExpertise = ddlFieldExpertise.SelectedValue.ToString();
                    bereg.experience = ddlYearsExp.SelectedValue.ToString() + "." + ddlMonthsExp.SelectedValue.ToString();
                    if (lbPreLoc.Items.Count > 0)
                    {
                        for (int i = 0; i < lbPreLoc.Items.Count; i++)
                        {
                            if (lbPreLoc.Items[i].Selected)
                            {
                                selectedItem += lbPreLoc.Items[i].Value + ',';
                            }
                        }
                    }
                    selectedItem = selectedItem.Remove(selectedItem.Length - 1);
                    bereg.prefLoc = selectedItem;
                    bereg.HighEdu = ddlHEdu.SelectedValue.ToString();
                    bereg.password = EncryptPassword_Client(txtPassword.Text);
                    bereg.filename = Path.GetExtension(fpResume.FileName).ToLower();
                    string ReturnMsg = bareg.regJobSeeker(bereg);
                    if (ReturnMsg == "Already Exist")
                    {
                        lblMsg.Text = "This Email Already Exist";
                    }
                    else
                    {
                        try
                        {
                            //string[] ext = fpResume.FileName.Split('.');
                            string ext = Path.GetExtension(fpResume.FileName).ToLower();
                            fpResume.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + ReturnMsg + ext);
                            SendMail();
                            lblMsg.Text = "";
                            txtFName.Text = "";
                            txtMName.Text = "";
                            txtLName.Text = "";
                            txtAddr1.Text = "";
                            txtAddr2.Text = "";
                            txtCity.Text = "";
                            ddlState.SelectedIndex = 0;
                            txtZip.Text = "";
                            txtPhone.Text = "";
                            txtMobile.Text = "";
                            txtEmail.Text = "";
                            txtPassword.Text = "";
                            rbLegallyUs.ClearSelection();
                            txtMRecentEmployer.Text = "";
                            txtJobTitle.Text = "";
                            ddlFieldExpertise.SelectedIndex = 0;
                            ddlYearsExp.SelectedIndex = 0;
                            ddlMonthsExp.SelectedIndex = 0;
                            Response.Redirect("Message.aspx", false);

                        }
                        catch (Exception ex)
                        {
                            lblMsg.Text = ex.Message;
                        }
                    }
                    conn.Close();
                }
                else
                {
                    lblMsg.Text = "File size exceeded the maximum size limit. Please upload file having size below 1 megabyte.";
                }
            }
            else
            {
                lblMsg.Text = "Please upload .doc or .docx format files only";
            }
        }
        catch (Exception ex1)
        {
            lblMsg.Text = ex1.Message;
        }
        finally
        {
            conn.Close();
        }
    }

    protected Boolean SendMail()
    {
        try
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage(new MailAddress(ConfigurationManager.AppSettings["ReceiverMail"].ToString()), new MailAddress(txtEmail.Text));
            mailMessage.Subject = "ploutuSllc activation mail.";
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = getEmailBody();
            System.Net.NetworkCredential networkCredentials = new
            System.Net.NetworkCredential(ConfigurationManager.AppSettings["ReceiverMail"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = networkCredentials;
            smtpClient.Host = ConfigurationManager.AppSettings["Host"].ToString();
            smtpClient.Port = int.Parse(ConfigurationManager.AppSettings["Port"].ToString());
            smtpClient.Send(mailMessage);

            return true;
        }
        catch (Exception ex)
        {

            return true;
        }
    }

    private string getEmailBody()
    {
        string body = "<P align='left'>Dear " + txtFName.Text + " </P>" +
                    "<P align='left'><BR>Thanking you for choosing ploutuS to apply for job opportunities. We hope you will have a bright career with our association.</P>" +
                    "<P align='left'>Please find your login information</P>" +
                    "<P align='left'>User id/ email id: " + txtEmail.Text + "<br/>Password: " + txtPassword.Text + "</P>" +
                    "<P align='left'>Please verify your e-mail address to complete your registration by clicking the link below:</P>" +
                    "<P align='left'>Please <A href='http://ploutosstaffing.co.nr/Ploutos/JobSeekerActivation.aspx?id=" + txtEmail.Text + "&id1=" + Session.SessionID.ToString() + "'>Click here</A> to activate your account. </P>" +
                    "<P align='left'>or</P>" +
                    "<P align='left'>Copy and paste the below link to your web browser to activate your account </P> " +
                    "<P align='left'><A href='#'>http://ploutosstaffing.co.nr/Ploutos/JobSeekerActivation.aspx?id=" + txtEmail.Text + "&id1=" + Session.SessionID.ToString() + "</A></P>" +
                    "<br/><P align='left'>Thanks you,</P>" +
                    "<P align='left'>ploutuS staffing solutions</P>" +
                    "<P align='left'>Toll Free - (343)444-4463</P>" +
                    "<br/><br/><hr/>" +
                    "<p align='left' style=\"font-family: calibri\"><b>Disclaimer:</b> If you didn't sign up for a ploutuS, please ignore this e-mail or you can delete the email.This is an auto generated e-mail and request you not to reply. You can contact us by sending an e-mail to <a href='#'>info@ploutuSllc.com</a> for any queries.</p>";

        return body;
        //"<P align='left'><BR>Please use your email address as your login and password:" + password + "</P>" +
        //"<P align='left'><BR>You will have the option to reset your password upon login by clicking on Change Password on top right menu area of landing page.</P>" +
        //"<P align='left'>Thank you<BR>ploutuS MEMBER SERVICES<BR>Toll Free - " + phone + "</P>";
    }


    protected bool checkFileType(string filename)
    {
        return (Path.GetExtension(filename).ToLower() == ".doc" || Path.GetExtension(filename).ToLower() == ".docx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerLogin.aspx", false);
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