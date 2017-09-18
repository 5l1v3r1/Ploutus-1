using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Office;
using System.Text.RegularExpressions;
using System.IO;
using System.Configuration;
 

public partial class JobSeekerInfo : System.Web.UI.Page
{
    
    JobSeeker js = new JobSeeker();
    string filename = string.Empty;
    string ext = string.Empty;
    string email = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             email = Session["eid"].ToString();
            int mode = 1;
            DataSet ds = new DataSet();
            ds = js.JSReview(email, mode);

            if(ds.Tables[0].Rows.Count>0)
            { 
            txtFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
            txtLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
            ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
            txtZipCode.Text = ds.Tables[0].Rows[0]["zip"].ToString();
            txtHomePhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
            txtMobilePhone.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
            txtWorkPhone.Text = ds.Tables[0].Rows[0]["work"].ToString();
            txtAdd1.Text = ds.Tables[0].Rows[0]["addressline1"].ToString();
            txtAdd2.Text = ds.Tables[0].Rows[0]["addressline2"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
            
            //if( Session["CapFName"].ToString()!="")
            //{
            //    txtFName.Text = Session["CapFName"].ToString();
            //}
            //if (Session["CapLName"].ToString() != "")
            //{
            //    txtLName.Text = Session["CapLName"].ToString();
            //}
            //if (Session["CapMobile"].ToString() != "")
            //{
            //    txtMobilePhone.Text = Session["CapMobile"].ToString();
            //}
            //if (Session["CapZip"].ToString() != "")
            //{
            //    txtZipCode.Text = Session["CapZip"].ToString();
            //}

            }
        }
       
