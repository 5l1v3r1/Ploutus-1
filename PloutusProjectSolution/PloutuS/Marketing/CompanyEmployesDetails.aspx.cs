using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DA_Ploutos;
using System.Data;
using Encrypt;

public partial class Marketing_CompanyEmployesDetails : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {


     


       
        EncryptDecrypt ency = new EncryptDecrypt();
      ViewState["CompanyName"] = ency.EncryptDecryptString("£", Request.QueryString["companyname"].ToString());
        FillEmployeData();
        lblCount.Text = ds.Tables[0].Rows.Count.ToString();

    }

    

    public void FillEmployeData(){
    
     DA_hiredprocess daHir = new DA_hiredprocess();
       

        ds = daHir.GetEachCompanyDetails(ViewState["CompanyName"].ToString());

        dlEmpCompanys.DataSource = ds.Tables[0];
        dlEmpCompanys.DataBind();


    }
}