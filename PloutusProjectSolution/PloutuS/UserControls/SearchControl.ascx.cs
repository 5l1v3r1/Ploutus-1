using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class UserControls_SearchControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // string str = "Data Source=192.168.100.210;user id=sa;password=Connect@123;Initial Catalog=jobportal";
        //Label6.Visible = false;
        
        //SqlConnection con1 = new SqlConnection(str);
        //con1.Open();
        //SqlCommand cmd1 = new SqlCommand("select loc from tbljobdet", con1);
        //cmd1.Parameters.Add(new SqlParameter("@loc", SqlDbType.VarChar, 30));
       
       
        //    SqlDataReader dr = cmd1.ExecuteReader();
        //    DropDownList1.SelectedItem.Value = dr[0].ToString();
        //DataSet ds;
        //SqlDataAdapter daFill;
        //string connection = "Data Source=192.168.100.210;user id=sa;password=Connect@123;Initial Catalog=jobportal";
        //SqlConnection con;
        //string Query = "select loc from tbljobdet";
        //con = new SqlConnection(connection);
        //daFill = new SqlDataAdapter(Query, con);
        //ds = new DataSet();
        //daFill.Fill(ds);


        

        //DropDownList1.DataSource = ds;
        //DropDownList1.DataValueField = "loc";
        //DropDownList1.DataTextField = "loc";
        //DropDownList1.DataBind();


        //dljobdet.DataBind();       
        //    if (dr.Read())
        //    {
        //        username = dr[0].ToString();

        //    }
        //    if (username1 == username)
        //    {
        //        Label18.Text = "Login Not Available";

        //    }
        //    else
        //    {
        //        Label18.Text = "Login Available";
        //        panel1.Visible = true;
        //        Button2.Visible = false;
        //    }
        //}
        //catch (SqlException pt)
        //{
        //    Label18.Text = pt.Message;
        //}
        //catch (NullReferenceException npt)
        //{
        //    Label18.Text = npt.Message;
        //}


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((TextBox2.Text == ""))
        {
            //Label6.Text = "Please select Jobtitle or Location";
           // Label6.Visible = true;
        }
        else
        {
           // Response.Redirect("Desiredsearch.aspx?value1=" + TextBox2.Text + "&value2=" + DropDownList1.SelectedValue);
        }
    }
}
