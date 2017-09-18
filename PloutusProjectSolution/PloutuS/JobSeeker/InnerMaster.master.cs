using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MainMaster : System.Web.UI.MasterPage
{
    public string ErrorMessage
    {
        get
        {
            return lblTitle.Text;
        }
        set
        {
            lblTitle.Text = value;
        }
    }
    public string user
    {
        get
        {
            return lblagentnameshow.Text;
        }
        set
        {
            lblagentnameshow.Text = value;
        }
    }
    public string time
    {
        get
        {
            return lbllogintimeshow.Text;
        }
        set
        {
            lbllogintimeshow.Text = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            // lblTitle.Text = this.lblTitle.ToString();
            lblagentnameshow.Text =  Session["username"].ToString();
            lbllogintimeshow.Text = Session["LoginTime"].ToString();
            Response.AppendHeader("Pragma", "no-cache");
            Response.AppendHeader("Cache-Control", "no-cache");

            Response.CacheControl = "no-cache";
            Response.Expires = -1;

            Response.ExpiresAbsolute = new DateTime(1900, 1, 1);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetNoStore();
            if (!Page.IsPostBack)
            {


            }

            // HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);


            //if ((Session["uid"] == null) || (Session["UserId"] == null))
            //{
            //    Response.Redirect("login.aspx");
            //}
            // lblRole.Text = Session["roledesc"].ToString();
            //  lblUserid.Text = Session["uname"].ToString();
            int a = int.Parse(DateTime.Now.Hour.ToString());
            //string b=DateTime.Now.Minute.ToString();
            if (a >= 0 && a <= 12)
            {
                // Label1.Text = "Good Morning "; return;
            }
            else
            {
                if (a > 12 && a < 15)
                {
                    //  Label1.Text = "Good Afternoon "; return;
                }
                else
                {
                    if (a > 15 && a <= 24)
                    {
                        // Label1.Text = "Good Evening "; return;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/JobSeekerLogin.aspx", false);
        }

    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        
        Session.Abandon();
        Response.Redirect("~/JobSeekerLogin.aspx");
    }
    
}
