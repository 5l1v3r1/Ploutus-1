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
        if (!Page.IsPostBack)
        {
            
            EncryptDecrypt ency = new EncryptDecrypt();

            string id = Session["PSEName"].ToString();
            GetTimeSheetInfo(id);

            // string id = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
            //ds = batine.GetTimeSheetInfo(id);
            //dlTsdet.DataSource = ds;
            //dlTsdet.DataBind();
        }
    }
    protected void GetTimeSheetInfo(string id)
    {
        BA_Timesheet batine = new BA_Timesheet();
        DataSet ds1 = new DataSet();
        ds1 = batine.GetUsers(id);
        ddlusers.DataSource = ds1;
        ddlusers.DataTextField = "firstname";
        ddlusers.DataValueField = "Consultantid";
        ddlusers.DataBind();
        ddlusers.Items.Insert(0, new ListItem("--Select--", "--Select--"));
    }


    protected void ddlusers_SelectedIndexChanged(object sender, EventArgs e)
    {
        BA_Timesheet batine = new BA_Timesheet();
        DataSet ds = new DataSet();
        string id1 = ddlusers.SelectedValue;
        //lblEmpName.Text = ddlusers.SelectedItem.ToString();
        ds = batine.GetTimeSheetInfo(id1);
        dlTsdet.DataSource = ds;
        dlTsdet.DataBind();
        ddlday.DataSource = ds;
        ddlday.DataTextField = "day";
        ddlday.DataValueField = "day";
        ddlday.DataBind();
        ddlday.Items.Insert(0, new ListItem("--Select--", "--Select--"));
        pnlgrid.Visible = true;
    }
   


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string company = Session["PSEName"].ToString();
        BA_Timesheet batine = new BA_Timesheet();
        //DateTime x = Convert.ToDateTime(tsTimeIn.Hour.ToString() + ":" + tsTimeIn.Minute.ToString() + tsTimeIn.AmPm);
        //DateTime y =  Convert.ToDateTime(tsTimeOut.Hour.ToString() + ":" + tsTimeOut.Minute.ToString() + tsTimeOut.AmPm);
        string x = tsTimeIn.Hour.ToString() + ":" + tsTimeIn.Minute.ToString() + tsTimeIn.AmPm;
        string y = tsTimeOut.Hour.ToString() + ":" + tsTimeOut.Minute.ToString() + tsTimeOut.AmPm;
        TimeSpan timediff = Convert.ToDateTime(y) - Convert.ToDateTime(x);
        string timedif = timediff.ToString();
        string[] ar = timedif.Split(':');
        string[] total;
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
        //int val=Convert.ToInt16(timediff.ToString());
        string d = ddlday.SelectedItem.ToString();
        string sid = ddlusers.SelectedValue;
        string worktype = ddlDayType.SelectedItem.ToString();
        //if (worktype=="Working")
        //{
        batine.InsertTimeSheet(x, y, d, sid, totalwork, worktype, company);
        //}
        //else if (worktype=="Holiday" || worktype=="Leave")
        //{
        //    batine.InsertOff(sid,d,worktype);
        //}
        
        DataSet ds = new DataSet();
        string id1 = ddlusers.SelectedValue;
        //lblEmpName.Text = ddlusers.SelectedItem.ToString();
        ds = batine.GetTimeSheetInfo(id1);
        dlTsdet.DataSource = ds;
        dlTsdet.DataBind();
       
    }
    protected void ddlday_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["day"] = ddlday.DataTextField.ToString();

    }

    protected void edittime(object sender, EventArgs e)
    {
        string sid = ddlusers.SelectedValue;
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            string ids = row.Cells[0].Text;
            DataSet ds3 = new DataSet();
            BA_Timesheet batine = new BA_Timesheet();
            ds3 = batine.GetTimes(sid, ids);

            ddlDayType.SelectedValue = ds3.Tables[0].Rows[0]["worktype"].ToString();
            ddlday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
            string timein = ds3.Tables[0].Rows[0]["timein"].ToString();
            if (timein == "Holiday" || timein == "Leave" || timein == "")
            {
                ddlday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
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


            }

            string timeout = ds3.Tables[0].Rows[0]["timeout"].ToString();
            if (timeout == "Holiday" || timeout == "Leave" || timeout == "")
            {
                ddlday.SelectedValue = ds3.Tables[0].Rows[0]["Day"].ToString();
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
            }

            //ddlday.DataTextField = ds3.Tables[0].Rows[0]["Day"].ToString();
            //ddlDayType.SelectedValue = ds3.Tables[0].Rows[0]["worktype"].ToString();



        }

    }

}