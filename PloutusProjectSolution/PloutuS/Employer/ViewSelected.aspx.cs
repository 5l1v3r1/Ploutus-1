using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DA_Ploutos;
using BE_Ploutos;
using BA_Ploutos;

public partial class Employer_ViewSelected : System.Web.UI.Page
{
    DataSet ds;
    DateTime enddate =new DateTime();
    string edate;
    DateTime time;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        BE_ViewSelected beview = new BE_ViewSelected();
        DA_ViewSelected daviewselected = new DA_ViewSelected();
        BA_ViewSelected baviewselected = new BA_ViewSelected();

        txtStartDate.Visible = false;
        txtEndDate.Visible = false;
        string s = Request.QueryString["id"].ToString();
        //SqlCommand cmd = new SqlCommand("spsViewCandidates", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = s;
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        // ds= new DataSet();
        //da.Fill(ds);
        beview.JobID = Convert.ToInt16(s);
        ds = baviewselected.getSelectedCandidates(beview);
        dlUserProfile.DataSource = ds.Tables[0];
        dlUserProfile.DataBind();

    }

    protected void ddlJobType_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (Convert.ToString(ddlJobType.Text) == "Permanent")
        {
            txtStartDate.Visible = true;
            txtEndDate.Visible = false;
        }
        else
        {

            txtStartDate.Visible = true;
            txtEndDate.Visible = true;
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        BE_ViewSelected beviewselected = new BE_ViewSelected();
        BA_ViewSelected baviewselected = new BA_ViewSelected();


        beviewselected.Firstname = ds.Tables[0].Rows[0]["firstname"].ToString();
        beviewselected.Middlename = ds.Tables[0].Rows[0]["middlename"].ToString();
        beviewselected.Lastname = ds.Tables[0].Rows[0]["lastname"].ToString();
        beviewselected.Addressline1 = ds.Tables[0].Rows[0]["addressline1"].ToString();
        beviewselected.Addressline2 = ds.Tables[0].Rows[0]["addressline2"].ToString();
        beviewselected.City = ds.Tables[0].Rows[0]["city"].ToString();
        beviewselected.State = ds.Tables[0].Rows[0]["state"].ToString();
        beviewselected.Zip = ds.Tables[0].Rows[0]["zip"].ToString();
        beviewselected.Phone = ds.Tables[0].Rows[0]["phone"].ToString();
        beviewselected.Mobile = ds.Tables[0].Rows[0]["mobile"].ToString();
        beviewselected.Email = ds.Tables[0].Rows[0]["email"].ToString();
        beviewselected.RecentEmployer = ds.Tables[0].Rows[0]["RecentEmployer"].ToString();
        beviewselected.JobTitle = ds.Tables[0].Rows[0]["JobTitle"].ToString();
        beviewselected.Exp = ds.Tables[0].Rows[0]["Exp"].ToString();
        beviewselected.LegallyUs = ds.Tables[0].Rows[0]["LegallyUs"].ToString();
        beviewselected.Education = ds.Tables[0].Rows[0]["education"].ToString();
        beviewselected.Category = ds.Tables[0].Rows[0]["Category"].ToString();
        beviewselected.Position = ds.Tables[0].Rows[0]["Position"].ToString();
        beviewselected.Company = ds.Tables[0].Rows[0]["company"].ToString();
        beviewselected.Positiongiven = txtPosition.Text;
        beviewselected.Rate = txtRate.Text;
        beviewselected.RateType = ddlRate.SelectedValue;
        beviewselected.Jobtype = ddlJobType.SelectedValue;
        beviewselected.Startdate = Convert.ToDateTime(txtStartDate.Text);        
        beviewselected.Enddate = txtEndDate.Text.ToString();
        beviewselected.Joiningdate = Convert.ToDateTime(txtJoiningDate.Text);
        beviewselected.jobid = ds.Tables[0].Rows[0]["jobid"].ToString();
        beviewselected.Jobseekerid = ds.Tables[0].Rows[0]["id"].ToString();

        baviewselected.submitSelectedCanditates(beviewselected);


        Response.Redirect("~/Employer/SchCandidates.aspx");

    }
}