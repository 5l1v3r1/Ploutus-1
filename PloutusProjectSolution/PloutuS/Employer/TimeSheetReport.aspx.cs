using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BA_Ploutos;
using System.IO;
using System.Drawing;

public partial class Employer_TimeSheetReport : System.Web.UI.Page
{
    string id;


    protected void Page_Load(object sender, EventArgs e)
    {
        lblSubMsg.Visible = false;
        id = Session["PSEName"].ToString();
        if (!Page.IsPostBack)
        {
            ddlUser.Enabled = true;
            BA_Timesheet batime = new BA_Timesheet();
            DataSet ds = new DataSet();
            ds = batime.GetUsers(id);
            ddlUser.DataSource = ds;
            ddlUser.DataTextField = "firstname";
            ddlUser.DataValueField = "Consultantid";
            ddlUser.DataBind();
            ddlUser.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlUser.Items.Insert(1, new ListItem("All Users", "All Users"));
        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        fillgrid();
    }

    public void fillgrid()
    {
        if (ddlUser.SelectedValue=="All Users")
        {
            pnlgrid.Visible = true;
            BA_Timesheet batime = new BA_Timesheet();
            DataSet ds = new DataSet();
            string StartDt = txtStartDate.Text;
            string EndDt = txtEndDate.Text;
            ds = batime.GetCompanyReports(id, StartDt, EndDt);
            gvReports.DataSource = ds;
            gvReports.DataBind();
            if (ds.Tables[0].Rows.Count < 1)
            {
                lblSubMsg.Visible = true;
            }

        }
        else
        {
            pnlgrid.Visible = true;
            BA_Timesheet batime = new BA_Timesheet();
            DataSet ds = new DataSet();
            string User = ddlUser.SelectedValue.ToString();
            string StartDt = txtStartDate.Text;
            string EndDt = txtEndDate.Text;
            ds = batime.GetUserReports(id, User, StartDt, EndDt);
            gvReports.DataSource = ds;
            gvReports.DataBind();
            if (ds.Tables[0].Rows.Count < 1)
            {
                lblSubMsg.Visible = true;
            }
        }
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {

        DataSet ds1 = new DataSet();
        if (ddlUser.SelectedValue == "All Users")
        {
            pnlgrid.Visible = true;
            BA_Timesheet batime = new BA_Timesheet();

            string StartDt = txtStartDate.Text;
            string EndDt = txtEndDate.Text;
            ds1 = batime.GetCompanyReports(id, StartDt, EndDt);
            gvReports.DataSource = ds1;
            gvReports.DataBind();
            if (ds1.Tables[0].Rows.Count < 1)
            {
                lblSubMsg.Visible = true;
            }

        }
        else
        {
            pnlgrid.Visible = true;
            BA_Timesheet batime = new BA_Timesheet();

            string User = ddlUser.SelectedValue.ToString();
            string StartDt = txtStartDate.Text;
            string EndDt = txtEndDate.Text;
            ds1 = batime.GetUserReports(id, User, StartDt, EndDt);
            gvReports.DataSource = ds1;
            gvReports.DataBind();
            if (ds1.Tables[0].Rows.Count < 1)
            {
                lblSubMsg.Visible = true;
            }
        }
        try
        {
            string filename = "Time Sheet Report from '"+txtStartDate.Text+"' to '"+txtEndDate.Text+"'.xls";
            string excelHeader = "Time Sheet Report from '" + txtStartDate.Text + "' to '" + txtEndDate.Text + "'";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);

            HttpContext.Current.Response.Charset = "utf-8";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            //HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
            //HttpContext.Current.Response.Write("<BR><BR><BR>");
            //sets the table border, cell spacing, border color, font of the text, background, foreground, font height
            HttpContext.Current.Response.Write("<table style='height:200px;width:100px;'><tr><td style='width:200px;height:100px;'></td></tr><tr><td style='width:200px;'></td><td><Table border='1' borderColor='#000000' style='padding-left:300px'> <TR><td align='center' colspan='" + ds1.Tables[0].Columns.Count + "' style='height:40px; font-weight: bold; font-size: 16px; color:black; background-color:Tan;vertical-align:middle;'>" + excelHeader.ToUpper() + "</td></tr><tr>");
            //Getting Dataset's column headers
            int columnscount = ds1.Tables[0].Columns.Count;

            for (int j = 0; j < columnscount; j++)
            {      //write in new column
                HttpContext.Current.Response.Write("<Td style='height:25px; font-weight: bold; font-size: 14px; color:black; background-color:PaleGoldenrod;vertical-align:left;'>");
                //Get column headers  and make it as bold in excel columns
                HttpContext.Current.Response.Write("<B>");
                HttpContext.Current.Response.Write(ds1.Tables[0].Columns[j].ColumnName.ToString());
                HttpContext.Current.Response.Write("</B>");
                HttpContext.Current.Response.Write("</Td>");
            }
            HttpContext.Current.Response.Write("</TR>");
            foreach (DataRow row in ds1.Tables[0].Rows)
            {
                //write in new row
                HttpContext.Current.Response.Write("<TR >");
                for (int i = 0; i < ds1.Tables[0].Columns.Count; i++)
                {
                    HttpContext.Current.Response.Write("<Td style='height:22px; font-size: 14px; background-color:white; color:black; vertical-align:left;'>");
                    HttpContext.Current.Response.Write(row[i].ToString());
                    HttpContext.Current.Response.Write("</Td>");
                }

                HttpContext.Current.Response.Write("</TR>");
            }
            HttpContext.Current.Response.Write("</Table></td></tr></table>");
            HttpContext.Current.Response.Write("</font>");
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        catch(Exception ex)
        {

        }
    }
    
}


