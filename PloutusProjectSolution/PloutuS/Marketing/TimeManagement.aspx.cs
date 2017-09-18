using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BA_Ploutos;
using Encrypt;

public partial class Ploutos_TimeManagement : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;
        if (!Page.IsPostBack)
        {
            BA_Timesheet1 batime = new BA_Timesheet1();
            DataSet ds = new DataSet();
            ds = batime.GetComList();
            ddlcompany.DataSource = ds.Tables[0];
            ddlcompany.DataTextField = "CompanyName";
            ddlcompany.DataValueField = "CompanyName";
            ddlcompany.DataBind();
            ddlcompany.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlusers.DataSource = ds.Tables[1];
            ddlusers.DataTextField = "Name";
            ddlusers.DataValueField = "ConsultantId";
            ddlusers.DataBind();
            ddlusers.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            pnlGrid.Visible = false;
           
        }
    }
    

    protected void ddlcompany_SelectedIndexChanged(object sender, EventArgs e)
    {

        BA_Timesheet1 batine = new BA_Timesheet1();
        DataSet ds = new DataSet();
        string id = ddlcompany.SelectedItem.Text;
        ds = batine.GetUsers(id);

        ddlCompUsers.DataSource = ds;
        ddlCompUsers.DataTextField = "Name";
        ddlCompUsers.DataValueField = "ConsultantId";
        ddlCompUsers.DataBind();
        ddlCompUsers.Items.Insert(0, new ListItem("--Select--", "--Select--"));


    }

    protected void ddlCompUsers_SelectedIndexChanged1(object sender, EventArgs e)
    {
        pnlGrid.Visible = true;
        gridComp.Visible = true;
        BA_Timesheet1 batine = new BA_Timesheet1();
        DataSet ds = new DataSet();
        string id1 = ddlCompUsers.SelectedValue;

        ds = batine.GetTimeSheetInfo(id1);
        gridComp.DataSource = ds;
        gridComp.DataBind();
        ddlCompday.DataSource = ds;
        ddlCompday.DataTextField = "day";
        ddlCompday.DataValueField = "day";
        ddlCompday.DataBind();
        ddlCompday.Items.Insert(0, new ListItem("--Select--", "--Select--"));


    }

    protected void ddlusers_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlGrid.Visible = true;
        gridComp.Visible = true;
        BA_Timesheet1 batine = new BA_Timesheet1();
        DataSet ds = new DataSet();
        string id1 = ddlusers.SelectedValue;

        ds = batine.GetTimeSheetInfo(id1);
        ViewState["CompName"] = ds.Tables[0].Rows[0]["CompanyName"].ToString();
        gridComp.DataSource = ds;
        gridComp.DataBind();

        ddlusersday.DataSource = ds;
        ddlusersday.DataTextField = "day";
        ddlusersday.DataValueField = "day";
        ddlusersday.DataBind();
        ddlusersday.Items.Insert(0, new ListItem("--Select--", "--Select--"));
    }
    protected void TimeSheet_ActiveTabChanged(object sender, EventArgs e)
    {
        gridComp.Visible = false;
        if (TimeSheet.ActiveTabIndex == 0)
        {
            if (ddlCompUsers.SelectedIndex != 0 && ddlcompany.SelectedIndex != 0)
            {
                pnlGrid.Visible = true;
                gridComp.Visible = true;
                BA_Timesheet1 batine = new BA_Timesheet1();
                DataSet ds = new DataSet();
                string id1 = ddlCompUsers.SelectedValue;

                ds = batine.GetTimeSheetInfo(id1);
                gridComp.DataSource = ds;
                gridComp.DataBind();
                ddlCompday.DataSource = ds;
                ddlCompday.DataTextField = "day";
                ddlCompday.DataValueField = "day";
                ddlCompday.DataBind();
                ddlCompday.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            }

        }
        else
        {
            if (ddlusers.SelectedIndex != 0)
            {
                pnlGrid.Visible = true;
                gridComp.Visible = true;
                BA_Timesheet1 batine = new BA_Timesheet1();
                DataSet ds = new DataSet();
                string id1 = ddlusers.SelectedValue;

                ds = batine.GetTimeSheetInfo(id1);
                gridComp.DataSource = ds;
                gridComp.DataBind();

                ddlusersday.DataSource = ds;
                ddlusersday.DataTextField = "day";
                ddlusersday.DataValueField = "day";
                ddlusersday.DataBind();
                ddlusersday.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            }

        }
    }

    protected void btnUsers_Click(object sender, EventArgs e)
    {
        string company = ViewState["CompName"].ToString();
        BA_Timesheet1 batine = new BA_Timesheet1();

        string x = TimeSelector1.Hour.ToString() + ":" + TimeSelector1.Minute.ToString() + TimeSelector1.AmPm;
        string y = TimeSelector2.Hour.ToString() + ":" + TimeSelector2.Minute.ToString() + TimeSelector2.AmPm;
        TimeSpan timediff = Convert.ToDateTime(y) - Convert.ToDateTime(x);
        string timedif = timediff.ToString();
        string[] ar = timedif.Split(':');

        string tt = string.Empty;
        int cnt = 0;
        foreach (string t in ar)
        {
            if (cnt < 2)
            {
                tt = tt + t.ToString() + '.';
                cnt++;
            }
        }
        tt = tt.Remove(tt.Length - 1, 1);
        string totalwork = tt.ToString();
        string d = ddlusersday.SelectedItem.ToString();
        string sid = ddlusers.SelectedValue;

        string worktype = ddluersdayttpe.SelectedItem.ToString();
        if (worktype == "Working")
        {
            batine.InsertTimeSheet(x, y, d, sid, totalwork, worktype, company);
        }
        else if (worktype == "Holiday" || worktype == "Leave")
        {
            batine.InsertTimeSheet(x, y, d, sid, totalwork, worktype, company);
        }

        DataSet ds = new DataSet();
        string id1 = ddlusers.SelectedValue;

        ds = batine.GetTimeSheetInfo(id1);
        gridComp.DataSource = ds;
        gridComp.DataBind();

    }
    protected void btnComp_Click(object sender, EventArgs e)
    {
        string company = ddlcompany.SelectedItem.ToString();
        BA_Timesheet1 batine = new BA_Timesheet1();
        string x = tsTimeIn.Hour.ToString() + ":" + tsTimeIn.Minute.ToString() + tsTimeIn.AmPm;
        string y = tsTimeOut.Hour.ToString() + ":" + tsTimeOut.Minute.ToString() + tsTimeOut.AmPm;
        TimeSpan timediff = Convert.ToDateTime(y) - Convert.ToDateTime(x);
        string timedif = timediff.ToString();
        string[] ar = timedif.Split(':');

        string tt = string.Empty;
        int cnt = 0;
        foreach (string t in ar)
        {
            if (cnt < 2)
            {
                tt = tt + t.ToString() + '.';
                cnt++;
            }
        }
        tt = tt.Remove(tt.Length - 1, 1);
        string totalwork = tt.ToString();
       
        string d = ddlCompday.SelectedItem.ToString();
        string sid = ddlCompUsers.SelectedValue;

        string worktype = ddlCompDayType.SelectedItem.ToString();
        if (worktype == "Working")
        {
            batine.InsertTimeSheet(x, y, d, sid, totalwork, worktype, company);
        }
        else if (worktype == "Holiday" || worktype == "Leave")
        {
            batine.InsertTimeSheet(x, y, d, sid, totalwork, worktype, company);
        }

        DataSet ds = new DataSet();
        string id1 = ddlCompUsers.SelectedValue;
     
        ds = batine.GetTimeSheetInfo(id1);
        gridComp.DataSource = ds;
        gridComp.DataBind();
    }
    protected void edittime(object sender, EventArgs e)
    {
        if (TimeSheet.ActiveTabIndex == 0)
        {
            string sid = ddlCompUsers.SelectedValue;
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                string ids = row.Cells[0].Text;
                DataSet ds3 = new DataSet();
                BA_Timesheet batine = new BA_Timesheet();
                ds3 = batine.GetTimes(sid, ids);
                string timein = ds3.Tables[0].Rows[0]["timein"].ToString();
                if (timein == "Holiday" || timein == "Leave" || timein == "")
                {

                    ddlCompday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();

                }
                else
                {
                    DateTime dttime = DateTime.Parse(timein);
                    MKB.TimePicker.TimeSelector.AmPmSpec am_pm;
                    if (dttime.ToString("tt") == "AM")
                    {
                        am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
                    }
                    else
                    {
                        am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
                    }
                    tsTimeIn.SetTime(dttime.Hour, dttime.Minute, am_pm);
                    ddlCompday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();

                }

                string timeout = ds3.Tables[0].Rows[0]["timeout"].ToString();

                if (timeout == "Holiday" || timeout == "Leave" || timeout == "")
                {
                    ddlCompday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
                }
                else
                {
                    DateTime dtttimeout = DateTime.Parse(timeout);
                    MKB.TimePicker.TimeSelector.AmPmSpec am_pm1;
                    if (dtttimeout.ToString("tt") == "AM")
                    {
                        am_pm1 = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
                    }
                    else
                    {
                        am_pm1 = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
                    }
                    tsTimeOut.SetTime(dtttimeout.Hour, dtttimeout.Minute, am_pm1);
                    ddlCompday.SelectedItem.Text = ds3.Tables[0].Rows[0]["Day"].ToString();
                }
                ddlCompDayType.SelectedValue = ds3.Tables[0].Rows[0]["worktype"].ToString();

            }
        }
        else
        {
            string sid = ddlusers.SelectedValue;
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                string ids = row.Cells[0].Text;
                DataSet ds3 = new DataSet();
                BA_Timesheet batine = new BA_Timesheet();
                ds3 = batine.GetTimes(sid, ids);
                string timein = ds3.Tables[0].Rows[0]["timein"].ToString();
                if (timein == "Holiday" || timein == "Leave" || timein == "")
                {

                    ddlusersday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
                }
                else
                {
                    DateTime dttime = DateTime.Parse(timein);
                    MKB.TimePicker.TimeSelector.AmPmSpec am_pm;
                    if (dttime.ToString("tt") == "AM")
                    {
                        am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
                    }
                    else
                    {
                        am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
                    }
                    TimeSelector1.SetTime(dttime.Hour, dttime.Minute, am_pm);

                    ddlusersday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
                }

                string timeout = ds3.Tables[0].Rows[0]["timeout"].ToString();

                if (timeout == "Holiday" || timeout == "Leave" || timeout == "")
                {


                    ddlusersday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
                }
                else
                {
                    DateTime dtttimeout = DateTime.Parse(timeout);
                    MKB.TimePicker.TimeSelector.AmPmSpec am_pm1;
                    if (dtttimeout.ToString("tt") == "AM")
                    {
                        am_pm1 = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
                    }
                    else
                    {
                        am_pm1 = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
                    }
                    TimeSelector2.SetTime(dtttimeout.Hour, dtttimeout.Minute, am_pm1);
                    ddlusersday.SelectedItem.Text = ds3.Tables[0].Rows[0]["Day"].ToString();
                }

                ddluersdayttpe.SelectedValue = ds3.Tables[0].Rows[0]["worktype"].ToString();
            }

        }
    }
    protected void ddlCompday_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gridComp_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}