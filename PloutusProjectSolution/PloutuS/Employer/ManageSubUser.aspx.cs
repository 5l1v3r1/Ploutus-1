using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BA_Ploutos;
using BE_Ploutos;
using DA_Ploutos;
using System.Windows.Forms;

public partial class Employer_ManageSubUser : System.Web.UI.Page
{
    string s;
    string session;
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


        if (!Page.IsPostBack)
        {
            lblCount.Visible = false;
            string company = Session["PSEName"].ToString();
            if (Session["PSEName"] != null)
            {
                FillGrid();
            }

        }

    }
    protected void FillGrid()
    {
        DataSet ds = new DataSet();
        BA_SubUsers basubusers = new BA_SubUsers();
        BE_SubUSers besubusers = new BE_SubUSers();
        besubusers.Company = Session["PSEName"].ToString();
        ds = basubusers.getSubUSers(besubusers);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["PSERefID"] = ds.Tables[0].Rows[0]["RefID"];
        }
        else
        {
            Session["PSERefID"] = "";

        }
        s = Session["PSERefID"].ToString();
        session = Session["PSERefID"].ToString();
        Session["session"] = session;
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

    //protected void edit(object sender, EventArgs e)
    //{
    //    using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
    //    {
    //        string id = row.Cells[2].Text;
    //        Response.Redirect("SecondForm.aspx?Parameter=" + id);
    //    }

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
    protected void dljobdet_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


    }
    protected void dljobdet_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        BA_SubUsers basubuser = new BA_SubUsers();
        BE_SubUSers besub = new BE_SubUSers();

        string[] id = e.CommandArgument.ToString().Split(',');

        besub.MemID = Session["session"].ToString();


        DataSet ds = new DataSet();
        if (e.CommandName == "Update")
        {
            if (id[0] != "Active")
            {
                ds = basubuser.countSubUser(besub);
                if (ds.Tables[0].Rows.Count > 1)
                {                  
                    HttpContext.Current.Response.Write("<script>alert('  You Should not Activate More Than Two Users  ');</script>");
                   
                }
                else
                {
                    //string id = dljobdet.Rows[e.RowIndex].Cells[2].Text.ToString();
                    DA_ActiveSubUSer active = new DA_ActiveSubUSer();
                    active.updatestatus(id[1]);
                    //dsys.updatestatus(id);
                    //divUserDetails.Visible = false;
                    FillGrid();
                }
            }
            else
            {
                DA_ActiveSubUSer active = new DA_ActiveSubUSer();
                active.updatestatus(id[1]);
                //dsys.updatestatus(id);
                //divUserDetails.Visible = false;
                FillGrid();
            }
        }
    }
}