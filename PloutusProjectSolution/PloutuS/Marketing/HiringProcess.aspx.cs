using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;
public partial class Marketing_HiringProcess : System.Web.UI.Page
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
    PagedDataSource _PageDataSource = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;
        try
        {
            if (!Page.IsPostBack)
            {
                fillIndustrieslist();
            }
            if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
            {

              
                FillGrid();
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
    private void fillIndustrieslist()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        ds = mar.fillcategory();
        ddlIndustry.DataSource = ds.Tables[0];
        ddlIndustry.DataTextField = "indusname";
        ddlIndustry.DataValueField = "indusname";
        ddlIndustry.DataBind();
        ddlIndustry.Items.Insert(0, new ListItem("Select", "Select"));

        
    }
    public void FillGrid()
    {
        DataSet ds = new DataSet();
        BA_Marketing mar = new BA_Marketing();
        ds = mar.FillHiringList();
        DataTable dt = ds.Tables[0];
        //if (ddlsort.SelectedItem.Text == "Name")
        //{
        //    dt.DefaultView.Sort = "Name ";
        //}
        //else
        //{
        //    dt.DefaultView.Sort = "uploaddate desc";
        //}
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            //DataTable dt = ds1.Tables[0];
            //if (dddlsort.SelectedIndex != 0)
            //{
            //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
            //}
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
            dljobseekerdet.DataSource = _PageDataSource;
            dljobseekerdet.DataBind();
            this.doPaging();
            lblCount.Text = Convert.ToString(ds.Tables[0].Rows.Count);
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
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        BA_Marketing mar = new BA_Marketing();
        if (ddlIndustry.SelectedItem.Value == "Select")
        {
            ds = mar.SearchHiringData(txtcomp.Text, txtHireCompany.Text, txtHireDate.Text, "");
          
        }
        else
        {
            ds = mar.SearchHiringData(txtcomp.Text, txtHireCompany.Text, txtHireDate.Text, ddlIndustry.SelectedItem.Text);
        }
            DataTable dt = ds.Tables[0];
            //if (ddlsort.SelectedItem.Text == "Name")
            //{
            //    dt.DefaultView.Sort = "Name ";
            //}
            //else
            //{
            //    dt.DefaultView.Sort = "uploaddate desc";
            //}
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
                dljobseekerdet.DataSource = _PageDataSource;
                dljobseekerdet.DataBind();
                this.doPaging();
                lblCount.Text = Convert.ToString(ds.Tables[0].Rows.Count);
            }
            else
            {
                pnlMain.Visible = false;
                pnlSub.Visible = true;
            }
        

    }
    protected void ddlsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsort.SelectedValue != "0")
        {
           
        }
    }
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        FillGrid();
    }
    protected void lbtnPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        FillGrid();
    }
    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Paging"))
        {
         //   ViewState["_CurrentPage"] = e.CommandArgument;
          //  CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
            //FillGrid(Session["Category"].ToString());
           // FillGrid();
        }
    }
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        //if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        //{
        //    lnkbtnPage.Enabled = false;
        //    lnkbtnPage.Style.Add("font-size", "14px");
        //    lnkbtnPage.Font.Bold = true;

        //}
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
       CurrentPage += 1;
        FillGrid();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        int lastpage = Convert.ToInt32(ViewState["TotalPages"]);
       // CurrentPage = (lastpage - 1);
        // FillGrid(Session["Category"].ToString());
      //  FillGrid();

    }
}