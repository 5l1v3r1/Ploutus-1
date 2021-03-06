﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using BA_Ploutos;
using BE_Ploutos;
using Encrypt;
using System.Text;
public partial class Employer_EditJobsData : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    DataSet ds;
    string MemID;
    string w;
    string jobtitle;
    string jobid;
    EncryptDecrypt ency;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["PSEEMAIL"].ToString() != "" && Session["PSEName"].ToString() != "")
            {
                this.Master.ErrorMessage = this.Title;
                ds = new DataSet();
                w = Request.QueryString["memid"].ToString();
                jobtitle = Request.QueryString["jobid"].ToString();
                ency = new EncryptDecrypt();
                MemID = ency.EncryptDecryptString("£", Request.QueryString["memid"].ToString());
                jobid = ency.EncryptDecryptString("£", Request.QueryString["jobid"].ToString());
                ViewState["orderby"] = "0";
                BA_Jobseeker1 bajobseeker = new BA_Jobseeker1();
                DataSet ds1 = new DataSet();

                ds1 = bajobseeker.getjobseeker(Convert.ToInt32(ViewState["orderby"].ToString()), MemID, jobid);
                string s = Session["PSEName"].ToString();
                string id = Session["PSMEID"].ToString();
                SqlCommand cmd = new SqlCommand("select * from [tblMerchantReg] where [MemID]='" + MemID + "'", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                da.Dispose();
                lblError.Visible = false;
                if (!Page.IsPostBack)
                {
                    txtJobDesc.Text = ds1.Tables[0].Rows[0]["JobDescription"].ToString();
                    txtJobTitle.Text = ds1.Tables[0].Rows[0]["JobTitle"].ToString();
                    //txtLoc.Text = ds1.Tables[0].Rows[0]["Location"].ToString();
                    txtRate.Text = ds1.Tables[0].Rows[0]["Rate"].ToString();
                    txtSkills.Text = ds1.Tables[0].Rows[0]["Skills"].ToString();

                    //code for selecting industry 
                    BA_Marketing mar = new BA_Marketing();
                    BA_postjobs pst2 = new BA_postjobs();
                    DataSet dsindustries = new DataSet(); ;
                    dsindustries = mar.fillcategory();
                    ddIndustry.DataSource = dsindustries;
                    ddIndustry.DataTextField = "indusname";
                    ddIndustry.DataValueField = "ID";
                    ddIndustry.DataBind();
                    ddIndustry.Items.Insert(0, new ListItem("--Select--", "--Select--"));
                    ddlcbIndustry.DataSource = dsindustries;
                    ddlcbIndustry.DataTextField = "indusname";
                    ddlcbIndustry.DataValueField = "indusname";
                    ddlcbIndustry.DataBind();
                    DataTable dt = dsindustries.Tables[0];
                    List<string> lst = new List<string>();
                    string industriesList = ds1.Tables[0].Rows[0]["Industry"].ToString();
                   string[] ss=industriesList.Split(',');
                  
                   if (ss.Length>0)
                   {
                      
                           for (int j = 0; j < ss.Length; j++)
                           {
                               foreach (System.Web.UI.WebControls.ListItem item in ddlcbIndustry.Items)
                               {
                                   string name = item.ToString();
                                    if (ss[j] == name)
                                   {
                                     // int index= ddlcbIndustry.Items.IndexOf(item);
                                    //  ddlcbIndustry.SelectedIndex = index;
                                      item.Selected = true;
                                   }
                                }



                          }
                           lblIndus.Text = "You have Selected : " + ConvertStringArrayToStringJoin(ss);
                   }
                    //  ddlcbIndustry.Items.Insert(0, new ListItem("--Select--", "--Select--"));

                    //code for  selecting experience fro &to
                    ddlmax.Items.Insert(0, new ListItem("Max", "Max"));
                    ddlmin.Items.Insert(0, new ListItem("Min", "Min"));
                    for (int i = 0; i <= 10; i++)
                    {
                        ddlmax.Items.Add(i.ToString());
                        ddlmin.Items.Add(i.ToString());
                    }
                    ddlmax.SelectedValue = ds1.Tables[0].Rows[0]["ExpTo"].ToString();
                    ddlmin.SelectedValue = ds1.Tables[0].Rows[0]["ExpFrom"].ToString();
                    //code for selecting location
                    DataSet dslocations = new DataSet(); ;
                    dslocations = pst2.getLocations();
                    ddlLocation.DataSource = dslocations;
                    ddlLocation.DataTextField = "PreLoc";
                    ddlLocation.DataValueField = "PreLoc";
                    ddlLocation.DataBind();
                   
                    ddlLocation.SelectedItem.Text = ds1.Tables[0].Rows[0]["Location"].ToString();
                    ddlLocation.Items.Insert(0, new ListItem("--Select--", "--Select--"));
                    ddlLocation.Items.Insert(1, new ListItem("--OTHER--", "--OTHER--"));
                    //code for jobtype
                    //ddlJobType.Items.Insert(0, new ListItem("--Select--", "--Select--"));
                    //ddlJobType.Items.Add("Permanent");
                    //ddlJobType.Items.Add("Contract");
                    //code for Binding Repeater
                    // BindRepeater();
                }
            }
            else
            {
                Response.Redirect("~/employlogin.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/employlogin.aspx", false);
        }
        
    }
    static string ConvertStringArrayToStringJoin(string[] array)
    {
        //
        // Use string Join to concatenate the string elements.
        //
        string result = string.Join(",", array);
        return result;
    }
    protected void ddIndustry_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlcbIndustry_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<String> industries_list = new List<string>();
        foreach (System.Web.UI.WebControls.ListItem item in ddlcbIndustry.Items)
        {
            if (item.Selected)
            {

                industries_list.Add(item.Text);
            }


        }
        string[] theArray = industries_list.ToArray();
        string s = string.Join(",", theArray);
        if (s == "")
        {
            lblIndus.Text = "";
        }
        else
        {
            lblIndus.Text = "You have Selected : " + s;
        }
    

    }
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLocation.SelectedIndex == 1)
        {
            txtLoc.Visible = true;

        }
        else if ((ddlLocation.SelectedIndex == 0))
        {
            txtLoc.Visible = false;
        }
        else
        {
            txtLoc.Visible = false;
        }
    }
    protected void btPost_Click(object sender, EventArgs e)
    {
        int max = Convert.ToInt16(ddlmax.SelectedItem.Text);
        int min = Convert.ToInt16(ddlmin.SelectedItem.Text);
        if (max < min)
        {
            lblError.Visible = true;
            lblError.Text = "Max experience should be greater than Min experience";
            lblError.Focus();
        }
        else
        {
            BE_Employer beemp = new BE_Employer();
            BA_postjobs bapostjob = new BA_postjobs();
            beemp.JobTitle = txtJobTitle.Text;
            beemp.jobdesc = txtJobDesc.Text;
            List<String> industries_list = new List<string>();
            foreach (System.Web.UI.WebControls.ListItem item in ddlcbIndustry.Items)
            {
                if (item.Selected)
                {

                    industries_list.Add(item.Text);
                }

                beemp.Industry = String.Join(",", industries_list.ToArray());
            }

            //  beemp.Functionalarea = ddlFunctionalArea.SelectedItem.ToString();
            beemp.Functionalarea = "";
            beemp.Expmin = ddlmin.SelectedItem.ToString();
            beemp.Expmax = ddlmax.SelectedItem.ToString();
            //  beemp.Dollor = ddldolor.SelectedItem.ToString();
            beemp.Dollor = "";
            beemp.Rate = txtRate.Text + beemp.Dollor;
            if (ddlLocation.SelectedIndex == 1)
            {
                beemp.Location = txtLoc.Text;
                beemp.Status = 1;

            }
            else
            {
                beemp.Location = ddlLocation.SelectedItem.ToString();
                beemp.Status = 2;
            }
            //  beemp.Jobtype = ddlJobType.SelectedItem.ToString();
            beemp.Jobtype = "";
            //   beemp.Vacancies = Convert.ToInt16(txtVacancy.Text);
            beemp.Vacancies = 0;
            beemp.Responsibilities = "<ul>";
            //foreach (RepeaterItem item in repeater1.Items)
            //{
            //    if (((TextBox)item.FindControl("txtJobRes")).Text != "")
            //    {
            //        //getting the values of user entered fields

            //        beemp.Responsibilities = beemp.Responsibilities + "<li>" + ((TextBox)item.FindControl("txtJobRes")).Text + "</li>";

            //    }
            //}
            beemp.Responsibilities = beemp.Responsibilities + "</ul>";
            beemp.Skills = txtSkills.Text;
            beemp.Jobpostedby = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
            beemp.Email = ds.Tables[0].Rows[0]["email"].ToString();
            beemp.Contactno = ds.Tables[0].Rows[0]["Mobile"].ToString();
            beemp.Company = ds.Tables[0].Rows[0]["companyname"].ToString();
            beemp.Jobid = jobid;

            try
            {
                int res = bapostjob.updatejob(beemp);

                lblError.Visible = true;
                if (res >= 1)
                {
                    //lblError.Text = "inserted sucessfully";
                    //txtJobTitle.Text = "";
                    //txtJobDesc.Text = "";
                    //ddIndustry.SelectedIndex = 0;
                    //ddlFunctionalArea.SelectedIndex = 0;
                    //ddlmax.SelectedIndex = 0;
                    //ddlmin.SelectedIndex = 0;
                    //txtRate.Text = "";
                    //ddlLocation.SelectedIndex = 0;
                    //ddlJobType.SelectedIndex = 0;
                    //txtVacancy.Text = "";
                    //txtSkills.Text = "";
                    //txtPostedBy.Text = "";
                    //txtEmail.Text = "";
                    //txtContactNo.Text = "";
                    //BindRepeater();
                    Response.Redirect("../Employer/EntViewJobs.aspx?id=" + w + "&title="+jobtitle+"");
                }
                else
                    lblError.Text = "not inserted";

            }
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = ex.Message.ToString();
            }
        }
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Marketing/MerchantCompleteInfo.aspx?id=" + w + "");
    }
}