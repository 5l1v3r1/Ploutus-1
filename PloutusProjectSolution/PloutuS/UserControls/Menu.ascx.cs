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



public partial class menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DrawMenu()
    {

        DataSet ds = new DataSet();
        if (Convert.ToInt32(Session["role"]) == 4)
            ds.ReadXml(Server.MapPath("XMLMenus/OuterAgent.xml"));
        else if (Convert.ToInt32(Session["role"]) == 5)
            ds.ReadXml(Server.MapPath("XMLMenus/Outerqa.xml"));
        else if (Convert.ToInt32(Session["role"]) == 3)
            ds.ReadXml(Server.MapPath("XMLMenus/OuterTeamLead.xml"));
        else if (Convert.ToInt32(Session["role"]) == 2)
            ds.ReadXml(Server.MapPath("XMLMenus/OuterManager.xml"));
        else if (Convert.ToInt32(Session["role"]) == 1)
            ds.ReadXml(Server.MapPath("XMLMenus/OuterAdmin.xml"));
      

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

                Response.Write(@"<li><a href='" + dtm.Rows[i]["url"].ToString() + "' target='_self'>" + dtm.Rows[i]["text"].ToString() + "</a>");
                Response.Write(@"<ul>");
                DataView dv = new DataView(dtm);
                dv.RowFilter = "submenu_id='" + k1 + "'"; // query example = "id = 10"
                DataTable dt1 = new DataTable();
                dt1 = dv.ToTable();
                k1++;
                for (int k = 0; k < dv.Count; k++)
                {
                    i++;
                    Response.Write("<li><a href='" + dt1.Rows[k]["url"] + "' target='_self'>" + dt1.Rows[k]["text"].ToString() + "</a></li>");
                }

                Response.Write(@"</ul></li>");


            }
        }

    }
}
