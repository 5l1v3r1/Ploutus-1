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
using Word = Microsoft.Office.Interop.Word;
using System.Web.UI.WebControls;
using DocxToTextDemo;
using System.Text.RegularExpressions;

public partial class UpdateResumesData : System.Web.UI.Page
{

    BE_MarketingReg bemarreg = new BE_MarketingReg();
    DA_MarketingReg damarreg = new DA_MarketingReg();

    public int Size;

    protected void Page_Load(object sender, EventArgs e)
    {
        fillIndustrieslist();
        
       
    }
  


    private void fillIndustrieslist()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        ds = mar.fillcategory();
        ddlIndustries1.DataSource = ds.Tables[0];
        ddlIndustries1.DataTextField = "indusname";
        ddlIndustries1.DataValueField = "indusname";
        ddlIndustries1.DataBind();
        ddlIndustries1.Items.Insert(0, new ListItem("--Select--", "--Select--"));

        ddlIndustries2.DataSource = ds.Tables[0];
        ddlIndustries2.DataTextField = "indusname";
        ddlIndustries2.DataValueField = "indusname";
        ddlIndustries2.DataBind();
        ddlIndustries2.Items.Insert(0, new ListItem("--Select--", "--Select--"));

        ddlIndustry3.DataSource = ds.Tables[0];
        ddlIndustry3.DataTextField = "indusname";
        ddlIndustry3.DataValueField = "indusname";
        ddlIndustry3.DataBind();
        ddlIndustry3.Items.Insert(0, new ListItem("--Select--", "--Select--"));

    }


    public void LodeData() {



        if (AsyncFileUpload1.HasFile)
        {
            if (AsyncFileUpload1.PostedFile.ContentLength <= 2097152)
            {
                ext = Path.GetExtension(AsyncFileUpload1.FileName).ToLower();

                string fname = Path.GetFileName(AsyncFileUpload1.FileName);
                string strPath = ConfigurationManager.AppSettings["Resumes"].ToString() + fname;
                // string strPath = ConfigurationManager.AppSettings["Resumes"].ToString() + "Resume" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Second + DateTime.Now.Millisecond + ext;
                if (ext.ToLower() != ".pdf" && ext.ToLower() != ".docx")
                {
                    lblMsg.Text = "allow only .pdf and .doc";
                }
                else
                {
                    AsyncFileUpload1.SaveAs(strPath);
                    this.iframe1.Attributes["src"] = "\\SUNILSOFTPC\\Shared\\Srihari\\Resumes" + " \\" + fname;

                    DocxToText1 doc = new DocxToText1();
                    Word.ApplicationClass oWordApp = new Word.ApplicationClass();
                    object isVisible = true;
                    object missing = System.Reflection.Missing.Value;
                    doc.DocxToText(strPath);
                    string data = doc.ExtractText();




                    #region Getting Resume Derails
                    string MatchPhonePattern = @"\(?\d{3}\)?-? *\d{3}-? *-?\d{4}";
                    Regex rx = new Regex(MatchPhonePattern, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture);
                    // Find matches.
                    var matches = rx.Matches(data).Cast<Match>().Where(m => m.Success).Select(m => m.Groups[0].Value).Distinct();
                    // Report the number of matches found.
                    //int noOfMatches = matches.Count;
                    // Report on each match.
                    //int i = 0;
                    int mcount = 1;

                    foreach (string match in matches)
                    {
                        if (mcount == 1)
                        {
                            txtMobileNumber.Text = match;
                            mcount = mcount + 1;

                        }
                        else if (mcount == 2)
                        {
                            if (txtMobileNumber.Text == match)
                            {
                                mcount = mcount + 1;
                            }

                            else
                            {
                                txtCellNumber.Text = match;
                                mcount = mcount + 1;
                            }
                        }

                        else if (mcount == 3)
                        {
                            if (match == txtMobileNumber.Text || match == txtCellNumber.Text)
                            {
                                // txtCellNumber.Text = string.Empty;
                                mcount = mcount + 1;
                            }
                            else
                            {
                                if (txtCellNumber.Text == "")
                                    txtCellNumber.Text = match;
                                mcount = mcount + 1;
                            }
                        }

                    }

                    string Email = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
                    Regex erx = new Regex(Email, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture);
                    // Find matches.
                    var ematches = erx.Matches(data).Cast<Match>().Where(m => m.Success).Select(m => m.Groups[0].Value).Distinct();
                    int ecount = 1;
                    foreach (string match in ematches)
                    {
                        if (ecount == 1)
                        {
                            txtEmail.Text = match;
                            ecount = ecount + 1;
                        }
                        else if (ecount == 2)
                        {

                            if (match == txtEmail.Text)
                            {
                                txtAEmail.Text = string.Empty;
                                // txtAEmail.Text = match.Value.ToString();

                                ecount = ecount + 1;
                            }
                            else
                            {
                                txtAEmail.Text = match;
                                ecount = ecount + 1;
                            }
                        }
                        else if (ecount == 3)
                        {


                            if (match == txtEmail.Text || match == txtAEmail.Text)
                            {
                                // txtAEmail.Text = string.Empty;
                                ecount = ecount + 1;
                            }
                            else
                            {
                                if (txtAEmail.Text == "")
                                    txtAEmail.Text = match;
                                ecount = ecount + 1;
                            }
                        }

                    }



                    string ctZip = @"[A-Za-z\-]+,\s?[A-Za-z]{2}\s(\d{5}|[A-Za-z0-9]{3}\s?[0-9]{3})";
                    Regex crx = new Regex(ctZip, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture);
                    // Find matches.
                    var cmatches = crx.Matches(data).Cast<Match>().Where(m => m.Success).Select(m => m.Groups[0].Value).Distinct();
                    // Report the number of matches found.
                    //  int noOfcMatches = matches.Count;
                    // Report on each match.
                    int adcount = 1;
                    foreach (string match in cmatches)
                    {
                        if (adcount == 1)
                        {
                            string[] s = Regex.Split(match.Trim(), ",");


                            string city = s[0];
                            string szip = s[1];

                            string[] ctzp = Regex.Split(szip.Trim(), " ");

                            string state = ctzp[0];

                            string zip = ctzp[1];

                            txtAddress.Text = match;
                            txtCity.Text = city;
                            txtState.Text = state;
                            txtZip.Text = zip;
                            adcount = adcount + 1;

                        }
                        else if (adcount == 2)
                        {

                            //txtCellNumber.Text = match.Value.ToString();

                            //count = count + 1;
                        }



                    }

                    string names = data.Substring(0, 100);


                    string Names = @"((\w+\s){2})";

                    // string Names = @"\w+\s+\w+{2}";
                    Regex Nrx = new Regex(Names, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture);
                    // Find matches.
                    var Nmatches = Nrx.Matches(names).Cast<Match>().Where(m => m.Success).Select(m => m.Groups[0].Value).Distinct();
                    // Report the number of matches found.
                    // int noOfNMatches = Nmatches.Count;
                    // Report on each match.
                    int nmcount = 1;
                    foreach (string match in Nmatches)
                    {
                        if (nmcount == 1)
                        {
                            string[] Name = Regex.Split(match.Trim(), " ");


                            txtFName.Text = Name[0];
                            txtLName.Text = Name[1];
                            nmcount = nmcount + 1;

                        }
                        else if (nmcount == 2)
                        {

                            //txtAEmail.Text = match.Value.ToString();

                            //count = count + 1;
                        }

                    }
                    string Statues = @"\d{1}/\d{1}";
                    Regex sNrx = new Regex(Statues, RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture);
                    var smatches = sNrx.Matches(names).Cast<Match>().Where(m => m.Success).Select(m => m.Groups[0].Value).Distinct();
                    int smcount = 1;
                    foreach (string match in smatches)
                    {
                        if (smcount == 1)
                        {

                            string v = match;
                            nmcount = nmcount + 1;
                        }
                        else if (nmcount == 2)
                        {
                        }
                    }



                    #endregion




                }
            }
            else
            {
                lblMsg.Text = "File size exceeded the maximum size limit. Please upload file having size below 1 megabyte.";
                lblMsg.Visible = true;
            }
        }
        else
        {
            lblMsg.Text = "Please add the file to upload.";
            lblMsg.Visible = true;

        }
  

    }
    string ext;
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        LodeData();
       
    }



  


    private int updateinfo()
    {
       // string selectedItem = string.Empty;
        bemarreg.firstName = txtFName.Text.Trim();
       // bemarreg.middleName = txtMName.Text.Trim();
        bemarreg.lastName = txtLName.Text.Trim();
        bemarreg.city = txtCity.Text;
        bemarreg.state = txtState.Text.ToString();
        bemarreg.address = txtAddress.Text.Trim();
        bemarreg.mobile = txtMobileNumber.Text.Trim();

        bemarreg.Cell = txtCellNumber.Text;
        bemarreg.email = txtEmail.Text;
        bemarreg.Altemail = txtAEmail.Text;
        bemarreg.Zip = txtZip.Text;
        bemarreg.address = txtAddress.Text;
        bemarreg.Industry1 = ddlIndustries1.SelectedItem.ToString();
        if (ddlIndustries2.SelectedValue == "--Select--" || ddlIndustries2.SelectedValue == "")
        {
            bemarreg.Industry2 = "";
        }
        else
        {
            bemarreg.Industry2 = ddlIndustries2.SelectedItem.ToString();
        }
        if (ddlIndustry3.SelectedValue == "--Select--" || ddlIndustry3.SelectedValue == "")
        {
            bemarreg.Industry3 = "";
        }
        else
        {
            bemarreg.Industry3 = ddlIndustry3.SelectedItem.ToString();
        }

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

        bemarreg.experience = Yexp + "." + Mexp;
        int noofRows = Convert.ToInt32(damarreg.InsertMarketing(bemarreg));

        return noofRows;

    }


    private void Clearinfo()
    {
        txtFName.Text = string.Empty;
       // txtMName.Text = string.Empty;
        txtLName.Text = string.Empty;
        // ddlcity.SelectedIndex = 0;
        txtEmail.Text = string.Empty;
        txtAEmail.Text = string.Empty;
        txtCity.Text = string.Empty;
        txtState.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtMobileNumber.Text = string.Empty;
        ddlIndustries1.SelectedIndex = 0;
        ddlIndustries2.SelectedIndex = 0;
        ddlIndustry3.SelectedIndex = 0;
       // txtHomeNumber.Text = string.Empty;
        txtCellNumber.Text = string.Empty;
        //txtResumeBuilder.Text = string.Empty;
        ddlYearsExp.SelectedIndex = 0;
        ddlMonthsExp.SelectedIndex = 0;
        txtZip.Text = string.Empty;
      //  rblFu.ClearSelection();
      //  pnlUploadResume.Visible = false;
      //  pnlBuildResume.Visible = false;
       // btnSave.Visible = false;
        //BindRepeater();
    }


  





    

    protected void btnSaveDb_Click(object sender, EventArgs e)
    {
        updateinfo();

        Clearinfo();


        lblMsg.Text = "Details Added successfully";
        lblMsg.Visible = true;

    }
}