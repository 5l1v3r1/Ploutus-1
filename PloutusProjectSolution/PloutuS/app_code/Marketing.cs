using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class Marketing
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
	public Marketing()
	{
		
	}

    public void UpdateLogout(string MarSessionID, string EmailID)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@MarSessionID", SqlDbType.VarChar, 50);
        param[0].Value = MarSessionID;
        param[1] = new SqlParameter("@EmailID", SqlDbType.VarChar, 50);
        param[1].Value = EmailID;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateLogoutMarketing", param);
    }
    

    public DataSet GetMarketingEmailID()
    {
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMarketingEmailIDList");
    }



    public DataSet GetLogsList(string emailID, string fromdate, string toDate)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@EmailID", SqlDbType.VarChar, 50);
        param[0].Value =emailID ;
        param[1] = new SqlParameter("@StartDate", SqlDbType.DateTime);
        param[1].Value = fromdate;
        param[2] = new SqlParameter("@ToDate", SqlDbType.DateTime);
        param[2].Value = toDate;
       return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetLogsForMarketing", param);
    }
}