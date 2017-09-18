using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;

public partial class Marketing_SchedulesStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    LoadActivities();
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
    }
    private void LoadActivities()
    {
        try
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.GetAllScMrktActivities();
            grdActivities.DataSource = ds1.Tables[0];
            grdActivities.DataBind();
        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
        }
    }
    protected void grdActivities_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void view(object sender, EventArgs e)
    {
        try
        {

            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                BA_Marketingactivities BAmaract = new BA_Marketingactivities();
                Label lbl = (Label)row.Cells[0].FindControl("lblid");
                string id = lbl.Text.ToString();
                ViewState["id"] = id;
                DataSet ds1 = new DataSet();
                ds1 = BAmaract.EditActivities(id);
                txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
                txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
                string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
                txttypeact.Enabled = false;
                txtActdt1.Enabled = false;
                tsActTime1.Enabled = false;
                DateTime dttime = DateTime.Parse(time);
                MKB.TimePicker.TimeSelector.AmPmSpec am_pm;
                if (dttime.ToString("tt") == "AM")
                {
                    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
                }
                else
                {
                    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
                }
                tsActTime1.SetTime(dttime.Hour, dttime.Minute, am_pm);
                txttypeact.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
                mpeshow.Show();
            }
        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
        }
    }
    protected void btnSaveStatus_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlStatus.SelectedIndex != 0)
            {
                lblErrorMsg.Text = "";
                BA_Marketingactivities BAmaract = new BA_Marketingactivities();
                BAmaract.ColseActivity(ViewState["id"].ToString());
                txtActdt1.Text = txtNotes1.Text = txttypeact.Text = "";
                ddlStatus.SelectedIndex = 0;
                LoadActivities();
            }
            else
            {
                lblErrorMsg.Text = "Please Selct Status";
                mpeshow.Show();
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = "Error";
            mpeshow.Show();
        }


    }
    protected void ddlSelecType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlSelecType.SelectedValue == "1")
            {
                pnldate.Visible = false;
                LoadActivities();
            }
            else if (ddlSelecType.SelectedValue == "2")
            {
                pnldate.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            DataSet ds1 = new DataSet();
            ds1=BAmaract.LoadActivitiesByDate(txtDate.Text);
            grdActivities.DataSource = ds1.Tables[0];
            grdActivities.DataBind();
        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
        }
    }
    protected void ddlsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if ((ddlSelecType.SelectedValue == "0" || ddlSelecType.SelectedValue == "1") && ddlsort.SelectedValue != "0")
            {
                BA_Marketingactivities BAmaract = new BA_Marketingactivities();
                DataSet ds1 = new DataSet();
                if (txtDate.Text == "")
                {
                    ds1 = BAmaract.GetAllScMrktActivities();

                }
                else
                {
                    ds1 = BAmaract.LoadActivitiesByDate(txtDate.Text);
                }
                DataTable dt = ds1.Tables[0];
                if (ddlsort.SelectedValue == "1")
                {
                    dt.DefaultView.Sort = "jsname asc";
                }
                else if (ddlsort.SelectedValue == "2")
                {
                    dt.DefaultView.Sort = "jsname desc";
                }
                else if (ddlsort.SelectedValue == "3")
                {
                    dt.DefaultView.Sort = "actdttime asc";

                }
                else if (ddlsort.SelectedValue == "4")
                {
                    dt.DefaultView.Sort = "actdttime desc";
                }
                grdActivities.DataSource = dt;
                grdActivities.DataBind();
            }

            else if (ddlSelecType.SelectedValue == "1" && ddlsort.SelectedValue != "0")
            {
                BA_Marketingactivities BAmaract = new BA_Marketingactivities();
                DataSet ds1 = new DataSet();
                ds1 = BAmaract.GetAllScMrktActivities();
                DataTable dt = ds1.Tables[0];
                if (ddlsort.SelectedValue == "1")
                {
                    dt.DefaultView.Sort = "jsname asc";
                }
                else if (ddlsort.SelectedValue == "2")
                {
                    dt.DefaultView.Sort = "jsname desc";
                }
                else if (ddlsort.SelectedValue == "3")
                {
                    dt.DefaultView.Sort = "actdttime asc";

                }
                else if (ddlsort.SelectedValue == "4")
                {
                    dt.DefaultView.Sort = "actdttime desc";
                }
                grdActivities.DataSource = dt;
                grdActivities.DataBind();
            }


        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
        }
    }
    protected void ddlActivities_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}