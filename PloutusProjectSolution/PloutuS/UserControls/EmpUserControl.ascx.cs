using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class UserControls_EmpUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    string cmdstrngdata;
    string time;
    DataSet ds = new DataSet();
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Employlogin.aspx", false);
        //getValues();
        //updateLastLogin();
        //Session.Abandon();
        //Response.Redirect("UserHome.aspx");
    }
    protected void getValues()
    {
        cmdstrngdata = "select currentlogintime from tblEmployeeLastLogin where emailid= '" + Session["PSEEMAIL"].ToString() + "'";

        try
        {
            SqlDataAdapter da = new SqlDataAdapter(cmdstrngdata, conn);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                time = ds.Tables[0].Rows[0]["currentlogintime"].ToString();
            }
        }
        catch (Exception)
        {

        }
    }
    protected void updateLastLogin()
    {

        try
        {
            SqlCommand cmdstrngupdate = new SqlCommand("update tblEmployeeLastLogin set lastlogintime = '" + time.Trim() + "', currentlogintime='" + null + "' where username= '" + Session["Uname"].ToString() + "'", conn);
            conn.Open();
            cmdstrngupdate.ExecuteNonQuery();


        }
        catch (Exception)
        {
        }

        finally
        {
            conn.Close();
        }
    }
}