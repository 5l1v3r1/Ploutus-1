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
using System.Text;
using GetDocText.Doc;
using BA_Ploutos;
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
                //ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                //scriptManager.RegisterPostBackControl(this.lnkViewResume);
                try
                {
                    if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                    {
                         CalendarExtender1.StartDate = DateTime.Now.AddDays(-1);
                        // CalendarExtender2.StartDate = DateTime.Now;
                        tsActTime.SetTime(00, 00, MKB.TimePicker.TimeSelector.AmPmSpec.AM);
                        DataSet ds = new DataSet();
                        EncryptDecrypt ency = new EncryptDecrypt();
                        BA_Marketingactivities bamarkact = new BA_Marketingactivities();
                        ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
                        ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
                        dlMemInfo.DataSource = ds.Tables[0];
                        dlMemInfo.DataBind();
                        Session["MemName"] = ds.Tables[0].Rows[0]["firstname"] + "" + ds.Tables[0].Rows[0]["lastname"];
                        string status = ds.Tables[0].Rows[0]["status"].ToString();
                        ViewState["filename"] = ds.Tables[0].Rows[0]["filename"].ToString();
                        if (status == "1" || status == "2")
                        {
                            btnAccept.Visible = false;
                            btnReject.Visible = true;
                        }
                        else if (status == "3" || status == "4")
                        {
                            btnAccept.Visible = true;
                            btnReject.Visible = false;
                        }
                        else
                        {
                            btnAccept.Visible = true;
                            btnReject.Visible = true;
                        }
                        LoadActivities();
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
        catch (Exception ex)
        { }
    }
    protected void lnkbtnDResume_Click(object sender, EventArgs e)
    {
        try
        {
            BA_Merchants bamer = new BA_Merchants();

            if (ViewState["jsid"].ToString() != "")
            {
                DataSet ds = new DataSet();
                string filename = ViewState["jsid"].ToString();
                ds=bamer.GetFileName(filename);
                string fname = ds.Tables[0].Rows[0][0].ToString();
                if (filename != "")
                {

                    string path = conn1 + ViewState["jsid"].ToString() + ".doc";
                    string path1 = conn1 + ViewState["jsid"].ToString() + ".docx";
                    string path2 = conn1 + fname;
                    System.IO.FileInfo filed = new System.IO.FileInfo(path);
                    System.IO.FileInfo filed1 = new System.IO.FileInfo(path1);
                    System.IO.FileInfo filed2 = new System.IO.FileInfo(path2);
                    if (filed.Exists)
                    {
                        try
                        {
                            Response.Redirect("~/ploutos/dummy.aspx?fName=" + path + "&id2=" + Convert.ToString(Session["MemName"]) + "_" + ViewState["jsid"].ToString(), false);

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
                                //Response.Redirect("~/ploutos/dummy.aspx?fName=" + path1 + "&id2=" + ViewState["jsid"].ToString(), false);
                                Response.Redirect("~/ploutos/dummy.aspx?fName=" + path1 + "&id2=" + Convert.ToString(Session["MemName"]) + "_" + ViewState["jsid"].ToString(), false);




                                HttpContext.Current.ApplicationInstance.CompleteRequest();
                                Response.Flush();

                            }
                            catch (Exception ex)
                            { }

                        }
                    if (filed2.Exists)
                    {
                        FileStream sourceFile = null;
                        try
                        {
                            //Response.Redirect("~/ploutos/dummy.aspx?fName=" + path1 + "&id2=" + ViewState["jsid"].ToString(), false);
                            Response.Redirect("~/ploutos/dummy.aspx?fName=" + path2 + "&id2=" + Convert.ToString(Session["MemName"]) + "_" + ViewState["jsid"].ToString(), false);




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
        ds1 = BAmaract.GetAllMArketingActivitiesAlready(ViewState["jsid"].ToString());
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
        ddlActivities.Items.Insert(0, new ListItem("Select", "Select"));
        ddlactvities1.Items.Insert(0, new ListItem("Select", "Select"));
        ddlActivities.SelectedIndex = 0;

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlActivities.SelectedIndex != 0 && txtActdt.Text != "")
            {
                TimeZoneInfo timeZoneInfo;
                DateTime cdt;
                //Set the time zone information to US Mountain Standard Time 
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
                //Get date and time in US Mountain Standard Time 
                cdt = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
                lblActMsg.Text = "";
                BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
                BE_MarketingActivities BEMarketingAct = new BE_MarketingActivities();

                BEMarketingAct.Jsid = ViewState["jsid"].ToString();
                BEMarketingAct.TypeofAct = ddlActivities.SelectedItem.ToString();
                BEMarketingAct.Actdt = txtActdt.Text;
                BEMarketingAct.ActTime = tsActTime.Hour + ":" + tsActTime.Minute + " " + tsActTime.AmPm;
                BEMarketingAct.Notes = txtNotes.Text.Trim();
                BEMarketingAct.ActCreatedBy = Session["Fname"].ToString();
                BEMarketingAct.CurrentDT = cdt;
                BAMarketingact.CreateActivityAlready(BEMarketingAct);
                txtActdt.Text = txtNotes.Text = string.Empty;
                ddlActivities.SelectedIndex = 0;
                LoadActivities();
                lblActMsg.ForeColor = System.Drawing.Color.Green;
                lblActMsg.Text = "Successfully created activity";
            }
            else
            {
                if (ddlActivities.SelectedIndex == 0)
                {
                    lblActMsg.Text = "Please select Activity Type";
                    lblActMsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblActMsg.ForeColor = System.Drawing.Color.Red;
                    lblActMsg.Text = "Activity Date is mandatory";
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.AceptcandiadteAlready(ViewState["jsid"].ToString());
        lblstatus.Text = "Candidate Accepted";
        lblstatus.ForeColor = System.Drawing.Color.Green;
        if (btnReject.Visible == true && btnAccept.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlistAlready.aspx");
        }
        else if (btnReject.Visible == false && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/RejectcanlistAlready.aspx");
        }
        else if (btnReject.Visible == true && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumesAlready.aspx");
        }

    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.RejectcandiadteAlready(ViewState["jsid"].ToString());
        lblstatus.Text = "Candidate Rejected";
        lblstatus.ForeColor = System.Drawing.Color.Red;
        if (btnReject.Visible == true && btnAccept.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlistAlready.aspx");
        }
        else if (btnReject.Visible == false && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/RejectcanlistAlready.aspx");
        }
        else if (btnReject.Visible == true && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumesAlready.aspx");
        }

    }

    protected void edit(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            Label lbl = (Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivitiesAlready(id);
            txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            txtActdt1.Enabled = true;
            ddlactvities1.Enabled = true;
            txtNotes1.Enabled = true;
            tsActTime1.Enabled = true;
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
            ds1 = BAmaract.EditActivitiesAlready(id);
            txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            txtActdt1.Enabled = false;
            ddlactvities1.Enabled = false;
            txtNotes1.Enabled = false;
            tsActTime1.Enabled = false;
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
            BAmaract.DeletActivityAlready(id1);
            LoadActivities();
        }
    }
    protected void Update(object sender, EventArgs e)
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        string time = tsActTime1.Hour + ":" + tsActTime1.Minute + " " + tsActTime1.AmPm;
        BAmaract.UpdateActivityAlready(ViewState["id"].ToString(), ddlactvities1.SelectedItem.Text, txtActdt1.Text, time, txtNotes1.Text);
        //lbldone.Text = "Updated Sucessfully";
        LoadActivities();

    }
    protected void editdetails(object sender, EventArgs e)
    {
        Response.Redirect("MarketingEditAlready.aspx?id=" + ViewState["jsid"], false);
    }
    protected void grdActivities_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void lnkbtnUpdateResume_Click(object sender, EventArgs e)
    {
        Response.Redirect("uploadresumealready.aspx?id=" + ViewState["jsid"], false);
    }

    protected void lnkViewResume_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Resumes.aspx?id=" + ViewState["filename"], false);
        try
        {
            txtViewResume.Text = "";
            string connection = conn1 + ViewState["jsid"].ToString() + ".doc";
            string connection1 = conn1 + ViewState["jsid"].ToString() + ".docx";
            System.IO.FileInfo file2 = new System.IO.FileInfo(connection);
            System.IO.FileInfo file3 = new System.IO.FileInfo(connection1);
            if (file2.Exists)
            {
                ApplicationClass wordApp = new ApplicationClass();

                object file = connection;

                object nullobj = System.Reflection.Missing.Value;

                Microsoft.Office.Interop.Word.Document doc = wordApp.Documents.Open(

                ref file, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj);

                doc.ActiveWindow.Selection.WholeStory();

                doc.ActiveWindow.Selection.Copy();

                string sFileText = doc.Content.Text;

                doc.Close(ref nullobj, ref nullobj, ref nullobj);

                wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);


                txtViewResume.Text = sFileText;
                mpViewResume.Show();



            }
            else if (file3.Exists)
            {
                ApplicationClass wordApp = new ApplicationClass();

                object file = connection1;

                object nullobj = System.Reflection.Missing.Value;

                Microsoft.Office.Interop.Word.Document doc = wordApp.Documents.Open(

                ref file, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj,

                ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj);



                doc.ActiveWindow.Selection.WholeStory();

                doc.ActiveWindow.Selection.Copy();

                string sFileText = doc.Content.Text;

                doc.Close(ref nullobj, ref nullobj, ref nullobj);

                wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);


                txtViewResume.Text = sFileText;
                mpViewResume.Show();
            }
            else
            {
                mpViewResume.Show();
                lblresumeMsg.Text = "Resume Unavailable";
            }
        }
        catch (Exception ex)
        {
            mpViewResume.Show();
            lblresumeMsg.Text = "Error Reading File";
        }
    }
}