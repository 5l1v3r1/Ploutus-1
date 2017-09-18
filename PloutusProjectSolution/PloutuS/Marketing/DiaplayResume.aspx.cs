using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Windows.Forms;
using DocxToTextDemo;

using Word = Microsoft.Office.Interop.Word;
public partial class Marketing_DiaplayResume : System.Web.UI.Page
{
    string path;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        path = Session["path"].ToString();
        if (!Page.IsPostBack)
        {
            show();
        }
       
    }
    public void show()
    {
     
        DocxToText1 doc1 = new DocxToText1();


        doc1.DocxToText(path);
        string Resumetext= doc1.ExtractText().Replace("\r\n\r\n", "<br />");
        displayResume.InnerHtml = Resumetext.Replace("\r\n", "<br />");
    }
    
}