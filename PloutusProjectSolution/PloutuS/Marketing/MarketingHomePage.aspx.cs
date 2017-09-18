using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;

public partial class Marketing_MarketingHomePage : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    BA_Marketing bamh = new BA_Marketing();

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;
        if (!IsPostBack)
        {
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    lblUserName.Text = "Welcome " + Session["PSMEName"].ToString();
                    filllogindetails();
                    postedprofiledetails();
                    EventDetails();
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

    private void EventDetails()
    {
        DataSet dsevents = new DataSet();
        dsevents = bamh.EventsDetails();
        lnkPendingEvent.Text = dsevents.Tables[0].Rows[0]["PendingEvents"].ToString();
        lnkToday.Text = dsevents.Tables[1].Rows[0]["TodayEvents"].ToString();
        lnkFuture.Text = dsevents.Tables[2].Rows[0]["FutureEvents"].ToString();
        lnkClosed.Text = dsevents.Tables[3].Rows[0]["ClosedEvents"].ToString();
    }
    protected void filllogindetails()
    {
        try
        {
            string id = Session["PSMEMAIL"].ToString();
            ds = bamh.getlogindetais(id);
            //lblempid.Text = ds.Tables[0].Rows[0]["EmpId"].ToString();
            //lblEmail.Text = ds.Tables[0].Rows[0]["Emailid"].ToString(); ;           
            //lblempname.Text = Session["PSMEName"].ToString();
            //lblAcCreated.Text = ds.Tables[0].Rows[0]["Accreatedt"].ToString();
            //lblPhone.Text = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
            //lblLogtime.Text = ds.Tables[1].Rows[0]["currenttime"].ToString();
            //lblLastLogintime.Text = ds.Tables[1].Rows[0]["lastlogintime"].ToString();
            //lnkbtnActUsers.Text = ds.Tables[1].Rows[0]["noofactive"].ToString();
            //lnkTotalJobs.Text = ds.Tables[1].Rows[0]["noofRJobs"].ToString();
            //lnkInterSche.Text = ds.Tables[1].Rows[0]["cnt1"].ToString();
            //lnkTodayInterSche.Text = ds.Tables[1].Rows[0]["cnt"].ToString();
            //lbtEvents.Text = ds.Tables[1].Rows[0]["cnt"].ToString();
            //lbfevents.Text = ds.Tables[1].Rows[0]["cnt1"].ToString();
        }
        catch (Exception ex)
        {

        }

    }
    protected void postedprofiledetails()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = bamh.postedprofiledetails();
            lnkposted.Text = ds.Tables[0].Rows[0]["count1"].ToString();
            lnkpending.Text = ds.Tables[1].Rows[0]["count2"].ToString();
           // lnkselect.Text = ds.Tables[2].Rows[0]["count3"].ToString();
           // lnkreject.Text = ds.Tables[3].Rows[0]["count4"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
    
    protected void lnkpending_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Marketing/ViewUploadedResumes.aspx", false);
    }
    protected void lnkselect_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Marketing/AcceptedCanList.aspx", false);
    }
    protected void lnkreject_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Marketing/RejectCanList.aspx", false);
    }
}
