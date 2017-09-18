using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class DesiredSearchIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string jobtitle, location;
        Label1.Visible = false;
        jobtitle = Request.QueryString["value1"];
        location = Request.QueryString["value2"];
        Label1.Visible = false;
        string str = "Data Source=192.168.100.122;user id=sa;password=Connect@123;Initial Catalog=jobportal";
        SqlConnection con = new SqlConnection(str);
        SqlCommand cmd = new SqlCommand();
        cmd = new SqlCommand("proforsearch6", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@jobtitle", SqlDbType.VarChar, 20));
        cmd.Parameters.Add(new SqlParameter("@location", SqlDbType.VarChar, 20));
        cmd.Parameters["@jobtitle"].Value = jobtitle;
        cmd.Parameters["@location"].Value = location;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dljobdet.DataSource = ds.Tables[0];
        dljobdet.DataBind();
        if (ds.Tables[0].Rows.Count > 0)
        {
            dljobdet.DataSource = ds.Tables[0];
            dljobdet.DataBind();
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "sorry no such records found";
        }

    }
}