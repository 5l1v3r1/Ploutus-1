using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSEducation : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["eid"].ToString() != "")
            {
                DataSet ds = js.GetFullDetails(Session["eid"].ToString());
                if (ds.Tables[0].Rows[0]["IsObiligation"].ToString() == "Yes")
                {
                    rbobligationYes.Checked = true;
                    fuobligation.Visible = true;
                }
                else if (ds.Tables[0].Rows[0]["IsObiligation"].ToString() == "No")
                {
                    rbobligationYes.Checked = true;
                }
                txtGaps.Text = ds.Tables[0].Rows[0]["Gaps"].ToString();
                txtAddInfo.Text = ds.Tables[0].Rows[0]["EmploymentInfo"].ToString();             


                if (ds.Tables[0].Rows[0]["IsContactEmployer"].ToString() == "Yes")
                {
                    rbCEmployerYes.Checked = true;
                    txtRefFullName.Text = ds.Tables[0].Rows[0]["EmployerFullName"].ToString();
                    txtRefRelation.Text = ds.Tables[0].Rows[0]["EmployerRelation"].ToString();
                    txtRefCompany.Text = ds.Tables[0].Rows[0]["EmployerCompany"].ToString();
                    txtRefPhone.Text = ds.Tables[0].Rows[0]["EmployerPhone"].ToString();
                    txtRefAddress.Text = ds.Tables[0].Rows[0]["EmployerPhone"].ToString();
                    pnlRef.Visible = true;
                }
                else if (ds.Tables[0].Rows[0]["IsContactEmployer"].ToString() == "No")
                {
                    rbCEmployerNo.Checked = true;
                    pnlRef.Visible = false;
                }
            }
        }
            
    }
    protected void rbobligationYes_CheckedChanged(object sender, EventArgs e)
    {
        fuobligation.Visible = true;
    }
    protected void rbobligationNo_CheckedChanged(object sender, EventArgs e)
    {
        fuobligation.Visible = false;
    }
    protected void rbCEmployerYes_CheckedChanged(object sender, EventArgs e)
    {
        pnlRef.Visible = true;
    }
    protected void rbCEmployerNo_CheckedChanged(object sender, EventArgs e)
    {
        pnlRef.Visible = false;
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        SavePositionsRef();       

        Response.Redirect("JSReview.aspx", false);
    }

    private void SavePositionsRef()
    {
        string obligations=string.Empty;
        if (rbobligationYes.Checked == true)
        {
            obligations = "Yes";
           // UploadFile();
           
        }
        else if (rbobligationNo.Checked == true)
        {
            obligations = "No";            
        }
        string gaps = txtGaps.Text;
        string addinfo = txtAddInfo.Text;

        string RefEmp = string.Empty;
         string RefFullName=string.Empty;
        string RefRelation=string.Empty;
        string RefCompany=string.Empty;
        string RefPhone=string.Empty;
        string RefAddress=string.Empty;
        if (rbCEmployerYes.Checked == true)
        {
            RefEmp = "Yes";
           RefFullName=txtRefFullName.Text;
            RefRelation = txtRefRelation.Text;
            RefCompany = txtRefCompany.Text;
            RefPhone = txtRefPhone.Text;
            RefAddress = txtRefAddress.Text;
        }
        else if(rbCEmployerNo.Checked == true)
        {
            RefEmp = "No";
        }
        string filename = js.UpdatePositionsRef(obligations, gaps, addinfo, RefEmp, RefFullName, RefRelation, RefCompany, RefPhone, RefAddress, Session["eid"].ToString());
        Session["filename"] = filename;
        if(rbobligationYes.Checked == true)
        {
            UploadFile();
        }
    }

    private void UploadFile()
    {
        try
        {
            if (fuobligation.HasFile)
            {
                if (fuobligation.PostedFile.ContentLength <= 1024000)
                {
                    if (checkFileType(fuobligation.FileName))
                    {
                        string ext = Path.GetExtension(fuobligation.FileName).ToLower();
                        fuobligation.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + Session["filename"].ToString() + ext);   
                    
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
    protected bool checkFileType(string filename)
    {
        return (Path.GetExtension(filename).ToLower() == ".doc" || Path.GetExtension(filename).ToLower() == ".docx" || Path.GetExtension(filename).ToLower() == ".pdf");
    }

    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Information saved successfully')", true);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSRPositions.aspx", false);
    }
}