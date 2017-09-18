using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class EmployerHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string constrng = ConfigurationManager.AppSettings["connstrng"].ToString();
        DataSet ds = new DataSet();
        SqlDataAdapter da, da1;
        if (!IsPostBack)
        {
            if (Session["PSEName"] != null)
            {
                ds.Tables.Add("tblMerchantReg");
                ds.Tables.Add("tblMerchantLastLogin");
                Label3.Text = Session["PSEName"].ToString();
                lblCurrentLogin.Text = DateTime.Now.ToString();
                SqlConnection conn = new SqlConnection(constrng);
                da = new SqlDataAdapter("select * from tblMerchantReg where id='" + Session["PSEId"].ToString() + "'", conn);
                da.Fill(ds.Tables["tblMerchantReg"]);
                da.Dispose();
                lblCompany.Text ="Welcome to " + ds.Tables["tblMerchantReg"].Rows[0]["companyname"].ToString();
                lblWebsite.Text = ds.Tables["tblMerchantReg"].Rows[0]["Website"].ToString();
                lblContactPerson.Text = ds.Tables["tblMerchantReg"].Rows[0]["ContactPerson"].ToString();
                lblEmail.Text = ds.Tables["tblMerchantReg"].Rows[0]["email"].ToString();
                lblPhone.Text = ds.Tables["tblMerchantReg"].Rows[0]["ContactNo"].ToString();
                lblCreatedDate.Text = ds.Tables["tblMerchantReg"].Rows[0]["RegDate"].ToString();
                lblCurrentLogin.Text = ds.Tables["tblMerchantReg"].Rows[0]["CurrentLogin"].ToString();
                lblLastLogintime.Text = ds.Tables["tblMerchantReg"].Rows[0]["LastLogin"].ToString();

                string username = Session["PSEMail"].ToString();


                SqlCommand cmdrec = new SqlCommand("spsRecentJobs", conn);
                cmdrec.CommandType = CommandType.StoredProcedure;
                cmdrec.Parameters.Add("@company", SqlDbType.NVarChar, 50).Value = Session["PSEName"].ToString();
                SqlDataAdapter dagv = new SqlDataAdapter(cmdrec);
                DataTable dtgv = new DataTable();
                dagv.Fill(dtgv);
                gvRecent.DataSource = dtgv;
                gvRecent.DataBind();
                if (dtgv.Rows.Count == 0)
                {
                    lbmore.Visible = false;
                }
                else
                {
                    lbmore.Visible = true;
                }

                SqlCommand cmdtot = new SqlCommand("spsGetTotalJobs", conn);
                cmdtot.CommandType = CommandType.StoredProcedure;
                cmdtot.Parameters.Add("@company",SqlDbType.NVarChar, 50).Value = Session["PSEName"].ToString();
                SqlDataAdapter datotal = new SqlDataAdapter(cmdtot);
                DataTable dttotal = new DataTable();
                datotal.Fill(dttotal);
                lbltotaljobs.Text = dttotal.Rows[0][0].ToString();



            }
            else
            {
                Response.Redirect("EmployerLogin.aspx");
            }
        }
        
    }
    //protected void btnEdit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Edit details.aspx");
    //}
    protected void btnEditContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerEditDetails.aspx");
    }
    protected void btnchgnpwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployerChangePassword.aspx");
    }
    protected void btnPostJob_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostJob.aspx");
    }
    protected void lbmore_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewJobs.aspx");
    }
}