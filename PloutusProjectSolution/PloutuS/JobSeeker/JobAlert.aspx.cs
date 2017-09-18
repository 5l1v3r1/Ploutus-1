using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE_Ploutos;
using BA_Ploutos;
using System.Data;

public partial class JobAlert : System.Web.UI.Page
{
    BAEssentials baEss = new BAEssentials();
    BEEssentials beEss;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCategory.DataSource = baEss.getCategories();
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("Select", "Select"));            
            GetJobs();
        }        
    }
    protected void ddlFunctionalArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        beEss = new BEEssentials();
        beEss.catagory = ddlCategory.SelectedValue.ToString();
        ddlFunctionalArea.DataSource = baEss.getFunctionalAreas(beEss);
        ddlFunctionalArea.DataValueField = "funid";
        ddlFunctionalArea.DataTextField = "FuncArea";
        ddlFunctionalArea.DataBind();
        ddlFunctionalArea.Items.Insert(0, new ListItem("Select", "Select"));
    }

    protected void ddlFuncAreaEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        beEss = new BEEssentials();
        beEss.catagory = ddlCategoryEdit.SelectedValue.ToString();
        ddlFuncAreaEdit.DataSource = baEss.getFunctionalAreas(beEss);
        ddlFuncAreaEdit.DataValueField = "funid";
        ddlFuncAreaEdit.DataTextField = "FuncArea";
        ddlFuncAreaEdit.DataBind();
        ddlFuncAreaEdit.Items.Insert(0, new ListItem("Select", "Select"));
        modalEdit.Show();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            BEJobAlerts beJob = new BEJobAlerts();
            BA_JobAlerts baJob = new BA_JobAlerts();
            beJob.jobSeekerID = Session["PSJUID"].ToString();
            beJob.keywords = txtKeywords.Text;
            beJob.location = ddlLocation.SelectedItem.Text;
            beJob.category = ddlCategory.SelectedItem.Text; ;
            beJob.functionalarea = ddlFunctionalArea.SelectedItem.Text;
            beJob.expYears = Convert.ToInt32(ddlYears.SelectedValue);
            beJob.expMonths = Convert.ToInt32(ddlMonths.SelectedValue);
            beJob.type = 1;
            beJob.id = 0;
            baJob.SetJobAlert(beJob);
            txtKeywords.Text = "";
            ddlLocation.SelectedValue = "Select";
            ddlCategory.SelectedValue = "Select";
            ddlMonths.SelectedValue = "-1";
            ddlYears.SelectedValue = "-1";
            ddlFunctionalArea.Items.Clear();
            GetJobs();
            lblmsg.Text = "Job Alert Successfully Created";
        }
        catch(Exception eg)
        {
            throw (eg);
        }
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx", false);
    }
    private void GetJobs()
    {
        BEJobAlerts beJob = new BEJobAlerts();
        BA_JobAlerts baJob = new BA_JobAlerts();
        beJob.jobSeekerID = Session["PSJUID"].ToString();
        beJob.type = 1;
        DataSet ds = new DataSet();
        ds = baJob.GetJobAlerts(beJob);
        dlJobAlerts.DataSource = ds.Tables[0];
        dlJobAlerts.DataBind();
        dlJobAlerts.Visible = true;
    }
    protected void dlJobAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //lblmsg.Text = string.Empty;
        if (e.CommandName.ToString() == "Edit")
        {
            try
            {
                BEJobAlerts bejob = new BEJobAlerts();
                BA_JobAlerts baJob = new BA_JobAlerts();
                beEss = new BEEssentials();
                ddlCategoryEdit.DataSource = baEss.getCategories();
                ddlCategoryEdit.DataValueField = "CategoryID";
                ddlCategoryEdit.DataTextField = "CategoryName";
                ddlCategoryEdit.DataBind();
                ddlCategoryEdit.Items.Insert(0, new ListItem("Select", "Select"));
                bejob.id = int.Parse(e.CommandArgument.ToString());
                ViewState["JobId"] = int.Parse(e.CommandArgument.ToString());
                bejob.type = 1;
                ds = new DataSet();
                ds = baJob.GetJsJobAlertModify(bejob);
                txtKeyword.Text = ds.Tables[0].Rows[0]["Keywords"].ToString();
                ddlStateEdit.SelectedValue = ds.Tables[0].Rows[0]["Location"].ToString();
                ddlCategoryEdit.SelectedValue = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                beEss.catagory = ddlCategoryEdit.SelectedValue.ToString();
                ddlFuncAreaEdit.DataSource = baEss.getFunctionalAreas(beEss);
                ddlFuncAreaEdit.DataValueField = "funid";
                ddlFuncAreaEdit.DataTextField = "FuncArea";
                ddlFuncAreaEdit.DataBind();
                ddlFuncAreaEdit.Items.Insert(0, new ListItem("Select", "Select"));
                ddlFuncAreaEdit.SelectedValue = ds.Tables[0].Rows[0]["funid"].ToString();
                ddlExpFrom.SelectedValue = ds.Tables[0].Rows[0]["YearsExp"].ToString();
                ddlExpTo.SelectedValue = ds.Tables[0].Rows[0]["MonthsExp"].ToString();
                modalEdit.Show();
                
            }
            catch (Exception ex)
            { }
        }
        if (e.CommandName.ToString() == "Delete")
        {
            try
            {
                BEJobAlerts bejob = new BEJobAlerts();
                BA_JobAlerts baJob = new BA_JobAlerts();
                bejob.id = int.Parse(e.CommandArgument.ToString());
                string result = baJob.DeleteJsJobAlert(bejob);
                if (result == "Success")
                {
                    lblmsg.Text = "Job ALert deleted";
                    GetJobs();
                }
                else
                {
                    lblmsg.Text = "Job ALert not deleted";
                }
            }
            catch (Exception ex1)
            {
 
            }
        }
        if(e.CommandName.ToString() == "View")
        {
            try
            {
                BEJobAlerts bejob = new BEJobAlerts();
                BA_JobAlerts baJob = new BA_JobAlerts();
                bejob.id = int.Parse(e.CommandArgument.ToString());
                bejob.type = 1;
                ViewState["JobId"] = int.Parse(e.CommandArgument.ToString());
                ds = new DataSet();
                ds = baJob.GetJsJobAlertModify(bejob);
                dlistJobAlertView.DataSource = ds.Tables[0];
                dlistJobAlertView.DataBind();
                modalViewAlert.Show();
            }
            catch (Exception exe)
            {
            }
        }
    }
    protected void dlJobAlerts_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void dlJobAlerts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dlJobAlerts.PageIndex = e.NewPageIndex;
        GetJobs();
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        BEJobAlerts beJob = new BEJobAlerts();
        BA_JobAlerts baJob = new BA_JobAlerts();
        beJob.jobSeekerID = Session["PSJUID"].ToString();
        beJob.keywords = txtKeyword.Text;
        beJob.location = ddlStateEdit.SelectedItem.Text;
        beJob.category = ddlCategoryEdit.SelectedItem.Text; ;
        beJob.functionalarea = ddlFuncAreaEdit.SelectedItem.Text;
        beJob.expYears = Convert.ToInt32(ddlExpFrom.SelectedValue);
        beJob.expMonths = Convert.ToInt32(ddlExpTo.SelectedValue);
        beJob.id = int.Parse(ViewState["JobId"].ToString());
        beJob.type = 2;
        baJob.SetJobAlert(beJob);
        txtKeywords.Text = "";
        ddlStateEdit.SelectedValue = "Select";
        ddlCategoryEdit.SelectedValue = "Select";
        ddlExpFrom.SelectedValue = "-1";
        ddlExpTo.SelectedValue = "-1";
        ddlFuncAreaEdit.Items.Clear();
        GetJobs();
        lblmsg.Text = "Job Alert Modified";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //btnSubmit.Visible = true;
        //btnupdate.Visible = false;
        //btnback.Visible = true;
        //btnClear.Visible = false;
        txtKeywords.Text = "";
        ddlLocation.SelectedValue = "Select";
        ddlCategory.SelectedValue = "Select";
        ddlMonths.SelectedValue = "-1";
        ddlYears.SelectedValue = "-1";
        ddlFunctionalArea.Items.Clear();
        //lblmsg.Text = string.Empty;
    }



    protected void dlJobAlerts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}