       // email = "pmksunil@ymail.com";    
        
    }

    #region /*upload resume code...upload shifted to another page*/ 

    //protected void btnUpload_Click(object sender, EventArgs e)
    //{
        
        
    //    WordFileToRead.SaveAs(Server.MapPath(WordFileToRead.FileName));
    //    object filename = Server.MapPath(WordFileToRead.FileName);
    //    Microsoft.Office.Interop.Word.ApplicationClass AC = new Microsoft.Office.Interop.Word.ApplicationClass();
    //    Microsoft.Office.Interop.Word.Document doc = new Microsoft.Office.Interop.Word.Document();
    //    object readOnly = false;
    //    object isVisible = true;
    //    object missing = System.Reflection.Missing.Value;
    //    try
    //    {
    //        doc = AC.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref isVisible, ref isVisible, ref missing, ref missing, ref missing);

    //        StringReader sr = new StringReader(doc.Content.Text);

    //        string[] NameSurname1 = doc.Content.Text.Split('\r');

    //        string fullname = NameSurname1[0];

    //        string[] name = fullname.Split();
    //        if (name.Length == 3)
    //        {
    //            txtFName.Text = name[0];
    //            txtLName.Text = name[2];
    //        }
    //        else
    //        {
    //            txtFName.Text = name[0];
    //            txtLName.Text = name[1];
    //        }

    //        const string MatchPhonePattern = @"\(?\d{3}\)?-? *\d{3}-? *-?\d{4}";
    //        Regex rx = new Regex(MatchPhonePattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
    //        // Find matches.
    //        MatchCollection matches = rx.Matches(doc.Content.Text);
    //        // Report the number of matches found.
    //        int noOfMatches = matches.Count;
    //        // Report on each match.
    //        //  string tempPhoneNumbers = "";
    //        foreach (Match match in matches)
    //        {
    //            txtMobilePhone.Text = txtMobilePhone.Text + match.Value.ToString();
    //        }

    //        const string MatchEmailPattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
    //        Regex rx1 = new Regex(MatchEmailPattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
    //        // Find matches.
    //        MatchCollection matches1 = rx1.Matches(doc.Content.Text);
    //        // Report the number of matches found.
    //        int noOfMatches1 = matches1.Count;
    //        // Report on each match.
    //        string tempemail = "";
    //        foreach (Match match1 in matches1)
    //        {

    //           // txtEmail.Text = txtEmail.Text + match1.Value.ToString();

    //        }

    //        const string Zipcode = @"\d{5}";
    //        Regex rxzipcode = new Regex(Zipcode, RegexOptions.Compiled | RegexOptions.IgnoreCase);
    //        // Find matches.
    //        MatchCollection matcheszip = rxzipcode.Matches(doc.Content.Text);
    //        // Report the number of matches found.
    //        int mat = matcheszip.Count;
    //        // Report on each match.           
    //        foreach (Match match2 in matcheszip)
    //        {

    //            txtZipCode.Text = txtZipCode.Text + match2.Value.ToString();

    //        }

    //       ViewState["filename"] = WordFileToRead.FileName.ToString();

    //        //ext = Path.GetExtension(WordFileToRead.FileName).ToLower();

    //       ViewState["ext"] = System.IO.Path.GetExtension(this.WordFileToRead.PostedFile.FileName);

    //       //AC.Documents.Close();

    //    }
    //    catch (Exception ex)
    //    {

    //    }

    //}

    //protected bool checkFileType(string filename)
    //{
    //    return (Path.GetExtension(filename).ToLower() == ".doc" || Path.GetExtension(filename).ToLower() == ".docx");
    //}

    #endregion

    protected void btnContApp_Click(object sender, EventArgs e)
    {       

        filename="";
        string ReturnMsg = js.JSInfo(Session["eid"].ToString(), filename.ToString(), txtFName.Text, txtLName.Text, txtHomePhone.Text, txtMobilePhone.Text, txtWorkPhone.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, ddlState.SelectedValue.ToString() , txtZipCode.Text);
        //WordFileToRead.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + ReturnMsg + ViewState["ext"].ToString());
        Response.Redirect("JobSeekerQuestionnaire.aspx",false);

        #region /*removed code*/
        //*Remove because upload file section moved to another page*//
         //try
         //{
         //    string fname = ViewState["filename"].ToString();
         //    if (checkFileType(fname))
         //    {
         //        if (WordFileToRead.PostedFile.ContentLength <= 1024000)
         //        {
         //            string selectedItem = string.Empty;
         //          //  bereg.tempId = Session.SessionID.ToString();
         //          //  bereg.firstName = txtFName.Text;
         //          //  bereg.middleName = txtMName.Text;
         //          //  bereg.lastName = txtLName.Text;
         //           // bereg.address1 = txtAddr1.Text;
         //           // bereg.address2 = txtAddr2.Text;
         //           // bereg.city = txtCity.Text;
         //           // bereg.state = ddlState.Text;
         //           // bereg.zip = txtZip.Text;
         //          //  bereg.phone = txtPhone.Text;
         //          //  bereg.mobile = txtMobile.Text;
         //           // bereg.email = txtEmail.Text;
         //          //  bereg.legallyUs = rbLegallyUs.SelectedValue.ToString();
         //          //  bereg.mRecentEmp = txtMRecentEmployer.Text;
         //          //  bereg.jobTitle = txtJobTitle.Text;
         //          //  bereg.fieldExpertise = ddlFieldExpertise.SelectedValue.ToString();
         //          //  bereg.experience = ddlYearsExp.SelectedValue.ToString() + "." + ddlMonthsExp.SelectedValue.ToString();
         //            //if (lbPreLoc.Items.Count > 0)
         //            //{
         //            //    for (int i = 0; i < lbPreLoc.Items.Count; i++)
         //            //    {
         //            //        if (lbPreLoc.Items[i].Selected)
         //            //        {
         //            //            selectedItem += lbPreLoc.Items[i].Value + ',';
         //            //        }
         //            //    }
         //            //}
         //            //selectedItem = selectedItem.Remove(selectedItem.Length - 1);
         //           // bereg.prefLoc = selectedItem;
         //            //bereg.HighEdu = ddlHEdu.SelectedValue.ToString();
         //           // bereg.password = EncryptPassword_Client(txtPassword.Text);
         //           // bereg.filename = Path.GetExtension(fpResume.FileName).ToLower();
         //            string ReturnMsg = js.JSInfo(email, ViewState["filename"].ToString(), txtFName.Text, txtLName.Text, txtHomePhone.Text, txtMobilePhone.Text, txtWorkPhone.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, ddlState.SelectedItem.Text, txtZipCode.Text);


         //            string[] ext = fname.Split('.');
         //            string exts = Path.GetExtension(fname).ToLower();
         //            WordFileToRead.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + ReturnMsg + exts);
         //                    //SendMail();
         //                    //lblMsg.Text = "";
         //                    //txtFName.Text = "";
         //                    //txtMName.Text = "";
         //                    //txtLName.Text = "";
         //                    //txtAddr1.Text = "";
         //                    //txtAddr2.Text = "";
         //                    //txtCity.Text = "";
         //                    //ddlState.SelectedIndex = 0;
         //                    //txtZip.Text = "";
         //                    //txtPhone.Text = "";
         //                    //txtMobile.Text = "";
         //                    //txtEmail.Text = "";
         //                    //txtPassword.Text = "";
         //                    //rbLegallyUs.ClearSelection();
         //                    //txtMRecentEmployer.Text = "";
         //                    //txtJobTitle.Text = "";
         //                    //ddlFieldExpertise.SelectedIndex = 0;
         //                    //ddlYearsExp.SelectedIndex = 0;
         //                    //ddlMonthsExp.SelectedIndex = 0;
         //                       Response.Redirect("JobSeekerQuestionnaire.aspx?Parameter=" + Server.UrlEncode(email));

                        
                     
         //            //conn.Close();
         //        }
         //        else
         //        {
         //           // lblMsg.Text = "File size exceeded the maximum size limit. Please upload file having size below 1 megabyte.";
         //        }
         //    }
         //    else
         //    {
         //       // lblMsg.Text = "Please upload .doc or .docx format files only";
         //    }
         //}
         //catch (Exception ex1)
         //{
         //    //lblMsg.Text = ex1.Message;
         //}
         //finally
         //{

        //}    
        #endregion

    }
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        filename = "";
        string ReturnMsg = js.JSInfo(Session["eid"].ToString(), filename.ToString(), txtFName.Text, txtLName.Text, txtHomePhone.Text, txtMobilePhone.Text, txtWorkPhone.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, ddlState.SelectedItem.Text, txtZipCode.Text);
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Information saved successfully')", true);
        
    }
}