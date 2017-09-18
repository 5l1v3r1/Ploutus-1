﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BA_Ploutos;
using BE_Ploutos;
using Encrypt;
using System.Configuration;

public partial class JobSeeker_JobSeekerSearch : System.Web.UI.Page
{
    int PageSize = 10;
    PagedDataSource _PageDataSource = new PagedDataSource();
    DataSet ds, ds1;
    BEJobAlerts beJobAlert = new BEJobAlerts();
    BA_JobAlerts bajob = new BA_JobAlerts();
    BA_JobSeekerDesiredJobs badesiredalerts = new BA_JobSeekerDesiredJobs();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                EncryptDecrypt ency = new EncryptDecrypt();
                ViewState["desired"] = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString().Trim());
                ViewState["page"] = Request.UrlReferrer.Segments[3].ToString();
                FillGrid();
                FillJobAlert();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/JobSeekerLogin.aspx", false);
        }
    }
    
    private void FillJobAlert()
    {
        beJobAlert.type = 1;
        ds = new DataSet();
        ds = bajob.GetJsJobAlertModify(beJobAlert);
        dlJobAlert.DataSource = ds.Tables[0];
        dlJobAlert.DataBind();
    }
    public void FillGrid()
    {
        int JobId=int.Parse(ViewState["desired"].ToString());
        beJobAlert.id = JobId;
        beJobAlert.jobSeekerID = Session["PSJUID"].ToString();
        beJobAlert.type = 2;
        ds1 = new DataSet();
        ds1 = bajob.GetJobAlerts(beJobAlert);
        //string query = "select id,Keywords,Location,Category from tblJobAlerts where id="; 
        //da1 = new SqlDataAdapter(query, conn);
        //da1.Fill(ds1);
        ds = new DataSet();
        //beJobAlert = new BEJobAlerts();
        beJobAlert.location = ds1.Tables[0].Rows[0]["Location"].ToString();
        beJobAlert.category = ds1.Tables[0].Rows[0]["category"].ToString();
        beJobAlert.keywords = ds1.Tables[0].Rows[0]["Keywords"].ToString();
        ds = badesiredalerts.GetDesiredJobAlerts(beJobAlert);
        //string q1 = "select *,dbo.EncryptDecrypt(id) as encryptid from tblJobPosting where Location like '%" + ds1.Tables[0].Rows[0]["Location"] + "%' and Industry like '%" + ds1.Tables[0].Rows[0]["Category"] + "%' and JobTitle like '%" + ds1.Tables[0].Rows[0]["Keywords"] + "%'";
        //  da = new SqlDataAdapter(q1, conn);
        //  da.Fill(ds);
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
                dlPostedJobs.DataSource = _PageDataSource;
                dlPostedJobs.DataBind();
                this.doPaging();
            }
            else
            {
                pnlMain.Visible = false;
                pnlSub.Visible = true;
            }
        }
    }
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
    private void doPaging()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
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
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        if (ViewState["page"].ToString() == "JobAlert.aspx")
            Response.Redirect("JobAlert.aspx", false);
        else
        {
            Response.Redirect("UserHome.aspx", false);
        }
    }
}