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
                if (Session["PSJUID"].ToString() != "")
                {



                    DataSet ds = js.GetFullDetails(Session["PSJUID"].ToString());
                    txtFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                    txtMName.Text = ds.Tables[0].Rows[0]["middlename"].ToString();
                    txtLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                    txtAddr1.Text = ds.Tables[0].Rows[0]["addressline1"].ToString();
                    txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                    ddlState.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
                    txtZip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                    txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                    txtMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    //     txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    txtPositions.Text = ds.Tables[0].Rows[0]["PositionsInterested"].ToString();
                    //txtDateAva.Text = ds.Tables[0].Rows[0]["AvailabilityDt1"].ToString();
                    //txtPerSalary.Text = ds.Tables[0].Rows[0]["PermanentSal"].ToString();
                    //txtTemporarySal.Text = ds.Tables[0].Rows[0]["TemporarySal"].ToString();
                    //rdAvailabilityTravel.SelectedValue = ds.Tables[0].Rows[0]["AvailabilityTravel"].ToString();
                    //txtDistance.Text = ds.Tables[0].Rows[0]["Distance"].ToString();
                    //IsCitizen.SelectedValue = ds.Tables[0].Rows[0]["IsCitizen"].ToString();
                    //IsLegal.SelectedValue = ds.Tables[0].Rows[0]["LegallyUs"].ToString();
                    //IsAccomidation.SelectedValue = ds.Tables[0].Rows[0]["IsAccomidation"].ToString();
                    //AppliedPloutus.SelectedValue = ds.Tables[0].Rows[0]["AppliedPloutus"].ToString();
                    //WorkedPloutus.SelectedValue = ds.Tables[0].Rows[0]["WorkedPloutus"].ToString();
                    //ValidDrivingLicense.SelectedValue = ds.Tables[0].Rows[0]["ValidDrivingLicense"].ToString();
                    //HaveTransport.SelectedValue = ds.Tables[0].Rows[0]["HaveTransport"].ToString();
                    //SameDayAssignment.SelectedValue = ds.Tables[0].Rows[0]["SameDayAssignment"].ToString();
                    //LongAssignment.SelectedValue = ds.Tables[0].Rows[0]["LongAssignment"].ToString();
                    //violations.SelectedValue = ds.Tables[0].Rows[0]["violations"].ToString();
                    //Employed.SelectedValue = ds.Tables[0].Rows[0]["Employed"].ToString();
                    //txtAddInfo.Text = ds.Tables[0].Rows[0]["AddInfo"].ToString();
                }
            }



        }
        catch (Exception ex)
        {

        }
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        SaveApplication();
    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        SaveApplication();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {

    }
    private void SaveApplication()
    {
        string Fname = txtFName.Text;
        string MName = txtMName.Text;
        string LName = txtLName.Text;
        string address = txtAddr1.Text;
        string city = txtCity.Text;
        string state = ddlState.SelectedItem.Text;
        string zip = txtZip.Text;
        string phone = txtPhone.Text;
        string mobile = txtMobile.Text;
        //  string email= txtEmail.Text ;
        string positions = txtPositions.Text;
        //string dateava = txtDateAva.Text;
        //string persalary = txtPerSalary.Text;
        //string temporarysal = txtTemporarySal.Text;
        //string dAvailabilityTravel = rdAvailabilityTravel.SelectedValue.ToString(); ;
        //string distance = txtDistance.Text;
        //string IsCitizen1 = IsCitizen.SelectedValue.ToString(); ;
        //string IsLegal1 = IsLegal.SelectedValue.ToString(); ;
        //string IsAccomidation1 = IsAccomidation.SelectedValue.ToString(); ;
        //string AppliedPloutus1 = AppliedPloutus.SelectedValue.ToString(); ;
        //string WorkedPloutus1 = WorkedPloutus.SelectedValue.ToString(); ;
        //string ValidDrivingLicense1 = ValidDrivingLicense.SelectedValue.ToString(); ;
        //string HaveTransport1 = HaveTransport.SelectedValue.ToString(); ;
        //string SameDayAssignment1 = SameDayAssignment.SelectedValue.ToString(); ;
        //string LongAssignment1 = LongAssignment.SelectedValue.ToString(); ;
        //string violations1 = violations.SelectedValue.ToString(); ;
        //string Employed1 = Employed.SelectedValue.ToString(); ;
        //string AddInfo = txtAddInfo.Text;
     //   DataSet ds = js.UpdateApplicationInfo(Fname, MName, LName, address, city, state, zip, phone, mobile, positions, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", Session["PSJUID"].ToString(),1);
    }
}