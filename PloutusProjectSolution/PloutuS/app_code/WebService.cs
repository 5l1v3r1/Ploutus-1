using System;
using System.Collections;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;
using AjaxControlToolkit;
using System.Configuration;
using System.Data;
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    [WebMethod]
    public CascadingDropDownNameValue[] BindCountrydropdown(string knownCategoryValues, string category)
    {
        string conn1 = (ConfigurationManager.AppSettings["connstrng"].ToString());
        //SqlConnection concountry = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
         string query= "select * from [tblStates]";
        SqlDataAdapter dacountry = new SqlDataAdapter(query,conn1);
        DataSet dscountry = new DataSet();
        dacountry.Fill(dscountry);
        
        List<CascadingDropDownNameValue> countrydetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow dtrow in dscountry.Tables[0].Rows)
        {
            string CountryID = dtrow["State_code"].ToString();
            string CountryName = dtrow["State"].ToString();
            countrydetails.Add(new CascadingDropDownNameValue(CountryName, CountryID));
        }
        return countrydetails.ToArray();
    }
    [WebMethod]
    public CascadingDropDownNameValue[] BindStatedropdown(string knownCategoryValues, string category)
    {
        string CountryID;
        StringDictionary countrydetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        CountryID = countrydetails["Country"];
        //SqlConnection constate = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
        string conn1 = (ConfigurationManager.AppSettings["connstrng"].ToString());
      
        string query1=("select * from tblCities where State_code='" + CountryID + "'");
        //cmdstate.Parameters.AddWithValue("@CountryID", CountryID);

        SqlDataAdapter dastate = new SqlDataAdapter(query1,conn1);
        DataSet dsstate = new DataSet();
        dastate.Fill(dsstate);
        List<CascadingDropDownNameValue> statedetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow dtstaterow in dsstate.Tables[0].Rows)
        {
            string stateID = dtstaterow["City"].ToString();
            string statename = dtstaterow["City"].ToString();
            statedetails.Add(new CascadingDropDownNameValue(statename, stateID));
        }
        return statedetails.ToArray();

    }
}
