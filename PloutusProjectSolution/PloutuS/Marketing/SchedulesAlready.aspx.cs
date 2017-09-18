using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;

public partial class Marketing_Schedules : System.Web.UI.Page
{
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
    int PageSize = 10;
    PagedDataSource _PageDataSource = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    LoadActivities();
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
    private void LoadActivities()
    {
        try
        {
            BA_Marketingactivities BAmaract = new BA_Marketingactivities();
            DataSet ds1 = new DataSet();
            ds1 = BAmaract.GetAllScMrktActivitiesAlready();
            if (ds1.Tables[0].Rows.Count > 10)
            {
                _PageDataSource.DataSource = ds1.Tables[0].DefaultView;
                _PageDataSource.AllowPaging = true;
                _PageDataSource.PageSize = PageSize;
                _PageDataSource.CurrentPageIndex = CurrentPage;
                ViewState["TotalPages"] = _PageDataSource.PageCount;
                //this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
                this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
                this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
                this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
                //lbtnFirst.Enabled = true;
                //lbtnNext.Enabled = true;
                //lbtnPrevious.Enabled = true;
                //LinkButton3.Enabled = true;
                //dlPaging.Enabled = true;
            }
            else
            {
                //lbtnFirst.Enabled = false;
                //lbtnNext.Enabled = false;
                //lbtnPrevious.Enabled = false;
                //LinkButton3.Enabled = false;
                //dlPaging.Enabled = false;
            }
            grdActivities.DataSource = _PageDataSource;
            grdActivities.DataSource = ds1.Tables[0];
            grdActivities.DataBind();
            this.doPaging();
        }
        catch (Exception ex)
        {
            lblErrMsg.Text = ex.Message;
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
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Ploutos/Userhome.aspx");
    }
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        LoadActivities();
    }
    protected void lbtnPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        LoadActivities();
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        LoadActivities();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        int lastpage = Convert.ToInt32(ViewState["TotalPages"]);
        CurrentPage = (lastpage - 1);
        // FillGrid(Session["Category"].ToString());
        LoadActivities();

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
            //FillGrid(Session["Category"].ToString());
            LoadActivities();
        }
    }
}