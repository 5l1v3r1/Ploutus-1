<%@ WebHandler Language="C#" Class="OpenOutlook" %>

using System;
using System.Web;
using Outlook = Microsoft.Office.Interop.Outlook;
using System.Data;
using BA_Ploutos;
using Encrypt;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Web.UI;

public class OpenOutlook : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {

        string jsid = string.Empty;
        System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
        if (request.QueryString["jsid"].ToString() != null || request.QueryString["jsid"].ToString() != " ")
        {
            jsid = request.QueryString["jsid"].ToString();
            EncryptDecrypt ency = new EncryptDecrypt();
            BA_Marketingactivities bamarkact = new BA_Marketingactivities();
            DataSet mailDS = new DataSet();
            List<string> result = new List<string>();
            string To = string.Empty;
            string Body = string.Empty;
            string Subject = string.Empty;
            string emailTo = string.Empty;
            string id = string.Empty;
            try
            {
                if (jsid != null || jsid != " ")
                {
                    mailDS = bamarkact.GetmarketingMemdetails(jsid);
                    To = mailDS.Tables[0].Rows[0]["emailid"].ToString();
                    string jobseekerName = mailDS.Tables[0].Rows[0]["fname"] + "  " + mailDS.Tables[0].Rows[0]["lname"];
                    string name = "Dear" + " " + jobseekerName.ToString() + ",";
                    string line1 = "Thank you for sending us the letter with your resume regarding the position of  <Position> in our company.";
                    string line2 = "We would be glad to meet you on <Date> for a preliminary interview to discuss this opportunity.";
                    string line3 = "I believe it will be a wonderful chance for me to learn more about your experience and to discuss how it can benefit our company in particular.";
                    Body = string.Format("{0}{1}{2}{3}{4}{5}{6}{7}", name, Environment.NewLine, Environment.NewLine, line1, Environment.NewLine, line2, Environment.NewLine, line3);
                    string from = request.QueryString["From"];
                    string RecFName = mailDS.Tables[0].Rows[0]["fname"].ToString();
                    Subject = "Walk-In on <DateAndTime> for (0-5 years) Dotnet Developer openings in PI Pvt Ltd at HYD";

                    var comma = Regex.Match(To, @",");
                    var orst = Regex.Match(To, @"|");
                    if (comma.Success)
                    {
                        string[] Nums = To.Split(',');
                        emailTo = Nums[0].ToString();

                    }
                    else if (orst.Success)
                    {
                        string[] Nums = To.Split('|');
                        emailTo = Nums[0].ToString();
                    }
                    else
                    {
                        emailTo = mailDS.Tables[0].Rows[0]["emailid"].ToString();
                    }

                    Outlook.Application oApp = new Outlook.Application();
                    Outlook._MailItem oMailItem = (Outlook._MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem);
                    //Outlook.Inspector oInspector = oMailItem.GetInspector;   
                    oMailItem.To = emailTo;

                    oMailItem.Body = Body;
                    oMailItem.Subject = Subject;
                                       
                    oMailItem.Display(true);
                    //oMailItem.Save();                                   
                  
                    //HttpContext.Current.Response.End();
                    HttpContext.Current.Response.Flush();
                    HttpContext.Current.Response.Close();
                   
                    
                    
                    //oMailItem.CC = "xxxx@pi-international.net"; 
                    //string storedBody = oMailItem.HTMLBody;
                    // oMailItem.HTMLBody = Body + oMailItem.HTMLBody;
                    //storedBody = ((Microsoft.Office.Interop.Outlook.MailItem)oMailItem).Body;

                    //if (!oMailItem.Body.EndsWith(Body))
                    //{                        
                    //    ((Microsoft.Office.Interop.Outlook.MailItem)oMailItem).HTMLBody = storedBody;
                    //}  

                }
            }
            catch (Exception ex)
            {
               // context.Response.Redirect("~/marketing/SelectedCandidatesProfile.aspx?id=" + id);
            }
        }
        else
        {
           // id = ency.EncryptDecryptString("£", jsid);
           //context.Response.Redirect("~/marketing/SelectedCandidatesProfile.aspx?id=" + id, false);
                  
        }
           
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}