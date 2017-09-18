<%@ WebHandler Language="C#" Class="DownLoadFilesHandler" %>

using System;
using System.Web;
using System.IO;
using Encrypt;

public class DownLoadFilesHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
        string sfilepath = request.QueryString["fpath"];
        EncryptDecrypt ency = new EncryptDecrypt();
        //string sfilepath = HttpContext.Current.Request.MapPath("~/Resume20141117104910.docx");

        string type = String.Empty, filepath = String.Empty;
        filepath = sfilepath;
        FileInfo file = new FileInfo(filepath);
        string path = file.ToString(); ;
        if (File.Exists(path))
        {
            
                string name = Path.GetFileName(Convert.ToString(file));
                string ext = Path.GetExtension(Convert.ToString(file)).ToLower();
                string x = Path.GetFileNameWithoutExtension(Convert.ToString(file));
                //Response.Buffer = true;
                //Response.Clear();
                //Response.ClearContent();
                //Response.AppendHeader("Content-Type", "application/msword");
                //Response.AppendHeader("Content-disposition", "attachment; filename=" + ViewState["jsid"].ToString() + ".doc" + "");
                // Response.Write(testc1(path));
                //Response.Flush();
                //Response.End();

                if (!String.IsNullOrEmpty(ext))
                {
                    switch (ext)
                    {
                        case ".doc": //this .doc for 97 to 2003 Ms-Word format
                            type = "Application/msword";
                            break;
                        case ".docx": //this .docx for 2003 to 2007 Ms-word format
                            type = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                            break;
                        case ".pdf": //Pdf Format
                            type = "application/pdf";
                            break;

                    }
                }
                //context.Response.ClearHeaders();
                ////Response.AppendHeader("Content-Type", "application/x-msdownload");
                //context.Response.AddHeader("Content-Disposition", "attachment; filename=" + name);
                //context.Response.AppendHeader("Content-Length", file.Length.ToString());
                //if (type != null)
                //    context.Response.ContentType = type;

                //context.Response.WriteFile(testc1(path));
                //context.Response.Flush();
                // Response.End();

                context.Response.Buffer = true;
                context.Response.Clear();
                context.Response.ClearContent();
                context.Response.AppendHeader("Content-Type", "application/msword");
                context.Response.AppendHeader("Content-disposition", "attachment; filename=" + x + ".doc" + "");
                context.Response.Write(testc1(path));
                // context.Response.WriteFile(path);
                context.Response.Flush();
                context.Response.End();
            
        }
        else
        {
            System.IO.FileInfo filed = new System.IO.FileInfo(path);
            string jsid = Path.GetFileNameWithoutExtension(filed.Name);
            string id = ency.EncryptDecryptString("£", jsid);
            context.Response.Redirect("~/marketing/Listofusers.aspx?id=" + id, false);                  
            
        }


        //string filename = context.Request.QueryString["File"];

        //Validate the file name and make sure it is one that the user may access
        // context.Response.Buffer = true;
        // context.Response.Clear();
        // context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
        // context.Response.ContentType = "application/octet-stream";
        // context.Response.WriteFile("~/downloads/" + filename);            
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
    }
    private string testc1(string path)
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
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
        try
        {
            Stream stream = File.Open(path, FileMode.Open);
            DocumentFormat.OpenXml.Packaging.WordprocessingDocument doc = DocumentFormat.OpenXml.Packaging.WordprocessingDocument.Open(stream, true);
            //Body body=;
            string text = doc.MainDocumentPart.Document.Body.Parent.InnerText;
            doc.Close();
            stream.Close();
            return text;
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}