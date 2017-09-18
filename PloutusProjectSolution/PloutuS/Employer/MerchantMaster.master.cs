using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class MerchantMaster : System.Web.UI.MasterPage
{

    string cmdstrngdata;
    string time;
    DataSet ds = new DataSet();
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    int role;


    protected void Page_Load(object sender, EventArgs e)
    {
        role = Convert.ToInt16(Session["Role"].ToString());
        if (role == 1)
        {
            uc3menu.Visible = true;
            ucSub.Visible = false;
        }
        if (role == 2)
        {
            uc3menu.Visible = false;
            ucSub.Visible = true;
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        //getValues();
        updateLastLogin();
        Session.Abandon();
        Response.Redirect("~/Index.aspx");
    }

    protected void getValues()
    {
        cmdstrngdata = "select currentlogintime from tblMerchantLastLogin where username= '" + Session["PSEName"].ToString() + "'";

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
            string sqlcmd = "update tblMerchantReg set LastLogin = '" + DateTime.Now.ToString() + "' where email= '" + Session["PSEMail"].ToString() + "'";
            SqlCommand cmdstrngupdate = new SqlCommand(sqlcmd, conn);
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
