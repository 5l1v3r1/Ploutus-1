using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BA_Ploutos;
using System.Configuration;
using DocxToTextDemo;
using System.IO;
using System.Text;
using System.Globalization;
using Novacode;
using Encrypt;
using ICSharpCode.SharpZipLib.Zip;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
public partial class Marketing_Search : System.Web.UI.Page
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
        this.Master.ErrorMessage = this.Title;
        if (!Page.IsPostBack)
        {
            BA_Marketing mar = new BA_Marketing();
            DataSet ds = new DataSet();
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    fillDDLlists();

                    if (HttpContext.Current.Session["backFlag"] != null)
                    {
                        string flv = HttpContext.Current.Session["backFlag"].ToString();
                        if (flv == "1")
                        {
                            getBackPreviousData();
                            hdnflagV.Value = "1";
                            HttpContext.Current.Session["backFlag"] = null;
                        }
                        else
                        {
                            FillGrid();
                            hdnflagV.Value = "0";
                            ViewState["SerchedData"] = null;
                            HttpContext.Current.Session["backFlag"] = null;

                            txtKeyword.Text = "";
                            txtNameEmailPhone.Text = "";
                            txtUploadDate.Text = "";
                            ddlActivities.SelectedItem.Text = "Select";
                            ddlIndustry.SelectedItem.Text = "Select";
                            ddlClient.SelectedItem.Text = "Select";
                        }
                    }
                    else
                    {
                        FillGrid();
                        hdnflagV.Value = "0";

                        ViewState["SerchedData"] = null;
                        HttpContext.Current.Session["backFlag"] = null;

                        txtKeyword.Text = "";
                        txtNameEmailPhone.Text = "";
                        txtUploadDate.Text = "";
                        ddlActivities.SelectedItem.Text = "Select";
                        ddlIndustry.SelectedItem.Text = "Select";
                        ddlClient.SelectedItem.Text = "Select";
                    }
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

    public void getBackPreviousData()
    {
        DataSet ds11 = new DataSet();
        BA_Marketing mar = new BA_Marketing();
        var obj1 = new SearchFieldsData();
        try
        {
            obj1 = (SearchFieldsData)HttpContext.Current.Session["SearchViewData"];
            if (obj1 != null)
            {
                txtKeyword.Text = obj1.Keywrd.ToString();
                txtNameEmailPhone.Text = obj1.NmeEmlPhone.ToString();
                txtUploadDate.Text = obj1.Date;
                ddlActivities.SelectedItem.Text = obj1.Activity;
                ddlIndustry.SelectedItem.Text = obj1.Industry;
                ddlClient.SelectedValue = obj1.Client;
                string ids = obj1.TIDS;
                if (obj1.Industry == "Select")
                {
                    obj1.Industry = "";
                }
                if (obj1.Activity == "Select")
                {
                    obj1.Activity = "";
                }
                if (obj1.Client == "Select")
                {
                    obj1.Client = "";
                }
                ds11 = mar.SearchViewUplodedData(txtNameEmailPhone.Text.Trim(), obj1.Activity, obj1.Industry, txtUploadDate.Text, ids, obj1.Client);

                DataTable dt11 = ds11.Tables[0];
                if (ds11 != null && ds11.Tables.Count > 0 && ds11.Tables[0].Rows.Count > 0)
                {
                    if (ddlsort.SelectedItem.Text.Trim() == "Name")
                    {
                        dt11.DefaultView.Sort = "Name";
                    }
                    else
                    {
                        dt11.DefaultView.Sort = "Jsid desc";
                    }
                    pnlMain.Visible = true;
                    pnlSub.Visible = false;
                    _PageDataSource.DataSource = dt11.DefaultView;
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
                    lblCount.Text = Convert.ToString(ds11.Tables[0].Rows.Count);
                    ViewState["SerchedData"] = ds11.Tables[0];

                    hdnflagV.Value = "1";

                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }
            }
            else if (ViewState["SerchedData"] != null && flag == 1)
            {
                DataTable dt11 = (DataTable)ViewState["SerchedData"];

                if (dt11 != null && dt11.Rows.Count > 0)
                {

                    if (ddlsort.SelectedItem.Text.Trim() == "Name")
                    {
                        dt11.DefaultView.Sort = "FName";
                    }
                    else
                    {
                        dt11.DefaultView.Sort = "Jsid desc";
                    }
                    pnlMain.Visible = true;
                    pnlSub.Visible = false;
                    _PageDataSource.DataSource = dt11.DefaultView;
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
                    lblCount.Text = Convert.ToString(ds11.Tables[0].Rows.Count);

                    hdnflagV.Value = "1";
                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }
            }
            //else
            //{
            //    flag =Convert.ToInt32(hdnflagV.Value);
            //    if (flag == 0)
            //    {
            //        //ds11 = mar.fillcategory();
            //        hdnflagV.Value = "0";
            //        FillGrid();

            //        txtKeyword.Text = "";
            //        txtNameEmailPhone.Text = "";
            //        txtUploadDate.Text = "";
            //        //ddlActivities.SelectedValue = "Select";
            //        //ddlIndustry.SelectedValue = "Select";
            //        ddlActivities.SelectedItem.Text = "Select";
            //        ddlIndustry.SelectedItem.Text = "Select";

            //    }
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

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Ploutos/Userhome.aspx");
    }
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        flag = Convert.ToInt32(hdnflagV.Value);
        if (flag == 0)
        {
            FillGrid();
        }
        else
        {
            getBackPreviousData();
        }
    }
    protected void lbtnPrevious_Click(object sender, EventArgs e)
    {
        //int SelectedPage = 0;
        //if (ViewState["_CurrentPage"] != null)
        //    SelectedPage = (int)ViewState["_CurrentPage"];
        //SelectedPage -= 1;
        CurrentPage -= 1;
        flag = Convert.ToInt32(hdnflagV.Value);
        if (flag == 0)
        {
            FillGrid();
        }
        else
        {
            getBackPreviousData();
        }
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        //int SelectedPage = 0;
        //if (ViewState["_CurrentPage"] != null)
        //    SelectedPage = (int)ViewState["_CurrentPage"];
        //SelectedPage += 1;
        CurrentPage += 1;
        flag = Convert.ToInt32(hdnflagV.Value);
        if (flag == 0)
        {
            FillGrid();
        }
        else
        {
            getBackPreviousData();
        }
    }

    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        int lastpage = Convert.ToInt32(ViewState["TotalPages"]);
        CurrentPage = (lastpage - 1);
        flag = Convert.ToInt32(hdnflagV.Value);
        if (flag == 0)
        {
            FillGrid();
        }
        else
        {
            getBackPreviousData();
        }
    }

    #region //Get The Row S.No between paging in DataList

    public void FillGrid(int CurrentPage)
    {
        //ViewState["sort"] = 1;

        BA_Marketing mar = new BA_Marketing();
        DataSet ds1 = new DataSet();

        ds1 = mar.FillmarketList();

        DataTable dt = ds1.Tables[0];

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            if (ddlsort.SelectedItem.Text.Trim() == "Name")
            {
                dt.DefaultView.Sort = "FName";
            }
            else
            {
                dt.DefaultView.Sort = "id desc";
            }

            pnlMain.Visible = true;
            pnlSub.Visible = false;


            //Get The Row S.No between paging in DataList        
            DataTable dtnew = new DataTable();

            int currentStartRow = (CurrentPage * PageSize) + 1;
            int currentEndRow = (CurrentPage * PageSize) + PageSize;
            int TotalPageCount = Convert.ToInt32(ds1.Tables[0].Rows.Count);
            if (currentEndRow > TotalPageCount)
            {
                currentEndRow = TotalPageCount;
            }
            for (int i = currentStartRow; i <= currentEndRow; i++)
            {
                //((Label)dljobseekerdet.FindControl("lblSNo")).Text =i.ToString();

                dtnew.ImportRow(dt.Rows[i]);
            }

            _PageDataSource.DataSource = dtnew.DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = PageSize;
            _PageDataSource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _PageDataSource.PageCount;
            this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
            this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
            this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
            this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
            //dljobseekerdet.DataSource = _PageDataSource;
            //dljobseekerdet.DataBind();


            if (CurrentPage > (_PageDataSource.PageCount - 1))
            {
                CurrentPage = _PageDataSource.PageCount - 1;
            }
            if (CurrentPage < 0)
            {
                CurrentPage = 0;
            }
            _PageDataSource.CurrentPageIndex = CurrentPage;

            // Step 3: Bind PagedDataSource to Repeater and set LinkButtons' behavior
            dljobseekerdet.DataSource = _PageDataSource;
            if (_PageDataSource.IsLastPage)
                lbtnNext.Enabled = false;
            else
                lbtnNext.Enabled = true;

            if (_PageDataSource.IsFirstPage)
                lbtnPrevious.Enabled = false;
            else
                lbtnPrevious.Enabled = true;

            this.doPaging();
            lblCount.Text = Convert.ToString(ds1.Tables[0].Rows.Count);
        }
        else
        {
            pnlMain.Visible = false;
            pnlSub.Visible = true;
        }
    }


    #endregion

    List<string> list = new List<string>();
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string fpath = string.Empty;
        List<string> fnames = new List<string>();
        List<string> lstjsid = new List<string>();
        //string jsids = string.Empty; ;
        string strtemp = string.Empty;

        var sfields = new SearchFieldsData();

        try
        {
            #region //KeyWord Search Code
            // if (!string.IsNullOrWhiteSpace(txtKeyWord.Text))
            // {                            

            //  ds = mar.SearchViewUplodedData("","",txtKeyWord.Text,"","","");
            //  dt = ds.Tables[0];

            #region  // Get the Searching Word in all columns of Tables in DB Not Using Now
            // ds1 = mar.SearchKeyWordFromDB(txtKeyWord.Text);
            // if (ds != null && ds.Tables.Count > 0)
            //{
            //if (ds1.Tables[0] != null && ds1.Tables[0].Rows.Count > 0)
            //{
            //    dt1 = ds1.Tables[0];
            //    foreach (DataRow dr in dt1.Rows)
            //    { str = dr["jsid"].ToString(); }
            //}
            //else if (ds1.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            //{
            //    dt1 = ds1.Tables[1];
            //    foreach (DataRow dr in dt1.Rows)
            //    { str = dr["jsid"].ToString(); }
            //}

            //ds = mar.GetmarketingMemByJsID(str);
            //dt = ds.Tables[0];
            // }
            #endregion

            //}
            #endregion
            if (txtKeyword.Text != "")
            {
                try
                {
                    KeywordResumes(txtKeyword.Text.Trim());
                }
                catch (Exception ex)
                {
                    //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + ex.Message + "');", true);
                }
            }
            if (list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    string name = Path.GetFileNameWithoutExtension(list[i]);
                    FileInfo fi = new FileInfo(list[i]);
                    //strtemp = strtemp + "'" + name + "',";
                    lstjsid.Add(name + ",");
                }
                //strtemp = strtemp.Remove(strtemp.Length - 1);
                string[] asdfg = lstjsid.ToArray();
                string val = string.Join("", asdfg);
                char[] mychar = { ',' };
                strtemp = val.TrimEnd(mychar);
            }
            else
            {
                strtemp = "";
            }
            if (txtNameEmailPhone.Text == "" && ddlActivities.SelectedItem.Value == "Select" && ddlIndustry.SelectedItem.Value == "Select" && txtUploadDate.Text == "" && txtKeyword.Text == "" && ddlClient.SelectedItem.Value == "Select")
            {
                //FillGrid();
                //HttpContext.Current.Session["backFlag"] = "0";
                //Session["SearchViewData"] = null;
                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Wrong Search Criteria');", true);
                Response.Redirect(Request.RawUrl);

            }
            else
            {
                string activ = string.Empty;
                string industry = string.Empty;
                string client = string.Empty;
                if (ddlActivities.SelectedItem.Value == "Select")
                {
                    activ = " ";
                }
                else
                {
                    activ = ddlActivities.SelectedItem.Text.ToString();

                }
                if (ddlIndustry.SelectedItem.Value == "Select")
                {
                    industry = "";
                }
                else
                {
                    industry = ddlIndustry.SelectedItem.Text.ToString();
                }
                if (ddlClient.SelectedItem.Value == "Select")
                {
                    client = "";
                }
                else
                {
                    client = ddlClient.SelectedValue;

                }

                ds = mar.SearchViewUplodedData(txtNameEmailPhone.Text.Trim(), activ, industry, txtUploadDate.Text, strtemp, client);

                dt = ds.Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    sfields.Keywrd = txtKeyword.Text.Trim().ToString();
                    sfields.NmeEmlPhone = txtNameEmailPhone.Text.Trim().ToString();
                    sfields.Date = txtUploadDate.Text.ToString();
                    if (activ != " ")
                    {
                        sfields.Activity = activ;
                    }
                    else
                    {
                        sfields.Activity = "Select";
                    }
                    if (industry != "")
                    {
                        sfields.Industry = industry;
                    }
                    else
                    {
                        sfields.Industry = "Select";
                    }
                    if (client != "")
                    {
                        sfields.Client = client;
                    }
                    else
                    {
                        sfields.Client = "Select";
                    }
                    sfields.TIDS = strtemp;
                    HttpContext.Current.Session["SearchViewData"] = sfields;  // Save the class object in Session                   
                }
                else
                {
                    HttpContext.Current.Session["SearchViewData"] = null;
                }


                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (ddlsort.SelectedItem.Text.Trim() == "Name")
                    {
                        dt.DefaultView.Sort = "Name";
                    }
                    else if (ddlsort.SelectedItem.Text.Trim() == "Client")
                    {
                        dt.DefaultView.Sort = "ClientName desc";
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
                    _PageDataSource.CurrentPageIndex = 0;                    
                    ViewState["TotalPages"] = _PageDataSource.PageCount;
                    this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
                    this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
                    this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
                    this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
                    dljobseekerdet.DataSource = _PageDataSource;
                    dljobseekerdet.DataBind();
                    this.doPaging();
                    lblCount.Text = Convert.ToString(ds.Tables[0].Rows.Count);
                    ViewState["SerchedData"] = ds.Tables[0];
                    hdnflagV.Value = "1";
                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + ex.Message + "');", true);
        }
    }
    public void KeywordResumes(string keyword)
    {
        var searchTerm = txtKeyword.Text.Trim();
        var searchDirectory = new System.IO.DirectoryInfo(ConfigurationManager.AppSettings["Resumes"].ToString());

        foreach (string fileName in Directory.GetFiles(ConfigurationManager.AppSettings["Resumes"].ToString()))
        {
            CultureInfo ci = new CultureInfo("en-US");
            string fileContent = System.IO.File.ReadAllText(fileName);
            string fileconten1 = getResume(fileName);
            if (ci.CompareInfo.IndexOf(fileconten1, searchTerm, CompareOptions.IgnoreCase) >= 0)
            {
                list.Add(fileName);
            }
        }

    }

    protected void ViewResume_Click(object sender, EventArgs e)
    {
        try
        {
            show();
            mpeshow.Show();
        }
        catch (Exception ex)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Not Available');", true);
        }



    }
    public void show()
    {
        string path = ConfigurationManager.AppSettings["Resumes"].ToString() + ViewState["Jsid"].ToString() + ".docx";
        Stream stream = File.Open(path, FileMode.Open);
        WordprocessingDocument doc = WordprocessingDocument.Open(stream, true);
        //Body body=;
        string text = doc.MainDocumentPart.Document.Body.Parent.InnerText;
        doc.Close();
        doc.Dispose();
        stream.Close();
        //return text;
       // string Resumetext = doc1.ExtractText();
        displayResume.InnerHtml = text;

    }
    protected void DwnldResume_Click(object sender, EventArgs e)
    {
        try
        {
            string path = ConfigurationManager.AppSettings["Resumes"].ToString() + ViewState["Jsid"].ToString() + ".docx";


            Response.Clear();
            Response.Buffer = true;
            Response.AppendHeader("Content-Type", "application/msword");
            Response.AppendHeader("Content-disposition", "attachment; filename=" + ViewState["Jsid"].ToString() + ".docx");
            string x = testc1(path);
            Response.WriteFile(x);

            Response.End();

        }
        catch (System.Threading.ThreadAbortException ex)
        {
            throw;
        }
        catch (Exception ex)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Not Available');", true);
        }
    }
    private string testc1(string path)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(@"<html xmlns:v='urn:schemas-microsoft-com:vml'" +
        "xmlns:o='urn:schemas-microsoft-com:office:office'" +
        "xmlns:w='urn:schemas-microsoft-com:office:word'" +
        "xmlns:m='http://schemas.microsoft.com/office/2004/12/omml'" +
        "xmlns='http://www.w3.org/TR/REC-html40'>" +
        "<head><meta http-equiv=Content-Type content='text/html; charset=utf-8'><title></title>" +
        "<style>" +
        @"v\:* {behavior:url(#default#VML);}" +
        @"o\:* {behavior:url(#default#VML);}" +
        @"w\:* {behavior:url(#default#VML);}" +
        ".shape {behavior:url(#default#VML);}" +
        "</style>" +
        "<xml>" +
        "<w:WordDocument>" +
        "<w:View>Print</w:View>" +
        "<w:Zoom>100</w:Zoom>" +
        "<w:DoNotOptimizeForBrowser/>" +
        "</w:WordDocument>" +
        "</xml>" +
        "</head>" +

        "<body>" +
        "<div class='Section1'>" +

           " <p>&nbsp;</p>" +
        "<br/>" +
           " <table id='hrdftrtbl' border='0' cellspacing='0' cellpadding='0'>" +
          "<tr><td>        <div style='mso-element:body' id=b1 >" +
             "   <!-- HEADER-tags -->" +
             getResume(path) +
            "    <!-- end HEADER-tags -->" +

            "    </div>" +
          "  </td></tr>" +

            "</td></tr>" +
           " </table></div></body></html>");
        return sb.ToString();
        //string strPath = Server.MapPath("~/Myfiles/") + "mywordfile11.doc";
        //FileStream fStream = File.Create(strPath);
        //fStream.Close();
        //StreamWriter sWriter = new StreamWriter(strPath);
        //sWriter.Write(sb);
        //sWriter.Close();

    }

    private string getResume(string path)
    {
        //DocxToText1 doc1 = new DocxToText1();
        //// string path = "F://JSM1328.docx";
        //doc1.DocxToText(path);
        //return doc1.ExtractText();
        Stream stream = File.Open(path,FileMode.Open);
       WordprocessingDocument doc = WordprocessingDocument.Open(stream,true);
        //Body body=;
        string text = doc.MainDocumentPart.Document.Body.Parent.InnerText;
        doc.Close();
       
        return text;
        
    }
    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
        if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkbtnPage.Enabled = false;
            lnkbtnPage.Style.Add("font-size", "15px");
            lnkbtnPage.Font.Bold = true;

        }
    }

    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("Paging"))
        {
            ViewState["_CurrentPage"] = e.CommandArgument;
            CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
            // FillGrid(Session["Category"].ToString()); 
            flag = Convert.ToInt32(hdnflagV.Value);
            if (flag == 0)
            {
                FillGrid();
                hdnflagV.Value = "0";
            }
            else if (flag == 1)
            {
                getBackPreviousData();
                hdnflagV.Value = "1";
            }



        }

    }

    public void FillGrid()
    {
        ViewState["sort"] = 1;

        BA_Marketing mar = new BA_Marketing();
        DataSet ds1 = new DataSet();
        int status = 0;
        ds1 = mar.FillmarketViewResumelist(status);

        DataTable dt = ds1.Tables[0];

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            if (ddlsort.SelectedItem.Text.Trim() == "Name")
            {
                dt.DefaultView.Sort = "Name";
            }
            else if (ddlsort.SelectedItem.Text.Trim() == "Client")
            {
                dt.DefaultView.Sort = "ClientName desc";
            }
            else
            {
                dt.DefaultView.Sort = "id desc";
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
            hdnflagV.Value = "0";
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
            flag = Convert.ToInt32(hdnflagV.Value);
            if (ViewState["SerchedData"] != null && flag == 1)
            {
                DataTable dt11 = (DataTable)ViewState["SerchedData"];

                if (dt11 != null && dt11.Rows.Count > 0)
                {
                    if (ddlsort.SelectedItem.Text.Trim() == "Name")
                    {
                        dt11.DefaultView.Sort = "Name";
                    }
                    else if (ddlsort.SelectedItem.Text.Trim() == "Client")
                    {
                        dt11.DefaultView.Sort = "ClientName desc";
                    }
                    else
                    {
                        dt11.DefaultView.Sort = "Jsid desc";
                    }
                    pnlMain.Visible = true;
                    pnlSub.Visible = false;
                    _PageDataSource.DataSource = dt11.DefaultView;
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
                    lblCount.Text = Convert.ToString(dt11.Rows.Count);

                    hdnflagV.Value = "1";
                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }


            }
            else if (ViewState["SerchedData"] == null && flag == 0)
            {
                FillGrid();
                //hdnflagV.Value = "0";
            }
            else
            {
                FillGrid();
            }

        }

    }
    //protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    BA_Search daserch = new BA_Search();
    //    DataSet ds = new DataSet();
    //    ds = daserch.getCity(ddlstate.SelectedValue);
    //    ddlcity.DataSource = ds;
    //    ddlcity.DataTextField = "City";
    //    ddlcity.DataValueField = "City";
    //    ddlcity.DataBind();
    //    ddlcity.Items.Insert(0, new ListItem("Select", "Select"));
    //}
    protected void hp1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewUploadedResumesAlready.aspx", false);
    }

    protected void dljobseekerdet_ItemCommand(object source, DataListCommandEventArgs e)
    {
        // ViewState["Jsid"] = e.CommandArgument.ToString();
        if (e.CommandName == "HpkName")
        {
            try
            {
                ViewState["Jsid"] = e.CommandArgument.ToString();
                if (hdnflagV.Value == "0" && ViewState["SerchedData"] == null)
                {
                    // string jsid = HttpUtility.UrlEncode(ViewState["Jsid"].ToString());

                    string jsid = ency.EncryptDecryptString("£", ViewState["Jsid"].ToString());
                    Response.Redirect(string.Format("Listofusers.aspx?id={0}&flagV=0", jsid));
                    hdnflagV.Value = "0";

                    //HttpContext.Current.Session["backFlag"] = 0;

                }
                if (hdnflagV.Value == "1" && ViewState["SerchedData"] != null)
                {
                    string jsid = ency.EncryptDecryptString("£", ViewState["Jsid"].ToString());
                    Response.Redirect(string.Format("Listofusers.aspx?id={0}&flagV=1", jsid));
                    hdnflagV.Value = "1";
                    //HttpContext.Current.Session["backFlag"] = 1;
                }

            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Error occured');", true);
            }
        }
        if (e.CommandName == "ViewResume")
        {
            try
            {
                ViewState["Jsid"] = e.CommandArgument.ToString();
                show();
                mpeshow.Show();
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Not Available');", true);
            }
        }
        if (e.CommandName == "DwnldResume")
        {
            try
            {
                string path = ConfigurationManager.AppSettings["Resumes"].ToString() + e.CommandArgument.ToString() + ".docx";
                FileInfo file = new FileInfo(path);
                if (File.Exists(path))
                {
                    //ViewState["JsId"] = e.CommandArgument.ToString();

                    Response.Redirect("DownLoadFilesHandler.ashx?fpath=" + path);
                   // Response.Redirect("dummy.aspx?fName=" + path);
                    //Response.Clear();
                    //Response.AppendHeader("Content-Type", "application/msword");
                    //Response.AppendHeader("Content-disposition", "attachment;  filename=" + e.CommandArgument.ToString() + ".docx" + "");
                    //string x = testc1(path);
                    //Response.Write(x);
                    //Response.End();
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Not Available');", true);
                }
            }
            catch (Exception ex)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Resume Not Available');", true);
            }
        }

    }
    protected void dljobseekerdet_Init(object sender, EventArgs e)
    {

    }
    protected void dljobseekerdet_ItemDataBound(object sender, DataListItemEventArgs e)
    {

    }
    private void fillDDLlists()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        BA_Marketingactivities BAmaract = new BA_Marketingactivities();
        DataSet ds1 = new DataSet();

        ds = mar.fillcategory();
        ddlIndustry.DataSource = ds.Tables[0];
        ddlIndustry.DataTextField = "indusname";
        ddlIndustry.DataValueField = "indusname";
        ddlIndustry.DataBind();
        ddlIndustry.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "Select"));

        ddlClient.DataSource = ds.Tables[3];
        ddlClient.DataTextField = "companyname";
        ddlClient.DataValueField = "MemID";
        ddlClient.DataBind();
        ddlClient.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "Select"));
        ddlClient.Items.Insert(1, new System.Web.UI.WebControls.ListItem("--NA--", "1"));

        ds1 = BAmaract.GetAllMArketingActivities(" ");
        ddlActivities.DataSource = ds1.Tables[0];
        ddlActivities.DataTextField = "activities";
        ddlActivities.DataValueField = "id";
        ddlActivities.DataBind();
        ddlActivities.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "Select"));
        ddlActivities.SelectedIndex = 0;


    }

    //It Keeps the session values of Search fields.
    public class SearchFieldsData
    {
        public string Keywrd { get; set; }
        public string NmeEmlPhone { get; set; }
        public string Activity { get; set; }
        public string Industry { get; set; }
        public string Date { get; set; }
        public string TIDS { get; set; }
        public string Client { get; set; }
    }


    #region//Old Search event which is Hard coded

    protected void btnsearch11_Click11()
    {
        if (true)
        {
            SearchGrid(0);
        }

        else if (true) //if (txtEmail.Text == "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" == "" && txtPhone.Text == "" && ddlIndustry.SelectedIndex == 0)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Wrong Search Criteria');", true);
        }
        else if (true) //(txtEmail.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" != "" && txtPhone.Text == "" && ddlIndustry.SelectedIndex == 0)
        {

            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = "status like '%" + "ddlActivities.SelectedItem.Value " + "%' and name like '%" + " txtEmail.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" != "" && txtPhone.Text != "" && ddlIndustry.SelectedIndex != 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = "status like '%" + "Status.text" + "%' and name like '%" + "txtEmail.Text " + "%' and Uploaddate like '%" + "txtPhone.Text" + "%' and Industry like'%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = "Uploaddate ='" + "txtPhone.Text" + "'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) //(txtEmail.Text == "" && txtPhone.Text != "" && "ddlActivities.SelectedItem.Value == "Select" != "" && ddlIndustry.SelectedIndex == 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = "status like '%" + "ddlActivities.SelectedItem.Value" + "Select" + "%' and Uploaddate like '%" + "txtPhone.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text != "" && txtPhone.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" == "" && ddlIndustry.SelectedIndex == 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = " name like '%" + "txtEmail.Text" + "%' and Uploaddate like '%" + "txtPhone.Text " + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text != "" && txtPhone.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" == "" && ddlIndustry.SelectedIndex != 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = " name like '%" + "txtEmail.Text" + "%' and Uploaddate like '%" + "txtPhone.Text " + "%' and Industry like '%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text == "" && txtPhone.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" != "" && ddlIndustry.SelectedIndex != 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = " Uploaddate like '%" + "txtPhone.Text" + "%' and status like '%" + "ddlActivities.SelectedItem.Value " + "%' and Industry like '%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text != "" && txtPhone.Text == "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" == "" && ddlIndustry.SelectedIndex != 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = " name like '%" + "txtEmail.Text" + "%' and Industry like '%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true) // (txtEmail.Text == "" && txtPhone.Text != "" && "ddlActivities.SelectedItem.Value == "Select".SelectedItem.Value == "Select"" == "" && ddlIndustry.SelectedIndex != 0)
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = " Uploaddate like '%" + "txtPhone.Text" + "%' and Industry like '%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
        else if (true)//(txtEmail.Text == "" && txtPhone.Text == "" && "ddlActivities.SelectedItem.Value"+ "Select" == "" && "ddlIndustry.SelectedIndex" != "0")
        {
            ViewState["sort"] = 1;

            BA_Marketing mar = new BA_Marketing();
            DataSet ds1 = new DataSet();
            ds1 = mar.FillmarketList();
            ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
            string search = "Industry like '%" + "ddlIndustry.SelectedItem.Text" + "%'";
            ds1.Tables[0].DefaultView.RowFilter = search;
            DataTable dt = ds1.Tables[0];
            // dt.DefaultView.RowFilter = search;
            if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
            {
                if (ddlsort.SelectedItem.Text.Trim() == "Name")
                {
                    dt.DefaultView.Sort = "FName";
                }
                else
                {
                    dt.DefaultView.Sort = "Jsid desc";
                }
                //DataTable dt = ds1.Tables[0];
                //if (dddlsort.SelectedIndex != 0)
                //{
                //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
                //}
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
    #endregion

    #region // Old code which is not using




    protected void btnStatus_Click(object sender, EventArgs e)
    {
        ViewState["sort"] = 1;

        BA_Marketing mar = new BA_Marketing();
        DataSet ds1 = new DataSet();
        ds1 = mar.FillmarketList();
        ViewState["Jsid"] = ds1.Tables[0].Rows[0]["jsid"].ToString();
        string search = "status like %" + "ddlActivities.SelectedItem.Value " + "%";
        //    ds1.Tables[0].DefaultView.RowFilter = search;
        DataTable dt = ds1.Tables[0];

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            if (ddlsort.SelectedItem.Text.Trim() == "Name")
            {
                dt.DefaultView.Sort = "FName";
            }
            else
            {
                dt.DefaultView.Sort = "Jsid desc";
            }
            //DataTable dt = ds1.Tables[0];
            //if (dddlsort.SelectedIndex != 0)
            //{
            //    dt.DefaultView.Sort = dddlsort.SelectedValue.ToString();
            //}
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
    public void SearchGrid(int status)
    {
        ViewState["sort"] = 2;
        try
        {
            if ("txtEmail.Text" == "")
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Please Enter Name');", true);
            }
            else
            {
                BA_Marketing mar = new BA_Marketing();
                DataSet ds = new DataSet();

                if ("txtEmail.Text.ToString()" == "")
                {
                    ViewState["search"] = "";
                }
                else
                {
                    // ViewState["search"] = "%" + txtEmail.Text.ToString() + "%";
                }

                ds = mar.SearchMarketlist(ViewState["search"].ToString(), "", "", "", status, "", "");
                DataTable dt = ds.Tables[0];
                if (ddlsort.SelectedItem.Text == "Name")
                {
                    dt.DefaultView.Sort = "Name ";
                }
                else
                {
                    dt.DefaultView.Sort = "uploaddate desc";
                }
                if (ds != null && ds.Tables[0].Rows.Count > 0)
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
                    dljobseekerdet.DataSource = _PageDataSource;
                    dljobseekerdet.DataBind();
                    this.doPaging();
                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }
            }
        }
        catch (Exception exs)
        {
            Response.Redirect("~/Marketing/MarketingLogin.aspx");
        }
    }
    public void SearchGridStatus(int status)
    {
        ViewState["sort"] = 2;
        try
        {
            if ("ddlActivities.SelectedItem.Value == Select" == "")
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Please Enter Name');", true);
            }
            else
            {
                BA_Marketing mar = new BA_Marketing();
                DataSet ds = new DataSet();
                //  string expfrom = ddlexpfrom.SelectedItem.ToString();
                // string expto = ddlexpto.SelectedItem.ToString();
                // string industry = ddlindustry.SelectedItem.ToString();
                //  string state = ddlstate.SelectedItem.ToString();
                //  string city = ddlcity.SelectedItem.ToString();
                if ("ddlActivities.SelectedItem.Value".ToString() == "")
                {
                    ViewState["search"] = "";
                }
                else
                {
                    ViewState["search"] = "%" + "ddlActivities.SelectedItem.Value ".ToString() + "%";
                }

                ds = mar.SearchMarKetStatusList(ViewState["search"].ToString());
                DataTable dt = ds.Tables[0];
                if (ddlsort.SelectedItem.Text == "Name")
                {
                    dt.DefaultView.Sort = "Name ";
                }
                else
                {
                    dt.DefaultView.Sort = "uploaddate desc";
                }
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
                }
                else
                {
                    pnlMain.Visible = false;
                    pnlSub.Visible = true;
                }
            }
        }
        catch (Exception exs)
        {
            Response.Redirect("~/MarketingLogin.aspx");
        }
    }

    #endregion
}

