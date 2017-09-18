using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BE_Ploutos;
using BA_Ploutos;
using DA_Ploutos;

public partial class Employer_ViewPremanentEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        BE_ViewSelected beview = new BE_ViewSelected();
        BA_PremanentEmp bapremanentemp = new BA_PremanentEmp();
        DA_PremanentEmployee dapremanent = new DA_PremanentEmployee();
        string s = Request.QueryString["id"].ToString();


        beview.JobID = Convert.ToInt32(s);
        ds = bapremanentemp.getViewPremanentEmp(beview);
        dlContractEmp.DataSource = ds.Tables[0];
        dlContractEmp.DataBind();
    }
}