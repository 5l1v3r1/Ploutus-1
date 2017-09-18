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
using Microsoft.Office.Interop.Word;
using System.IO;
public partial class Marketing_Listofusers : System.Web.UI.Page
{
    string Jsid;
    string id;
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!Page.IsPostBack)
            {
                //Session["PSMID"] = "Test";
                DataSet ds = new DataSet();
                EncryptDecrypt ency = new EncryptDecrypt();
                BA_Marketingactivities bamarkact = new BA_Marketingactivities();
                //ViewState["jsencryptid"] = Request.QueryString["id"].ToString();
                ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
                //ViewState["jsid"] = "0001";
                ds = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());
                dlMemInfo.DataSource = ds.Tables[0];
                dlMemInfo.DataBind();
                //   string path = Server.MapPath(conn1 + ViewState["jsid"].ToString() + ".doc");
                // string path1 = Server.MapPath(conn1 + ViewState["jsid"].ToString() + ".docx");
                string connection = conn1 + ViewState["jsid"].ToString() + ".doc";
                string connection1 = conn1 + ViewState["jsid"].ToString() + ".docx";
                System.IO.FileInfo file = new System.IO.FileInfo(connection);
                System.IO.FileInfo file1 = new System.IO.FileInfo(connection1);
                if (file.Exists)
                {

                    ApplicationClass wordApp = new ApplicationClass();
                    object file3 = connection;
                    object nullobj = System.Reflection.Missing.Value;
                    Microsoft.Office.Interop.Word.Document docs = wordApp.Documents.Open(
                    ref file3, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj, ref nullobj);

                    docs.ActiveWindow.Selection.WholeStory();
                    docs.ActiveWindow.Selection.Copy();
                    string sFileText = docs.Content.Text;
                    docs.Close(ref nullobj, ref nullobj, ref nullobj);
                    wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);
                    //divTxt.InnerHtml = sFileText;
                    txtResume.Text = sFileText;
                }
                else if (file1.Exists)
                {
                    ApplicationClass wordApp = new ApplicationClass();
                    object file4 = connection1;
                    object nullobj = System.Reflection.Missing.Value;
                    Microsoft.Office.Interop.Word.Document docs = wordApp.Documents.Open(
                    ref file4, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj,
                    ref nullobj, ref nullobj, ref nullobj, ref nullobj);

                    docs.ActiveWindow.Selection.WholeStory();
                    docs.ActiveWindow.Selection.Copy();
                    string sFileText = docs.Content.Text;
                    docs.Close(ref nullobj, ref nullobj, ref nullobj);
                    wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);
                    //divTxt.InnerHtml = sFileText;
                    txtResume.Text = sFileText;
                }
                else
                {
                    lblresumeMsg.Text = "Resume Unavailable";
                }
                // ViewState["username"] = ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["mname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString();
                LoadActivities();
            }
        }
        catch (Exception ex)
        { }
    }
    protected void lnkbtnDResume_Click(object sender, EventArgs e)
    {
        try
        {
            if (ViewState["jsid"].ToString() != "")
            {
                string filename = ViewState["jsid"].ToString();

                if (filename != "")
                {
                    string path = conn1 + ViewState["jsid"].ToString() + ".doc";
                    string path1 = conn1 + ViewState["jsid"].ToString() + ".docx";
                    System.IO.FileInfo filed = new System.IO.FileInfo(path);
                    System.IO.FileInfo filed1 = new System.IO.FileInfo(path1);
                    if (filed.Exists)
                    {
                        try
                        {
                            Response.Redirect("~/ploutos/dummy.aspx?fName=" + path + "&id2=" + ViewState["jsid"].ToString(), false);

                            HttpContext.Current.ApplicationInstance.CompleteRequest();
                            Response.Flush();

                        }
                        catch (Exception ex)
                        { }

                    }
                    else
                        if (filed1.Exists)
                        {
                            FileStream sourceFile = null;
                            try
                            {
                                Response.Redirect("~/ploutos/dummy.aspx?fName=" + path1 + "&id2=" + ViewState["jsid"].ToString(), false);


                                HttpContext.Current.ApplicationInstance.CompleteRequest();
                                Response.Flush();

                            }
                            catch (Exception ex)
                            { }

                        }
                        else
                        {
                            lblresumeMsg.Visible = true;
                            lblresumeMsg.Text = "Resume Unavailable";
                        }
                }
            }
            else
            {
                lblresumeMsg.Visible = true;
                lblresumeMsg.Text = "Resume Unavailable";
            }
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadActivities()
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();
        ds1 = BAmaract.GetAllMArketingActivities(ViewState["jsid"].ToString());
        ddlActivities.DataSource = ds1.Tables[0];
        ddlActivities.DataTextField = "activities";
        ddlActivities.DataValueField = "id";
        ddlActivities.DataBind();
        ddlactvities1.DataSource = ds1.Tables[0];
        ddlactvities1.DataTextField = "activities";
        ddlactvities1.DataValueField = "id";
        ddlactvities1.DataBind();
        grdActivities.DataSource = ds1.Tables[1];
        grdActivities.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            lblActMsg.Text = "";
            BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
            BE_MarketingActivities BEMarketingAct = new BE_MarketingActivities();

            BEMarketingAct.Jsid = ViewState["jsid"].ToString();
            BEMarketingAct.TypeofAct = ddlActivities.SelectedItem.ToString();
            BEMarketingAct.Actdt = txtActdt.Text;
            BEMarketingAct.ActTime = tsActTime.Hour + ":" + tsActTime.Minute + " " + tsActTime.AmPm;
            BEMarketingAct.Notes = txtNotes.Text.Trim();
            BEMarketingAct.ActCreatedBy = Session["Fname"].ToString();
            BAMarketingact.CreateActivity(BEMarketingAct);
            txtActdt.Text = txtNotes.Text = string.Empty;
            ddlActivities.SelectedIndex = 0;
            LoadActivities();
            lblActMsg.Text = "Successfully created activity";
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Aceptcandiadte(Jsid);
        lblstatus.Text = "Candidate Accepted";
        lblstatus.ForeColor = System.Drawing.Color.Green;

    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Rejectcandiadte(Jsid);
        lblstatus.Text = "Candidate Rejected";
        lblstatus.ForeColor = System.Drawing.Color.Red;
    }
    //protected void grdActivities_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName.ToString() == "Edit")
    //    {
    //        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
    //        DataSet ds1 = new DataSet();
    //        ds1 = BAmaract.EditActivities(e.CommandArgument.ToString());
    //        txtActdt.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
    //        txtNotes.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
    //        ddlActivities.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
    //        LoadActivities();

    //    }
    //}
    protected void edit(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            Label lbl = (Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);
            txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
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
            ddlactvities1.SelectedItem.Text= ds1.Tables[0].Rows[0]["typeofact"].ToString();
            btnupdate.Visible = true;
            mpeshow.Show();

        }
    }
    protected void view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            Label lbl = (Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);
            txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
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
            ddlactvities1.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            btnupdate.Visible = false;
            mpeshow.Show();
        }
    }
    protected void Delete(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((ImageButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            Label lbl = (Label)row.Cells[0].FindControl("lblid");
            int id1 = Convert.ToInt32(lbl.Text.ToString());
            BAmaract.DeletActivity(id1);
            LoadActivities();
        }
    }
    protected void Update(object sender, EventArgs e)
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        string time = tsActTime1.Hour + ":" + tsActTime1.Minute + " " + tsActTime1.AmPm;
        BAmaract.UpdateActivity(ViewState["id"].ToString(), ddlactvities1.SelectedItem.Text, txtActdt1.Text, time, txtNotes1.Text);
        //lbldone.Text = "Updated Sucessfully";
        LoadActivities();

    }
    protected void grdActivities_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}