using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BA_Ploutos;


public partial class Marketing_SentMails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;
        if (!Page.IsPostBack)
        {                     
            BindGridView();
        }
    }


    private void BindGridView()
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet dsGrid = new DataSet();
        try
        {
            dsGrid = BAMarketingact.BindSentMailGrid();
 
            gvSentMails.DataSource = dsGrid.Tables[0];
            gvSentMails.DataBind();
            
            if (gvSentMails.Rows.Count > 0)
            {
                lblCounttext.Visible = true;
                lblCount.Text = dsGrid.Tables[0].Rows.Count.ToString();
                lblCount.Visible = true;            
                lblCounttext.Visible = true;
            }
            else
            {
                lblCounttext.Visible = false;
                lblCount.Visible = false;            
                lblCounttext.Visible = false;
                gvSentMails.DataSource = null;
                gvSentMails.DataBind();
                //lblMessage.Visible = true;
                //lblMessage.ForeColor = System.Drawing.Color.Red;
                //lblMessage.Text = "No Mails are Available";

            }
           
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
        }

    }

    protected void gvdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSentMails.PageIndex = e.NewPageIndex;
        BindGridView();
    }
   
   
}