using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSEducation : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if(!IsPostBack)
        {
           // Session["eid"] = "pv.kumar08@yandex.com";

            if (Session["eid"].ToString() != "")
            {
                int year;
                ddlHighYear.Items.Add("---Select---");
                for (year = DateTime.Now.Year - 25; year <= DateTime.Now.Year + 75; year++)
                {
                    ddlHighYear.Items.Add(year.ToString());
                }

                int year1;
                ddlLevelYear.Items.Add("---Select---");
                for (year1 = DateTime.Now.Year - 25; year1 <= DateTime.Now.Year + 75; year1++)
                {
                    ddlLevelYear.Items.Add(year1.ToString());
                }

                DataSet ds = js.GetFullDetails(Session["eid"].ToString());
                ddlHighestEdu.SelectedValue = ds.Tables[0].Rows[0]["HEduType"].ToString();
                txtHighCollegeName.Text = ds.Tables[0].Rows[0]["HCollege"].ToString();
                txtHighCourse.Text = ds.Tables[0].Rows[0]["HCourse"].ToString();
                rblHighGraduated.SelectedValue = ds.Tables[0].Rows[0]["HIsGraduated"].ToString();
                ddlHighYear.SelectedValue = ds.Tables[0].Rows[0]["HYear"].ToString();
                txtHighDiploma.Text = ds.Tables[0].Rows[0]["HDiploma"].ToString();
                ddlLevelEdu.SelectedValue = ds.Tables[0].Rows[0]["LEduType"].ToString();
                txtLevelCollegeName.Text = ds.Tables[0].Rows[0]["LCollege"].ToString();
                txtLevelCourse.Text = ds.Tables[0].Rows[0]["LCourse"].ToString();
                rbLevelGraduated.SelectedValue = ds.Tables[0].Rows[0]["LIsGraduated"].ToString();
                ddlLevelYear.SelectedValue = ds.Tables[0].Rows[0]["LYear"].ToString();
                txtLevelDiploma.Text = ds.Tables[0].Rows[0]["LDiploma"].ToString();
                txtSpecialization.Text = ds.Tables[0].Rows[0]["Specialization"].ToString();
                if (ds.Tables[0].Rows[0]["IsMilitary"].ToString() == "Yes")
                {
                    rbMilitaryYes.Checked = true;
                    txtMilitaryDetails.Text = ds.Tables[0].Rows[0]["MilitaryDetails"].ToString();
                    lblMilitaryDetails.Visible = true;
                    txtMilitaryDetails.Visible = true;
                }
                else if (ds.Tables[0].Rows[0]["IsMilitary"].ToString() == "No")
                {
                    rbMilitaryNo.Checked = true;
                }   
     
            }
            
        }
    }
    protected void rbMilitaryYes_CheckedChanged(object sender, EventArgs e)
    {
        lblMilitaryDetails.Visible = true;
        txtMilitaryDetails.Visible = true;
    }
    protected void rbMilitaryNo_CheckedChanged(object sender, EventArgs e)
    {
        lblMilitaryDetails.Visible = false;
        txtMilitaryDetails.Visible = false;
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        SaveData();
        Response.Redirect("JSReviewEmergency.aspx?Parameter=" + Server.UrlEncode(Session["eid"].ToString()), false);
    }

    private void SaveData()
    {

        string HighestEdu = ddlHighestEdu.SelectedValue.ToString();
        string HighCollegeName = txtHighCollegeName.Text;
        string HighCourse = txtHighCourse.Text;
        string IsGraduated = rblHighGraduated.SelectedValue.ToString();
        string HighYear = ddlHighYear.SelectedValue.ToString();
        string HighDiploma = txtHighDiploma.Text;
        string LevelEdu = ddlLevelEdu.SelectedValue.ToString();
        string LevelCollegeName = txtLevelCollegeName.Text;
        string LevelCourse = txtLevelCourse.Text;
        string LevelGraduated = rbLevelGraduated.SelectedValue.ToString();
        string LevelYear = ddlLevelYear.SelectedValue.ToString();
        string LevelDiploma = txtLevelDiploma.Text;
        string Specialization = txtSpecialization.Text;
        string ISMilitary = string.Empty;     
        string MilitaryDetails=string.Empty;         
       
        if(rbMilitaryYes.Checked == true)
        {
            ISMilitary = "Yes";
            MilitaryDetails = txtMilitaryDetails.Text;
        }
        else if(rbMilitaryNo.Checked == true)
        {
          
            ISMilitary = "No";
            MilitaryDetails = "";
        }    
        DataSet ds=js.UpdateEducation(HighestEdu,HighCollegeName,HighCourse,IsGraduated,HighYear,HighDiploma,LevelEdu,LevelCollegeName,LevelCourse,LevelGraduated,LevelYear,LevelDiploma,Specialization,ISMilitary,MilitaryDetails,Session["eid"].ToString());
         
     
    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSReviewEmergency.aspx?Parameter=" + Server.UrlEncode(Session["eid"].ToString()), false);
    }
}