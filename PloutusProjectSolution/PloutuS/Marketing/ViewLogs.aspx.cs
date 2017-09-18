using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_ViewLogs : System.Web.UI.Page
{
    Marketing marclass = new Marketing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            DataSet ds = marclass.GetMarketingEmailID();
            ddlEmailID.DataSource = ds.Tables[0];
            ddlEmailID.DataTextField = "emailid";
            ddlEmailID.DataBind();
            ddlEmailID.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlEmailID.Items.Insert(1, new ListItem("ALL", "ALL"));
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        try
        {
            if (ddlEmailID.SelectedValue == "--Select--")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please Select Email ID";

            }
            else
            {
                lblMsg.Visible = false;
                if (txtToDate.Text == "")
                {
                    txtToDate.Text = txtFromDate.Text;
                }
                DataSet ds = marclass.GetLogsList(ddlEmailID.SelectedValue, txtFromDate.Text, txtToDate.Text);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvReports.DataSource = ds.Tables[0];
                    gvReports.DataBind();

                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "No Data to Display";
                }
            }
        
        }
        catch( Exception ex)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "No Data to Display";
        }
    }
}