using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Encrypt;
using BA_Ploutos;
using System.Configuration;

public partial class Ploutos_ViewDetails : System.Web.UI.Page
{
    SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    DataSet ds=new DataSet();
    string rowid;
    string s;
    string JobTitle;
    string memid;
    string jobid;
    string w;
    EncryptDecrypt ency;
    protected void Page_Load(object sender, EventArgs e)
    {
        //EncryptDecrypt ency = new EncryptDecrypt();
        //rowid = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());
     //   s = Request.QueryString["id"].ToString();
        w = Request.QueryString["id"].ToString();
        JobTitle = Request.QueryString["title"].ToString();
        ency = new EncryptDecrypt();
        memid = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
        jobid = ency.EncryptDecryptString("£", Request.QueryString["title"].ToString());
        Session["PSEJobId"] = Request.QueryString["id"].ToString();
        ViewState["orderby"] = "0";
        
        BA_Jobseeker1 bajobseeker = new BA_Jobseeker1();
        DataSet ds = new DataSet();

        ds = bajobseeker.getjobseeker(Convert.ToInt32(ViewState["orderby"].ToString()), memid, jobid);
        lblhead.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
        dlJobPosting.DataSource = ds;
        dlJobPosting.DataBind();
        //if (!IsPostBack)
        //{
        //   string cmdstring = "select * from tblJobPosting  where ID = '" + s + "'";

        //SqlDataAdapter da = new SqlDataAdapter(cmdstring, con);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //    dlJobPosting.DataSource=dt;
        //    dlJobPosting.DataBind();
        //}
      

    }
    //public void fillGrid(string s)
    //{
    //    ds=baview.GetDetails(rowid);
    //    rowid = ds.Tables[0].Rows[0]["ID"].ToString();
    //    dlJobPosting.DataSource = ds.Tables[0];
    //    dlJobPosting.DataBind();
    //     private void listbind()
    //{
       
    //    string cmdstring = "select * from tblJobPosting  where ID = '" + s + "'";

    //    SqlDataAdapter da = new SqlDataAdapter(cmdstring, con);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    dljobdet.DataSource = dt;
    //    dljobdet.DataBind();
    //}

    protected void btnBackSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Marketing/MerchantCompleteInfo.aspx");
    }
    protected void btEdit_Click(object sender, EventArgs e)
    {
      
        Response.Redirect("EditJobsData.aspx?memid="+w+"&jobid="+JobTitle+"");
    }
   
    protected void lnkBack11_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Marketing/MerchantCompleteInfo.aspx?id="+w+"");
    }
}