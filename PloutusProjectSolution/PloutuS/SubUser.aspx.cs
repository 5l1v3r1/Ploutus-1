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
        SqlCommand cmdSub = new SqlCommand("spEmployerReg", conn);
        cmdSub.CommandType = CommandType.StoredProcedure;
        cmdSub.Parameters.Add("@ContactInfo", SqlDbType.NVarChar, 50).Value = txtSubUserName.Text;
        cmdSub.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = txtMobile.Text;
        cmdSub.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = txtEmail.Text;
        cmdSub.Parameters.Add("@CompanyName", SqlDbType.NVarChar, 100).Value = company;
        cmdSub.Parameters.Add("@RefID", SqlDbType.NVarChar, 10).Value = MemID;
        cmdSub.Parameters.Add("@pwd", SqlDbType.NVarChar, 1000).Value = EncryptPassword_Client(txtPassword.Text);
        cmdSub.Parameters.Add("@Role", SqlDbType.Int).Value = 2;
        cmdSub.Parameters.Add("@Category", SqlDbType.NVarChar, 50).Value = Category;
        cmdSub.Parameters.Add("@ContactNum", SqlDbType.NVarChar, 50).Value = ContactNo;
        cmdSub.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = City;
        cmdSub.Parameters.Add("@State", SqlDbType.NVarChar, 50).Value = State;
        cmdSub.Parameters.Add("@ZipCode", SqlDbType.NVarChar, 50).Value = ZipCode;
        cmdSub.Parameters.Add("@Address1", SqlDbType.NVarChar, 100).Value = Address;
        cmdSub.Parameters.Add("@Website", SqlDbType.NVarChar, 100).Value = Website;
        cmdSub.Parameters.Add("@ActiveStatus", SqlDbType.Int).Value = 1;
        conn.Open();
        cmdSub.ExecuteNonQuery();
        lblsuccess.Visible = true;
        lblsuccess.Text = "Sub-User Created Successfully";
        txtSubUserName.Text = "";
        txtEmail.Text = "";
        txtMobile.Text = "";
        conn.Close();
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