using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;
using System.Web.Script.Serialization;
using System.Text;
using BA_Ploutos;
using System.Data;
using System.Data.SqlClient;
using BE_Ploutos;
using DA_Ploutos;
using System.Configuration;
using System.Xml;
using System.IO.Packaging;
using DocxToTextDemo;
using Word = Microsoft.Office.Interop.Word;
using System.Text.RegularExpressions;
using Novacode;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using DocumentFormat.OpenXml;

public partial class SelfUploadResumes : System.Web.UI.Page
{
    BE_MarketingReg bemarreg = new BE_MarketingReg();
    DA_MarketingReg damarreg = new DA_MarketingReg();
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    public int Size;
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Master.ErrorMessage = this.Title;
        if (!IsPostBack)
        {
            BindRepeater();
           // fillIndustrieslist();
           // fillclientsAndPojection();
           // ddlposition.Items.Insert(0, new System.Web.UI.WebControls.ListItem("None", "None"));
        }
    }
    //private void fillIndustrieslist()
    //{
    //    BA_Marketing mar = new BA_Marketing();
    //    DataSet ds = new DataSet();
    //    try
    //    {
    //        ds = mar.fillcategory();
    //        ddlIndustry.DataSource = ds.Tables[0];
    //        ddlIndustry.DataTextField = "indusname";
    //        ddlIndustry.DataValueField = "indusname";
    //        ddlIndustry.DataBind();
    //        ddlIndustry.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "Select"));
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
    //private void fillclientsAndPojection()
    //{
    //    DA_Marketing mar = new DA_Marketing();
    //    DataSet ds = new DataSet();
    //    ds = mar.GetClientsDetails();
    //    ddlclient.DataSource = ds.Tables[0];
    //    ddlclient.DataTextField = "companyname";
    //    ddlclient.DataValueField = "Memid";
    //    ddlclient.DataBind();
    //    ddlclient.Items.Insert(0, new System.Web.UI.WebControls.ListItem("None", "None"));
    //}
    //protected void ddlclient_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DA_Marketing mar = new DA_Marketing();
    //    if (ddlclient.SelectedItem.Value != "None")
    //    {
    //        DataSet ds = new DataSet();
    //        ds = mar.GetJobposition(ddlclient.SelectedItem.Value);
    //        ddlposition.DataSource = ds.Tables[0];
    //        ddlposition.DataTextField = "jobtitle";
    //        ddlposition.DataValueField = "JobID";
    //        ddlposition.DataBind();
    //        ddlposition.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "Select"));
    //        ddlIndustry.Visible = false;
    //        lbltext.Visible = false;
    //    }
    //    else
    //    {
    //        ddlposition.Items.Clear();
    //        ddlposition.Items.Insert(0, new System.Web.UI.WebControls.ListItem("None", "None"));
    //        ddlIndustry.Visible = true;
    //        lbltext.Visible = true;
    //        fillIndustrieslist();
    //    }
    //}
    public void BindRepeater()
    {
        DataTable edt = new DataTable();
        DataTable sdt = new DataTable();
        DataTable cdt = new DataTable();
        DataRow edr = null;
        DataRow cdr = null;
        DataRow sdr = null;
        edt.Columns.Add(new DataColumn("email", typeof(string)));
        cdt.Columns.Add(new DataColumn("ContactNum", typeof(string)));
        sdt.Columns.Add(new DataColumn("Status", typeof(string)));
        edr = edt.NewRow();
        edr["email"] = string.Empty;
        cdr = cdt.NewRow();
        cdr["ContactNum"] = string.Empty;
        sdr = sdt.NewRow();
        sdr["Status"] = string.Empty;
        edt.Rows.Add(edr);
        repemail.DataSource = edt;
        repemail.DataBind();
        sdt.Rows.Add(sdr);
        //repStatus.DataSource = sdt;
       // repStatus.DataBind();
        cdt.Rows.Add(cdr);
        repContactNum.DataSource = cdt;
        repContactNum.DataBind();
    }
    string ext = ".docx";
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string jsid = updateinfo();
            if (!string.IsNullOrEmpty(jsid))
            {
                string strPath = (conn1 + jsid + ext).ToString();
                DataSet ds1 = new DataSet();
                string body = txtResumeBuilder.Text.Replace("_&lt;", "&lt;");
                string fixedText = Server.HtmlDecode(body);
                CreateNewDoc(strPath, fixedText.Replace("\n\n \n\n", "\n"), jsid);
                Clearinfo();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Uploaded Successfully')", true);
            }
            else
            {
               // fillIndustrieslist();
                //fillclientsAndPojection();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Entered email already existed')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('"+ex.Message.ToString()+"')", true);
        }
    }
    private string updateinfo()
    {
        bemarreg.firstName = txtFName.Text.Trim();
        bemarreg.middleName = "";
        bemarreg.lastName = "";
        bemarreg.Ext = ext;
        List<string> emailsList = new List<string>();
        string tempemils = string.Empty;
        foreach (RepeaterItem item in repemail.Items)
        {
            if (((TextBox)item.FindControl("txtEmail")).Text != "")
            {
                emailsList.Add(((TextBox)item.FindControl("txtEmail")).Text.ToString() + ",");
                bemarreg.email = bemarreg.email + ((TextBox)item.FindControl("txtEmail")).Text + "|";
            }
        }
        string[] asdfg = emailsList.ToArray();
        string val = string.Join("", asdfg);
        char[] mychar = { ',' };
        tempemils = val.TrimEnd(mychar);
        //if (!(damarreg.FindExistEmailID(tempemils) >= 1))
        //{
            if (bemarreg.email.Length > 0)
            {
                bemarreg.email = bemarreg.email.Remove(bemarreg.email.Length - 1);
            }
            foreach (RepeaterItem item in repContactNum.Items)
            {
                if (((TextBox)item.FindControl("txtContactNum")).Text != "")
                {
                    bemarreg.ContactNum = bemarreg.ContactNum + ((TextBox)item.FindControl("txtContactNum")).Text + "|";
                }
            }
            if (bemarreg.ContactNum.Length > 0)
            {
                bemarreg.ContactNum = bemarreg.ContactNum.Remove(bemarreg.ContactNum.Length - 1);
            }
            //foreach (RepeaterItem item in repStatus.Items)
            //{
            //    if (((TextBox)item.FindControl("txtStatus")).Text != "")
            //    {
            //        bemarreg.Status = bemarreg.Status + ((TextBox)item.FindControl("txtStatus")).Text + "|";
            //    }
            //}
            if (bemarreg.Status.Length > 0)
            {
                bemarreg.Status = bemarreg.Status.Remove(bemarreg.Status.Length - 1);
            }

            //if (ddlIndustry.SelectedItem.Value == "Select")
            //{
            //    bemarreg.Industry1 = "";
            //}
            //else
            //{
            //    bemarreg.Industry1 = ddlIndustry.SelectedItem.Text.ToString();

            //}
            DA_Marketing mar = new DA_Marketing();
           // bemarreg.Client = ddlclient.SelectedItem.Value.ToString();

            //if (ddlclient.SelectedItem.Value.ToString() != "" || ddlclient.SelectedItem.Value.ToString() != "None")
            //{
            //    DataSet ds = new DataSet();
            //    ds = mar.GetClientCategory(ddlclient.SelectedItem.Text.ToString());

            //    bemarreg.Industry1 = ds.Tables[0].Rows[0]["Category"].ToString();
            //}
           // bemarreg.JobTitle = ddlposition.SelectedItem.Value.ToString();
            //bemarreg.UploadBy = Session["PSMEMAIL"].ToString();
            bemarreg.UploadBy = "Self";
            string jsid = damarreg.InsertMarketing(bemarreg);
            return jsid;
        //}
        //else
        //{
        //    return null;
        //}
    }
    private void Clearinfo()
    {
        txtFName.Text = string.Empty;
        txtResumeBuilder.Text = string.Empty;
        BindRepeater();
       // fillclientsAndPojection();
        //ddlposition.Items.Clear();
       // ddlposition.Items.Insert(0, new System.Web.UI.WebControls.ListItem("None", "None"));
       // ddlIndustry.Visible = true;
       // lbltext.Visible = true;
      //  fillIndustrieslist();
    }
    protected void repContactNum_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "AddRows")
        {
            Size = repContactNum.Items.Count;
            if (Size == 5)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 ContactNo')", true);
            }
            else
            {
                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("ContactNum", typeof(string)));
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    dr = dt.NewRow();
                    dr["ContactNum"] = ((TextBox)item.FindControl("txtContactNum")).Text;
                    dt.Rows.Add(dr);
                }
                dr = dt.NewRow();
                dr["ContactNum"] = string.Empty;
                dt.Rows.Add(dr);
                repContactNum.DataSource = dt;
                repContactNum.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    Count++;
                    if (repContactNum.Items.Count != Count)
                    {
                        ((Button)item.FindControl("btnAddRows")).Visible = false;
                    }
                }
                txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);
            }
        }

        else if (e.CommandName == "DeleteRows")
        {
            Size = repContactNum.Items.Count;
            if (Size == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one ContactNo')", true);
            }
            else
            {
                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("ContactNum", typeof(string)));
                foreach (RepeaterItem item in repContactNum.Items)
                {
                    dr = dt.NewRow();
                    dr["ContactNum"] = ((TextBox)item.FindControl("txtContactNum")).Text;

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
                    if (repContactNum.Items.Count != Count)
                    {
                        ((Button)item.FindControl("btnAddRows")).Visible = false;
                    }
                }
            }
            txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);
        }
    }
    //protected void repStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{

    //    if (e.CommandName == "AddRows")
    //    {
    //        Size = repStatus.Items.Count;
    //        if (Size == 5)
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 Statues')", true);
    //        }
    //        else
    //        {
    //            DataTable dt = new DataTable();
    //            DataRow dr = null;
    //            dt.Columns.Add(new DataColumn("Status", typeof(string)));
    //            foreach (RepeaterItem item in repStatus.Items)
    //            {
    //                dr = dt.NewRow();
    //                dr["Status"] = ((TextBox)item.FindControl("txtStatus")).Text;
    //                dt.Rows.Add(dr);
    //            }
    //            dr = dt.NewRow();
    //            dr["Status"] = string.Empty;
    //            dt.Rows.Add(dr);
    //            repStatus.DataSource = dt;
    //            repStatus.DataBind();
    //            int Count = 0;
    //            foreach (RepeaterItem item in repStatus.Items)
    //            {
    //                Count++;
    //                if (repStatus.Items.Count != Count)
    //                {
    //                    ((Button)item.FindControl("btnAddRows")).Visible = false;
    //                }

    //            } txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);

    //        }
    //    }

    //    else if (e.CommandName == "DeleteRows")
    //    {
    //        Size = repStatus.Items.Count;
    //        if (Size == 1)
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one Status')", true);
    //        }
    //        else
    //        {
    //            DataTable dt = new DataTable();
    //            DataRow dr = null;
    //            dt.Columns.Add(new DataColumn("Status", typeof(string)));
    //            foreach (RepeaterItem item in repStatus.Items)
    //            {
    //                dr = dt.NewRow();
    //                dr["Status"] = ((TextBox)item.FindControl("txtStatus")).Text;
    //                dt.Rows.Add(dr);
    //            }
    //            RepeaterItem item1 = e.Item;
    //            dt.Rows[item1.ItemIndex].Delete();
    //            dt.AcceptChanges();
    //            repStatus.DataSource = dt;
    //            repStatus.DataBind();

    //            int Count = 0;
    //            foreach (RepeaterItem item in repStatus.Items)
    //            {
    //                Count++;
    //                if (repStatus.Items.Count != Count)
    //                {
    //                    ((Button)item.FindControl("btnAddRows")).Visible = false;
    //                }

    //            } txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);
    //        }
    //    }
    //}
    protected void repemail_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "AddRows")
        {
            Size = repemail.Items.Count;
            if (Size == 5)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 emails')", true);
            }
            else
            {
                DataTable edt = new DataTable();
                DataRow edr = null;
                edt.Columns.Add(new DataColumn("email", typeof(string)));

                foreach (RepeaterItem item in repemail.Items)
                {
                    edr = edt.NewRow();
                    edr["email"] = ((TextBox)item.FindControl("txtEmail")).Text;
                    edt.Rows.Add(edr);
                }
                edr = edt.NewRow();
                edr["email"] = string.Empty;
                edt.Rows.Add(edr);
                repemail.DataSource = edt;
                repemail.DataBind();

                int Count = 0;
                foreach (RepeaterItem item in repemail.Items)
                {
                    Count++;
                    if (repemail.Items.Count != Count)
                    {
                        ((Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                } txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);
            }
        }

        else if (e.CommandName == "DeleteRows")
        {
            Size = repemail.Items.Count;
            if (Size == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one Email')", true);
            }
            else
            {
                DataTable edt = new DataTable();
                DataRow edr = null;
                edt.Columns.Add(new DataColumn("email", typeof(string)));
                foreach (RepeaterItem item in repemail.Items)
                {
                    edr = edt.NewRow();
                    edr["email"] = ((TextBox)item.FindControl("txtEmail")).Text;

                    edt.Rows.Add(edr);
                }
                RepeaterItem item1 = e.Item;
                edt.Rows[item1.ItemIndex].Delete();
                edt.AcceptChanges();
                repemail.DataSource = edt;
                repemail.DataBind();
                int Count = 0;
                foreach (RepeaterItem item in repemail.Items)
                {
                    Count++;
                    if (repemail.Items.Count != Count)
                    {
                        ((Button)item.FindControl("btnAddRows")).Visible = false;
                    }

                } txtResumeBuilder.Text = Server.HtmlDecode(txtResumeBuilder.Text);
            }
        }
    }
    public void CreateNewDoc(string resumsPath, string ResumContent,string filename)
    {       

        using (WordprocessingDocument document = WordprocessingDocument.Create(resumsPath, WordprocessingDocumentType.Document))
        {
            MainDocumentPart mainPart = document.AddMainDocumentPart();
            mainPart.Document = new Document(new Body());
            Body body = new Body();
            //Create paragraph
            DocumentFormat.OpenXml.Wordprocessing.Paragraph paragraph = new DocumentFormat.OpenXml.Wordprocessing.Paragraph();
            DocumentFormat.OpenXml.Wordprocessing.Run run_paragraph = new DocumentFormat.OpenXml.Wordprocessing.Run();
            // we want to put that text into the output document
            Text text_paragraph = new Text(ResumContent);
            //Append elements appropriately.
            run_paragraph.Append(text_paragraph);
            paragraph.Append(run_paragraph);
            body.Append(paragraph);
            mainPart.Document.Append(body);
            document.MainDocumentPart.Document.Save();
            document.Close();
        }
    }
    public void CreateNewDocByDocx(string resumsPath, string ResumContent)
    {
        DocxToText1 docTT = new DocxToText1();
        try
        {
            string fileName = resumsPath;
            using (DocX document = DocX.Create(fileName))
            {
                Novacode.Paragraph remainingpara = document.InsertParagraph();
                remainingpara.Append(ResumContent);
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
}