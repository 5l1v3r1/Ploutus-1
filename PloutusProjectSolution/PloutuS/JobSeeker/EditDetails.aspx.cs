using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BA_Ploutos;
using BE_Ploutos;

public partial class EditDetails : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        BEMemDetails beMem = new BEMemDetails();
        BAJobSeeker baMem = new BAJobSeeker();
        beMem.email = Session["PSJUID"].ToString();
        ds = baMem.getMemCompleteDetails(beMem);
        if (!IsPostBack)
        {
            BindCategory();
            if (ds.Tables[0].Rows.Count != 0)
            {
                txtFName.Focus();
                lblSuccess.Visible = false;
                txtFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                txtMName.Text = ds.Tables[0].Rows[0]["middlename"].ToString();
                txtLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                txtAddr1.Text = ds.Tables[0].Rows[0]["addressline1"].ToString();
                txtAddr2.Text = ds.Tables[0].Rows[0]["addressline2"].ToString();
                txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
                txtZip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                txtMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                if (ds.Tables[0].Rows[0]["LegallyUs"].ToString().Trim() == "Yes")
                {
                    rbLegallyUs.SelectedValue = "Yes";
                }
                else
                {
                    rbLegallyUs.SelectedValue = "No";
                }
                txtMRecentEmployer.Text = ds.Tables[0].Rows[0]["RecentEmployer"].ToString();
                txtJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
                ddlFieldExpertise.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
                ddlYearsExp.SelectedValue = ds.Tables[0].Rows[0]["Exp"].ToString().Split('.')[0];
                string x = ds.Tables[0].Rows[0]["Exp"].ToString();
                string y = string.Empty;
                if (!string.IsNullOrEmpty(x))
                {
                    y = x.Split('.')[1];
                }
                ddlMonthsExp.SelectedValue = y.Trim();
                ddlHEdu.SelectedValue = ds.Tables[0].Rows[0]["edu"].ToString();
                string[] substring = ds.Tables[0].Rows[0]["PreferredLoc"].ToString().Split(',');
                foreach (string str in substring)
                {
                    for (int intItem = 0; intItem <= lbPreLoc.Items.Count - 1; intItem++)
                    {
                        if (lbPreLoc.Items[intItem].Value == str)
                        {
                            lbPreLoc.Items[intItem].Selected = true;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("UserHome.aspx");
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string selectedItem = string.Empty;
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
        BEJobSeeker beDetails = new BEJobSeeker();
        BEMemDetails beMem = new BEMemDetails();
        BAJobSeeker baUpdate = new BAJobSeeker();
        beDetails.firstName = txtFName.Text;
        beDetails.lastName = txtLName.Text;
        beDetails.middleName = txtMName.Text;
        beDetails.address1 = txtAddr1.Text;
        beDetails.address2 = txtAddr2.Text;
        beDetails.city = txtCity.Text;
        beDetails.state = ddlState.SelectedValue;
        beDetails.zip = txtZip.Text;
        beDetails.phone = txtPhone.Text;
        beDetails.mobile = txtMobile.Text;
        beDetails.email = txtEmail.Text;
        beDetails.legallyUs = rbLegallyUs.SelectedValue;
        beDetails.mRecentEmp = txtMRecentEmployer.Text;
        beDetails.jobTitle = txtJobTitle.Text;
        beDetails.HighEdu = ddlHEdu.SelectedValue;
        beDetails.fieldExpertise = ddlFieldExpertise.SelectedValue;
        beDetails.experience = ddlYearsExp.SelectedValue + "." + ddlMonthsExp.SelectedValue;
        beDetails.prefLoc = selectedItem;
        beMem.email = Session["PSJUID"].ToString();
        try
        {
            baUpdate.updateMemReg(beDetails, beMem);
            btnUpdate.Visible = false;
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
            rbLegallyUs.SelectedValue = "";
            txtMRecentEmployer.Text = "";
            txtJobTitle.Text = "";
            ddlFieldExpertise.SelectedIndex = 0;
            ddlMonthsExp.SelectedValue = "-1";
            ddlYearsExp.SelectedValue = "-1";
            lbPreLoc.ClearSelection();
            ddlHEdu.SelectedValue = "-1";
            Response.Redirect("ViewProfile.aspx");

        }
        catch (Exception)
        { }
        finally
        {

        }

    }
    private void BindCategory()
    {

        DataSet ds = new DataSet();
        BAJobSeeker bacat = new BAJobSeeker();
        ds = bacat.GetCatogories();
        ddlFieldExpertise.DataSource = ds.Tables[0];
        ddlFieldExpertise.DataTextField = "CategoryName";
        ddlFieldExpertise.DataValueField = "CategoryName";
        ddlFieldExpertise.DataBind();
        ddlFieldExpertise.Items.Insert(0, new ListItem("Select", "Select"));

        DataSet ds1 = new DataSet();
        ds1 = bacat.GetPreferedLoactions();
        lbPreLoc.DataSource = ds1.Tables[0];
        lbPreLoc.DataTextField = "preloc";
        lbPreLoc.DataValueField = "id";
        lbPreLoc.DataBind();
        lbPreLoc.Items.Insert(0, new ListItem("Select", "Select"));
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Viewprofile.aspx", false);
    }
}