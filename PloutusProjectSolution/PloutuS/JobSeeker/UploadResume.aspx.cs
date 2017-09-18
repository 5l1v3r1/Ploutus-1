using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using BA_Ploutos;
using BE_Ploutos;

public partial class UploadResume : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    public string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            name = Session["PSJUID"].ToString();
            lblMsg.Visible = false;
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        BAJobSeeker BAreg = new BAJobSeeker();
        BEMemDetails beMem = new BEMemDetails();
        BEUpdateResume beresm = new BEUpdateResume();
        if (Session["PSJUID"].ToString() != "" || Session["PSJUID"].ToString() != null)
        {
            name = Session["PSJUID"].ToString();
            beMem.email = name;
            ds = BAreg.getMemDetails(beMem);
        }

        if (uploadFile.HasFile)
        {
            if (uploadFile.PostedFile.ContentLength <= 1024000)
            {
                if (checkFileType(uploadFile.FileName))
                {
                    string ext = Path.GetExtension(uploadFile.FileName).ToLower();

                    uploadFile.SaveAs(ConfigurationManager.AppSettings["Resumes"].ToString() + ds.Tables[0].Rows[0]["id"] + ext);
                    beresm.filename = ext;
                    beresm.email = name;
                    string ReturnMsg = BAreg.Updateresume(beresm);

                    if (ReturnMsg == "Success")
                    {
                        lblMsg.Text = "Resume successfully updated.";
                        lblMsg.Visible = true;
                    }
                    else
                    {
                        lblMsg.Text = "Error in updating the resume";
                        lblMsg.Visible = true;
                    }
                }
                else
                {
                    lblMsg.Text = "Please upload your resume in .doc or .docx format only.";
                    lblMsg.Visible = true;
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
    public bool repeat()
    {
        if (ds.Tables[0].Rows[0]["filename"].ToString() == "")
            return false;
        else
            return true;
    }
    protected bool checkFileType(string filename)
    {
        return (Path.GetExtension(filename).ToLower() == ".doc" || Path.GetExtension(filename).ToLower() == ".docx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("userHome.aspx", false);
    }
}