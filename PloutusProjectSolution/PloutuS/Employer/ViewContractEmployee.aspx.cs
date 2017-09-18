using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE_Ploutos;
using DA_Ploutos;
using BA_Ploutos;
using System.Data;
public partial class Employer_ViewContractEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        BE_ViewSelected beview = new BE_ViewSelected();
        BA_ContractEmp bacontractemp = new BA_ContractEmp();
        DA_ContarctEmployee dacont = new DA_ContarctEmployee();

        string s = Request.QueryString["id"].ToString();

        
        beview.JobID = Convert.ToInt32(s);
        ds = bacontractemp.getViewContractEmp(beview);
        dlContractEmp.DataSource = ds.Tables[0];
        dlContractEmp.DataBind();
    }
}