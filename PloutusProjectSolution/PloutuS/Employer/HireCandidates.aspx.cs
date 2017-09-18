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

public partial class Employer_HireCandidates : System.Web.UI.Page
{
    SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    //SqlConnection con = new SqlConnection("Data Source=192.168.100.122;User Id=sa; Password=Connect@123;database=Ploutos");
    int PageSize = 10;
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
        ViewState["orderby"] = "0";
        FillGrid();
    }
    protected void FillGrid()
    {
        BA_hiringprocess bahire=new BA_hiringprocess();
        DataSet ds = new DataSet();

        ds = bahire.gethiredprocess(Convert.ToInt32(ViewState["orderby"].ToString()), Session["PSEName"].ToString());
       // DataTable dataTable = this.GetDataTable();
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
    //private DataTable GetDataTable()
    //{
    //    System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter("spsHiring", con);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);
    //    return ds.Tables[0];
    //}
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
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employer/EmployerHomePage.aspx");
    }
    protected void lnkBack2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employer/EmployerHomePage.aspx");
    }
}