using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class FindJob : System.Web.UI.Page
{
    DataSet ds;
    SqlDataAdapter daFill;
    string connection = "Data Source=192.168.100.122;user id=sa;password=Connect@123;Initial Catalog=jobportal";
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        FillSerchJobsByJTitle();
        FillSerchJobsByJLocation();
    }

    private void FillSerchJobsByJLocation()
    {
        string Query = "select loc,COUNT(*) as count from tbljobdet group by loc order by loc";
        con = new SqlConnection(connection);
        daFill = new SqlDataAdapter(Query, con);
        DataSet ds1 = new DataSet();
        daFill.Fill(ds1);
        tbljobdet1.DataSource = ds1.Tables[0];
        tbljobdet1.DataBind();
        if (ds1 != null)
        {
            if (ds1.Tables[0].Rows.Count > 0)
            {
                tbljobdet1.DataSource = ds1.Tables[0];
                tbljobdet1.DataBind();
            }
            else
            {

            }
        }
        else
        {

        }
    }

    private void FillSerchJobsByJTitle()
    {
        string Query = "select Jobtitl,COUNT(*) as count from tbljobdet group by Jobtitl order by Jobtitl ";
        con = new SqlConnection(connection);
        daFill = new SqlDataAdapter(Query, con);
        ds = new DataSet();
        daFill.Fill(ds);
        tbljobdet.DataSource = ds.Tables[0];
        tbljobdet.DataBind();
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                tbljobdet.DataSource = ds.Tables[0];
                tbljobdet.DataBind();
            }
            else
            {

            }
        }
        else
        {

        }
    }
}