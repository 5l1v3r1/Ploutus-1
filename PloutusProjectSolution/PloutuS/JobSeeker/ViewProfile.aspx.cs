using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BA_Ploutos;
using BE_Ploutos;

public partial class ViewProfile : System.Web.UI.Page
{
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = Request.QueryString["PSJUID"];
        if (!IsPostBack)
        {

            if (Session["PSJUID"] != null)
            {
                BAJobSeeker baMem = new BAJobSeeker();
                BEMemDetails beMem = new BEMemDetails();
                beMem.email = Session["PSJUID"].ToString();
                DataSet ds = new DataSet();
                ds = baMem.getMemCompleteDetails(beMem);
                dlUserProfile.DataSource = ds.Tables[0];
                dlUserProfile.DataBind();
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditDetails.aspx", false);
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx", false);
    }
}