using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BA_Ploutos;
using System.Data;
using System.Data.SqlClient;
using Encrypt;
public partial class Marketing_MarketingEdit : System.Web.UI.Page
{
    public int Size;
    BA_Marketingactivities bamarkact = new BA_Marketingactivities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["PSMEID"].ToString() != "" && Session["PSMEName"].ToString() != "")
                {
                    fillIndustrieslist();
                    EncryptDecrypt ency = new EncryptDecrypt();

                    ViewState["jsid"] = Request.QueryString["id"].ToString();
                    DataSet ds = new DataSet();
                    ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
                    txtFName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                    txtMName.Text = ds.Tables[0].Rows[0]["middlename"].ToString();
                    txtLName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                    txtMobileNumber.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    txtCellNumber.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                    txtHomeNumber.Text = ds.Tables[0].Rows[0]["HomeNum"].ToString();
                    BindRepeater();
                    string exp = ds.Tables[0].Rows[0]["totalexp"].ToString();
                    if (exp == "Fresher")
                    {
                        ddlYearsExp.SelectedValue = "0";
                        ddlMonthsExp.SelectedValue = "0";
                    }
                    else
                    {
                        string[] words = exp.Split('.');
                        string[] month = words[1].Split(' ');
                        ddlYearsExp.SelectedValue = words[0];
                        ddlMonthsExp.SelectedValue = month[0];
                    }
                    ddlIndustries1.SelectedValue = ds.Tables[0].Rows[0]["Industry"].ToString();
                    ddlIndustries2.SelectedValue = ds.Tables[0].Rows[0]["Industry2"].ToString();
                    ddlIndustry3.SelectedValue = ds.Tables[0].Rows[0]["Industry3"].ToString();
                    ddlState.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
                    ddlState_SelectedIndexChanged(null, null);
                    ddlcity.SelectedValue = ds.Tables[0].Rows[0]["city"].ToString();
                    txtAddress.Text = ds.Tables[0].Rows[0]["addressline1"].ToString();
                }
                else
                {
                    Response.Redirect("~/MarketingLogin.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/MarketingLogin.aspx", false);
            }
            // check if postback came through AjaxFileUpload control


        }
    }
    private void fillIndustrieslist()
    {
        BA_Marketing mar = new BA_Marketing();
        DataSet ds = new DataSet();
        ds = mar.fillcategory();
        ddlIndustries1.DataSource = ds.Tables[0];
        ddlIndustries1.DataTextField = "indusname";
        ddlIndustries1.DataValueField = "indusname";
        ddlIndustries1.DataBind();
        ddlIndustries1.Items.Insert(0, new ListItem("Select", "Select"));

        ddlIndustries2.DataSource = ds.Tables[0];
        ddlIndustries2.DataTextField = "indusname";
        ddlIndustries2.DataValueField = "indusname";
        ddlIndustries2.DataBind();
        ddlIndustries2.Items.Insert(0, new ListItem("Select", "Select"));

        ddlIndustry3.DataSource = ds.Tables[0];
        ddlIndustry3.DataTextField = "indusname";
        ddlIndustry3.DataValueField = "indusname";
        ddlIndustry3.DataBind();
        ddlIndustry3.Items.Insert(0, new ListItem("Select", "Select"));

        ddlState.DataSource = ds.Tables[1];
        ddlState.DataTextField = "State";
        ddlState.DataValueField = "State";
        ddlState.DataBind();

        ddlState.Items.Insert(0, new ListItem("Select", "Select"));
        ddlcity.Items.Insert(0, new ListItem("Select", "Select"));
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string Yexp;
            string Mexp;

            if (ddlYearsExp.SelectedIndex == 0)
            {
                Yexp = "0";

            }
            else
            {
                Yexp = ddlYearsExp.SelectedValue.ToString();

            }
            if (ddlMonthsExp.SelectedIndex == 0)
            {
                Mexp = "0";
            }
            else
            {
                Mexp = ddlMonthsExp.SelectedValue.ToString();
            }
            string exp = Yexp + '.' + Mexp;
            string emailid = string.Empty;
            foreach (RepeaterItem item in repeater1.Items)
            {
                if (((TextBox)item.FindControl("txtEmail")).Text != "")
                {
                    //getting the values of user entered fields
                    emailid = emailid + ((TextBox)item.FindControl("txtEmail")).Text + ",";
                }
            }
            emailid = emailid.Remove(emailid.Length - 1);
            string ind2;
            if (ddlIndustries2.SelectedValue == "--Select--" || ddlIndustries2.SelectedValue == "")
            {
                ind2 = "";
            }
            else
            {
                ind2 = ddlIndustries2.SelectedItem.ToString();
            }
            string ind3;
            if (ddlIndustry3.SelectedValue == "--Select--" || ddlIndustry3.SelectedValue == "")
            {
                ind3 = "";
            }
            else
            {
                ind3 = ddlIndustry3.SelectedItem.ToString();
            }

            BA_Marketingactivities bamarkact = new BA_Marketingactivities();
           // bamarkact.UpdatemarletJobseekerAlready(ViewState["jsid"].ToString(), txtFName.Text, txtLName.Text, txtMName.Text, txtMobileNumber.Text,
          //  txtCellNumber.Text, txtHomeNumber.Text, emailid, exp, ddlIndustries1.SelectedValue,ddlIndustries2.SelectedValue,ddlIndustry3.SelectedValue, ddlState.SelectedValue, ddlcity.SelectedValue, txtAddress.Text);
            EncryptDecrypt ency = new EncryptDecrypt();
            string enc = ency.EncryptDecryptString("£", ViewState["jsid"].ToString());
            Response.Redirect("ListofUsersAlready.aspx?id=" + enc, false);
            lblsucess.Text = "Updated Sucessfully";
        }
        catch (Exception ex)
        {
            lblsucess.Text = ex.Message;
        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BA_Search daserch = new BA_Search();
        DataSet ds = new DataSet();
        ds = daserch.getCity(ddlState.SelectedValue);
        ddlcity.DataSource = ds;
        ddlcity.DataTextField = "City";
        ddlcity.DataValueField = "City";
        ddlcity.DataBind();
        ddlcity.Items.Insert(0, new ListItem("Select", "Select"));
    }
    protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddRows")
        {
            Size = repeater1.Items.Count;
            if (Size == 5)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Cannot Add More than 5 emails')", true);
            }
            else
            {
                DataTable dt = new DataTable();
                DataRow dr = null;
                //Create DataTable columns
                dt.Columns.Add(new DataColumn("email", typeof(string)));

                foreach (RepeaterItem item in repeater1.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["email"] = ((TextBox)item.FindControl("txtEmail")).Text;
                    dt.Rows.Add(dr);
                }
                //Create Row for each columns
                dr = dt.NewRow();
                dr["email"] = string.Empty;
                dt.Rows.Add(dr);
                repeater1.DataSource = dt;
                repeater1.DataBind();
            }
        }

        else if (e.CommandName == "DeleteRows")
        {
            Size = repeater1.Items.Count;
            if (Size == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Should Enter Atleast one Email')", true);
            }
            else
            {
                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("email", typeof(string)));
                foreach (RepeaterItem item in repeater1.Items)
                {
                    //getting the values of user entered fields
                    dr = dt.NewRow();
                    dr["email"] = ((TextBox)item.FindControl("txtEmail")).Text;

                    dt.Rows.Add(dr);
                }
                RepeaterItem item1 = e.Item;
                dt.Rows[item1.ItemIndex].Delete();
                dt.AcceptChanges();
                repeater1.DataSource = dt;
                repeater1.DataBind();

            }
        }
    }
    public void BindRepeater()
    {
        DataSet ds = new DataSet();
        ds = bamarkact.GetmarketingMemdetailsAlready(ViewState["jsid"].ToString());
        //if email1 field is empty then bind email else bind email1
        string email1 = ds.Tables[0].Rows[0]["Email1"].ToString();
        if (email1 == "" || email1 == null)
        {
            string[] emailid = ds.Tables[0].Rows[0]["email"].ToString().Split(',');
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("email", typeof(string)));
            for (int i = 0; i < emailid.Count(); i++)
            {
                dr = dt.NewRow();
                dr["email"] = emailid[i];
                dt.Rows.Add(dr);
            }
            repeater1.DataSource = dt;
            repeater1.DataBind();
        }
        else
        {
            string[] emailid = ds.Tables[0].Rows[0]["Email1"].ToString().Split(',');
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("email", typeof(string)));
            for (int i = 0; i < emailid.Count(); i++)
            {
                dr = dt.NewRow();
                dr["email"] = emailid[i];
                dt.Rows.Add(dr);
            }
            repeater1.DataSource = dt;
            repeater1.DataBind();
        }
    }
    protected void repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    protected void repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
    {

    }
}