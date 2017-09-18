using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSRApplication : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
   
    protected void Page_Load(object sender, EventArgs e)
    {       
        try
        {
           
            if (!IsPostBack)
            {
                //txtDateAva.Attributes.Add("readonly", "readonly");    

                if (Session["eid"].ToString() != "")
                {
                    DataSet ds = js.GetFullDetails(Session["eid"].ToString());      
                  txtDateAva.Text = Convert.ToString( ds.Tables[0].Rows[0]["AvailabilityDt1"].ToString());
                    txtPerSalary.Text = ds.Tables[0].Rows[0]["PermanentSal"].ToString();
                    txtTemporarySal.Text = ds.Tables[0].Rows[0]["TemporarySal"].ToString();
                    rblTravel.SelectedValue = ds.Tables[0].Rows[0]["AvailabilityTravel"].ToString();
                    txtDistance.Text = ds.Tables[0].Rows[0]["Distance"].ToString();
                    IsCitizen.SelectedValue = ds.Tables[0].Rows[0]["IsCitizen"].ToString();
                    rblLegal.SelectedValue = ds.Tables[0].Rows[0]["LegallyUs"].ToString();
                    rblAge.SelectedValue = ds.Tables[0].Rows[0]["IsAge"].ToString();

                    if (ds.Tables[0].Rows[0]["AppliedPloutus"].ToString()=="Yes")
                    {
                        rbAppliedPloutusYes.Checked = true;
                        txtAppliedPloutuse.Text = ds.Tables[0].Rows[0]["AppliedDt1"].ToString();
                        lblApplied.Visible = true;
                        txtAppliedPloutuse.Visible = true;
                    }
                    else if (ds.Tables[0].Rows[0]["AppliedPloutus"].ToString() == "No")
                    {
                        rbAppliedPloutusNo.Checked = true;
                    }
                    
                    if (ds.Tables[0].Rows[0]["WorkedPloutus"].ToString() == "Yes")
                    {
                        rbWorkedPloutusYes.Checked = true;
                        txtWorkedPloutus.Text = ds.Tables[0].Rows[0]["WorkedDt1"].ToString();
                        lblWorkedPloutus.Visible = true;
                        txtWorkedPloutus.Visible = true;
                    }
                    else if (ds.Tables[0].Rows[0]["WorkedPloutus"].ToString() == "No")
                    {
                        rbWorkedPloutusNo.Checked = true;
                    }            
                  
                    rblValidDrivingLicense.SelectedValue = ds.Tables[0].Rows[0]["ValidDrivingLicense"].ToString();
                    rblHaveTransport.SelectedValue = ds.Tables[0].Rows[0]["HaveTransport"].ToString();
                    rblSameDayAssignment.SelectedValue = ds.Tables[0].Rows[0]["SameDayAssignment"].ToString();
                    rblLongAssignment.SelectedValue = ds.Tables[0].Rows[0]["LongAssignment"].ToString();
                    ddlJobType.SelectedValue = ds.Tables[0].Rows[0]["JobType"].ToString();

                    if (ds.Tables[0].Rows[0]["violations"].ToString() == "Yes")
                    {
                        rbviolationYes.Checked = true;
                        txtViolationDetails.Text = ds.Tables[0].Rows[0]["ViolationDetails"].ToString();
                        lblViolationDetails.Visible = true;
                        txtViolationDetails.Visible = true;
                    }
                    else if (ds.Tables[0].Rows[0]["violations"].ToString() == "No")
                    {
                        rbviolationNo.Checked = true;
                    }

                    if (ds.Tables[0].Rows[0]["Employed"].ToString() == "Yes")
                    {
                        rbEmployedYes.Checked = true;
                        txtRefName.Text = ds.Tables[0].Rows[0]["RefName"].ToString();
                        txtRefRelation.Text = ds.Tables[0].Rows[0]["RefName"].ToString();
                        lblRefName.Visible = true;
                        txtRefName.Visible = true;
                        lblRefRelation.Visible = true;
                        txtRefRelation.Visible = true;
                    }
                    else if (ds.Tables[0].Rows[0]["Employed"].ToString() == "No")
                    {
                        rbEmployedNo.Checked = true;
                    }                      
                    txtAdditionalInfo.Text = ds.Tables[0].Rows[0]["AddInfo"].ToString();
                }
            }



        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert("+ex.ToString()+")", true);
        }
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        SaveApplication();
        Response.Redirect("JSREmergency.aspx", false);
    }

    private void SaveApplication()
    {
        DateTime dateava =Convert.ToDateTime(txtDateAva.Text);
        string persalary = txtPerSalary.Text;
        string temporarysal = txtTemporarySal.Text;
        string dAvailabilityTravel = rblTravel.SelectedValue.ToString(); 
        string distance = txtDistance.Text;
        string IsCitizen1 = IsCitizen.SelectedValue.ToString(); 
        string IsLegal1 = rblLegal.SelectedValue.ToString();
        string age = rblAge.SelectedValue.ToString(); 
        string AppliedPloutus1;
        DateTime dtapplied;
        if(rbAppliedPloutusYes.Checked == true)
        {
            AppliedPloutus1 = "Yes";
            dtapplied = Convert.ToDateTime(txtAppliedPloutuse.Text);
        }
        else 
        {
          //  dtapplied = Convert.ToDateTime( null);
            AppliedPloutus1 = "No";
            dtapplied = DateTime.Now;
        }
        string WorkedPloutus1;
        DateTime dtworked;
        if (rbWorkedPloutusYes.Checked == true)
        {
            WorkedPloutus1 = "Yes";
            dtworked = Convert.ToDateTime(txtWorkedPloutus.Text);
        }
        else
        {
          //  dtworked = Convert.ToDateTime(null);
            WorkedPloutus1 = "No";
            dtworked = DateTime.Now;
        }

        string ValidDrivingLicense1 = rblValidDrivingLicense.SelectedValue.ToString(); 
        string HaveTransport1 = rblHaveTransport.SelectedValue.ToString(); 
        string SameDayAssignment1 = rblSameDayAssignment.SelectedValue.ToString(); 
        string LongAssignment1 = rblLongAssignment.SelectedValue.ToString();
        string jobtype = ddlJobType.SelectedValue.ToString();
        string violations1;
        string ViolationDetails=string.Empty;
        if (rbviolationYes.Checked == true)
        {
            violations1 = "Yes";
             ViolationDetails = txtViolationDetails.Text;
        }
        else
        {
            violations1 = "No";
        }

        string Employed1=string.Empty;
        string RefName = string.Empty;
        string RefRelation = string.Empty;
        if (rbEmployedYes.Checked == true)
        {
            Employed1 = "Yes";
            RefName = txtRefName.Text;
            RefRelation = txtRefRelation.Text;
        }
        else
        {
            Employed1 = "No";
        }     
     
       string AddInfo = txtAdditionalInfo.Text;
       DataSet ds = js.UpdateApplicationInfo1(dateava, persalary, temporarysal, dAvailabilityTravel, distance, IsCitizen1, IsLegal1, age, AppliedPloutus1, dtapplied, WorkedPloutus1, dtworked, ValidDrivingLicense1, HaveTransport1, SameDayAssignment1, LongAssignment1, jobtype, violations1, ViolationDetails, Employed1, RefName, RefRelation, AddInfo, Session["eid"].ToString());
        
     
    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        SaveApplication();
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Information saved successfully')", true);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobSeekerQuestionnaire.aspx", false);
    }
   
    protected void rbAppliedPloutusYes_CheckedChanged(object sender, EventArgs e)
    {
        lblApplied.Visible = true;
        txtAppliedPloutuse.Visible = true;
    }
    protected void rbAppliedPloutusNo_CheckedChanged(object sender, EventArgs e)
    {
        lblApplied.Visible = false;
        txtAppliedPloutuse.Visible = false;
    }
    protected void rbWorkedPloutusYes_CheckedChanged(object sender, EventArgs e)
    {
        lblWorkedPloutus.Visible = true;
        txtWorkedPloutus.Visible = true;
    }
    protected void rbWorkedPloutusNo_CheckedChanged(object sender, EventArgs e)
    {
        lblWorkedPloutus.Visible = false;
        txtWorkedPloutus.Visible = false;
    }
    protected void rbviolationYes_CheckedChanged(object sender, EventArgs e)
    {
        lblViolationDetails.Visible = true;
        txtViolationDetails.Visible = true;
    }
    protected void rbviolationNo_CheckedChanged(object sender, EventArgs e)
    {
        lblViolationDetails.Visible = false;
        txtViolationDetails.Visible = false;
    }
    protected void rbEmployedYes_CheckedChanged(object sender, EventArgs e)
    {
        lblRefName.Visible = true;
        txtRefName.Visible = true;
        lblRefRelation.Visible = true;
        txtRefRelation.Visible = true;
    }
    protected void rbEmployedNo_CheckedChanged(object sender, EventArgs e)
    {
        lblRefName.Visible = false;
        txtRefName.Visible = false;
        lblRefRelation.Visible = false;
        txtRefRelation.Visible = false;
    }
}