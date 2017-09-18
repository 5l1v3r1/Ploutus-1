using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encrypt;
using System.Data;
using BE_Ploutos;
using BA_Ploutos;
using BA_Ploutos;

public partial class Marketing_ViewClients : System.Web.UI.Page
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
    int PageSize = 100;
    int a;
    int flag;
    PagedDataSource _PageDataSource = new PagedDataSource();
    EncryptDecrypt ency = new EncryptDecrypt();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
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
        }
        else
        {
            lastIndex = 10;
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
    public void FillGrid()
    {
        
        BA_Clients baClnt = new BA_Clients();
        DataSet ds1 = new DataSet();
        int status = 0;
        //ds1 = baClnt.FillmarketViewResumelist(status);

        DataTable dt = ds1.Tables[0];

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            if (ddlsort.SelectedItem.Text.Trim() == "Name")
            {
                dt.DefaultView.Sort = "Name";
            }
            else
            {
                dt.DefaultView.Sort = "Jsid desc";
            }

            pnlMain.Visible = true;
            pnlSub.Visible = false;

            _PageDataSource.DataSource = dt.DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = PageSize;
            _PageDataSource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _PageDataSource.PageCount;
            this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
            this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
            this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
            this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
            dljobseekerdet.DataSource = _PageDataSource;
            dljobseekerdet.DataBind();

            this.doPaging();
            lblCount.Text = Convert.ToString(ds1.Tables[0].Rows.Count);
            
        }
        else
        {
            pnlMain.Visible = false;
            pnlSub.Visible = true;
        }
    }
}