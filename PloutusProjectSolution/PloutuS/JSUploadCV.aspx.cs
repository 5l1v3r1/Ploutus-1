//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Data.SqlClient;
//using Microsoft.Office;
//using System.Text.RegularExpressions;
//using System.IO;
//using System.Configuration;
//using AjaxControlToolkit;
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

public partial class JobSeekerInfo : System.Web.UI.Page
{
    
    JobSeeker js = new JobSeeker();
    string filename = string.Empty;
    string ext = string.Empty;
    string ReturnMsg = string.Empty;
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
 

    protected void Page_Load(object sender, EventArgs e)
    {
        ReturnMsg = Server.UrlDecode(Request.QueryString["Parameter"].ToString());       
        ViewState["ReturnMsg"] = ReturnMsg;       
   
    }
   

    protected bool checkFileType(string filename)
    {
        return (Path.GetExtension(filename).ToLower() == ".doc" || Path.GetExtension(filename).ToLower() == ".docx");
    }


    

   
  
    protected void imgbtnBrowse_Click1(object sender, ImageClickEventArgs e)
    {
       
            pnlUpload.Visible = true;
            pnlCopy.Visible = false;
            pnlMain.Visible = false;
    
     


    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {

            if (uploadFile.HasFile)
            {
                if (uploadFile.PostedFile.ContentLength <= 1024000)
                {
                    if (checkFileType(uploadFile.FileName))
                    {
                        string ext = Path.GetExtension(uploadFile.FileName).ToLower();

                        uploadFile.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + ReturnMsg.ToString() + ext);

                        filename = ReturnMsg.ToString() + ext;

                        DataSet ds1 = new DataSet();
                        ds1 = js.JSUpload(ReturnMsg.ToString(), filename);

                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Resume uploaded successfully')", true);
                        Response.Redirect("JobSeekerInfo.aspx", false);

                    }
                    else
                    {

                    }
                }

                else
                {

                }

            }
            else
            {


            }
        }
        catch (Exception ex)
        {
      
        }
    }
  
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlUpload.Visible = false;
        pnlCopy.Visible = false;
        pnlMain.Visible = true;
    }
    protected void imgbtnCopy_Click(object sender, ImageClickEventArgs e)
    {
        pnlMain.Visible = false;
        pnlUpload.Visible = false;
        pnlCopy.Visible = true;
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string jsid = ReturnMsg.ToString();
            if (!string.IsNullOrEmpty(jsid))
            {
                string strPath = (conn1 + jsid + ".docx").ToString();
                DataSet ds1 = new DataSet();
                string body = txtResumeBuilder.Text.Replace("_&lt;", "&lt;");
                string fixedText = Server.HtmlDecode(body);
                CreateNewDoc(strPath, fixedText.Replace("\n\n \n\n", "\n"), jsid);
               // Clearinfo();               
                DataSet ds2 = new DataSet();
                ds2 = js.JSUpload(ReturnMsg.ToString(), jsid+".docx");
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Resume uploaded successfully')", true);
                Response.Redirect("JobSeekerInfo.aspx",false);
            }
            else
            {
               
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Entered email already existed')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.ToString() + "')", true);
        }
    }

    public void CreateNewDoc(string resumsPath, string ResumContent, string filename)
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


}