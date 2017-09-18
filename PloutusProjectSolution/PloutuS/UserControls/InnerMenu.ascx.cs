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
using System.Xml;



public partial class InnerMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       try
       {

       }
        catch(Exception ex)
       {
           Response.Redirect("../Marketing/Logout.aspx");
        }

    }

    protected void DrawMenu()
    {
        try
        {
            DataSet ds = new DataSet();

            if (Convert.ToInt32(Session["PSLogin"].ToString()) == 1)
            {
                ds.ReadXml(Server.MapPath("~/XMLMenus/Innermarketing.xml"));
            }
            else
            {
                ds.ReadXml(Server.MapPath("~/XMLMenus/InnermarketingAdmin.xml"));
            }


            DataTable dtm = ds.Tables[0];
            int k1 = 0;
            for (int i = 0; i < dtm.Rows.Count; i++)
            {
                if (dtm.Rows[i]["url"].ToString().Trim() != "")
                {
                    Response.Write(@"<li><a href='" + dtm.Rows[i]["url"].ToString() + "' target='_self'>" + dtm.Rows[i]["text"].ToString() + "</a></li>");

                }
                else
                {
                    DataView dv = new DataView(dtm);
                    dv.RowFilter = "submenu_id='" + k1 + "'"; // query example = "id = 10"
                    DataTable dt1 = new DataTable();
                    dt1 = dv.ToTable();
                    k1++;
                    if (dv.Count > 0)
                    {

                        Response.Write(@"<li><a href='#' target='_self'>" + dtm.Rows[i]["text"].ToString() + "</a>");
                        Response.Write(@"<ul>");
                        for (int k = 0; k < dv.Count; k++)
                        {
                            i++;
                            Response.Write("<li><a href='" + dt1.Rows[k]["url"] + "' target='_self'>" + dt1.Rows[k]["text"].ToString() + "</a></li>");
                        }
                    }
                    else
                    {
                        Response.Write(@"<li><a href='" + dtm.Rows[i]["url"].ToString() + "' target='_self'>" + dtm.Rows[i]["text"].ToString() + "</a>");
                        Response.Write(@"<ul>");
                    }
                    Response.Write(@"</ul></li>");

                }
            }

        }
        catch(Exception ex)
        {
            Response.Redirect("../Marketing/Logout.aspx");
        }
      
          
        }
    }
