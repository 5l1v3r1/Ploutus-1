using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Encrypt;
using System.Collections.Generic;
using BA_Ploutos;
using DA_Ploutos;
using BE_Ploutos;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Marketing_MerchantCompleteInfo : System.Web.UI.Page
{
    string MemID;
    EncryptDecrypt ency;
    string s;
    int PageSize = 10;
    PagedDataSource _PageDataSource = new PagedDataSource();
    string mnrstring;
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    DA_hiredprocess daHir = new DA_hiredprocess();
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
        try
        {
            if (Session["PSEEMAIL"].ToString() != "" && Session["PSEName"].ToString() != "")
            {
                s = Request.QueryString["id"].ToString();
                ency = new EncryptDecrypt();
                MemID = ency.EncryptDecryptString("£", Request.QueryString["id"].ToString());

                ds = daHir.getClientView(MemID);
                Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                dlMemInfo.DataSource = ds;
                dlMemInfo.DataBind();
                FillGrid();
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
    public void FillGrid()
    {
        DataSet ds1 = new DataSet();
        ds1 = daHir.getClientPostData(MemID);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            _PageDataSource.DataSource = ds1.Tables[0].DefaultView;
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
        }
        else
        {
            sub.Visible = true;
        }
    }
    private void fillLocations()
    {
        try
        {
            BA_postjobs pst2 = new BA_postjobs();
            //code for selecting location
            DataSet dslocations = new DataSet(); ;
            dslocations = pst2.getLocations();
            ddlLocation.DataSource = dslocations;
            ddlLocation.DataTextField = "PreLoc";
            ddlLocation.DataValueField = "PreLoc";
            ddlLocation.DataBind();
            ddlLocation.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlLocation.Items.Insert(1, new ListItem("--OTHER--", "--OTHER--"));
        }
        catch (Exception ex)
        {

        }
    }
    private void fillCategories()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        try
        {
            ds = mar.fillcategory();
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataTextField = "indusname";
            ddlCategory.DataValueField = "indusname";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("----------Select----------", "----------Select----------"));

        }
        catch (Exception ex)
        {

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
    protected void btnPostaJob_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Employer/PostJob.aspx?memid="+s+"");
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
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        FillGrid();
    }
    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        int lastpage = Convert.ToInt32(ViewState["TotalPages"]);
        CurrentPage = (lastpage - 1);
        FillGrid();
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

    protected void editdetails(object sender, EventArgs e)
    {

        fillCategories();
        fillLocations();


        ds = daHir.getClientView(MemID);

        txtCompanyName.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
        //ddlCategory.SelectedItem.Text = ds.Tables[0].Rows[0]["Category"].ToString();
        if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["Category"].ToString()))
        {
            ddlCategory.SelectedItem.Text = ds.Tables[0].Rows[0]["Category"].ToString();
        }
        else
        {
            ddlCategory.SelectedItem.Text = "--Select--";
        }
        txtWebSite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
        txtAdd1.Text = ds.Tables[0].Rows[0]["Address1"].ToString();
        txtNewLoaction.Visible = false;
        ddlLocation.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
        if (!string.IsNullOrWhiteSpace(ds.Tables[0].Rows[0]["state"].ToString()))
        {
            ddlLocation.SelectedItem.Text = ds.Tables[0].Rows[0]["state"].ToString();
        }
        else
        {
            ddlLocation.SelectedItem.Text = "----------Select----------";
        }
        txtZip.Text = ds.Tables[0].Rows[0]["zipcode"].ToString();
        txtContact.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
        txtContactNumber.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
        txtMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();

        mpedit.Show();
    }

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        mpedit.Show();
        if (ddlLocation.SelectedItem.Value == "--OTHER--".ToString())
        {
            txtNewLoaction.Text = string.Empty;
            txtNewLoaction.Visible = true;

        }
        else
        {
            txtNewLoaction.Text = string.Empty;
            txtNewLoaction.Visible = false;
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            DA_Marketing damar = new DA_Marketing();
            BE_Clients beviewselected = new BE_Clients();
            BA_Clients baClnt = new BA_Clients();

            beviewselected.Company = txtCompanyName.Text;
            if (ddlCategory.SelectedItem.Text == "----------Select----------")
            {
                beviewselected.Category = "";
            }
            else
            {
                beviewselected.Category = ddlCategory.SelectedItem.Text.ToString();
            }
            beviewselected.Website = txtWebSite.Text;
            beviewselected.Addressline1 = txtAdd1.Text;
            if (ddlLocation.SelectedItem.Text == "--Select--")
            {
                beviewselected.State = "";
            }
            else
            {
                if (ddlLocation.SelectedItem.Text == "--OTHER--")
                {
                    beviewselected.State = txtNewLoaction.Text.ToString();
                }
                else
                {
                    beviewselected.State = ddlLocation.SelectedItem.Text.ToString();
                }
            }



            beviewselected.Zip = txtZip.Text;
            beviewselected.Contact = txtContact.Text;
            beviewselected.Phone = txtContactNumber.Text;
            beviewselected.Mobile = txtMobile.Text;
            beviewselected.Email = txtEmail.Text;
            beviewselected.MemID = MemID;

            damar.updateCliensDetails(beviewselected);

            ds = daHir.getClientView(MemID);
            dlMemInfo.DataSource = ds;
            dlMemInfo.DataBind();



        }
        catch (Exception ex)
        {


        }
    }




}