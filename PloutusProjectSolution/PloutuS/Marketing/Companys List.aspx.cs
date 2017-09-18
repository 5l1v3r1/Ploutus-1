using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DA_Ploutos;
using BE_Ploutos;
using System.IO;
using Encrypt;
public partial class Marketing_Companys_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.ErrorMessage = this.Title;
        if (!IsPostBack)
        {
            FillCompanysData();
            FillDDLCompanyNames();
            FillDDLCompanyLocation();
        }
        
    }

    public void FillCompanysData() {

        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillCopanys();
        dlCompanys.DataSource = ds.Tables[0];
        
        dlCompanys.DataBind();
        lblCount.Text = ds.Tables[0].Rows.Count.ToString();
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
        ddlindustry.Items.Insert(0, new ListItem("--------------Select--------------", "Select"));
        

    }
    public void FillDDLCompanyLocation()
    {
        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
        ds = daHir.FillCompanyNames();
        ddlstate.DataSource = ds.Tables[1];
        ddlstate.DataTextField = "CompanyLocation";
        ddlstate.DataValueField = "CompanyLocation";       
        ddlstate.DataBind();
        ddlstate.Items.Insert(0, new ListItem("--------------Select--------------", "Select"));

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {string cname=string.Empty,clocation=string.Empty;
        if(ddlindustry.SelectedIndex>0)
        {
         cname = ddlindustry.SelectedItem.Value;
        }
        if (ddlstate.SelectedIndex > 0)
        {
            clocation = ddlstate.SelectedItem.Value;
        }
        DA_hiredprocess daHir = new DA_hiredprocess();
        DataSet ds = new DataSet();
      ds = daHir.SearchCompany(cname, clocation);
            if (ds.Tables[0].Rows.Count > 0)
            {
                pnlSub.Visible = false;
                dlCompanys.Visible = true;
                dlCompanys.DataSource = ds.Tables[0];

                dlCompanys.DataBind();
                lblCount.Text = ds.Tables[0].Rows.Count.ToString();
            }
            else
            {

                pnlSub.Visible = true;
                dlCompanys.Visible = false;
                lblCount.Text = ds.Tables[0].Rows.Count.ToString();


            }
       
    }

   
}