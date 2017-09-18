using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using BE_Ploutos;
using System.Text;
using DocxToTextDemo;
using Encrypt;
using System.IO;
using DA_Ploutos;
using BA_Ploutos;

public partial class Marketing_SelectedCandidatesProfile : System.Web.UI.Page
{

    string Jsid;
    string id;
    public int Size;
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    DA_hiredprocess daEmpHier = new DA_hiredprocess();
    BE_MarketingHiring beHiring = new BE_MarketingHiring();
    BA_Marketingactivities bamarkact = new BA_Marketingactivities();
    DataSet ds1 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Master.ErrorMessage = this.Title;

            if (!Page.IsPostBack)
            {
                //ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                //scriptManager.RegisterPostBackControl(this.lnkViewResume);
                load();
                BindRepeater();
               // FillDDLCompanyNames();

            }

        }
        catch (Exception ex)
        { }
    }


    #region Candidate ProfileData/EditeData

    public void BindRepeater()
    {
        DataSet ds = new DataSet();
        ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        //if email1 field is empty then bind email else bind email1
        string email1 = ds.Tables[2].Rows[0]["EmailId"].ToString();
        string cell = ds.Tables[0].Rows[0]["cell"].ToString();
        if (email1 == "" || email1 == null)
        {
            string[] emailid = ds.Tables[2].Rows[0]["EmailId"].ToString().Split('|');
            System.Data.DataTable dt = new System.Data.DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("email", typeof(string)));
            for (int i = 0; i < emailid.Count(); i++)
            {
                dr = dt.NewRow();
                dr["email"] = emailid[i];
                dt.Rows.Add(dr);
            }
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
        else
        {
            string[] emailid = ds.Tables[2].Rows[0]["EmailId"].ToString().Split('|');
            System.Data.DataTable dt = new System.Data.DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("email", typeof(string)));
            for (int i = 0; i < emailid.Count(); i++)
            {
                dr = dt.NewRow();
                dr["email"] = emailid[i];
                dt.Rows.Add(dr);
            }
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
        if (cell == "" || cell == null)
        {
            string[] cell1 = ds.Tables[0].Rows[0]["Cell"].ToString().Split('|');
            System.Data.DataTable dt = new System.Data.DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("cell", typeof(string)));
            for (int i = 0; i < cell1.Count(); i++)
            {
                dr = dt.NewRow();
                dr["cell"] = cell1[i];
                dt.Rows.Add(dr);
            }
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
        else
        {
            string[] cell1 = ds.Tables[0].Rows[0]["Cell"].ToString().Split('|');
            System.Data.DataTable dt = new System.Data.DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("cell", typeof(string)));
            for (int i = 0; i < cell1.Count(); i++)
            {
                dr = dt.NewRow();
                dr["cell"] = cell1[i];
                dt.Rows.Add(dr);
            }
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
    }
    private void fillIndustrieslist()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
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
        if (e.Item.ItemType == ListItemType.Item)
        {
            DataList innerDataList = e.Item.FindControl("dlInnerEmail") as DataList;
            innerDataList.DataSource = convertStringToDataTable(ViewState["EmailID"].ToString());
            innerDataList.DataBind();
            DataList innerDataList1 = e.Item.FindControl("dlInnerCell") as DataList;
            innerDataList1.DataSource = convertStringToDataTable(ViewState["Cell"].ToString());
            innerDataList1.DataBind();
        }
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

            fillIndustrieslist();           
            ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
            txtFName.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            //txtMName.Text = ds.Tables[0].Rows[0]["mname"].ToString();
            // txtLName.Text = ds.Tables[0].Rows[0]["lname"].ToString();
            //txtMobileNumber.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
            // txtCellNumber.Text = ds.Tables[0].Rows[0]["Cell"].ToString();
            // txtHomeNumber.Text = ds.Tables[0].Rows[0]["HomeNum"].ToString();
            BindRepeater();
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
            //ddlIndustries1.SelectedValue = ds.Tables[0].Rows[0]["Industry"].ToString();
            //ddlIndustries2.SelectedValue = ds.Tables[0].Rows[0]["Industry2"].ToString();
            //ddlIndustry3.SelectedValue = ds.Tables[0].Rows[0]["Industry3"].ToString();
            //try
            //{
            //    // ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
            //}
            //catch (Exception ex)
            //{
            //}
            //ddlState_SelectedIndexChanged(null, null);
            //ddlcity.SelectedValue = ds.Tables[0].Rows[0]["city"].ToString();
            //txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            mpedit.Show();

        }
        catch (Exception ex)
        {
            Response.Redirect("~/MarketingLogin.aspx", false);
        }
        // check if postback came through AjaxFileUpload control



        //   Response.Redirect("MarketingEdit.aspx?id=" + ViewState["jsid"], false);
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

    protected void btnUpdateHd_Click(object sender, EventArgs e)
    {
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

            emailid = emailid.Remove(emailid.Length - 1);
            string cell = string.Empty;
            foreach (RepeaterItem item in repContactNum.Items)
            {
                if (((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text != "")
                {
                    //getting the values of user entered fields
                    cell = cell + ((System.Web.UI.WebControls.TextBox)item.FindControl("txtCellNumber")).Text + "|";
                }
            }

            cell = cell.Remove(cell.Length - 1);
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

            BA_Marketingactivities bamarkact = new BA_Marketingactivities();
            //bamarkact.UpdatemarletJobseekerAlready(ViewState["jsid"].ToString(), txtFName.Text, "", "", "", cell, "", emailid, exp, ddlIndustries1.SelectedValue, ddlIndustries2.SelectedValue, ddlIndustry3.SelectedValue, state, txtCity.Text, txtAddress.Text);
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updates Successfully')", true);

            ds1 = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());
            dlMemInfo.DataSource = ds1.Tables[0];
            dlMemInfo.DataBind();
            // lblsucess.Text = "Updated Sucessfully";

            load();
            mpedit.Hide();
        }
        catch (Exception ex)
        {
            // lblsucess.Text = ex.Message;
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

    #endregion 

    #region Candidate Resume/Download/update/Edit

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
                  // string content = DisplayResume.InnerHtml;
                 //  string modifiedString = content.Replace("<br>", "");
                 //  string x1 = getResume(path1);
                 //  string x = testc1(path1);
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
                            //Response.Buffer = true;
                            //Response.Clear();
                            //Response.ClearContent();
                            //Response.AppendHeader("Content-Type", "application/x-msdownload");
                            // Response.ContentType = "application/force-download";
                            //Response.AppendHeader("Content-disposition", "attachment;  filename=" + ViewState["jsid"].ToString() + ".doc" + "");
                            //Response.Write(testc1(path1));
                            //Response.Flush();
                            //Response.End();


                    //    }
               //         else
               //             if (filed1.Exists)
               //             {

               //         Response.Clear();
               // Response.Buffer = true;
               // Response.ContentType = "application/vnd.ms-excel";
               // // Response.ContentType ="application/text";
               // Response.AddHeader("Content-Disposition", "attachment;filename=" + ViewState["jsid"].ToString() + ".doc" + "");
 
               // Response.Charset = "";
               // this.EnableViewState = false;
 
               // System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
               // System.Web.UI.Html32TextWriter oHtmlTextWriter = new System.Web.UI.Html32TextWriter(oStringWriter);
               //// gvCustomData.RenderControl(oHtmlTextWriter);
               //// Response.AppendHeader("Content-disposition", "attachment;  filename=" + ViewState["jsid"].ToString() + ".doc" + "");
               // Response.Write(testc1(path1));
               // Response.End();
              
                        
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

    protected void UpdateResume(object sender, EventArgs e)
    {
        try
        {
            string filename = ViewState["jsid"].ToString();
            string path = conn1 + filename + ".docx";
            System.IO.FileInfo filed = new System.IO.FileInfo(path);
            if (filed.Exists)
            {
                filed.Delete();

            }
            String fixedText = Server.HtmlDecode(txtViewResume.Text).Replace("<p>", "").Replace("</p>", "").Replace("<o:p>", "").Replace("</o:p>", "").Replace("\r", "");


            CreateNewDoc(path, fixedText.Replace("\n\n \n\n", "\n"));
            //CreateNewDoc(path, txtViewResume.Text);
            show();
            load();
        }
        catch (Exception ex)
        {

        }
    }
    private string testc1(string path)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(@"<html xmlns:v='urn:schemas-microsoft-com:vml'" +
"xmlns:o='urn:schemas-microsoft-com:office:office'" +
"xmlns:w='urn:schemas-microsoft-com:office:word'" +
"xmlns:m='http://schemas.microsoft.com/office/2004/12/omml'" +
"xmlns='http://www.w3.org/TR/REC-html40'>" +
"<head><meta http-equiv=Content-Type content='text/html; charset=utf-8'><title></title>" +
"<style>" +
@"v\:* {behavior:url(#default#VML);}" +
@"o\:* {behavior:url(#default#VML);}" +
@"w\:* {behavior:url(#default#VML);}" +
".shape {behavior:url(#default#VML);}" +
"</style>" +
"<xml>" +
"<w:WordDocument>" +
"<w:View>Print</w:View>" +
"<w:Zoom>100</w:Zoom>" +
"<w:DoNotOptimizeForBrowser/>" +
"</w:WordDocument>" +
"</xml>" +
"</head>" +

"<body>" +
"<div class='Section1'>" +

   " <p>&nbsp;</p>" +
"<br/>" +
   " <table id='hrdftrtbl' border='0' cellspacing='0' cellpadding='0'>" +
  "<tr><td>        <div style='mso-element:body' id=b1 >" +
     "   <!-- HEADER-tags -->" +
     getResume(path) +
    "    <!-- end HEADER-tags -->" +

    "    </div>" +
  "  </td></tr>" +

    "</td></tr>" +
   " </table></div></body></html>");
        return sb.ToString();
        //string strPath = Server.MapPath("~/Myfiles/") + "mywordfile11.doc";
        //FileStream fStream = File.Create(strPath);
        //fStream.Close();
        //StreamWriter sWriter = new StreamWriter(strPath);
        //sWriter.Write(sb);
        //sWriter.Close();

    }
    private string getResume(string path)
    {
        DocxToText1 doc1 = new DocxToText1();
        // string path = "F://JSM1328.docx";
        doc1.DocxToText(path);
        return doc1.ExtractText();
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

    protected void lnkbtnUpdateResume_Click(object sender, EventArgs e)
    {
        //Response.Redirect("uploadresume.aspx?id=" + ViewState["jsid"], false);
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
                        DocxToText1 doc1 = new DocxToText1();
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

    public void show()
    {
        try
        {
            DocxToText1 doc1 = new DocxToText1();

            string path = conn1 + ViewState["jsid"].ToString() + ".docx";
            doc1.DocxToText(path);
            //  string Resumetext = doc1.ExtractText().Replace("\r\n\r\n", "<br />");
            DisplayResume.InnerHtml = doc1.ExtractText();
        }
        catch (Exception ex)
        {
            DisplayResume.InnerHtml = "Resume not available or document reading error. " + ex.Message;
            //Response.Redirect("listofusers.aspx?id=" + Request.QueryString["id"].ToString(), false);
        }

    }
    #endregion


    #region Candidate Activitys/Edit/Update

    private void LoadActivities()
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();
        ds1 = BAmaract.GetAllMArketingActivities(ViewState["jsid"].ToString());
        ddlactvities1.DataSource = ds1.Tables[0];
        ddlactvities1.DataTextField = "activities";
        ddlactvities1.DataValueField = "id";
        ddlactvities1.DataBind();

        ddlactvities1.DataSource = ds1.Tables[0];
        ddlactvities1.DataTextField = "activities";
        ddlactvities1.DataValueField = "id";
        ddlactvities1.DataBind();
      //  grdActivities.DataSource = ds1.Tables[1];
       // grdActivities.DataBind();
        ddlactvities1.Items.Insert(0, new ListItem("Select", "Select"));
        ddlactvities1.Items.Insert(0, new ListItem("Select", "Select"));
        ddlactvities1.SelectedIndex = 0;

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //if (ddlActivities.SelectedIndex != 0 && txtActdt.Text != "")
            if (ddlactvities1.SelectedIndex != 0)
            {
                TimeZoneInfo timeZoneInfo;
                DateTime cdt;
                //Set the time zone information to US Mountain Standard Time 
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
                //Get date and time in US Mountain Standard Time 
                cdt = TimeZoneInfo.ConvertTime(DateTime.Now, timeZoneInfo);
                
                BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
                BE_MarketingActivities BEMarketingAct = new BE_MarketingActivities();

                BEMarketingAct.Jsid = ViewState["jsid"].ToString();
                BEMarketingAct.TypeofAct = ddlactvities1.SelectedItem.ToString();
                BEMarketingAct.Notes = txtNotes1.Text.Trim();
                BEMarketingAct.ActCreatedBy = Session["Fname"].ToString();
                BEMarketingAct.CurrentDT = cdt;
                BAMarketingact.CreateActivity(BEMarketingAct);
               
                ddlactvities1.SelectedIndex = 0;
                LoadActivities();
                txtNotes1.Text = string.Empty;
                btnupdate.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Created Activity Successfully')", true);
               
            }
            else
            {
                if (ddlactvities1.SelectedIndex == 0)
                {
                    // lblActMsg.Text = "Please select Activity Type";
                    // lblActMsg.ForeColor = System.Drawing.Color.Red;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Activity Type')", true);
                }
                else
                {
                    // lblActMsg.ForeColor = System.Drawing.Color.Red;
                    // lblActMsg.Text = "Activity Date is mandatory";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Activity Date is mandatory')", true);
                }
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void AddActivits(object sender, EventArgs e) {
        btnupdate.Visible = false;
        btnATvSave.Visible = true;
        mpeshow.Show();
    
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
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            //  txtActdt1.Enabled = true;
            ddlactvities1.Enabled = true;
            txtNotes1.Enabled = true;
            ddlactvities1.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            btnupdate.Visible = true;
            btnATvSave.Visible = false;
            mpeshow.Show();

        }
    }
    protected void Update(object sender, EventArgs e)
    {
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        // string time = tsActTime1.Hour + ":" + tsActTime1.Minute + " " + tsActTime1.AmPm;
        BAmaract.UpdateActivity(ViewState["id"].ToString(), ddlactvities1.SelectedItem.Text, DateTime.Now.ToString(), "", txtNotes1.Text);
        //lbldone.Text = "Updated Sucessfully";
        LoadActivities();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Updated Successfully')", true);

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
            txtNotes1.Text = ds1.Tables[0].Rows[0]["notes"].ToString();
            string time = ds1.Tables[0].Rows[0]["acttime"].ToString();
            // txtActdt1.Enabled = false;
            ddlactvities1.Enabled = false;
            txtNotes1.Enabled = false;
            // tsActTime1.Enabled = false;
            // DateTime dttime = DateTime.Parse(time);
            //MKB.TimePicker.TimeSelector.AmPmSpec am_pm;
            //if (dttime.ToString("tt") == "AM")
            //{
            //    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.AM;
            //}
            //else
            //{
            //    am_pm = MKB.TimePicker.TimeSelector.AmPmSpec.PM;
            //}
            // tsActTime1.SetTime(dttime.Hour, dttime.Minute, am_pm);
            ddlactvities1.SelectedItem.Text = ds1.Tables[0].Rows[0]["typeofact"].ToString();
            btnupdate.Visible = false;

            mpeshow.Show();
        }
    }

    #endregion 

    #region Candidate HiredProcess/Edit/Update

    public void FillHiredGrid()
    {


        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillHiredCandidateGridData(ViewState["jsid"].ToString());
       // grvHiredata.DataSource = ds.Tables[0];
        //grvHiredata.DataBind();



    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            DA_hiredprocess daEmpHier = new DA_hiredprocess();
            BE_MarketingHiring beHiring = new BE_MarketingHiring();

           // BA_Marketingactivities bamarkact = new BA_Marketingactivities();
            beHiring.CandidateName = Session["MemName"].ToString();
            beHiring.CompanyName = txtCompanyName.Text;
            beHiring.AppointingDate = Convert.ToDateTime(txtAppntDate.Text);
            beHiring.ContractPodFrom = Convert.ToDateTime(txtCntractFDate.Text);
            beHiring.ContractPodTo = Convert.ToDateTime(txtCntractTDate.Text);
            beHiring.CompanyLocation = txtCLocation.Text;
            beHiring.JobType = txtjobType.Text;
            beHiring.Position = txtPosition.Text;
            beHiring.Salary =Convert.ToInt32(txtSalary.Text);
            beHiring.SalaryType = ddlSalType.SelectedItem.Text;
            beHiring.HiredBy = Session["PSMEName"].ToString();
            beHiring.Jsid = ViewState["jsid"].ToString();


            daEmpHier.InsertHiredPfofile(beHiring);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Candidate Hired Successfully')", true);
            load();
            ClearHiredData();
            mpedit.Hide();
            Response.Redirect("~/marketing/Companys List.aspx");
           
        }
        catch (Exception ex)
        {
          //  lblsucess.Text = ex.Message;
        }
    }

    public void ClearHiredData() {

        txtCompanyName.Text = string.Empty;

         txtAppntDate.Text=string.Empty;
       txtCntractFDate.Text=string.Empty;
   txtCntractTDate.Text=string.Empty;
txtPosition.Text=string.Empty;
txtSalary.Text = string.Empty;
ddlSalType.SelectedItem.Value = "-1";
    }
    //public void FillDDLCompanyNames()
    //{
    //    DA_hiredprocess daHir = new DA_hiredprocess();
    //    DataSet ds = new DataSet();
    //    ds = daHir.FillCompanyNames();
    //    ddlCName.DataSource = ds.Tables[0];
    //    ddlCName.DataTextField = "CompanyName";
    //    ddlCName.DataValueField = "CompanyName";
    //    ddlCName.DataBind();

    //}

    protected void AdHirData(object sender, EventArgs e)
    {
        btnSave.Visible = true;
       

        mdPopHire.Show();



    }

    protected void EditHiredData(object sender, EventArgs e)
    {


        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DA_hiredprocess daHire = new DA_hiredprocess();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;
            btnSave.Visible = false;
            btnUpdateHired.Visible = true;
            DataSet ds = new DataSet();

            ds = daHire.EditHiredData(Convert.ToInt32(id));

            txtCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtAppntDate.Text = ds.Tables[0].Rows[0]["AppointingDate"].ToString();
            txtCntractFDate.Text = ds.Tables[0].Rows[0]["ContractFromDate"].ToString();
            txtCntractTDate.Text = ds.Tables[0].Rows[0]["ContractToDate"].ToString();
            txtjobType.Text = ds.Tables[0].Rows[0]["JobType"].ToString();
            txtPosition.Text = ds.Tables[0].Rows[0]["Position"].ToString();
            txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
            ddlSalType.SelectedItem.Text = ds.Tables[0].Rows[0]["SalaryType"].ToString();

            mdPopHire.Show();

            

        }



    }

    protected void ViewHierData(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            DA_hiredprocess daHire = new DA_hiredprocess();
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)row.Cells[0].FindControl("lblid");
            id = lbl.Text.ToString();
            ViewState["id"] = id;

            DataSet ds = new DataSet();

            ds = daHire.EditHiredData(Convert.ToInt32(id));

            txtCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            txtAppntDate.Text = ds.Tables[0].Rows[0]["AppointingDate"].ToString();
            txtCntractFDate.Text = ds.Tables[0].Rows[0]["ContractFromDate"].ToString();
            txtCntractTDate.Text = ds.Tables[0].Rows[0]["ContractToDate"].ToString();
            txtPosition.Text = ds.Tables[0].Rows[0]["Position"].ToString();
            txtjobType.Text = ds.Tables[0].Rows[0]["JobType"].ToString();
            txtSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
            ddlSalType.SelectedItem.Text = ds.Tables[0].Rows[0]["SalaryType"].ToString();


            txtCompanyName.Enabled = false;
            txtAppntDate.Enabled = false;
            txtCntractFDate.Enabled = false;
            txtCntractTDate.Enabled = false;
            txtPosition.Enabled = false;
            txtSalary.Enabled = false;
            txtjobType.Enabled = false;
            ddlSalType.Enabled = false;
            btnUpdateHired.Visible = false;
            mdPopHire.Show();

        }

    }

    protected void UpdateHireData(object sender, EventArgs e) {


        DA_hiredprocess daEmpHier = new DA_hiredprocess();
        BE_MarketingHiring beHiring = new BE_MarketingHiring();

        daEmpHier.UpdateHiredProfile(ViewState["id"].ToString(), txtCompanyName.Text, Convert.ToDateTime(txtAppntDate.Text), Convert.ToDateTime(txtCntractFDate.Text), Convert.ToDateTime(txtCntractTDate.Text),
               txtPosition.Text, txtjobType.Text,Convert.ToInt32(txtSalary.Text),ddlSalType.SelectedItem.Text);
                      
           
           
            FillHiredGrid();
            mdPopHire.Hide();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Candidate Updated Successfully')", true);
        //}
    }
    #endregion


  

    public void load()
    {
        try
        {
        //    if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
        //    {
                // CalendarExtender1.StartDate = DateTime.Now.AddDays(-1);
                // CalendarExtender2.StartDate = DateTime.Now;
                //  tsActTime.SetTime(00, 00, MKB.TimePicker.TimeSelector.AmPmSpec.AM);

                EncryptDecrypt ency = new EncryptDecrypt();
                BA_Marketingactivities bamarkact = new BA_Marketingactivities();
                //ViewState["jsencryptid"] = Request.QueryString["id"].ToString();
                ViewState["jsid"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
                //ViewState["jsid"] = "0001";

                //this is For SendMail hidden fiels to pass Jsid
                hdnFielsJSID.Value = ViewState["jsid"].ToString();  
 
                ds1 = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());
                ViewState["EmailID"] = ds1.Tables[0].Rows[0]["emailid"].ToString();
                ViewState["Cell"] = ds1.Tables[0].Rows[0]["cell"].ToString();
                ViewState["FileName"] = ds1.Tables[2].Rows[0]["JSMFile"].ToString();

                dlMemInfo.DataSource = ds1.Tables[0];
                dlMemInfo.DataBind();
                lblMemInfo.Text = ds1.Tables[0].Rows[0]["fname"] + "" + ds1.Tables[0].Rows[0]["lname"];
                Session["MemName"] = ds1.Tables[0].Rows[0]["fname"] + "" + ds1.Tables[0].Rows[0]["lname"];
                string status = ds1.Tables[0].Rows[0]["status"].ToString();
                if (status == "1" || status == "2")
                {
                   // btnAccept.Visible = false;
                    btnReject.Visible = true;
                }
                else if (status == "3" || status == "4")
                {
                   // btnAccept.Visible = true;
                    btnReject.Visible = false;
                }
                else
                {
                   // btnAccept.Visible = true;
                    btnReject.Visible = true;
                }
                LoadActivities();
                FillHiredGrid();
                  show();
               

            //}
            //else
            //{
            //    Response.Redirect("~/MarketingLogin.aspx", false);
            //}
        }
        catch (Exception ex)
        {
           // Response.Redirect("~/MarketingLogin.aspx", false);
        }
        //Session["PSMID"] = "Test";
    }
   
    protected void btnHired_Click(object sender, EventArgs e)
    {
        btnSave.Visible = true;


        mdPopHire.Show();
       
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
        if (btnReject.Visible == true && btnHired.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlist.aspx");
        }
        else if (btnReject.Visible == false && btnHired.Visible == true)
        {
            Response.Redirect("~/marketing/Rejectcanlist.aspx");
        }
        else if (btnReject.Visible == true && btnHired.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumes.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Profile Rejected Successfully')", true);
        }

    }


    protected void btnHold_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities BAMarketingact = new BA_Marketingactivities();
        DataSet ds = new DataSet();
        ds = BAMarketingact.GetmarketingMemdetails(ViewState["jsid"].ToString());
        string status = (ds.Tables[0].Rows[0]["status"].ToString());
        BAMarketingact.Holdcandiadte(ViewState["jsid"].ToString());
        lblstatus.Text = "Candidate Hold";
        lblstatus.ForeColor = System.Drawing.Color.Red;
        if (btnReject.Visible == true && btnHired.Visible == false)
        {
            Response.Redirect("~/marketing/acceptedcanlist.aspx");
        }
        else if (btnReject.Visible == false && btnHired.Visible == true)
        {
            Response.Redirect("~/marketing/Rejectcanlist.aspx");
        }
        else if (btnReject.Visible == true && btnHired.Visible == true)
        {
            Response.Redirect("~/marketing/ViewUploadedResumes.aspx");
        }
    }


    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        EncryptDecrypt ency = new EncryptDecrypt();
        BA_Marketingactivities bamarkact = new BA_Marketingactivities();
        DataSet mailDS = new DataSet();
        DataTable dt = new DataTable();
        string Body = string.Empty;
        string subject = string.Empty;
        string emailTo = string.Empty;
        try
        {
            if (ViewState["jsid"].ToString() != null || ViewState["jsid"].ToString() != " ")
            {

                mailDS = bamarkact.GetmarketingMemdetails(ViewState["jsid"].ToString());

                string jobseekerName = mailDS.Tables[0].Rows[0]["fname"] + "  " + mailDS.Tables[0].Rows[0]["lname"];
                string name = "Dear" + " " + jobseekerName.ToString() + ",";
                string line1 = "Thank you for sending us the letter with your resume regarding the position of  <Position> in our company.";
                string line2 = "We would be glad to meet you on <Date> for a preliminary interview to discuss this opportunity.";
                string line3 = "I believe it will be a wonderful chance for me to learn more about your experience and to discuss how it can benefit our company in particular.";
                Body = string.Format("{0}{1}{2}{3}{4}{5}{6}{7}", name, Environment.NewLine, Environment.NewLine, line1, Environment.NewLine, line2, Environment.NewLine, line3);
                //string storedBody = string.Format("{0}<br/><br/>{1}<br/>{2}<br/>{3}", name, line1, line2, line3);              

                string To = mailDS.Tables[0].Rows[0]["emailid"].ToString();

                string jsid = ViewState["jsid"].ToString();
                string from = Session["PSMEMAIL"].ToString();
                string RecFName = mailDS.Tables[0].Rows[0]["fname"].ToString();
                subject = "Walk-In on <DateAndTime> for (0-5 years) Dotnet Developer openings in PI Pvt Ltd at HYD";

                if (bamarkact.InsertSendMailDetails(jsid, To, from, subject, Body, RecFName) >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully saved Sending Email Details')", true);

                    //Response.Redirect("OpenOutlook.ashx?jsid=" + ViewState["jsid"].ToString()+"&&From="+from);


                    //var comma = Regex.Match(To, @",");
                    //var orst = Regex.Match(To, @"|");
                    //if (comma.Success)
                    //{
                    //    string[] Nums = To.Split(',');
                    //    emailTo = Nums[0].ToString();

                    //}
                    //else if (orst.Success)
                    //{
                    //    string[] Nums = To.Split('|');
                    //    emailTo = Nums[0].ToString();
                    //}
                    //else
                    //{
                    //    emailTo = mailDS.Tables[0].Rows[0]["emailid"].ToString();

                    //}

                    //Outlook.Application oApp = new Outlook.Application();
                    //Outlook._MailItem oMailItem = (Outlook._MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem);
                    ////Outlook.Inspector oInspector = oMailItem.GetInspector;   
                    //oMailItem.To = emailTo;

                    //oMailItem.Body = Body;
                    //oMailItem.Subject = subject;
                    //// oMailItem.Importance =Outlook.OlImportance.olImportanceHigh;

                    //// body, bcc etc...
                    //oMailItem.Display(true);
                    ////oMailItem.Save();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error Occered Try Again')", true);
                }



            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "')", true);
        }
    }

   
}