using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BE_Ploutos;
using Encrypt;
using System.IO;

public partial class Marketing_ListofActivities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldatalist();
            LoadActivities();
            lblerrmsg.Visible = false;
        }
    }

    private void LoadActivities()
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();
        ds1 = BAmaract.GetAllMArketingActivitiesAlready(ViewState["jsid"].ToString());
        grdActivities.DataSource = ds1.Tables[2];
        grdActivities.DataBind();
    }

    private void filldatalist()
    {
        DataSet ds = new DataSet();
        EncryptDecrypt ency = new EncryptDecrypt();
        BA_Marketingactivities bamarkact = new BA_Marketingactivities();
        ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
        ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        dlMemInfo.DataSource = ds.Tables[0];
        dlMemInfo.DataBind();
    }
    protected void Delete(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((ImageButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            Label lbl = (Label)row.Cells[0].FindControl("lblid");
            int id1 = Convert.ToInt32(lbl.Text.ToString());
            BAmaract.DeletActivityAlready(id1);
            LoadActivities();
        }
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
                ds1 = BAmaract.EditActivitiesAlready(id);
                txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
                txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
                string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
                txttypeact.Enabled = false;
                txtActdt1.Enabled = false;
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
                txttypeact.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
                mpeshow.Show();
            }
        }
        catch (Exception ex)
        {
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
                BAmaract.ColseActivityAlready(ViewState["id"].ToString());
                txtActdt1.Text = txtNotes1.Text = txttypeact.Text = "";
                ddlStatus.SelectedIndex = 0;
                LoadActivities();
            }
            else
            {
                lblErrorMsg.Text = "Please Select Status";
                mpeshow.Show();
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = "Error";
            mpeshow.Show();
        }


    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());        
        if (ds.Tables[1].Rows.Count == 0)
        {
            lblerrmsg.Visible = false;
            BAMarketingact.AceptcandiadteAlready(ViewState["jsid"].ToString());
            lblstatus.Text = "Candidate Accepted";
            lblstatus.ForeColor = System.Drawing.Color.Green;
            if (btnReject.Visible == true && btnAccept.Visible == false)
            {
                Response.Redirect("~/marketing/acceptedcanlistalready.aspx");
            }
            else if (btnReject.Visible == false && btnAccept.Visible == true)
            {
                Response.Redirect("~/marketing/Rejectcanlistalready.aspx");
            }
            else if (btnReject.Visible == true && btnAccept.Visible == true)
            {
                Response.Redirect("~/marketing/Schedulesalready.aspx");
            }
        }
        else
        {
            lblerrmsg.Visible = true;
            lblerrmsg.Text = "Please Close all activities";
        }

    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Rejectcandiadte(ViewState["jsid"].ToString());
        lblstatus.Text = "Candidate Rejected";
        lblstatus.ForeColor = System.Drawing.Color.Red;
        if (btnReject.Visible == true && btnAccept.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlistalready.aspx");
        }
        else if (btnReject.Visible == false && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/Rejectcanlistalready.aspx");
        }
        else if (btnReject.Visible == true && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/Schedulesalready.aspx");
        }

    }
}