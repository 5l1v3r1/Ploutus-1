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
using System.Net;
using DocxToTextDemo;
using System.Windows.Forms;
using System.Threading;
using Novacode;
using Word = Microsoft.Office.Interop.Word;
using DocumentFormat.OpenXml.Packaging;

public partial class Marketing_Listofusers : System.Web.UI.Page
{
    string Jsid;
    string id;
    public int Size;
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    BA_Marketingactivities bamarkact = new BA_Marketingactivities();
    DataSet ds1 = new DataSet();
    EncryptDecrypt ency = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Master.ErrorMessage = this.Title;
            if (!Page.IsPostBack)
            {
                ViewState["EditLoadDS"] = "";             
                load();
            }

        }
        catch (Exception ex)
        { }
    }
    public void load()
    {
        try
        {
            if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
            {
              
                BA_Marketingactivities bamarkact = new BA_Marketingactivities();
                //ViewState["jsencryptid"] = Request.QueryString["id"].ToString();
                ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
                string js = ViewState["jsid"].ToString();
                HttpContext.Current.Session["backFlag"] = Request.QueryString["flagV"].ToString();

                ds1 = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());

                ViewState["EmailID"] = ds1.Tables[0].Rows[0]["emailid"].ToString();
                ViewState["Cell"] = ds1.Tables[0].Rows[0]["cell"].ToString();
                ViewState["Address"] = ds1.Tables[0].Rows[0]["Address"].ToString();
                ViewState["State"] = ds1.Tables[0].Rows[0]["State"].ToString();
                ViewState["City"] = ds1.Tables[0].Rows[0]["City"].ToString();

                ViewState["Industry"] = ds1.Tables[0].Rows[0]["Industry"].ToString();
                ViewState["Industry2"] = ds1.Tables[0].Rows[0]["Industry2"].ToString();
                ViewState["Industry3"] = ds1.Tables[0].Rows[0]["Industry3"].ToString();
                ViewState["ClientName"] = ds1.Tables[0].Rows[0]["ClientName"].ToString();
                ViewState["Totalexp"] = ds1.Tables[0].Rows[0]["Totalexp"].ToString();


                ViewState["FileName"] = ds1.Tables[2].Rows[0]["JSMFile"].ToString();



                dlMemInfo.DataSource = ds1.Tables[0];
                dlMemInfo.DataBind();
                lblMemInfo.Text = ds1.Tables[0].Rows[0]["fname"] + "" + ds1.Tables[0].Rows[0]["lname"];
                Session["MemName"] = ds1.Tables[0].Rows[0]["fname"] + "" + ds1.Tables[0].Rows[0]["lname"];

              

                LoadActivities();
                try
                {
                    show();

                }
                catch (Exception ex)
                {
                    DisplayResume.InnerHtml = "Resume not available";
                }

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
        //Session["PSMID"] = "Test";
    }
    public void show()
    {      
        string path = conn1 + ViewState["jsid"].ToString() + ".docx";
        Stream stream = File.Open(path, FileMode.Open);
        WordprocessingDocument doc = WordprocessingDocument.Open(stream, true);
        //Body body=;
        string text = doc.MainDocumentPart.Document.Body.Parent.InnerText;
        doc.Close();
        doc.Dispose();
        //return text;
        // string Resumetext = doc1.ExtractText();
        DisplayResume.InnerHtml = text;

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
                    string path2 = conn1 + ViewState["jsid"].ToString() + ".pdf";
                    System.IO.FileInfo filed = new System.IO.FileInfo(path);
                    System.IO.FileInfo filed1 = new System.IO.FileInfo(path1);
                    System.IO.FileInfo filed2 = new System.IO.FileInfo(path2);
                    if (filed.Exists)
                    {
                        try
                        {
                            Response.Redirect("DownLoadFilesHandler.ashx?fpath=" + path);
                            //Response.Buffer = true;
                            //Response.Clear();
                            //Response.ClearContent();
                            //Response.AppendHeader("Content-Type", "application/msword");
                            //Response.AppendHeader("Content-disposition", "attachment; filename=" + ViewState["jsid"].ToString() + ".doc" + "");
                            //Response.Write(testc1(path));
                            //Response.Flush();
                            //Response.End();
                        }
                        catch (Exception ex)
                        { }

                    }
                    else
                        if (filed1.Exists)
                        {
                            Response.Redirect("DownLoadFilesHandler.ashx?fpath=" + path1);
                            ////Response.Buffer = true;
                            //Response.Clear();
                            //Response.ClearContent();
                            //Response.AppendHeader("Content-Type", "application/x-msdownload");
                            //// Response.ContentType = "application/force-download";
                            //Response.AppendHeader("Content-disposition", "attachment;  filename=" + ViewState["jsid"].ToString() + ".doc" + "");
                            //Response.Write(testc1(path1));
                            //Response.Flush();
                            //Response.End();


                        }
                        else if (filed2.Exists)
                        {
                            //FileStream sourceFile = null;
                            try
                            {
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
                            // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Resume Unavailable')", true);
                        }
                }
            }
            else
            {
                lblresumeMsg.Visible = true;
                lblresumeMsg.Text = "Resume Unavailable";
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Resume Unavailable')", true);
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

        grdActivities.DataSource = ds1.Tables[1];
        grdActivities.DataBind();
        ddlActivities.Items.Insert(0, new ListItem("Select", "Select"));

        ddlActivities.SelectedIndex = 0;

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        BE_MarketingActivities BEMarketingAct = new BE_MarketingActivities();
        string ID = string.Empty;
        try
        {
            if (lblActivityTitle.Text == "Edit Activity")
            {
                if (ddlActivities.SelectedValue != "Select")
                {
                    BAMarketingact.UpdateActivity(ViewState["id"].ToString(), ddlActivities.SelectedItem.Text, DateTime.Now.ToString(), "", txtNotes.Text);
                    //lbldone.Text = "Updated Sucessfully";
                    LoadActivities();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Activity Updated Successfully')", true);
                    ddlActivities.SelectedIndex = 0;
                    txtNotes.Text = "";
                }
                else
                {
                    if (ddlActivities.SelectedValue == "Select")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Activity Type')", true);
                    }
                }
            }
            else if (lblActivityTitle.Text == "Add New Activity")
            {
                if (ddlActivities.SelectedValue != "Select")
                {
                    TimeZoneInfo timeZoneInfo;
                    DateTime cdt;
                    //Set the time zone information to US Mountain Standard Time 
                    timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
                    //Get date and time in US Mountain Standard Time 
                    cdt = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
                    lblActMsg.Text = "";

                    BEMarketingAct.Jsid = ViewState["jsid"].ToString();
                    BEMarketingAct.TypeofAct = ddlActivities.SelectedItem.ToString();
                    //  BEMarketingAct.Actdt = txtActdt.Text;
                    //  BEMarketingAct.ActTime = tsActTime.Hour + ":" + tsActTime.Minute + " " + tsActTime.AmPm;
                    BEMarketingAct.Notes = txtNotes.Text.Trim();
                    BEMarketingAct.ActCreatedBy = Session["Fname"].ToString();
                    BEMarketingAct.CurrentDT = cdt;
                    BAMarketingact.CreateActivity(BEMarketingAct);
                    // txtActdt.Text = txtNotes.Text = string.Empty;
                    ddlActivities.SelectedIndex = 0;
                    LoadActivities();
                    //  lblActMsg.ForeColor = System.Drawing.Color.Green;
                    //lblActMsg.Text = "Successfully created activity";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Update Activity Successfully')", true);
                    txtNotes.Text = "";
                }
                else
                {
                    if (ddlActivities.SelectedValue == "Select")
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Activity Type')", true);
                    }

                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnAddActivity_Click(object sender, EventArgs e)
    {

        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();
        try
        {
            ds1 = BAmaract.GetAllMArketingActivities(ViewState["jsid"].ToString());
            ddlActivities.DataSource = ds1.Tables[0];
            ddlActivities.DataTextField = "activities";
            ddlActivities.DataValueField = "id";
            ddlActivities.DataBind();
            ddlActivities.Items.Insert(0, new ListItem("Select", "Select"));

            lblActivityTitle.Text = "Add New Activity".ToString();
            ddlActivities.Enabled = true;
            txtNotes.Enabled = true;
            txtNotes.Text = "";
            btnSubmit.Visible = true;
            AddActiveModalPopup.Show();
        }
        catch (Exception ex)
        {

        }
    }
    protected void edit(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);
            //  txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();
            lblActivityTitle.Text = "Edit Activity".ToString();
            txtNotes.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            //  txtActdt1.Enabled = true;
            ddlActivities.Enabled = true;
            txtNotes.Enabled = true;

            DataSet ds2 = new DataSet();
            ds2 = BAmaract.GetAllMArketingActivities(ViewState["jsid"].ToString());
            ddlActivities.DataSource = ds2.Tables[0];
            ddlActivities.DataTextField = "activities";
            ddlActivities.DataValueField = "id";
            ddlActivities.DataBind();
            ddlActivities.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            //ddlActivities.Items.Insert(0, new ListItem("Select", "Select"));

            btnSubmit.Visible = true;
            AddActiveModalPopup.Show();

           

        }
    }
    protected void view(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.EditActivities(id);
            //txtActdt1.Text = ds1.Tables[0].Rows[0]["actdt"].ToString();

            lblActivityTitle.Text = "View Activity".ToString();
            txtNotes.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            // txtActdt1.Enabled = false;
            ddlActivities.Enabled = false;
            txtNotes.Enabled = false;
           
            ddlActivities.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            btnSubmit.Visible = false;
            AddActiveModalPopup.Show();

            
        }
    }
    protected void Delete(object sender, EventArgs e)
    {

        using (GridViewRow row = (GridViewRow)((ImageButton)sender).Parent.Parent)
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            int id1 = Convert.ToInt32(lbl.Text.ToString());
            BAmaract.DeletActivity(id1);
            LoadActivities();
        }
    }
    protected void Update(object sender, EventArgs e)
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        // string time = tsActTime1.Hour + ":" + tsActTime1.Minute + " " + tsActTime1.AmPm;
        BAmaract.UpdateActivity(ViewState["id"].ToString(), ddlActivities.SelectedItem.Text, DateTime.Now.ToString(), "", txtNotes.Text);
        //lbldone.Text = "Updated Sucessfully";
        LoadActivities();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Updated Successfully')", true);

    }



    protected void editdetails(object sender, EventArgs e)
    {

        EncryptDecrypt ency = new EncryptDecrypt();
        DataSet ds = new DataSet();
        BA_Marketing mar = new BA_Marketing();
        DataSet ds1 = new DataSet();
        try
        {
            //Bind the States list
            ds1 = mar.fillcategory();
            ddlstate.DataSource = ds1.Tables[1];
            ddlstate.DataTextField = "State";
            ddlstate.DataValueField = "State";
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("Select", "Select"));


            ddlCities.DataSource = ds1.Tables[2];
            ddlCities.DataTextField = "City";
            ddlCities.DataValueField = "City";
            ddlCities.DataBind();
            ddlCities.Items.Insert(0, new ListItem("Select", "Select"));

            ddlClient.DataSource = ds1.Tables[3];
            ddlClient.DataTextField = "companyname";
            ddlClient.DataValueField = "MemID";
            ddlClient.DataBind();
            ddlClient.Items.Insert(0, new ListItem("Select", "Select"));



            //Bind Industries list
            fillIndustrieslist();

            ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
            ViewState["EditLoadDS"] = ds;
            txtFName.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            //txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();

            BindRepeater();
            if (ds.Tables[4].Rows.Count > 0)
            {
                ddlJobPosition.DataSource = ds.Tables[4];
                ddlJobPosition.DataTextField = "JobTitle";
                ddlJobPosition.DataValueField = "JobID";
                ddlJobPosition.DataBind();
                ddlJobPosition.Items.Insert(0, new ListItem("Select", "Select"));
            }
            else
            {
                ddlJobPosition.Visible = false;
                lblJob.Visible = false;
            }
            string exp = ds.Tables[0].Rows[0]["totalexp"].ToString();
            if (exp == "Fresher")
            {
                ddlYearsExp.SelectedValue = "0";
                ddlMonthsExp.SelectedValue = "0";
            }
            else if (exp == "N/A")
            {
                ddlYearsExp.SelectedValue = "Select";
                ddlMonthsExp.SelectedValue = "Select";
            }
            else
            {
                try
                {
                    string[] words = exp.Split('.');
                    string[] month = words[1].Split(' ');
                    ddlYearsExp.SelectedValue = words[0];
                    ddlMonthsExp.SelectedValue = month[0];
                }
                catch (Exception ex)
                {
                    ddlYearsExp.SelectedValue = "0";
                    ddlMonthsExp.SelectedValue = "0";
                }
            }

            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["Industry"].ToString()))
            {
              
                ddlIndustries1.SelectedValue = ds.Tables[0].Rows[0]["Industry"].ToString();
            }
            else
            {
                ddlIndustries1.SelectedValue = "Select";
            }
            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["Industry2"].ToString()))
            {
                ddlIndustries2.SelectedValue = ds.Tables[0].Rows[0]["Industry2"].ToString();
            }
            else
            {
                ddlIndustries2.SelectedValue = "Select";
            }
            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["Industry3"].ToString()))
            {
                ddlIndustry3.SelectedValue = ds.Tables[0].Rows[0]["Industry3"].ToString();
            }
            else
            {
                ddlIndustry3.SelectedValue = "Select";
            }


            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["state"].ToString()))
            {
                ddlstate.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
            }
            else
            {
                ddlstate.SelectedValue = "Select";
            }
            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["City"].ToString()))
            {
                ddlCities.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            }
            else
            {
                ddlCities.SelectedValue = "Select";
            }

            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["ClientID"].ToString()))
            {
                ddlClient.SelectedValue = ds.Tables[0].Rows[0]["ClientID"].ToString();
            }
            else
            {
                ddlClient.SelectedValue = "Select";
            }

            if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["JobPosition"].ToString()))
            {
                ddlJobPosition.SelectedValue = ds.Tables[0].Rows[0]["JobPosition"].ToString();
            }
            else
            {
                ddlJobPosition.SelectedValue = "Select";
            }

            mpedit.Enabled = true;           
            mpedit.Show();

        }
        catch (Exception ex)
        {
            // Response.Redirect("~/MarketingLogin.aspx", false);
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities bamarkact = new BA_Marketingactivities();
        try
        {
            string Yexp;
            string Mexp;

            if (ddlYearsExp.SelectedIndex == 0)
            {
                Yexp = "0";
            }
            else
            {
                Yexp = ddlYearsExp.SelectedValue.ToString();
            }
            if (ddlMonthsExp.SelectedIndex == 0)
            {
                Mexp = "0";
            }
            else
            {
                Mexp = ddlMonthsExp.SelectedValue.ToString();
            }
            string exp = Yexp + '.' + Mexp;
            string emailid = string.Empty;
            foreach (RepeaterItem item in repeater1.Items)
            {
                if (((System.Web.UI.WebControls.TextBox)item.FindControl("txtEmail")).Text != "")
                {
                    //getting the values of user entered fields
                    emailid = emailid + ((System.Web.UI.WebControls.TextBox)item.FindControl("txtEmail")).Text + "|";
                }
            }
            if (!string.IsNullOrWhiteSpace(emailid))
            {
                emailid = emailid.Remove(emailid.Length - 1);
            }
            else
            {
                emailid = "";
            }
            string cell = string.Empty;
            foreach (RepeaterItem item in repContactNum.Items)
            {
                if (((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text != "")
                {
                    //getting the values of user entered fields
                    cell = cell + ((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text + "|";
                }

            }

            if (!string.IsNullOrWhiteSpace(cell))
            {
                cell = cell.Remove(cell.Length - 1);
            }
            else
            {
                cell = "";
            }


            string ind1;
            if (ddlIndustries1.SelectedValue == "Select" || ddlIndustries1.SelectedValue == "")
            {
                ind1 = "";
            }
            else
            {
                ind1 = ddlIndustries1.SelectedItem.ToString();
            }
            string ind2;
            if (ddlIndustries2.SelectedValue == "Select" || ddlIndustries2.SelectedValue == "")
            {
                ind2 = "";
            }
            else
            {
                ind2 = ddlIndustries2.SelectedItem.ToString();
            }
            string ind3;
            if (ddlIndustry3.SelectedValue == "Select" || ddlIndustry3.SelectedValue == "")
            {
                ind3 = "";
            }
            else
            {
                ind3 = ddlIndustry3.SelectedItem.ToString();
            }
            string state;
            if (ddlstate.SelectedValue == "Select" || ddlstate.SelectedValue == "")
            {
                state = "";
            }
            else
            {
                state = ddlstate.SelectedItem.ToString();
            }
            string city = string.Empty;
            if (ddlCities.SelectedValue == "Select" || ddlCities.SelectedValue == "")
            {
                city = "";
            }
            else
            {
                city = ddlCities.SelectedItem.ToString();
            }
            string Client = string.Empty;
            if (ddlClient.SelectedValue == "Select" || ddlClient.SelectedValue == "")
            {
                Client = "";
            }
            else
            {
                Client = ddlClient.SelectedValue.ToString();
            }
            string jobid = string.Empty;
            string jobtitle = string.Empty;
            if (ddlJobPosition.SelectedValue == "Select" || ddlJobPosition.SelectedValue == "" || ddlClient.SelectedValue == "None")
            {
                jobid = "";
                jobtitle = "";
            }
            else
            {
                jobid = ddlJobPosition.SelectedValue.ToString();
                jobtitle = ddlJobPosition.SelectedItem.Text;
            }
           

            bamarkact.UpdatemarletJobseekerAlready(ViewState["jsid"].ToString(), txtFName.Text.Trim(), "", "", "",
            cell, "", emailid, exp, ind1, ind2, ind3, state, city, txtAddress.Text, Client, jobid, jobtitle);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updates Successfully')", true);

            ds1 = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());
            dlMemInfo.DataSource = ds1.Tables[0];
            dlMemInfo.DataBind();
           
            load();           
            mpedit.Enabled = false;
            mpedit.Hide();
            //UpdatePanelEditDetails.Update();
        }
        catch (Exception ex)
        {
            //lblsucess.Text = ex.Message;
        }
    }
 
    protected void lnkbtnUpdateResume_Click(object sender, EventArgs e)
    {
        //Response.Redirect("uploadresume.aspx?id=" + ViewState["jsid"], false);
        DocxToText1 doc1 = new DocxToText1();
        try
        {
            if (ViewState["jsid"].ToString() != "")
            {
                string filename = ViewState["jsid"].ToString();

                if (filename != "")
                {

                    string path = conn1 + filename + ".docx";
                    if (File.Exists(path))
                    {

                        doc1.DocxToText(path);
                        string Resumetext = doc1.ExtractText();
                        //  Clipboard.SetDataObject(Resumetext);
                        txtViewResume.Text = Resumetext;
                    }
                    else
                    {
                        txtViewResume.Text = "Resume not available";
                    }

                    mpViewResume.Show();

                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Resume Not Found')", true);
        }
    }

    protected void dlMemInfo_DataBinding(object sender, EventArgs e)
    {
        string[] lines = ds1.Tables[0].Rows[0]["cell"].ToString().Split(',');

        for (int i = 0; i < lines.Length; i++)
        {
            var newLabel = new System.Web.UI.WebControls.Label();
            newLabel.Text = lines[i];
            dlMemInfo.Controls.AddAt(0, newLabel);
        }

    }
    protected void dlMemInfo_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == System.Web.UI.WebControls.ListItemType.Item)
        {
            if (!string.IsNullOrEmpty(ViewState["EmailID"].ToString()) || ViewState["EmailID"].ToString() != "")
            {

                DataList innerDataList = e.Item.FindControl("dlInnerEmail") as DataList;
                innerDataList.DataSource = convertStringToDataTable(ViewState["EmailID"].ToString());
                innerDataList.DataBind();
                // Find the div control as htmlgenericcontrol type and Hide it
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("EmailDiv");
                div.Visible = true;

            }
            else
            {
                DataList innerDataList = e.Item.FindControl("dlInnerEmail") as DataList;
                innerDataList.DataSource = null;
                innerDataList.DataBind();
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("EmailDiv");
                div.Visible = false;

            }
            if (!string.IsNullOrEmpty(ViewState["Cell"].ToString()) || ViewState["Cell"].ToString() != "")
            {

                DataList innerDataList1 = e.Item.FindControl("dlInnerCell") as DataList;
                innerDataList1.DataSource = convertStringToDataTable(ViewState["Cell"].ToString());
                innerDataList1.DataBind();
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CellDiv");
                div.Visible = true;
            }
            else
            {
                DataList innerDataList1 = e.Item.FindControl("dlInnerCell") as DataList;
                innerDataList1.DataSource = null;
                innerDataList1.DataBind();
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CellDiv");
                div.Visible = false;
            }
            if (!string.IsNullOrEmpty(ViewState["State"].ToString()) || ViewState["State"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("StateDiv");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblState")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "State"));              
            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("StateDiv");
                div.Visible = false;

            }
            if (!string.IsNullOrEmpty(ViewState["Address"].ToString()) || ViewState["Address"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("AddrDiv");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblAddress")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "Address"));
            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("AddrDiv");
                div.Visible = false;

            }
            if (!string.IsNullOrEmpty(ViewState["City"].ToString()) || ViewState["City"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CityDiv");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblCity")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "City"));

            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("CityDiv");
                div.Visible = false;
                //System.Web.UI.WebControls.Label lblCvalue = e.Item.FindControl("lblCity") as System.Web.UI.WebControls.Label;
                //lblCvalue.Visible = false;
            }
            if (!string.IsNullOrEmpty(ViewState["Totalexp"].ToString()) || ViewState["Totalexp"].ToString() != "")
            {
                string exp = ds1.Tables[0].Rows[0]["totalexp"].ToString();
                exp = exp.Trim();
                if (exp == "ys")
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("TotalexpDiv");
                    div.Visible = false;
                }
                else
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("TotalexpDiv");
                    div.Visible = true;
                }



                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblCity")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "City"));
            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("TotalexpDiv");
                div.Visible = false;

            }

            if (!string.IsNullOrEmpty(ViewState["Industry"].ToString()) || ViewState["Industry"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv1");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblCity")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "City"));

            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv1");
                div.Visible = false;
            }
            if (!string.IsNullOrEmpty(ViewState["Industry2"].ToString()) || ViewState["Industry2"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv2");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblCity")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "City"));

            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv2");
                div.Visible = false;
            }
            if (!string.IsNullOrEmpty(ViewState["Industry3"].ToString()) || ViewState["Industry3"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv3");
                div.Visible = true;
                //((System.Web.UI.WebControls.Label)e.Item.FindControl("lblCity")).Text = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "City"));
            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("IndryDiv3");
                div.Visible = false;

            }
            if (!string.IsNullOrEmpty(ViewState["ClientName"].ToString()) || ViewState["ClientName"].ToString() != "")
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("ClientDiv");
                div.Visible = true;
            }
            else
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("ClientDiv");
                div.Visible = false;

            }
        }
    }

   
    public System.Data.DataTable convertStringToDataTable(string data)
    {
        System.Data.DataTable table = new System.Data.DataTable();
        table.Columns.Add("emailid1", typeof(string));
        foreach (string row in data.Split('|'))
        {
            table.Rows.Add(row);
        }
        return table;
    }


    protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddRows")
        {
            Size = repeater1.Items.Count;
            if (Size == 5)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 emails')", true);
            }
            else
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                DataRow dr = null;
                //Create DataTable columns
                dt.Columns.Add(new DataColumn("email", typeof(string)));

                foreach (RepeaterItem item in repeater1.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["email"] = ((System.Web.UI.WebControls.TextBox)item.FindControl("txtEmail")).Text;
                    dt.Rows.Add(dr);
                }
                //Create Row for each columns
                dr = dt.NewRow();
                dr["email"] = string.Empty;
                dt.Rows.Add(dr);
                repeater1.DataSource = dt;
                repeater1.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repeater1.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repeater1.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                }
            }
            mpedit.Show();
        }

        else if (e.CommandName == "DeleteRows")
        {
            Size = repeater1.Items.Count;
            if (Size == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one Email')", true);
            }
            else
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("email", typeof(string)));

                foreach (RepeaterItem item in repeater1.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["email"] = ((System.Web.UI.WebControls.TextBox)item.FindControl("txtEmail")).Text;
                    dt.Rows.Add(dr);
                }
                RepeaterItem item1 = e.Item;
                dt.Rows[item1.ItemIndex].Delete();
                dt.AcceptChanges();
                repeater1.DataSource = dt;
                repeater1.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repeater1.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repeater1.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                }
            }
            mpedit.Show();
        }
    }
    protected void repContactNum_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddRows")
        {
            Size = repContactNum.Items.Count;
            if (Size == 5)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 emails')", true);
            }
            else
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                DataRow dr = null;
                //Create DataTable columns
                dt.Columns.Add(new DataColumn("cell", typeof(string)));

                foreach (RepeaterItem item in repContactNum.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["cell"] = ((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text;
                    dt.Rows.Add(dr);
                }
                //Create Row for each columns
                dr = dt.NewRow();
                dr["cell"] = string.Empty;
                dt.Rows.Add(dr);
                repContactNum.DataSource = dt;
                repContactNum.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repContactNum.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                }
            }
            mpedit.Show();
        }
        else if (e.CommandName == "DeleteRows")
        {
            Size = repContactNum.Items.Count;
            if (Size == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one Email')", true);
            }
            else
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("cell", typeof(string)));
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["cell"] = ((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text;

                    dt.Rows.Add(dr);
                }
                RepeaterItem item1 = e.Item;
                dt.Rows[item1.ItemIndex].Delete();
                dt.AcceptChanges();
                repContactNum.DataSource = dt;
                repContactNum.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repContactNum.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                }
            }
            mpedit.Show();
        }

    }

   

    public void BindRepeater()
    {
        DataSet ds = new DataSet();
        System.Data.DataTable dtemails = new System.Data.DataTable();
        System.Data.DataTable dtcells = new System.Data.DataTable();
        string[] emailid;
        string[] cell1;
        try
        {
            ds = (DataSet)ViewState["EditLoadDS"];
            //if email1 field is empty then bind email else bind email1
            string email1 = ds.Tables[0].Rows[0]["EmailId"].ToString();
            string cell = ds.Tables[0].Rows[0]["cell"].ToString();
            if (email1 == "" || email1 == null)
            {
                emailid = ds.Tables[0].Rows[0]["EmailId"].ToString().Split('|');
                DataRow dr = null;
                dtemails.Columns.Add(new DataColumn("email", typeof(string)));
                for (int i = 0; i < emailid.Count(); i++)
                {
                    dr = dtemails.NewRow();
                    dr["email"] = emailid[i];
                    dtemails.Rows.Add(dr);
                }
                repeater1.DataSource = dtemails;
                repeater1.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repeater1.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repeater1.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }


                }
            }
            else
            {
                emailid = ds.Tables[0].Rows[0]["EmailId"].ToString().Split('|');
                DataRow dr = null;
                dtemails.Columns.Add(new DataColumn("email", typeof(string)));
                for (int i = 0; i < emailid.Count(); i++)
                {
                    dr = dtemails.NewRow();
                    dr["email"] = emailid[i];
                    dtemails.Rows.Add(dr);
                }
                repeater1.DataSource = dtemails;
                repeater1.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repeater1.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repeater1.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }


                }
            }
            if (cell == "" || cell == null)
            {
                cell1 = ds.Tables[0].Rows[0]["Cell"].ToString().Split('|');
                DataRow dr = null;
                dtcells.Columns.Add(new DataColumn("cell", typeof(string)));
                for (int i = 0; i < cell1.Count(); i++)
                {
                    dr = dtcells.NewRow();
                    dr["cell"] = cell1[i];
                    //dtcells.Rows[i]["Cell"] = cell1[i];

                    dtcells.Rows.Add(dr);
                }
                repContactNum.DataSource = dtcells;
                repContactNum.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repContactNum.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }


                }
            }
            else
            {
                cell1 = ds.Tables[0].Rows[0]["Cell"].ToString().Split('|');
                DataRow dr = null;
                dtcells.Columns.Add(new DataColumn("cell", typeof(string)));
                for (int i = 0; i < cell1.Count(); i++)
                {
                    //dt.Rows[i]["Cell"] = cell1[i];
                    dr = dtcells.NewRow();
                    dr["cell"] = cell1[i];
                    dtcells.Rows.Add(dr);
                }
                repContactNum.DataSource = dtcells;
                repContactNum.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    Count++;
                    //getting the values of user entered fields
                    if (repContactNum.Items.Count != Count)
                    {
                        ((System.Web.UI.WebControls.Button)item.FindControl("btnAddRows")).Visible = false;
                    }


                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    private void fillIndustrieslist()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        ddlIndustries1.Items.Clear();
        ddlIndustries2.Items.Clear();
        ddlIndustry3.Items.Clear();
        try
        {
            ds = mar.fillcategory();
        
            ddlIndustries1.DataSource = ds.Tables[0];
            ddlIndustries1.DataTextField = "indusname";
            ddlIndustries1.DataValueField = "indusname";
            ddlIndustries1.DataBind();
            ddlIndustries1.Items.Insert(0, new ListItem("Select", "Select"));

           
            ddlIndustries2.DataSource = ds.Tables[0];
            ddlIndustries2.DataTextField = "indusname";
            ddlIndustries2.DataValueField = "indusname";
            ddlIndustries2.DataBind();
            ddlIndustries2.Items.Insert(0, new ListItem("Select", "Select"));

         
            ddlIndustry3.DataSource = ds.Tables[0];
            ddlIndustry3.DataTextField = "indusname";
            ddlIndustry3.DataValueField = "indusname";
            ddlIndustry3.DataBind();
            ddlIndustry3.Items.Insert(0, new ListItem("Select", "Select"));

            //ddlState.DataSource = ds.Tables[1];
            //ddlState.DataTextField = "State";
            //ddlState.DataValueField = "State_code";
            //ddlState.DataBind();

            //ddlState.Items.Insert(0, new ListItem("Select", "Select"));
            //ddlcity.Items.Insert(0, new ListItem("Select", "Select"));
        }
        catch (Exception ex)
        {

        }
    }
    protected void UpdateResume(object sender, EventArgs e)
    {
        try
        {

            string filename = ViewState["jsid"].ToString();
            string path = (conn1 + filename + ".docx").ToString();
            System.IO.FileInfo filed = new System.IO.FileInfo(path);

            if (filed.Exists)
            {
                filed.Delete();
            }
            // String fixedText = Server.HtmlDecode(txtViewResume.Text).Replace("<p>", "").Replace("</p>", "").Replace("<o:p>", "").Replace("</o:p>", "").Replace("\r", "");          
            // String fixedText = Server.HtmlDecode(body); 
            string body = txtViewResume.Text.Replace("_&lt;", "&lt;");
            string fixedText = Server.HtmlDecode(body);

            UpdateExistResumeDocx(path, fixedText.Replace("\n\n \n\n", "\n"));

            UpdatePanel_ResumeView.Update();

            show();
            load();


            string jsid = Path.GetFileNameWithoutExtension(filed.Name);
            string id = ency.EncryptDecryptString("£", jsid);
            Response.Redirect("~/marketing/Listofusers.aspx?id=" + id + "&flagV=0", false);

            //string jsid = ency.EncryptDecryptString("£", ViewState["Jsid"].ToString());
            // Response.Redirect(string.Format("Listofusers.aspx?id={0}&flagV=0", id));

        }
        catch (Exception ex)
        {
            DisplayResume.InnerHtml = "Resume not available or document reading error. " + ex.Message;
            show();
            load();
        }
    }

    public void UpdateExistResumeDocx(string resumsPath, string ResumContent)
    {
        Word.ApplicationClass oWordApp = new Word.ApplicationClass();
        object isVisible = true;
        object missing = System.Reflection.Missing.Value;

        Word.Document oWordDoc = oWordApp.Documents.Add(ref missing,
                                   ref missing, ref missing, ref missing);

        oWordDoc.Activate();
        //DocxToText1 doc = new DocxToText1();
        //doc.DocxToText(resumsPath);
        // string data = doc.ExtractText();
        //  oWordApp.Selection.HTMLDivisions.Application.Language.CompareTo("english");
        oWordApp.Selection.TypeText(ResumContent);
        oWordApp.Selection.TypeParagraph();
        // string path = "F:\\samples\\sample1\\Reader" + ResumeName + ".docx";

        oWordDoc.SaveAs(resumsPath);
        //oWordApp.Application.Quit(ref missing, ref missing, ref missing);
        //oWordDoc.Close(ref missing, ref missing, ref missing);
        ((Microsoft.Office.Interop.Word._Document)oWordDoc).Close();

    }


   
    #region //Microsoft.Office.Interop.Word Dll related stuff

    protected void lnkViewResume_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Resumes.aspx?id=" + ViewState["filename"], false);
        try
        {
            txtViewResume.Text = "";
            string connection = conn1 + ViewState["jsid"].ToString() + ".doc";
            string connection1 = conn1 + ViewState["jsid"].ToString() + ".docx";
            string connection2 = conn1 + ViewState["jsid"].ToString() + ".pdf";
            // string connection2 = conn1 + ViewState["jsid"].ToString() + ".pdf";
            System.IO.FileInfo file2 = new System.IO.FileInfo(connection);
            System.IO.FileInfo file3 = new System.IO.FileInfo(connection1);
            System.IO.FileInfo file4 = new System.IO.FileInfo(connection2);
            // System.IO.FileInfo file4 = new System.IO.FileInfo(connection2);
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
    public void CreateNewDoc(string resumsPath, string ResumContent)
    {
        Microsoft.Office.Interop.Word.ApplicationClass oWordApp = new Microsoft.Office.Interop.Word.ApplicationClass();

        object isVisible = true;
        object missing = System.Reflection.Missing.Value;

        Microsoft.Office.Interop.Word.Document oWordDoc = oWordApp.Documents.Add(ref missing,
                                   ref missing, ref missing, ref missing);

        oWordDoc.Activate();

        oWordApp.Selection.TypeText(ResumContent);
        oWordApp.Selection.TypeParagraph();

        Object savePath = resumsPath;
        System.IO.FileInfo filed = new System.IO.FileInfo(resumsPath);
        Microsoft.Office.Interop.Word.Application oWord = new Microsoft.Office.Interop.Word.Application();

        oWordDoc.SaveAs(ref savePath,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing,
            ref missing
           );


        object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
        System.Runtime.InteropServices.Marshal.ReleaseComObject(oWordDoc);
        // word has to be case to type _Application so that it will find 
        // the correct Quit method. 
        ((Microsoft.Office.Interop.Word._Application)oWord).Quit(ref doNotSaveChanges, ref missing, ref missing);
        System.Runtime.InteropServices.Marshal.ReleaseComObject(oWord);
        //  oWordDoc.SaveAs(resumsPath);

        oWordApp.Application.Quit(ref missing, ref missing, ref missing);


    }

    #endregion
 

    DA_Ploutos.DA_Marketing dajobs = new DA_Ploutos.DA_Marketing();
    protected void ddlClient_SelectedIndexChanged(object sender, EventArgs e)
    {

        string clientid = ddlClient.SelectedValue;
        DataSet ds = new DataSet();
        ds = dajobs.GetJobposition(clientid);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlJobPosition.DataSource = ds.Tables[0];
            ddlJobPosition.DataTextField = "JobTitle";
            ddlJobPosition.DataValueField = "JobID";
            ddlJobPosition.DataBind();
            ddlJobPosition.Items.Insert(0, new ListItem("Select", "Select"));
            ddlJobPosition.Visible = true;
            lblJob.Visible = true;
        }
        else
        {
            ddlJobPosition.Visible = false;
            lblJob.Visible = false;
        }
        if (clientid == "None")
        {
            ddlJobPosition.Visible = false;
            lblJob.Visible = false;
        }
        mpedit.Show();
    }




    #region //Reject ,Accept ,Hold Functionality----Not Using Now
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Aceptcandiadte(ViewState["jsid"].ToString());
        // lblstatus.Text = "Candidate Accepted";
        // lblstatus.ForeColor = System.Drawing.Color.Green;
        if (true) // (btnReject.Visible == true && btnAccept.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlist.aspx");
        }
        else if (true) // (btnReject.Visible == false && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/Rejectcanlist.aspx");
        }
        else if (true) // (btnReject.Visible == true && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumes.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Profile Accepted Successfully')", true);
        }

    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Rejectcandiadte(ViewState["jsid"].ToString());
        lblstatus.Text = "Candidate Rejected";
        lblstatus.ForeColor = System.Drawing.Color.Red;
        if (true)// (btnReject.Visible == true && btnAccept.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlist.aspx");
        }
        else if (true)// (btnReject.Visible == false && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/Rejectcanlist.aspx");
        }
        else if (true) // (btnReject.Visible == true && btnAccept.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumes.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Profile Rejected Successfully')", true);
        }

    }
    protected void btnHold_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        try
        {
            ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
            string status = (ds.Tables[0].Rows[0]["status"].ToString());
            BAMarketingact.Holdcandiadte(ViewState["jsid"].ToString());
            lblstatus.Text = "Candidate Hold";
            lblstatus.ForeColor = System.Drawing.Color.Red;
            if (true)// (btnReject.Visible == true && btnAccept.Visible == false)
            {
                Response.Redirect("~/marketing/acceptedcanlist.aspx");
            }
            else if (true)// (btnReject.Visible == false && btnAccept.Visible == true)
            {
                Response.Redirect("~/marketing/Rejectcanlist.aspx");
            }
            else if (true)// (btnReject.Visible == true && btnAccept.Visible == true)
            {
                Response.Redirect("~/marketing/ViewUploadedResumes.aspx");
            }
        }
        catch (Exception ex)
        {

        }
    }


    public void CreateNewDocByDocx(string resumsPath, string ResumContent)
    {
        //DocxToText1 docTT = new DocxToText1();
        try
        {
            string fileName = resumsPath;
            using (DocX document = DocX.Create(fileName))
            {

                Novacode.Paragraph remainingpara = document.InsertParagraph();
                remainingpara.Append(ResumContent);
                remainingpara.Direction = Direction.LeftToRight;

                Novacode.Formatting para_formatting = new Novacode.Formatting();
                para_formatting.Bold = false;
                para_formatting.Size = 9;

                document.InsertSection();
                document.SaveAs(fileName);
            }
        }
        catch (Exception ex)
        {
        }

    }
    #endregion

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}