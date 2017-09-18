using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BA_Ploutos;
using DA_Ploutos;
using BE_Ploutos;
using System.IO;
using Encrypt;
public partial class Marketing_ViewClientsList : System.Web.UI.Page
{
    string mnrstring;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    DataSet ds = new DataSet();
    SqlDataAdapter da;
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
        this.Master.ErrorMessage = this.Title;
        try
        {
            if (Session["PSEEMAIL"].ToString() != "" && Session["PSEName"].ToString() != "")
            {
                if (!Page.IsPostBack)
                {
                    ViewState["orderby"] = "0";
                    FillGrid();
                   
                    FillDDLCompanyNames();
                    FillDDLCompanyLocation();
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

    public void FillDDLCompanyNames()
    {
        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillCompanyNames();
        ddlindustry.DataSource = ds.Tables[0];
        ddlindustry.DataTextField = "CompanyName";
        ddlindustry.DataValueField = "CompanyName";

        ddlindustry.DataBind();
        ddlindustry.Items.Insert(0, new ListItem("--------Select---------", "Select"));


    }
    public void FillDDLCompanyLocation()
    {
        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillCompanyNames();
        ddlstate.DataSource = ds.Tables[1];
        ddlstate.DataTextField = "city";
        ddlstate.DataValueField = "city";
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, new ListItem("----------Select----------", "Select"));

    }

    protected void FillGrid()
    {
        DataSet ds = new DataSet();
        BA_Merchants mer = new BA_Merchants();
        ds = mer.GetMerchantsList(1, ViewState["orderby"].ToString());
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
                dlMerchantList.DataSource = _PageDataSource;
                dlMerchantList.DataBind();
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


        //mnrstring = "select top 1000 ROW_NUMBER() over(order by id desc) as Sno,id, userid,firstname,lastname,companyname,phone,email,typeofenquiry from tblMerchantReg";
        //da = new SqlDataAdapter(mnrstring, conn);
        //da.Fill(ds);
        // dlMerchantList.DataSource = ds;
        //dlMerchantList.DataBind();

    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        var btn = sender as Button;
        var arg = btn.CommandArgument;
        Session["dset"] = arg;
        Response.Redirect("MerchantCompleteInfo.aspx");
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("MarketingHomePage.aspx", false);
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
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string companyname = ddlindustry.SelectedItem.Text;
        string location = ddlstate.SelectedItem.Text;
        if (ddlindustry.SelectedIndex == 0)
        {
            companyname = "";
        }
        if (ddlstate.SelectedIndex == 0)
        {
            location = "";
        }
        DataSet ds = new DataSet();
        BA_Merchants mer = new BA_Merchants();
        ds = mer.GetSearchMerchantsList(1, ViewState["orderby"].ToString(), companyname, location);

        if (ds != null)
        {

            if (ds.Tables[0].Rows.Count > 0)
            {
                pnlMain.Visible = true;
                pnl.Visible = true;
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
                dlMerchantList.DataSource = _PageDataSource;
                dlMerchantList.DataBind();
                this.doPaging();
            }
            else
            {
               //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(' Search Criteria Not Found')", true);
                pnlMain.Visible = true;
                pnlSub.Visible = true;
                pnl.Visible = false;
            }
        }
        else
        {
            pnlMain.Visible = true;
            pnlSub.Visible = true;
            pnl.Visible = false;
        }


    }
}