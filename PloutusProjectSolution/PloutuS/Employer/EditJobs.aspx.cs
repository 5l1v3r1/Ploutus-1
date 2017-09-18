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

public partial class Employer_EditJobs : System.Web.UI.Page
{
    string PSEJobId;
    DataSet dsload = new DataSet();
    DataSet ds,ds1;
    SqlDataAdapter da2;
    SqlDataAdapter daload;
    SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        PSEJobId = Session["PSEJobId"].ToString();
        if (!Page.IsPostBack)
        {
            //code for selecting industry 
            BA_postjobs pst2 = new BA_postjobs();
            DataSet dsindustries = new DataSet(); ;
            dsindustries = pst2.getindustries();
            ddIndustry.DataSource = dsindustries;
            ddIndustry.DataTextField = "IndusName";
            ddIndustry.DataValueField = "ID";
            ddIndustry.DataBind();
            ddIndustry.Items.Insert(0, new ListItem("--Select--", "--Select--"));

            //code for  selecting experience fro &to
            ddlmin.Items.Insert(0, new ListItem("Min", "Min"));
            ddlmax.Items.Insert(0, new ListItem("Max", "Max"));
            for (int i = 0; i <= 10; i++)
            {
                ddlmax.Items.Add(i.ToString());
                ddlmin.Items.Add(i.ToString());
            }

            //code for selecting location
            DataSet dslocations = new DataSet(); ;
            dslocations = pst2.getLocations();
            ddlLocation.DataSource = dslocations;
            ddlLocation.DataTextField = "PreLoc";
            ddlLocation.DataValueField = "PreLoc";
            ddlLocation.DataBind();
            ddlLocation.Items.Insert(0, new ListItem("--Select--", "--Select--"));

            //code for jobtype
            ddlJobType.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlJobType.Items.Add("Permanent");
            ddlJobType.Items.Add("Contract");
            //BindRepeater();
                

            //Functionl Area
            DataSet dt = new DataSet();
            SqlCommand cmd1 = new SqlCommand("select ID,FuncArea from tblFunctionalArea where IndusID='" + dsindustries.Tables[0].Rows[0]["ID"].ToString() + "'", con);
            SqlDataAdapter da3 = new SqlDataAdapter(cmd1);
            con.Open();
            cmd1.ExecuteNonQuery();
            ds1 = new DataSet();
            da3.Fill(ds1);
            con.Close();
            ddlFunctionalArea.DataSource = ds1.Tables[0];
            ddlFunctionalArea.DataTextField = "FuncArea";
            ddlFunctionalArea.DataValueField = "id";
            ddlFunctionalArea.DataBind();
            ddlFunctionalArea.Items.Insert(0, new ListItem("--Select--", "--Select--"));

            if (Session["PSEJobId"] != null)
            {
                
                
                dsload.Tables.Add("tblJobPosting");
                daload = new SqlDataAdapter("select * from tblJobPosting where id='" + Session["PSEJobId"].ToString() + "'", con);
                daload.Fill(dsload.Tables["tblJobPosting"]);
                daload.Dispose();
                
            }
            if (Session["PSEJobId"] != null)
            {
                if (dsload.Tables[0].Rows.Count > 0)
                {
                    txtJobTitle.Text = dsload.Tables[0].Rows[0]["JobTitle"].ToString();
                    txtJobDesc.Text = dsload.Tables[0].Rows[0]["JobDescription"].ToString();
                    DataSet dt1 = new DataSet();
                    string quer = "select ID from tblIndustries where IndusName='" + dsload.Tables[0].Rows[0]["Industry"].ToString() + "'";
                    SqlDataAdapter da1 = new SqlDataAdapter("select ID from tblIndustries where IndusName='" + dsload.Tables[0].Rows[0]["Industry"].ToString() + "'", con);
                    da1.Fill(dt1);
                    ddIndustry.SelectedValue = dt1.Tables[0].Rows[0]["ID"].ToString();
                    ds = new DataSet();
                    string quer1 = "select ID from tblFunctionalArea where FuncArea='" + dsload.Tables[0].Rows[0]["FunctionalArea"].ToString() + "'";
                    da2 = new SqlDataAdapter("select ID from tblFunctionalArea where FuncArea='" + dsload.Tables[0].Rows[0]["FunctionalArea"].ToString() + "'", con);
                    da2.Fill(ds);


                    if (ds.Tables[0].Rows[0]["id"].ToString() == "" || ds.Tables[0].Rows[0]["id"].ToString() == null)
                    {
                        ddlFunctionalArea.SelectedIndex = 0;
                        //ddlFunctionalArea.SelectedItem == "--Select--";
                    }
                        else
                        {
                            ddlFunctionalArea.SelectedValue = ds.Tables[0].Rows[0]["id"].ToString();
                        }

                    ddlmin.SelectedValue = dsload.Tables[0].Rows[0]["ExpFrom"].ToString();
                    ddlmax.SelectedValue = dsload.Tables[0].Rows[0]["ExpTo"].ToString();
                    txtRate.Text=dsload.Tables[0].Rows[0]["Rate"].ToString();
                    ddlLocation.SelectedValue = dsload.Tables[0].Rows[0]["Location"].ToString();
                    ddlJobType.SelectedValue = dsload.Tables[0].Rows[0]["JobType"].ToString();
                    txtVacancy.Text = dsload.Tables[0].Rows[0]["Vacancies"].ToString();
                    //repeater1.DataSource = dsload.Tables[0].Rows[0]["Responsibilities"].ToString();
                    //repeater1.DataBind();
                    txtSkills.Text = dsload.Tables[0].Rows[0]["Skills"].ToString();
                   
                  
                }

            }
            
        }
    }


    protected void btPost_Click(object sender, EventArgs e)
    {

    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employer/EmployerHomePage.aspx");
    }
    protected void ddIndustry_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select ID,FuncArea from tblFunctionalArea where IndusID='" + ddIndustry.SelectedValue.ToString() + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        cmd.ExecuteNonQuery();
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        ddlFunctionalArea.DataSource = ds.Tables[0];
        ddlFunctionalArea.DataTextField = "FuncArea";
        ddlFunctionalArea.DataBind();
        ddlFunctionalArea.Items.Insert(0, new ListItem("--------Select-----------", "--------Select-----------"));
    }
    //public void BindRepeater()
    //{
    //    DataTable dt = new DataTable();
    //    DataRow dr = null;
    //    //Create DataTable columns
    //    dt.Columns.Add(new DataColumn("skill", typeof(string)));


    //    //Create Row for each columns
    //    dr = dt.NewRow();
    //    dr["skill"] = string.Empty;
    //    dt.Rows.Add(dr);
    //    repeater1.DataSource = dt;
    //    repeater1.DataBind();
    //}
    //protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    if (e.CommandName == "AddRows")
    //    {
    //        DataTable dt = new DataTable();
    //        DataRow dr = null;
    //        //Create DataTable columns
    //        dt.Columns.Add(new DataColumn("skill", typeof(string)));

    //        foreach (RepeaterItem item in repeater1.Items)
    //        {
    //            //getting the values of user entered fields
    //            dr = dt.NewRow();
    //            dr["skill"] = ((TextBox)item.FindControl("txtJobRes")).Text;

    //            dt.Rows.Add(dr);
    //        }

    //            //Create Row for each columns
    //            dr = dt.NewRow();
    //            dr["skill"] = string.Empty;                
    //            dt.Rows.Add(dr);



    //        repeater1.DataSource = dt;
    //        repeater1.DataBind();
    //    }

    //    else if (e.CommandName == "DeleteRows")
    //    {
    //        DataTable dt = new DataTable();
    //        DataRow dr = null;
    //        dt.Columns.Add(new DataColumn("skill", typeof(string)));
    //        foreach (RepeaterItem item in repeater1.Items)
    //        {
    //            //getting the values of user entered fields
    //            dr = dt.NewRow();
    //            dr["skill"] = ((TextBox)item.FindControl("txtJobRes")).Text;

    //            dt.Rows.Add(dr);
    //        }
    //        RepeaterItem item1 = e.Item;

    //        dt.Rows[item1.ItemIndex].Delete();
    //        dt.AcceptChanges();

    //        //rebind the Repeater with the updated DataTable
    //        repeater1.DataSource = dt;
    //        repeater1.DataBind();
    //    }
    //}
    protected void btUpdate_Click(object sender, EventArgs e)
    {
        dsload.Tables.Add("tblJobPosting");
        daload = new SqlDataAdapter("select * from tblJobPosting where id='" + Session["PSEJobId"].ToString() + "'", con);
        daload.Fill(dsload.Tables["tblJobPosting"]);
        daload.Dispose();
        int max = Convert.ToInt16(ddlmax.SelectedValue);
        int min = Convert.ToInt16(ddlmin.SelectedValue);
        if (max < min)
        {
            lblError.Visible = true;
            lblError.Text = "Max experience should be greater than Min experience";
            lblError.Focus();
        }
        else
        {
            try
            {
                BE_Employer beemp = new BE_Employer();
                BA_EditJobs baedit = new BA_EditJobs();
                beemp.JobID = PSEJobId;
                beemp.JobTitle= txtJobTitle.Text;
                beemp.Jobtype = txtJobDesc.Text;
                beemp.Industry = ddIndustry.SelectedItem.ToString();
                beemp.Functionalarea = ddlFunctionalArea.SelectedItem.ToString();
                beemp.Expmin = ddlmin.SelectedItem.ToString();
                beemp.Expmax = ddlmax.SelectedItem.ToString();
                //beemp.Dollor= ddldolor.SelectedItem.ToString();
                //beemp.Rate = txtRate.Text + dollor;
                beemp.Rate = txtRate.Text;
                beemp.Location= ddlLocation.SelectedItem.ToString();
                beemp.Jobtype = ddlJobType.SelectedItem.ToString();
                beemp.Vacancies = Convert.ToInt16(txtVacancy.Text);
                //string Responsibilities = "<ul>";
                //foreach (RepeaterItem item in repeater1.Items)
                //{
                //    if (((TextBox)item.FindControl("txtJobRes")).Text != "")
                //    {
                //        //getting the values of user entered fields

                //        Responsibilities = Responsibilities + "<li>" + ((TextBox)item.FindControl("txtJobRes")).Text + "</li>";

                //    }
                //}
                //Responsibilities = Responsibilities + "</ul>";
               beemp.Skills = txtSkills.Text;
               beemp.Jobpostedby = dsload.Tables[0].Rows[0]["PostedBy"].ToString();
                //string jobposteddate = DateTime.Now.ToString("yyyy-MM-dd");
               beemp.Email = dsload.Tables[0].Rows[0]["EmailID"].ToString();
               beemp.Contactno = dsload.Tables[0].Rows[0]["ContactNumber"].ToString();



                int res=baedit.editjobs(beemp);
               
                lblError.Visible = true;
                if (res == 1)
                {
                    
                    //BindRepeater();
                   Response.Redirect("~/Employer/JobUpdate.aspx");
                }
                else
                    lblError.Text = "not updated";

            }
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = ex.Message.ToString();
            }
        }
    }
}