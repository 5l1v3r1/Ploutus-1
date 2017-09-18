using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encrypt;
using System.IO;
using DA_Ploutos;
using BA_Ploutos;
using System.Data;
using System.Globalization;
using BE_Ploutos;
using DocxToTextDemo;
using System.Configuration;
public partial class Marketing_SelectedHiredCandidateProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
            if(!Page.IsPostBack)
            {
                 load();
                 FillHiredGrid();
                 LoadActivities();
                 ddlSalaryType.Items.Insert(1, new ListItem("--Select--", "--Select--"));
                 ddlSalaryType.Enabled = false;
              //   ddlSalaryType.Items.Insert(1, new ListItem("Day", "Day"));
                // ddlSalaryType.Items.Insert(2, new ListItem("Hours", "Hours"));
                // ddlSalaryType.Items.Insert(3, new ListItem("Month", "Month"));
               
            }
            if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
            {


            }
            else
            {
                Response.Redirect("~/MarketingLogin.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/MarketingLogin.aspx", false);
        }
    }
    public void load()
    {
        try
        {
            EncryptDecrypt ency = new EncryptDecrypt();
            ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
            string jsid = ViewState["jsid"].ToString();
            BA_Marketing mar = new BA_Marketing();
            DataSet ds = new DataSet();
            ds = mar.GetHireCandidateDetails(jsid);
            string date = ds.Tables[0].Rows[0]["AppointingDate"].ToString();
            DateTime dt = Convert.ToDateTime(date);
            txtApnmtDate.Text = dt.ToString("MM/dd/yyyy");
            txtCName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtLocation.Text = ds.Tables[0].Rows[0]["CompanyLocation"].ToString();
            string date1 = ds.Tables[0].Rows[0]["ContractFromDate"].ToString();
            DateTime dt1 = Convert.ToDateTime(date1);
            txtFromDate.Text = dt1.ToString("MM/dd/yyyy");
            txtPosition.Text = ds.Tables[0].Rows[0]["Position"].ToString();
            txtjobType.Text = ds.Tables[0].Rows[0]["JobType"].ToString();
            txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
            ddlSalaryType.SelectedItem.Text = ds.Tables[0].Rows[0]["SalaryType"].ToString();
            string date2 = ds.Tables[0].Rows[0]["ContractToDate"].ToString();
            DateTime dt2 = Convert.ToDateTime(date2);
            txtToDate.Text = dt2.ToString("MM/dd/yyyy");
           
            txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
        }
        catch (Exception ex)
        {
            Response.Redirect("~/MarketingLogin.aspx", false);
        }
 
    }
    protected void edit(object sender, EventArgs e)
    {
        string id;
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);
            lblActivityTitle.Text = "Edit Activity".ToString();
            //  txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            //  txtActdt1.Enabled = true;
            ddlactvities1.Enabled = true;
            txtNotes1.Enabled = true;
            ddlactvities1.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            Button1.Visible = true;
            btnATvSave.Visible = false;
            mpeshow.Show();

        }
    }
    protected void view(object sender, EventArgs e)
    {
        string id;
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);

            lblActivityTitle.Text = "View Activity".ToString();
            //txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            // txtActdt1.Enabled = false;
            ddlactvities1.Enabled = false;
            txtNotes1.Enabled = false;
            // tsActTime1.Enabled = false;
            // DateTime dttime = DateTime.Parse(time);
            //MKB.TimePicker.TimeSelector.AmPmSpec am_pm;
            //if (dttime.ToString("tt") == "AM")
            //{
            //    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
            //}
            //else
            //{
            //    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
            //}
            // tsActTime1.SetTime(dttime.Hour, dttime.Minute, am_pm);
            ddlactvities1.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            Button1.Visible = false;

            mpeshow.Show();
        }
    }
    protected void EditHiredData(object sender, EventArgs e)
    {

        string id;
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DA_hiredprocess daHire = new DA_hiredprocess();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            btnSave.Visible = false;
            btnUpdateHired.Visible = true;
            DataSet ds = new DataSet();

            ds = daHire.EditHiredData(Convert.ToInt32(id));

            txtAppntDate.Enabled = true;
            txtCompanyName.Enabled = true;
            txtCntractFDate.Enabled = true;
            txtCntractTDate.Enabled = true;
            txtgjtype.Enabled = true;
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            ddlSalaryType.Enabled = true;
            txtCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtAppntDate.Text = ds.Tables[0].Rows[0]["AppointingDate"].ToString();
            txtCntractFDate.Text = ds.Tables[0].Rows[0]["ContractFromDate"].ToString();
            txtCntractTDate.Text = ds.Tables[0].Rows[0]["ContractToDate"].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0]["Position"].ToString();
            txtgjtype.Text = ds.Tables[0].Rows[0]["JobType"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
            ddlSalType.SelectedItem.Text = ds.Tables[0].Rows[0]["SalaryType"].ToString();
            
            mdPopHire.Show();



        }



    }

    protected void ViewHierData(object sender, EventArgs e)
    {
        string id;
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DA_hiredprocess daHire = new DA_hiredprocess();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;

            DataSet ds = new DataSet();

            ds = daHire.EditHiredData(Convert.ToInt32(id));

            txtCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtAppntDate.Text = ds.Tables[0].Rows[0]["AppointingDate"].ToString();
            txtCntractFDate.Text = ds.Tables[0].Rows[0]["ContractFromDate"].ToString();
            txtCntractTDate.Text = ds.Tables[0].Rows[0]["ContractToDate"].ToString();
            txtgjtype.Text = ds.Tables[0].Rows[0]["JobType"].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0]["Position"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
            ddlSalType.SelectedItem.Text = ds.Tables[0].Rows[0]["SalaryType"].ToString();


            txtCompanyName.Enabled = false;
            txtAppntDate.Enabled = false;
            txtCntractFDate.Enabled = false;
            txtCntractTDate.Enabled = false;
            txtgjtype.Enabled = false;
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            ddlSalType.Enabled = false;
            btnUpdateHired.Visible = false;
            mdPopHire.Show();

        }

    }
    protected void UpdateHireData(object sender, EventArgs e)
    {


        DA_hiredprocess daEmpHier = new DA_hiredprocess();
        BE_MarketingHiring beHiring = new BE_MarketingHiring();

        daEmpHier.UpdateHiredProfile(ViewState["id"].ToString(), txtCompanyName.Text, Convert.ToDateTime(txtAppntDate.Text), Convert.ToDateTime(txtCntractFDate.Text), Convert.ToDateTime(txtCntractTDate.Text),
           TextBox1.Text, txtgjtype.Text, Convert.ToInt32(TextBox2.Text), ddlSalType.SelectedItem.Text);



        FillHiredGrid();
        load();
        mdPopHire.Hide();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Candidate Updated Successfully')", true);
        //}
    }
    protected void Update(object sender, EventArgs e)
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        // string time = tsActTime1.Hour + ":" + tsActTime1.Minute + " " + tsActTime1.AmPm;
        BAmaract.UpdateActivity(ViewState["id"].ToString(), ddlactvities1.SelectedItem.Text, DateTime.Now.ToString(), "", txtNotes1.Text);
        //lbldone.Text = "Updated Sucessfully";
        LoadActivities();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Updated Successfully')", true);

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        txtApnmtDate.Enabled = true;
        txtCName.Enabled = true;
        txtLocation.Enabled = true;
        txtFromDate.Enabled = true;
        txtName.Enabled = true;
        txtPosition.Enabled = true;
        txtjobType.Enabled = true;
        txtSalary.Enabled = true;
        ddlSalaryType.Enabled = true;
        txtToDate.Enabled = true;
        btnUpdate.Visible = true;

       
    }
    public void FillHiredGrid()
    {


        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillHiredCandidateGridData(ViewState["jsid"].ToString());
        grvHiredata.DataSource = ds.Tables[0];
        grvHiredata.DataBind();



    }
    private void LoadActivities()
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();
        ds1 = BAmaract.GetAllMArketingActivities(ViewState["jsid"].ToString());
        ddlactvities1.DataSource = ds1.Tables[0];
        ddlactvities1.DataTextField = "activities";
        ddlactvities1.DataValueField = "id";
        ddlactvities1.DataBind();

        ddlactvities1.DataSource = ds1.Tables[0];
        ddlactvities1.DataTextField = "activities";
        ddlactvities1.DataValueField = "id";
        ddlactvities1.DataBind();
        grdActivities.DataSource = ds1.Tables[1];
        grdActivities.DataBind();
        ddlactvities1.Items.Insert(0, new ListItem("Select", "Select"));
        ddlactvities1.Items.Insert(0, new ListItem("Select", "Select"));
        ddlactvities1.SelectedIndex = 0;

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            DA_hiredprocess daEmpHier = new DA_hiredprocess();
            BE_MarketingHiring beHiring = new BE_MarketingHiring();

            // BA_Marketingactivities bamarkact = new BA_Marketingactivities();

            beHiring.CompanyName = txtCompanyName.Text;
            beHiring.AppointingDate = Convert.ToDateTime(txtAppntDate.Text);
            beHiring.ContractPodFrom = Convert.ToDateTime(txtCntractFDate.Text);
            beHiring.ContractPodTo = Convert.ToDateTime(txtCntractTDate.Text);
            beHiring.Position = txtPosition.Text;
            beHiring.Salary = Convert.ToInt32(txtSalary.Text);
            beHiring.SalaryType = ddlSalType.SelectedItem.Text;
            beHiring.HiredBy = Session["PSMEName"].ToString();
            beHiring.Jsid = ViewState["jsid"].ToString();


            daEmpHier.InsertHiredPfofile(beHiring);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Candidate Hired Successfully')", true);
            load();
            ClearHiredData();
           // mpedit.Hide();

        }
        catch (Exception ex)
        {
            //  lblsucess.Text = ex.Message;
        }
    }
    public void ClearHiredData()
    {

        txtCompanyName.Text = string.Empty;

        txtAppntDate.Text = string.Empty;
        txtCntractFDate.Text = string.Empty;
        txtCntractTDate.Text = string.Empty;
        txtPosition.Text = string.Empty;
        txtSalary.Text = string.Empty;
        ddlSalType.SelectedItem.Value = "-1";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //if (ddlActivities.SelectedIndex != 0 && txtActdt.Text != "")
            if (ddlactvities1.SelectedIndex != 0)
            {
                TimeZoneInfo timeZoneInfo;
                DateTime cdt;
                //Set the time zone information to US Mountain Standard Time 
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
                //Get date and time in US Mountain Standard Time 
                cdt = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);

                BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
                BE_MarketingActivities BEMarketingAct = new BE_MarketingActivities();

                BEMarketingAct.Jsid = ViewState["jsid"].ToString();
                BEMarketingAct.TypeofAct = ddlactvities1.SelectedItem.ToString();
                BEMarketingAct.Notes = txtNotes1.Text.Trim();
                BEMarketingAct.ActCreatedBy = Session["Fname"].ToString();
                BEMarketingAct.CurrentDT = cdt;
                BAMarketingact.CreateActivity(BEMarketingAct);

                ddlactvities1.SelectedIndex = 0;
                LoadActivities();
                txtNotes1.Text = string.Empty;
                Button1.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Created Activity Successfully')", true);

            }
            else
            {
                if (ddlactvities1.SelectedIndex == 0)
                {
                    // lblActMsg.Text = "Please select Activity Type";
                    // lblActMsg.ForeColor = System.Drawing.Color.Red;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Activity Type')", true);
                }
                else
                {
                    // lblActMsg.ForeColor = System.Drawing.Color.Red;
                    // lblActMsg.Text = "Activity Date is mandatory";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Activity Date is mandatory')", true);
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlSalaryType.SelectedItem.Text != "--Select--" || ddlSalaryType.SelectedItem.Text != "" || ddlSalaryType.SelectedItem.Text != "Select")
            {
                string apnmntdate = txtApnmtDate.Text;
                string cname = txtCName.Text;
                string clocatiion = txtLocation.Text;
                string fromdate = txtFromDate.Text;
                string name = txtName.Text;
                string position = txtPosition.Text;
                string jobType = txtjobType.Text;
                string salary = txtSalary.Text;
                string salarytype = ddlSalaryType.SelectedItem.Text;
                string todate = txtToDate.Text;
                string jsid = ViewState["jsid"].ToString();
                BA_Marketing mar = new BA_Marketing();
                DataSet ds = new DataSet();
                ds = mar.UpdateHireCandidateDetails(jsid, apnmntdate, cname,clocatiion, fromdate, name, position,jobType, salary, salarytype, todate);
                load();
                btnUpdate.Visible = false;
                txtApnmtDate.Enabled = false;
                txtCName.Enabled = false;
                txtLocation.Enabled = false;
                txtFromDate.Enabled = false;
                txtName.Enabled = false;
                txtPosition.Enabled = false;
                txtjobType.Enabled = false;
                txtSalary.Enabled = false;
                ddlSalaryType.Enabled = false;
                txtToDate.Enabled = false;
                btnUpdate.Visible = false;
                FillHiredGrid();
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Updated Successfully');", true);
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Please Select Salary Type');", true);
            }
        }
        catch (Exception ex)
        {
            load();
            btnUpdate.Visible = false;
            txtApnmtDate.Enabled = false;
            txtCName.Enabled = false;
            txtLocation.Enabled = false;
            txtFromDate.Enabled = false;
            txtName.Enabled = false;
            txtPosition.Enabled = false;
            txtSalary.Enabled = false;
            ddlSalaryType.Enabled = false;
            txtToDate.Enabled = false;
            btnUpdate.Visible = false;
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Update Failure');", true);
        }

    }
    public void show()
    {
        string path = ConfigurationManager.AppSettings["Resumes"].ToString() + ViewState["jsid"].ToString() + ".docx";
        DocxToText1 doc1 = new DocxToText1();


        doc1.DocxToText(path);
        string Resumetext = doc1.ExtractText();
        displayResume.InnerHtml = Resumetext;

    }
    protected void btnResume_Click(object sender, EventArgs e)
    {
        show();
        mpeshowResume.Show();
    }
}