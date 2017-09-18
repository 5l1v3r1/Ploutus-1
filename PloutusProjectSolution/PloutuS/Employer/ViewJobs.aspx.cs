using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BA_Ploutos;
using Encrypt;
public partial class Employer_View : System.Web.UI.Page
{
    SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    //SqlConnection con = new SqlConnection("Data Source=192.168.100.122;User Id=sa; Password=Connect@123;database=Ploutos");
    int PageSize = 10;
    string JobTitle;
    string memid;
    string jobid;
    string w;
    EncryptDecrypt ency;
    PagedDataSource _PageDataSource = new PagedDataSource();
    #region Paging Properties
    private int CurrentPage
    {
        get
        {

            object objPage = ViewState["_CurrentPage"];
            int _CurrentPage = 0;
            if (objPage == null)
            {
                _CurrentPage = 0;
            }
            else
            {
                _CurrentPage = (int)objPage;
            }
            return _CurrentPage;
        }
        set { ViewState["_CurrentPage"] = value; }
    }

    private int firstIndex
    {
        get
        {

            int _FirstIndex = 0;
            if (ViewState["_FirstIndex"] == null)
            {
                _FirstIndex = 0;
            }
            else
            {
                _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
            }
            return _FirstIndex;
        }
        set { ViewState["_FirstIndex"] = value; }
    }

    private int lastIndex
    {
        get
        {
            int _LastIndex = 0;
            if (ViewState["_LastIndex"] == null)
            { _LastIndex = 0; }
            else
            { _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]); }
            return _LastIndex;
        }
        set { ViewState["_LastIndex"] = value; }
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand("SELECT ID,JobTitle,PostedDate,Skills,ExpFrom,ExpTo,Location,Vacancies FROM tblJobPosting ", con);
        //cmd.CommandType = CommandType.Text;
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //dljobdet.DataSource = ds.Tables[0];
        //dljobdet.DataBind();
        w = Request.QueryString["id"].ToString();
        JobTitle = Request.QueryString["title"].ToString();
        ency = new EncryptDecrypt();
        memid = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
        jobid = ency.EncryptDecryptString("£", Request.QueryString["title"].ToString());
      //  JobTitle = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());
        //if (Session["PSEName"] != null)
        //{
        //    DataSet dsload = new DataSet();
        //    SqlDataAdapter daload, da1;
        //    dsload.Tables.Add("tblMerchantReg");
        //    dsload.Tables.Add("tblMerchantLastLogin");
        //    //Label3.Text = Session["PSEName"].ToString();
        //    //Label5.Text = DateTime.Now.ToString();
        //    daload = new SqlDataAdapter("select * from tblMerchantReg where id='" + Convert.ToInt32(Session["PSMEID"].ToString()) + "'", con);
        //    daload.Fill(dsload.Tables["tblMerchantReg"]);
        //    daload.Dispose();
        //    string username = Session["PSEEMAIL"].ToString();
        //    da1 = new SqlDataAdapter("select lastlogintime from tblMerchantLastLogin where username='" + username + "'", con);
        //    da1.Fill(dsload.Tables["tblMerchantLastLogin"]);
        //    da1.Dispose();
        //    //lblLastLogintime.Text = dsload.Tables["tblMerchantLastLogin"].Rows[0]["lastlogintime"].ToString();
        //    if (dsload.Tables["tblMerchantLastLogin"].Rows.Count != 0)
        //        Session["lastlogin"] = dsload.Tables["tblMerchantLastLogin"].Rows[0]["lastlogintime"].ToString();
        //    else
        //        Session["lastlogin"] = "";
        //}
        ViewState["orderby"] = "0";
        FillGrid();



    }
    protected void FillGrid()
    {
        BA_Jobseeker1 bajobseeker = new BA_Jobseeker1();
        DataSet ds = new DataSet();

        ds = bajobseeker.getjobseeker(Convert.ToInt32(ViewState["orderby"].ToString()), memid,jobid);

        //DataTable dataTable = this.GetDataTable();
        if (ds != null)
        {


            if (ds.Tables[0].Rows.Count > 0)
            {
                pnlMain.Visible = true;
                pnlSub.Visible = false;
                _PageDataSource.DataSource = ds.Tables[0].DefaultView;
                _PageDataSource.AllowPaging = true;
                _PageDataSource.PageSize = PageSize;
                _PageDataSource.CurrentPageIndex = CurrentPage;
                ViewState["TotalPages"] = _PageDataSource.PageCount;
                this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
                this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
                this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
                this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
                dljobdet.DataSource = _PageDataSource;
                dljobdet.DataBind();
                this.doPaging();
            }
            else
            {
                pnlMain.Visible = false;
                pnlSub.Visible = true;
            }
        }
        else
        {
            pnlMain.Visible = false;
            pnlSub.Visible = true;
        }

    }

    private void doPaging()
    {

        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
        // firstindex = Bepage.firstIndex;

        firstIndex = CurrentPage - 5;

        if (CurrentPage > 5)
        {
            lastIndex = CurrentPage + 5;
            //lastIndex = CurrentPage + 5;
        }
        else
        {
            lastIndex = 10;
            //lastIndex = 10;
        }
        if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
        {
            lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
            firstIndex = lastIndex - 10;
        }

        if (firstIndex < 0)
        {
            firstIndex = 0;
        }

        for (int i = firstIndex; i < lastIndex; i++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }

        this.dlPaging.DataSource = dt;
        this.dlPaging.DataBind();
    }


    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        FillGrid();
    }
    protected void lbtnPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        FillGrid();
    }
    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        int lastpage = Convert.ToInt32(ViewState["TotalPages"]);
        CurrentPage = (lastpage - 1);
        FillGrid();
    }
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        FillGrid();
    }
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkbtnPage.Enabled = false;
            lnkbtnPage.Style.Add("font-size", "14px");
            lnkbtnPage.Font.Bold = true;

        }
    }

    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Paging"))
        {
            ViewState["_CurrentPage"] = e.CommandArgument;
            CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
            FillGrid();
        }
    }

    protected void dddlsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["orderby"] = dddlsort.SelectedValue.ToString();
        FillGrid();
    }
}