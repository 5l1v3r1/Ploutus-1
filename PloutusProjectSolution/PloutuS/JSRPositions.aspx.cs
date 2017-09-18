using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSEducation : System.Web.UI.Page
{
    JobSeeker js = new JobSeeker();
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["eid"] = "satya.pulavarty@pi-international.net";
        if (Session["eid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                DataSet ds = js.GetFullDetails(Session["eid"].ToString());
                ViewState["MemID"] = ds.Tables[0].Rows[0]["MemID"].ToString();
              

                try
                {
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        Repeater1.DataSource = ds.Tables[1];
                        Repeater1.DataBind();
                    }
                    else
                    {
                        CreateTableForPositions();
                    }
                   
                    //txtCompanyName.Text = ds.Tables[1].Rows[0]["Company"].ToString();
                    //txtEmpStartDt.Text = ds.Tables[1].Rows[0]["EmploymentStrtDt1"].ToString();
                    //txtEmpEndDt.Text = ds.Tables[1].Rows[0]["EmploymentEndDt1"].ToString();
                    //txtSupName.Text = ds.Tables[1].Rows[0]["Supervisor"].ToString();
                    //txtPosition.Text = ds.Tables[1].Rows[0]["Position"].ToString();
                    //txtAdd.Text = ds.Tables[1].Rows[0]["Address"].ToString();
                    //txtDuties.Text = ds.Tables[1].Rows[0]["Duties"].ToString();
                    //txtReasonLeaving.Text = ds.Tables[1].Rows[0]["LeavingReason"].ToString();
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    private void CreateTableForPositions()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        //Create DataTable columns
        dt.Columns.Add(new DataColumn("CompanyName", typeof(string)));
        dt.Columns.Add(new DataColumn("EmpStartDt", typeof(string)));
        dt.Columns.Add(new DataColumn("EmpEndDt", typeof(string)));
        dt.Columns.Add(new DataColumn("SupName", typeof(string)));
        dt.Columns.Add(new DataColumn("Position", typeof(string)));
        dt.Columns.Add(new DataColumn("Address", typeof(string)));
        dt.Columns.Add(new DataColumn("Duties", typeof(string)));
        dt.Columns.Add(new DataColumn("ReasonLeaving", typeof(string)));
        for (int i = 0; i < 1; i++)
        {
            //Create Row for each columns
            dr = dt.NewRow();
            dr["CompanyName"] = string.Empty;
            dr["EmpStartDt"] = string.Empty;
            dr["EmpEndDt"] = string.Empty;
            dr["SupName"] = string.Empty;
            dr["Position"] = string.Empty;
            dr["Address"] = string.Empty;
            dr["Duties"] = string.Empty;
            dr["ReasonLeaving"] = string.Empty;
            dt.Rows.Add(dr);

        }
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        Repeater1.Visible = true;
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        DeleteData();
        SaveData();       
        Response.Redirect("JSRPositionRef.aspx", false);
    }

    private void DeleteData()
    {
        js.DeletePositions(Session["eid"].ToString());
    }

    private void SaveData()
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
           
                //getting the values of user entered fields

            string CompanyName = ((TextBox)item.FindControl("txtCompanyName")).Text;
            DateTime EmpStartDt = Convert.ToDateTime(((TextBox)item.FindControl("txtEmpStartDt")).Text);
            DateTime EmpEndDt = Convert.ToDateTime(((TextBox)item.FindControl("txtEmpEndDt")).Text);
            string SupName = ((TextBox)item.FindControl("txtSupName")).Text;
            string Position = ((TextBox)item.FindControl("txtPosition")).Text;
            string Add = ((TextBox)item.FindControl("txtAdd")).Text;
            string Duties = ((TextBox)item.FindControl("txtDuties")).Text;
            string ReasonLeaving = ((TextBox)item.FindControl("txtReasonLeaving")).Text;
             DataSet ds = js.InsertPositions(CompanyName, EmpStartDt, EmpEndDt, SupName, Position, Add, Duties, ReasonLeaving, Session["eid"].ToString(), ViewState["MemID"].ToString());

        }

        //string CompanyName = txtCompanyName.Text;
        //DateTime EmpStartDt = Convert.ToDateTime(txtEmpStartDt.Text);
        //DateTime EmpEndDt = Convert.ToDateTime(txtEmpEndDt.Text);
        //string SupName = txtSupName.Text;
        //string Position = txtPosition.Text;
        //string Add = txtAdd.Text;
        //string Duties = txtDuties.Text;
        //string ReasonLeaving = txtReasonLeaving.Text;
        //DataSet ds = js.InsertPositions(CompanyName, EmpStartDt, EmpEndDt, SupName, Position, Add, Duties, ReasonLeaving, Session["eid"].ToString(), ViewState["MemID"].ToString());
        
    }

   
    protected void btnSaveLater_Click(object sender, EventArgs e)
    {
        DeleteData();
        SaveData();      
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Information saved successfully')", true);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("JSREducation.aspx", false);
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "AddRows")
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            //Create DataTable columns
            dt.Columns.Add(new DataColumn("CompanyName", typeof(string)));
            dt.Columns.Add(new DataColumn("EmpStartDt", typeof(string)));
            dt.Columns.Add(new DataColumn("EmpEndDt", typeof(string)));
            dt.Columns.Add(new DataColumn("SupName", typeof(string)));
            dt.Columns.Add(new DataColumn("Position", typeof(string)));
            dt.Columns.Add(new DataColumn("Address", typeof(string)));
            dt.Columns.Add(new DataColumn("Duties", typeof(string)));
            dt.Columns.Add(new DataColumn("ReasonLeaving", typeof(string)));
          
            foreach (RepeaterItem item in Repeater1.Items)
            {
                //getting the values of user entered fields
                dr = dt.NewRow();
                dr["CompanyName"] = ((TextBox)item.FindControl("txtCompanyName")).Text;
                dr["EmpStartDt"] = ((TextBox)item.FindControl("txtEmpStartDt")).Text;
                dr["EmpEndDt"] = ((TextBox)item.FindControl("txtEmpEndDt")).Text;
                dr["SupName"] = ((TextBox)item.FindControl("txtSupName")).Text;
                dr["Position"] = ((TextBox)item.FindControl("txtPosition")).Text;
                dr["Address"] = ((TextBox)item.FindControl("txtAdd")).Text;
                dr["Duties"] = ((TextBox)item.FindControl("txtDuties")).Text;
                dr["ReasonLeaving"] = ((TextBox)item.FindControl("txtReasonLeaving")).Text;

                dt.Rows.Add(dr);
            }
            for (int i = 0; i < 1; i++)
            {
                //Create Row for each columns
                dr = dt.NewRow();
                dr["CompanyName"] = string.Empty;
                dr["EmpStartDt"] = string.Empty;
                dr["EmpEndDt"] = string.Empty;
                dr["SupName"] = string.Empty;
                dr["Position"] = string.Empty;
                dr["Address"] = string.Empty;
                dr["Duties"] = string.Empty;
                dr["ReasonLeaving"] = string.Empty;
               

                dt.Rows.Add(dr);
            }


            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }




    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {       
       
        if (e.Item.ItemType == ListItemType.Footer)
        {          

                Button btnAddRows = new Button();
                btnAddRows = (Button)e.Item.FindControl("btnAddPosition");
                btnAddRows.Enabled = true;
            
        }
    }
}