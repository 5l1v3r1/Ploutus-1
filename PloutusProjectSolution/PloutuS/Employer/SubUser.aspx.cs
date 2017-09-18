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
using BA_Ploutos;
using DA_Ploutos;
using BE_Ploutos;
public partial class Employer_SubUser : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    string email;
    string company;
    string MemID;
    string Category;
    string ContactNo;
    string City;
    string State;
    string ZipCode;
    string Address;
    string Website;


    protected void Page_Load(object sender, EventArgs e)
    {
        lblsuccess.Visible = false;
        pnlStatus.Visible = false;
        email = Session["PSEMail"].ToString();

        DA_SubUsers dasubuser = new DA_SubUsers();
        BE_Employer beemp = new BE_Employer();
        BA_SubUsers basub = new BA_SubUsers();
        beemp.Company = email;
        DataSet ds = new DataSet();
        ds = basub.getUserListInSubUser(beemp);

        company = ds.Tables[0].Rows[0]["companyname"].ToString();
        MemID = ds.Tables[0].Rows[0]["MemID"].ToString();
        Category = ds.Tables[0].Rows[0]["Category"].ToString();
        ContactNo = ds.Tables[0].Rows[0]["ContactNo"].ToString();
        City = ds.Tables[0].Rows[0]["City"].ToString();
        State = ds.Tables[0].Rows[0]["State"].ToString();
        ZipCode = ds.Tables[0].Rows[0]["zipcode"].ToString();
        Address = ds.Tables[0].Rows[0]["Address1"].ToString();
        Website = ds.Tables[0].Rows[0]["Website"].ToString();

        // code forchecking number of users
        DataSet dsChk = new DataSet();
        BE_SubUSers besub = new BE_SubUSers();
        besub.MemID = MemID;
        dsChk = basub.getNumUsers(besub);


        if (dsChk.Tables[0].Rows.Count > 1)
        {
            pnl.Visible = false;
            pnlStatus.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BE_ViewSelected beview = new BE_ViewSelected();
        BA_SubUsers basub=new BA_SubUsers();
        beview.Contact = txtSubUserName.Text;
        beview.Mobile = txtMobile.Text;
        beview.Email = txtEmail.Text;
        beview.Company = company;
        beview.RefID = MemID;
        beview.pwd = EncryptPassword_Client(txtPassword.Text); ;
        beview.Role = 2;
        beview.Category = Category;
        beview.Phone = ContactNo;
        beview.City = City;
        beview.State = State;
        beview.Zip = ZipCode;
        beview.Addressline1 = Address;
        beview.Website = Website;
        beview.ActiveStatus = 1;

        string ReturnMsg = basub.SubUserReg(beview);
        if (ReturnMsg == "Email Already Exist")
        {
            lblsuccess.Visible = true;
            lblsuccess.Text = "Email Already Exists....";
            txtEmail.Text = "";
        }
        else
        {
            Response.Redirect("~/Employer/SubUserSucess.aspx");
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employer/EmployerHomePage.aspx");
    }
}