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
using System.Text;

public partial class Employer_TimeSheetReport : System.Web.UI.Page
{
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;

        if (!Page.IsPostBack)
        {
            BA_Timesheet1 batimesheet = new BA_Timesheet1();
            DataSet ds1 = new DataSet();
            ds1 = batimesheet.GetComList();
            ddlcompany.DataSource = ds1.Tables[0];
            ddlcompany.DataTextField = "CompanyName";
            ddlcompany.DataValueField = "CompanyName";
            ddlcompany.DataBind();
            ddlcompany.Items.Insert(0, new ListItem("--------------Select----------------", "--Select--"));            

        }

    }
   

    protected void ddlcompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcompany.SelectedIndex != 0)
        {
            BA_Timesheet1 batimesheet = new BA_Timesheet1();
            DataSet ds1 = new DataSet();
            id = ddlcompany.SelectedItem.Text;
            ds1 = batimesheet.GetUsers(id);
            ddlCompUsers.DataSource = ds1.Tables[0];
            ddlCompUsers.DataTextField = "Name";
            ddlCompUsers.DataValueField = "Consultantid";
            ddlCompUsers.DataBind();
            ddlCompUsers.Items.Insert(0, new ListItem("--------------Select--------------", "Select"));
            ddlCompUsers.Items.Insert(1, new ListItem("All", "All"));
        }
        else
        {
            ddlCompUsers.Items.Clear();
        }
    }
    protected void ddlCompUsers_SelectedIndexChanged1(object sender, EventArgs e)
    {
    }
    protected void ddlcompany1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnComp_Click(object sender, EventArgs e)
     {        
             try
             {             
                 BA_Timesheet1 batimesheet = new BA_Timesheet1();
                 DataSet ds = new DataSet();
                 string company = Session["PSEName"].ToString();
                 string StartDt = txtStartDate.Text;
                 string EndDt = txtEndDate.Text;
                 string company1 = ddlCompUsers.SelectedItem.Text;
                 ds = batimesheet.GetcompinGrid(StartDt, EndDt, ddlcompany.SelectedValue, ddlCompUsers.SelectedValue.ToString());
                 // lblPageInfo.Text=ds.Tables[0].Rows.Count.ToString();
                 gvReports.DataSource = ds.Tables[0];
                 gvReports.DataBind();
                 if (ds.Tables[0].Rows.Count > 0)
                 {
                     pnlSub.Visible = false;

                     btnImport.Visible = true;
                     pnlGrid.Visible = true;
                     int tot = 0;
                     tot = tot + Convert.ToInt32(ds.Tables[0].Rows[0][8]);
                     //lblSum.Text = tot.ToString();
                     lblTotalhr.Text = ds.Tables[0].Rows[0][4].ToString();
                     lblTotAmount.Text = tot.ToString();
                 }
                 else
                 {
                     pnlSub.Visible = true;
                     btnImport.Visible = false;
                     pnlGrid.Visible = false;
                 }
               

             }
             catch (Exception ex)
             {
             }
         
        
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    //protected void btnImport_Click1(object sender, EventArgs e)
    //{

    //    //try
    //    //{
    //    //    BA_Timesheet1 batimesheet = new BA_Timesheet1();
    //    //    DataSet ds = new DataSet();
    //    //    string company = Session["PSEName"].ToString();
    //    //    string StartDt = txtStartDate.Text;
    //    //    string EndDt = txtEndDate.Text;
    //    //    string company1 = ddlCompUsers.SelectedValue;
    //    //    ds = batimesheet.GetcompinGrid(StartDt, EndDt, ddlcompany.SelectedValue, ddlCompUsers.SelectedValue.ToString());

    //    //    string filename = "Time Sheet Report from '" + txtStartDate.Text + "' to '" + txtEndDate.Text + "'.xls";
    //    //    string excelHeader = "Time Sheet Report from '" + txtStartDate.Text + "' to '" + txtEndDate.Text + "'";
    //    //    HttpContext.Current.Response.Clear();
    //    //    HttpContext.Current.Response.ClearContent();
    //    //    HttpContext.Current.Response.ClearHeaders();
    //    //    HttpContext.Current.Response.Buffer = true;
    //    //    HttpContext.Current.Response.ContentType = "application/ms-excel";
    //    //    HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
    //    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);

    //    //    HttpContext.Current.Response.Charset = "utf-8";
    //    //    HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
    //    //    //sets font
    //    //    //HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
    //    //    //HttpContext.Current.Response.Write("<BR><BR><BR>");
    //    //    //sets the table border, cell spacing, border color, font of the text, background, foreground, font height
    //    //    HttpContext.Current.Response.Write("<table style='height:200px;width:100px;'><tr><td style='width:200px;height:100px;'></td></tr><tr><td style='width:200px;'></td><td><Table border='1' borderColor='#000000' style='padding-left:300px'> <TR><td align='center' colspan='" + ds.Tables[0].Columns.Count + "' style='height:40px; font-weight: bold; font-size: 16px; color:black; background-color:Tan;vertical-align:middle;'>" + excelHeader.ToUpper() + "</td></tr><tr>");
    //    //    //Getting Dataset's column headers
    //    //    int columnscount = ds.Tables[0].Columns.Count;

    //    //    for (int j = 0; j < columnscount; j++)
    //    //    {      //write in new column
    //    //        HttpContext.Current.Response.Write("<Td style='height:25px; font-weight: bold; font-size: 14px; color:black; background-color:PaleGoldenrod;vertical-align:left;'>");
    //    //        //Get column headers  and make it as bold in excel columns
    //    //        HttpContext.Current.Response.Write("<B>");
    //    //        HttpContext.Current.Response.Write(ds.Tables[0].Columns[j].ColumnName.ToString());
    //    //        HttpContext.Current.Response.Write("</B>");
    //    //        HttpContext.Current.Response.Write("</Td>");
    //    //    }
    //    //    HttpContext.Current.Response.Write("</TR>");
    //    //    foreach (DataRow row in ds.Tables[0].Rows)
    //    //    {
    //    //        //write in new row
    //    //        HttpContext.Current.Response.Write("<TR >");
    //    //        for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
    //    //        {
    //    //            HttpContext.Current.Response.Write("<Td style='height:22px; font-size: 14px; background-color:white; color:black; vertical-align:left;'>");
    //    //            HttpContext.Current.Response.Write(row[i].ToString());
    //    //            HttpContext.Current.Response.Write("</Td>");
    //    //        }

    //    //        HttpContext.Current.Response.Write("</TR>");
    //    //    }
    //    //    HttpContext.Current.Response.Write("</Table></td></tr></table>");
    //    //    HttpContext.Current.Response.Write("</font>");
    //    //    HttpContext.Current.Response.Flush();
    //    //    HttpContext.Current.Response.End();
    //    //}
    //    //catch (Exception ex)
    //    //{

    //    //}
    //}
   
  
    protected void btnImport_Click1(object sender, EventArgs e)
    {

        try
        {
            BA_Timesheet1 batimesheet = new BA_Timesheet1();
            DataSet ds = new DataSet();
            string company = Session["PSEName"].ToString();
            string StartDt = txtStartDate.Text;
            string EndDt = txtEndDate.Text;
            string company1 = ddlCompUsers.SelectedValue;
            ds = batimesheet.GetcompinGrid(StartDt, EndDt, ddlcompany.SelectedValue, ddlCompUsers.SelectedValue.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["ds"] = ds;
                string fileName = "Time_Sheet_ReportOn" + DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString() + ".xls";
                string fName = Server.MapPath(@"Backup\") + fileName;


                string newFileName = fName;
                string oldFileName = Server.MapPath(@"Template\TimeSheetReport.xls");
                File.Copy(oldFileName, newFileName, true);
                //openExcelDocument(newFileName);
                //File creation                
                //lblMessage.Text = "Process Started...";
                addData(newFileName);
                Response.Redirect("dummy.aspx?fName=" + fileName, false);

                //HttpContext.Current.ApplicationInstance.CompleteRequest();
                Response.Flush();
            }
            else
            {
               // lblSubmitMesag.Text = "No Time Sheets are available";
            }                     

        }
        catch (Exception exp)
        {
            //lblMessage.Text = exp.Message.ToString();

        }

    }


    public void addData(string _fName)
    {
        StringBuilder myHtml = new StringBuilder();
        const string startExcelXML = "<xml version=\"\">\r\n<Workbook " +
          "xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\r\n" +
          " xmlns:o=\"urn:schemas-microsoft-com:office:office\"\r\n " +
          "xmlns:x=\"urn:schemas-    microsoft-com:office:" +
          "excel\"\r\n xmlns:ss=\"urn:schemas-microsoft-com:" +
          "office:spreadsheet\">\r\n <Styles>\r\n " +
          "<Style ss:ID=\"Default\" ss:Name=\"Normal\">\r\n " +
          "<Alignment ss:Vertical=\"Bottom\"/>\r\n <Borders/>" +
          "\r\n <Font/>\r\n <Interior/>\r\n <NumberFormat/>" +
          "\r\n <Protection/>\r\n </Style>\r\n " +
          "<Style ss:ID=\"BoldColumn\">\r\n <Font " +
          "x:Family=\"Verdana\" ss:Bold=\"1\"/>\r\n </Style>\r\n " +
          "<Style     ss:ID=\"StringLiteral\">\r\n <NumberFormat" +
          " ss:Format=\"@\"/>\r\n </Style>\r\n <Style " +
          "ss:ID=\"Decimal\">\r\n <NumberFormat " +
          "ss:Format=\"0.0000\"/>\r\n </Style>\r\n " +
          "<Style ss:ID=\"Integer\">\r\n <NumberFormat " +
          "ss:Format=\"0\"/>\r\n </Style>\r\n" +
          "<Style ss:ID=\"s39\">\r\n" +
          " <Alignment ss:Horizontal=\"Center\" ss:Vertical=\"Bottom\"/>\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"12\" ss:Color=\"#000000\" ss:Bold=\"1\"/>\r\n" +
            //"<Interior ss:Color=\"#000080\" ss:Pattern=\"Solid\"/>\r\n" +
          "</Style>\r\n" +
          "<Style ss:ID=\"s100\">\r\n" +
          " <Alignment ss:Horizontal=\"Center\" ss:Vertical=\"Bottom\"/>\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"12\" ss:Color=\"#000000\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#FFFC17\" ss:Pattern=\"Solid\"/>\r\n" +
          "</Style>\r\n" +
           "<Style ss:ID=\"s50\">\r\n" +
          " <Alignment ss:Horizontal=\"Left\" ss:Vertical=\"Bottom\"/>\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"10\" ss:Color=\"#000000\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#99CCFF\" ss:Pattern=\"Solid\"/>\r\n" +
          "</Style>\r\n" +

           "<Style ss:ID=\"s90\">\r\n" +
          " <Alignment ss:Horizontal=\"Left\" ss:Vertical=\"Bottom\"/>\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"10\" ss:Color=\"#000000\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#99CCFF\" ss:Pattern=\"Solid\"/>\r\n" +
             "<NumberFormat ss:Format=\"0\"/>\r\n" +
          "</Style>\r\n" +



          "<Style ss:ID=\"s80\">\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#C0DCEF\" ss:Pattern=\"Solid\"/>\r\n" +
           "</Style>\r\n" +

            "<Style ss:ID=\"s38\">\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +

           "</Style>\r\n" +


          "<Style ss:ID=\"s40\">\r\n" +
          "<Borders>\r\n" +
          "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"11\" ss:Color=\"#000000\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#666666\" ss:Pattern=\"Solid\"/>\r\n" +
           "</Style>\r\n" +
           "<Style ss:ID=\"s41\"><Alignment ss:Vertical=\"Top\" ss:WrapText=\"1\" ss:Horizontal=\"Right\"/>\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"#,##,##,##0\"/>\r\n" +
          "</Style>\r\n" +

          "<Style ss:ID=\"s101\"><Alignment ss:Vertical=\"Top\" ss:WrapText=\"1\" ss:Horizontal=\"Center\" />\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"10\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#CDC0DA\" ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"@\"/>\r\n" +
          "</Style>\r\n" +
            //F8E0B2
          "<Style ss:ID=\"sTot\"><Alignment ss:Vertical=\"Top\" ss:Horizontal=\"Right\" />\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"11\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#C7D8F2\" ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"@\"/>\r\n" +
          "</Style>\r\n" +

          "<Style ss:ID=\"sTot1\"><Alignment ss:Vertical=\"Top\" ss:Horizontal=\"Right\" />\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Font x:Family=\"Verdana\" ss:Size=\"11\" ss:Bold=\"1\"/>\r\n" +
          "<Interior ss:Color=\"#F8E0B2\" ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"#,##,##,##0\"/>\r\n" +
          "</Style>\r\n" +

          "<Style ss:ID=\"s102\"><Alignment ss:Vertical=\"Top\" />\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"2\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"@\"/>\r\n" +
          "</Style>\r\n" +

          "<Style ss:ID=\"s103\"><Alignment ss:Vertical=\"Top\" />\r\n" +
          "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"2\"/>\r\n" +
          "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
          "</Borders>\r\n" +
          "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
          "<NumberFormat ss:Format=\"@\"/>\r\n" +
          "</Style>\r\n" +

           "<Style ss:ID=\"s81\"><Alignment ss:Vertical=\"Top\" ss:WrapText=\"1\"/>\r\n" +
                  "<Borders><Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
            "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
            "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
            "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
           "</Borders>\r\n" +
           "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
           "<NumberFormat ss:Format=\"@\"/>\r\n" +
          "</Style>\r\n" +


      "<Style ss:ID=\"s42\">\r\n" +
       "<Borders>\r\n" +
        "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "</Borders>\r\n" +
       "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
       "<NumberFormat ss:Format=\"0\"/>\r\n" +
      "</Style>\r\n" +

       "<Style ss:ID=\"s82\">\r\n" +
       "<Borders>\r\n" +
        "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "</Borders>\r\n" +
       "<Interior ss:Pattern=\"Solid\"/>\r\n" +
       "<NumberFormat ss:Format=\"0\"/>\r\n" +
      "</Style>\r\n" +


      "<Style ss:ID=\"s43\">\r\n" +
       "<Borders>\r\n" +
        "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "</Borders>\r\n" +
       "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
       "<NumberFormat ss:Format=\"0.00\"/>\r\n" +
      "</Style>\r\n" +

       "<Style ss:ID=\"s83\">\r\n" +
       "<Borders>\r\n" +
        "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
        "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "</Borders>\r\n" +
       "<Interior  ss:Pattern=\"Solid\"/>\r\n" +
       "<NumberFormat ss:Format=\"0.00\"/>\r\n" +
      "</Style>\r\n" +



       "<Style " +
       "ss:ID=\"DateLiteral\">\r\n <NumberFormat " +
       "ss:Format=\"mm/dd/yyyy;@\"/>\r\n </Style>\r\n " +
        "<Style ss:ID=\"s44\">\r\n" +
       " <Alignment ss:Horizontal=\"Center\" ss:Vertical=\"Bottom\"/>\r\n" +
       "<Borders>\r\n" +
       "<Border ss:Position=\"Bottom\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "<Border ss:Position=\"Left\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "<Border ss:Position=\"Right\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "<Border ss:Position=\"Top\" ss:LineStyle=\"Continuous\" ss:Weight=\"1\"/>\r\n" +
       "</Borders>\r\n" +
       "<Font x:Family=\"Verdana\" ss:Size=\"10\" ss:Color=\"Red\" ss:Bold=\"1\"/>\r\n" +
       "<Interior ss:Pattern=\"Solid\"/>\r\n" +
       "</Style>\r\n" +
          "</Styles>\r\n ";
        const string endExcelXML = "</Workbook></xml >";
        myHtml.Append(startExcelXML);

        /*Worksheet Daily Report*/
        //Summary Report
        myHtml.Append("<ss:Worksheet ss:Name=\"Daily Report\">");
        myHtml.Append("<ss:Table>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='45'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='120'/>");
        myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        // Append actual user data
        myHtml.Append(AppendActualUserDataToExcelSummary(1).Replace("'", ""));       // Missed codes Report
        myHtml.Append("</ss:Table>");
        myHtml.Append("");
        myHtml.Append(" </ss:Worksheet>");
        //Summary Report       
        /*Worksheet Daily Report*/


        /*Worksheet Daily Report*/
        //Summary Report
        //myHtml.Append("<ss:Worksheet ss:Name=\"LPH Report\">");
        //myHtml.Append("<ss:Table>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='45'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='120'/>");
        //myHtml.Append("<ss:Column ss:AutoFitWidth='0' ss:Width='90'/>");
        //// Append actual user data
        //myHtml.Append(AppendActualUserDataToExcelSummary(2).Replace("'", ""));       // Missed codes Report
        //myHtml.Append("</ss:Table>");
        //myHtml.Append("");
        //myHtml.Append(" </ss:Worksheet>");
        //Summary Report       
        /*Worksheet Daily Report*/

        myHtml.Append(endExcelXML);
        StreamWriter swXLS = new StreamWriter(_fName);
        swXLS.Write(myHtml.ToString());
        swXLS.Close();
        Response.Clear();
        Response.WriteFile(_fName);

    }
    //14/08/2010 - LOB Report - Daily
    public string AppendActualUserDataToExcelSummary(int sheet)
    {
        BA_Timesheet1 batimesheet = new BA_Timesheet1();
        DataSet ds = new DataSet();
        string company = Session["PSEName"].ToString();
        string StartDt = txtStartDate.Text;
        string EndDt = txtEndDate.Text;
        string company1 = ddlCompUsers.SelectedValue;
        StringBuilder myHtml = new StringBuilder();
        try
        {

            int workSheet = sheet;
            if (workSheet == 1)
            {

                ds = batimesheet.GetcompinGrid(StartDt, EndDt, ddlcompany.SelectedValue, ddlCompUsers.SelectedValue.ToString());
            }

            string[] dt = Convert.ToDateTime(txtStartDate.Text).ToLongDateString().ToString().Split(',');
            //Report Title
            myHtml.Append("<ss:Row ss:Index=\"2\">");//Row           
            myHtml.Append("<Cell ss:Index=\"2\" ss:MergeAcross=\"" + (ds.Tables[0].Columns.Count - 1) + "\" ss:StyleID=\"s100\"><Data ss:Type=\"String\">Time sheet Reports :" + dt[0] + " - " + dt[1] + ", " + dt[2] + " </Data></Cell>");

            myHtml.Append("</ss:Row>");
            myHtml.Append("<ss:Row ss:Index=\"3\">");

            for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
            {
                myHtml.Append("<Cell ss:Index=\"" + (i + 2) + "\" ss:StyleID=\"s101\"><Data ss:Type=\"String\">" + ds.Tables[0].Columns[i].ColumnName.ToString() + "</Data></Cell>");

            }
            myHtml.Append("</ss:Row>");

            if (ds.Tables[0] != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        myHtml.Append("<ss:Row ss:Index=\"" + (4 + i).ToString() + "\">");
                        for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                        {
                            myHtml.Append("<ss:Cell ss:Index=\"" + (j + 2) + "\" ss:StyleID=\"s41\"><ss:Data ss:Type=\"String\">" + ds.Tables[0].Rows[i][j].ToString() + "</ss:Data></ss:Cell>");
                        }
                        myHtml.Append("</ss:Row>");
                    }

                }
            }
        }
        catch (Exception Ex)
        {
            //lblMessage.Text = Ex.Message.ToString();
        }
        finally
        {
        }
        return myHtml.ToString();

    }
}

