using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class dummy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString != null)
        {
            string fname = Request.QueryString["fName"].ToString();

            Response.ContentType = "application/vnd.ms-excel"; 
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fname);
            Response.TransmitFile(Server.MapPath("Backup/" + fname)); 
            Response.End();
            //Response.Redirect("DailyReportClient.aspx",false);
        }
    }
}
