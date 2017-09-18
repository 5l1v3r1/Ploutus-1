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
using Encrypt;

public partial class UploadResume : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    public string name;
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    EncryptDecrypt ency = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    ViewState["jsid"] = Request.QueryString["id"].ToString();
                    lblMsg.Visible = false;
                }
                else
                {
                    Response.Redirect("~/MarketingLogin.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/MarketingLogin.aspx", false);
            }
          
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        BA_Marketingactivities bamarkact = new BA_Marketingactivities();
        ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        string ext = Path.GetExtension(uploadFile.FileName).ToLower();
        string path = conn1 + ViewState["jsid"].ToString() + ".doc";
        string path1 = conn1 + ViewState["jsid"].ToString() + ".docx";
        System.IO.FileInfo filed = new System.IO.FileInfo(path);
        System.IO.FileInfo filed1 = new System.IO.FileInfo(path1);
        if (filed.Exists)
        {
            File.Delete(path);
            if (uploadFile.HasFile)
            {
                if (uploadFile.PostedFile.ContentLength <= 2097152)
                {
                    if (checkFileType(uploadFile.FileName))
                    {
                        uploadFile.SaveAs((conn1 + ds.Tables[0].Rows[0]["id"] + ext));

                        //beresm.filename = ext;
                        //beresm.email = name;
                        //string ReturnMsg = BAreg.Updateresume(beresm);
                        lblMsg.Text = "Resume successfully updated.";
                        lblMsg.Visible = true;
                      
                        //Response.Redirect("Listofusers.aspx?id=" + ency.EncryptDecryptString("£",ds.Tables[0].Rows[0]["jsid"].ToString()), false);

                    }
                    else
                    {
                        lblMsg.Text = "Please upload your resume in Ms Word(.doc or.docx) format only.";
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
        else if (filed1.Exists)
        {
            File.Delete(path1);
            if (uploadFile.HasFile)
            {
                if (uploadFile.PostedFile.ContentLength <= 1024000)
                {
                    if (checkFileType(uploadFile.FileName))
                    {


                        uploadFile.SaveAs((conn1 + ds.Tables[0].Rows[0]["id"] + ext));

                        //beresm.filename = ext;
                        //beresm.email = name;
                        //string ReturnMsg = BAreg.Updateresume(beresm);
                        lblMsg.Text = "Resume successfully updated.";
                        lblMsg.Visible = true;
                       // Response.Redirect("Listofusers.aspx?id=" + ency.EncryptDecryptString("£", ds.Tables[0].Rows[0]["jsid"].ToString()), false);



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
        else
        {
            if (uploadFile.HasFile)
            {
                if (uploadFile.PostedFile.ContentLength <= 1024000)
                {
                    if (checkFileType(uploadFile.FileName))
                    {


                        uploadFile.SaveAs((conn1 + ds.Tables[0].Rows[0]["id"] + ext));

                        //beresm.filename = ext;
                        //beresm.email = name;
                        //string ReturnMsg = BAreg.Updateresume(beresm);
                        lblMsg.Text = "Resume successfully updated.";
                        lblMsg.Visible = true;
                        //Response.Redirect("Listofusers.aspx?id=" + ency.EncryptDecryptString("£", ds.Tables[0].Rows[0]["jsid"].ToString()), false);



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
    }
    public bool repeat()
    {
        if (ds.Tables[0].Rows[0]["jsid"].ToString() == "")
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
        Response.Redirect("Listofusersalready.aspx?id=" + ency.EncryptDecryptString("£", ViewState["jsid"].ToString()), false);
    }
}