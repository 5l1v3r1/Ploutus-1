using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class InnerMaster : System.Web.UI.MasterPage
{
    string name;
    string cmdstrngdata;
    string time;
    DataSet ds = new DataSet();
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    string constrng = ConfigurationManager.AppSettings["connstrng"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //if (Session["PSJUID"] != null)
            //{
            //    name = Session["PSJUID"].ToString();
            //    SqlConnection conn = new SqlConnection(constrng);
            //    cmd = new SqlCommand("spsJSLogininf", conn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = name;
            //    conn.Open();
            //    ds = new DataSet();
            //    da = new SqlDataAdapter();
            //    da.SelectCommand = cmd;
            //    da.Fill(ds); 
            //    lblUsername.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
            //    lblLastLoginTime.Text = ds.Tables[2].Rows[0]["LoginTime"].ToString();
            //    lblLogintime.Text = ds.Tables[1].Rows[0]["IntialLogin"].ToString();
            //}
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
       // getValues();
       // updateLastLogin();
        Session.Abandon();
        Response.Redirect("~/JobSeekerLogin.aspx");
    }
    protected void getValues()
    {
        cmdstrngdata = "select currentlogintime from tblMemLastLogin where username= '" + Session["PSJUID"].ToString() + "'";

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
            SqlCommand cmdstrngupdate = new SqlCommand("update tblMemLastLogin set lastlogintime = '" + time.Trim() + "', currentlogintime='" + null + "' where username= '" + Session["Uname"].ToString() + "'", conn);
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
