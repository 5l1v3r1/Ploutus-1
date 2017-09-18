using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data;
using System.Configuration;
using BE_Ploutos;
using BA_Ploutos;

public partial class Edit_details : System.Web.UI.Page
{
    string email;
    string constrng = ConfigurationManager.AppSettings["connstrng"].ToString();
   

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(constrng);
        lblsuccess.Visible = false;
        //btnLogin.Visible = false;
        if (!Page.IsPostBack)
        {
            if (Session["PSEName"] != null)
            {
                DataSet dsload = new DataSet();
                SqlDataAdapter daload,da11;
                dsload.Tables.Add("tblMerchantReg");
                dsload.Tables.Add("tblMerchantLastLogin");
                //Label3.Text = Session["PSEName"].ToString();
                //Label5.Text = DateTime.Now.ToString();
                daload = new SqlDataAdapter("select * from tblMerchantReg where id='" + Session["PSEId"].ToString() + "'", con);
                daload.Fill(dsload.Tables["tblMerchantReg"]);
                daload.Dispose();
                string username = Session["PSEMail"].ToString();
                da11 = new SqlDataAdapter("select lastlogintime from tblMerchantLastLogin where username='" + username + "'", con);
                da11.Fill(dsload.Tables["tblMerchantLastLogin"]);
                da11.Dispose();
                //lblLastLogintime.Text = dsload.Tables["tblMerchantLastLogin"].Rows[0]["lastlogintime"].ToString();
                if (dsload.Tables["tblMerchantLastLogin"].Rows.Count != 0)
                    Session["lastlogin"] = dsload.Tables["tblMerchantLastLogin"].Rows[0]["lastlogintime"].ToString();
                else
                    Session["lastlogin"] = "";
            }
            email = Session["PSEmail"].ToString();
            SqlDataAdapter da1 = new SqlDataAdapter("spGetCategories", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            ddlCategory.DataSource = dt;
            //ddlCategory.Items.Insert(0, new ListItem("Select Category", ""));
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryName";

            ddlCategory.DataBind();

            //string constring = "Data Source=192.168.100.122;user id=sa;password=Connect@123;Initial Catalog=jobportal";
            //SqlConnection con = new SqlConnection(constring);
            con.Open();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("spGetCompanies", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            if (Session["PSEmail"] != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                { 
                    lblID.Text = ds.Tables[0].Rows[0]["MemID"].ToString();
                    ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    //txtCompanyName.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
                    txtContactNumber.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                    txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                    ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
                    txtZip.Text = ds.Tables[0].Rows[0]["zipcode"].ToString();
                    txtAdd1.Text = ds.Tables[0].Rows[0]["Address1"].ToString();
                    txtMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    txtWebSite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
                    txtContact.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
                }
            }

        }
    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerHomePage.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string constring = "Data Source=192.168.100.122;user id=sa;password=Connect@123;Initial Catalog=jobportal";
        SqlConnection con = new SqlConnection(constrng);
        //string insrtstr = "update tblMerchantReg set userid='" + txtUid.Text + "', firstname='" + txtFName.Text + "', lastname='" + txtLastName.Text + "', email='" + txtEmail.Text + "', companyname='" + txtCompanyName.Text + "',phone='" + txtPhone.Text + "',city='" + txtCity.Text + "',state='" + ddlState.SelectedValue + "',zipcode='" + txtZip.Text + "',typeofenquiry='" + ddlenquiry.SelectedValue + "',positions='" + txtPositions.Text + "',hereaboutploutos='" +ddlhearabtploutos.SelectedValue + "',comments='" + txtcomments.Text + "' where userid='" + txtUid.Text + "'";
        //string insrtstr = "update tblMerchantReg set email='" + txtEmail.Text + "', companyname='" + txtCompanyName.Text + "',phone='" + txtPhone.Text + "',city='" + txtCity.Text + "',state='" + ddlState.SelectedValue + "',zipcode='" + txtZip.Text + "' where email='" + txtEmail.Text + "' ";

        BE_ViewSelected beviewselected = new BE_ViewSelected();
        BA_Employer baemp = new BA_Employer();
       
        beviewselected.Email = txtEmail.Text;
        //beviewselected.Company = txtCompanyName.Text;
        beviewselected.Phone = txtContactNumber.Text;
        beviewselected.City= txtCity.Text;
        beviewselected.State = ddlState.SelectedValue;
        beviewselected.Zip = txtZip.Text;
        beviewselected.Addressline1 = txtAdd1.Text;
        beviewselected.Website= txtWebSite.Text;
        beviewselected.Contact = txtContact.Text;
        beviewselected.Mobile = txtMobile.Text;
        beviewselected.Category = ddlCategory.SelectedValue;
        beviewselected.MemID = lblID.Text;

        baemp.editemployee(beviewselected);

        Response.Redirect("UpdateSuccess.aspx");
        //btnLogin.Visible = true;
    }
}