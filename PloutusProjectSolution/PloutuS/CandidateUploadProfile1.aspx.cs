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

public partial class CandidateUploadProfile : System.Web.UI.Page
{
    BEJobSeeker bemarreg = new BEJobSeeker();
  //  DA_MarketingReg damarreg = new DA_MarketingReg();
    DAJobSeeker dajobseeker = new DAJobSeeker();
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    public int Size;
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Master.ErrorMessage = this.Title;
        if (!IsPostBack)
        {
           
        }
    }
   
    string ext = ".docx";
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

     string jsid = updateinfo();
       
        //string strPath = ConfigurationManager.AppSettings["Resumes"].ToString() + jsid + "." + ext;
     string strPath =(conn1 + jsid + ext).ToString();
        DataSet ds1 = new DataSet();
        string body = txtResumeBuilder.Text.Replace("_&lt;", "&lt;");
       // String fixedText = Server.HtmlDecode(body);

        string fixedText = Server.HtmlDecode(body);

        CreateNewDoc(strPath, fixedText.Replace("\n\n \n\n", "\n"));
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Uploaded Successfully')", true);
     
        Clearinfo();

        
  
    }
    private void Clearinfo()
    {
        txtFName.Text = string.Empty;
        txtContactNo.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtLName.Text = string.Empty;
        txtResumeBuilder.Text = string.Empty;
       
    }
    private string updateinfo()
    {
        // string selectedItem = string.Empty;

        bemarreg.firstName = txtFName.Text.Trim();
        //bemarreg.middleName = "";
        bemarreg.lastName = txtLName.Text.Trim();
        bemarreg.mobile = txtContactNo.Text.Trim();
        bemarreg.email = txtEmail.Text.Trim();
        bemarreg.Ext = ext;
        string jsid = dajobseeker.InsertCandidateData(bemarreg);
        return jsid;
    }
       


   

  

    public void CreateNewDoc(string resumsPath, string ResumContent)
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

        oWordApp.Application.Quit(ref missing, ref missing, ref missing);

    }


    public void CreateNewDocByDocx(string resumsPath,string ResumContent)
    {
        DocxToText1 docTT = new DocxToText1();    
        try
        {
            string fileName = resumsPath;         
            using (DocX document =DocX.Create(fileName))
            {                

                Novacode.Paragraph remainingpara = document.InsertParagraph();
                remainingpara.Append(ResumContent);
                Novacode.Formatting para_formatting = new Novacode.Formatting();
                para_formatting.Bold = false;
                para_formatting.Size = 9;          
                document.InsertSection();
               // document.Save();
                document.SaveAs(fileName);
            }           
        }
        catch (Exception ex)
        {
        }

    }

    

}