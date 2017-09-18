using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using BE_Ploutos;

namespace DA_Ploutos
{
    class DA_Employee
    {

    }
    public class DA_EmpLoginByEmailid
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getemploginbyemailid(string emailid, string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@emailid", SqlDbType.NVarChar, 100);
            param[0].Value = emailid;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            param[1].Value = password;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsEmpLogin", param);
        }
        public DataSet getloginforActivation(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsEmpLogin1", param);
        }
        public void ActivateComp(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsActivateComp]", param);
        }
    }
    public class DA_JobCategories
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getjobcategories()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobcategories]");
        }
        public DataSet Getjobcategories(string CatLoc, string Type)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@CatLoc", SqlDbType.NVarChar, 100);
            param[0].Value = CatLoc;
            param[1] = new SqlParameter("@Type", SqlDbType.Int);
            param[1].Value = Type;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjobsubcatloc", param);
        }
    }
    public class DA_JobSeeker
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet GetJobseekersByCategory(string type)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Type", SqlDbType.Int);
            param[0].Value = type;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetJobSeekers", param);
        }

        public DataSet GetJobseekers(string Category)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Category", SqlDbType.VarChar, 100);
            param[0].Value = Category;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetJobSeekersAll", param);
        }

        public DataSet GetSingleMemDetails(string Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.VarChar, 100);
            param[0].Value = Id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMemDetails", param);
        }

        public DataSet GetUnselectJobseekers(string Category, string exp, string title)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Category", SqlDbType.VarChar, 100);
            param[0].Value = Category;
            param[1] = new SqlParameter("@exp", SqlDbType.VarChar, 50);
            param[1].Value = exp;
            param[2] = new SqlParameter("@title", SqlDbType.VarChar, 100);
            param[2].Value = title;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetUnselectJS", param);
        }
    }
    public class DA_Meractivation
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet GetSingleMemDetails(string Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.VarChar, 100);
            param[0].Value = Id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMerchantListstatus1", param);
        }
        public DataSet GetMerchantsListstatus()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMerchantListstatus");
        }
    }
    public class DA_Merchants
    {
        string con = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet GetPostingJobs()
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetPostedJobs");
        }
        public DataSet GetPostingJobs(string FunAreaLoc, string Type,string Order,string MCat,string mType)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@FunAreaLoc", SqlDbType.NVarChar, 100);
            param[0].Value = FunAreaLoc;
            param[1] = new SqlParameter("@Type", SqlDbType.Int);
            param[1].Value = Type;
            param[2] = new SqlParameter("@Order", SqlDbType.Int);
            param[2].Value = Order;
            param[3] = new SqlParameter("@MCat", SqlDbType.VarChar,200);
            param[3].Value = MCat;
            param[4] = new SqlParameter("@MType", SqlDbType.Int);
            param[4].Value = mType;
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetPostedJobs1", param);
        }
        public DataSet GetSearchMerchantsList(int Type, string Order, string companyname, string location)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@type", SqlDbType.Int);
            param[0].Value = Type;
            param[1] = new SqlParameter("@Order", SqlDbType.Int);
            param[1].Value = Order;
            param[2] = new SqlParameter("@companyname", SqlDbType.NVarChar, 100);
            param[2].Value = companyname;
            param[3] = new SqlParameter("@location", SqlDbType.NVarChar, 100);
            param[3].Value = location;
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sps_getSearchViewClients", param);
        }
        public DataSet GetMerchantsList(int Type,string Order)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@type", SqlDbType.Int);
            param[0].Value = Type;
            param[1] = new SqlParameter("@Order", SqlDbType.Int);
            param[1].Value = Order;

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetMerchantList", param);
        }

        public DataSet GetMerchantDetails(int Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.Int);
            param[0].Value = Id;

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetSMerchantInfo", param);
        }

        public DataSet GetJSMFile(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.VarChar,10);
            param[0].Value = id;

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetJSMFile", param);
        }

        public DataSet GetPostedJobsInfo(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.Int);
            param[0].Value = id;

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "[spsGetPostedJobInfo]", param);
        }





        public DataSet GetRecentPostJobs(string OrderBy, int Type)
        {
            SqlParameter[] param = new SqlParameter[2];
           
            param[0] = new SqlParameter("@Order", SqlDbType.Int);
            param[0].Value = OrderBy;
            param[1] = new SqlParameter("@Type", SqlDbType.Int);
            param[1].Value = Type;

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spsGetRecentPJ", param);
        }
        public void updatestutus(int Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.Int);
            param[0].Value = Id;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spsupdatestatus", param);
        }
        public void updateViaEmail(int Id, string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Id", SqlDbType.Int);
            param[0].Value = Id;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 500);
            param[1].Value = password;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spsupdatestatusViaEmail", param);
        }
    }
    public class DA_ViewDetails
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet GetDetails(string rowid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@rowid", SqlDbType.Int);
            param[0].Value = rowid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobdetails]", param);
        }

        public DataSet GetComAndJobDetails(string Jobid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jobid", SqlDbType.VarChar, 30);
            param[0].Value = Jobid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetComandJobDet]", param);
        }
    }
    public class DAUserHome
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getuserinfo(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_GetUserinfo]", param);
        }
        public DataSet GetLastLoginInfo(string id1)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@EmailId", SqlDbType.NVarChar, 100);
            param[0].Value = id1;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_GetLastLoginInfo]", param);
        }
    }
    public class DA_changepassword
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet GetpasswordDetails(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spchangepassword]", param);
        }
        public void updatepassword(string id, string newpassword)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            param[1] = new SqlParameter("@newpassword", SqlDbType.NVarChar, 50);
            param[1].Value = newpassword;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spupdatepassword]", param);
        }
    }
    public class DA_EmployRegistration
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet GetRole()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_GetRole]");
        }
        public int InsertData(string empid, string firstname, string middlename, string lastname, string dob, string email, string mobile, string phone, string addr1, string addr2, string state, string Zip, string role, string password)
        {
            SqlParameter[] param = new SqlParameter[14];
            param[0] = new SqlParameter("@empid", SqlDbType.VarChar, 50);
            param[0].Value = empid;
            param[1] = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            param[1].Value = firstname;
            param[2] = new SqlParameter("@middlename", SqlDbType.VarChar, 50);
            param[2].Value = middlename;
            param[3] = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            param[3].Value = lastname;
            param[4] = new SqlParameter("@dob", SqlDbType.DateTime);
            param[4].Value = dob;
            param[5] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
            param[5].Value = email;
            param[6] = new SqlParameter("@mobile", SqlDbType.VarChar, 15);
            param[6].Value = mobile;
            param[7] = new SqlParameter("@phone", SqlDbType.VarChar, 15);
            param[7].Value = phone;
            param[8] = new SqlParameter("@addr1", SqlDbType.NVarChar, 200);
            param[8].Value = addr1;
            param[9] = new SqlParameter("@addr2", SqlDbType.NVarChar, 200);
            param[9].Value = addr2;
            param[10] = new SqlParameter("@state", SqlDbType.VarChar, 30);
            param[10].Value = state;
            param[11] = new SqlParameter("@zip", SqlDbType.VarChar, 10);
            param[11].Value = Zip;
            param[12] = new SqlParameter("@role", SqlDbType.Int);
            param[12].Value = role;
            param[13] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            param[13].Value = password;
            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[sp_ploutosreg]", param);
        }
    }
    public class DA_ResetPassword
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getroleid()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetroleid");
        }
        public DataSet Getuserid(int role)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@role", SqlDbType.Int, 50);
            param[0].Value = role;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sp_Getuserid", param);
        }
        public int resetpwd(string Emailid, string pwd)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Emailid", SqlDbType.VarChar, 100);
            param[0].Value = Emailid;
            param[1] = new SqlParameter("@pwd", SqlDbType.VarChar, 50);
            param[1].Value = pwd;
            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sp_resetpwd", param);
        }
    }
    public class DA_Listofusers
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getlistusers()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getlistusers]");
        }
    }
    public class DA_Process
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());


        public int SelectUsers(string jsids, string JobId, int Type=1)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@jsids", SqlDbType.VarChar, 500);
            param[0].Value = jsids;
            param[1] = new SqlParameter("@JobId", SqlDbType.VarChar, 50);
            param[1].Value = JobId;
            param[2] = new SqlParameter("@Type", SqlDbType.Int);
            param[2].Value = Type;
            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsSelectJobSeekers", param);
        }
    }
    public class DA_emphomepage
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet getlogindetails(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@emailid", SqlDbType.VarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsgetlogindetails]", param);

        }

    }
    public class DA_HiringProcess
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

      

        public DataSet GetHiredCandidates(int type,string Company)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@type", SqlDbType.Int);
            param[0].Value = type;
            param[1] = new SqlParameter("@Company", SqlDbType.VarChar,200);
            param[1].Value = Company;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsgetHiredCadidates]", param);
        }

        public DataSet GetHiredCompanies()
        {
           
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetHiredCompanies]");
        }
    }
    public class DA_Jobcatandloc
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet getjobcat()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobtitle]");
        }
        public DataSet GetJobloc()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobloc]");
        }
    }
    public class DA_Jobseekerslist
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet Getjobseekercat()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetjobseekertitle]");
        }
        public DataSet Getjobseekerloc()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobseekerloc]");
        }
    }
    public class DA_Memsubcatlist
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet GetMemcatloclist(string CatLoc, string Type)
        {
            {
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@CatLoc", SqlDbType.NVarChar, 100);
                param[0].Value = CatLoc;
                param[1] = new SqlParameter("@Type", SqlDbType.Int);
                param[1].Value = Type;
                return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMemsubcatloc", param);
            }
        }
    }

    public class DA_MemList
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet GetMemList(string jobLoc, string Type, string maincat, string maintype)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@jobLoc", SqlDbType.NVarChar, 100);
            param[0].Value = jobLoc;
            param[1] = new SqlParameter("@type", SqlDbType.Int);
            param[1].Value = Type;
            param[2] = new SqlParameter("@maincat", SqlDbType.NVarChar, 100);
            param[2].Value = maincat;
            param[3] = new SqlParameter("@MainType", SqlDbType.Int);
            param[3].Value = maintype;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjssubcatdet", param);
        }
    }
    public class DA_Activities
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet GetAllActivities(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetAllActivities",param);
        }

        public void CreateActivity(BE_Ploutos.BE_Activity BEAct)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[0].Value = BEAct.Jsid;
            param[1] = new SqlParameter("@typeofact", SqlDbType.NVarChar,200);
            param[1].Value = BEAct.TypeofAct;
            param[2] = new SqlParameter("@Actdt", SqlDbType.DateTime);
            param[2].Value = BEAct.Actdt;
            param[3] = new SqlParameter("@ActTime", SqlDbType.NVarChar,100);
            param[3].Value = BEAct.ActTime;
            param[4] = new SqlParameter("@Notes", SqlDbType.NVarChar, 2000);
            param[4].Value = BEAct.Notes;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            param[5].Value = BEAct.ActCreatedBy;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateActivity", param);
        }


        public void Hiringactivity(BE_Activity BEAct)
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@phinview", SqlDbType.VarChar, 10);
            param[0].Value = BEAct.phinview;
            param[1] = new SqlParameter("@onsiteinview", SqlDbType.VarChar, 10);
            param[1].Value = BEAct.onsiteinview;
            param[2] = new SqlParameter("@secondinview", SqlDbType.VarChar, 10);
            param[2].Value = BEAct.secondinview;
            param[3] = new SqlParameter("@thirdinview", SqlDbType.VarChar, 10);
            param[3].Value = BEAct.thirdinview;
            param[4] = new SqlParameter("@offered", SqlDbType.VarChar, 10);
            param[4].Value = BEAct.offered;
            param[5] = new SqlParameter("@acceptedoffer", SqlDbType.VarChar, 10);
            param[5].Value = BEAct.acceptedoffer;
            param[6] = new SqlParameter("@joindate", SqlDbType.VarChar, 50);
            param[6].Value = BEAct.joindate;
            param[7] = new SqlParameter("@rate", SqlDbType.VarChar, 10);
            param[7].Value = BEAct.rate;
            param[8] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[8].Value = BEAct.Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsUpdateHireprocess", param);
        }

        public DataSet GetScheduInfo(int Type)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Type", SqlDbType.Int);
            param[0].Value =Type;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetAllActivities1",param);
        }

        public void DeleteActivity(string Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Id", SqlDbType.VarChar,10);
            param[0].Value = Id;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsDelActivities", param);
        }
        public DataSet Getnewdsactivities(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetNewhiringact", param);
        }       
       
    }
    public class DA_TimeSheet1
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet GetTimeSheetInfo(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Tsid", SqlDbType.VarChar, 20);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetOneWeekTsdet]", param);
        }
        public DataSet GetUsers(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetTimeUsers]", param);
        }
        public void InsertTimeSheet(string x, string y, string day, string psic, string totaltime, string worktype, string company)
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@timein", SqlDbType.NVarChar, 100);
            param[0].Value = x;
            param[1] = new SqlParameter("@timeout", SqlDbType.NVarChar, 100);
            param[1].Value = y;
            param[2] = new SqlParameter("@day", SqlDbType.VarChar, 50);
            param[2].Value = day;
            param[3] = new SqlParameter("@Tsid", SqlDbType.VarChar, 20);
            param[3].Value = psic;
            param[4] = new SqlParameter("@timediff", SqlDbType.NVarChar, 100);
            param[4].Value = totaltime;
            param[5] = new SqlParameter("@WorkType", SqlDbType.NVarChar, 100);
            param[5].Value = worktype;
            param[6] = new SqlParameter("@company", SqlDbType.NVarChar, 100);
            param[6].Value = company;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsInsertTimeSheet]", param);
        }

        public void Insoff(string day, string psic, string worktype)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@day", SqlDbType.VarChar, 50);
            param[0].Value = day;
            param[1] = new SqlParameter("@Tsid", SqlDbType.VarChar, 20);
            param[1].Value = psic;
            param[2] = new SqlParameter("@WorkType", SqlDbType.NVarChar, 100);
            param[2].Value = worktype;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsInsertTimeSheet]", param);
        }
        public DataSet GetTimeToEdit(string sid, string ids)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@sid", SqlDbType.NVarChar, 100);
            param[0].Value = sid;
            param[1] = new SqlParameter("@ids", SqlDbType.NVarChar, 100);
            param[1].Value = ids;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetTimes]", param);
        }

        public DataSet GetUserReport(string id, string user, string startdt, string enddt)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@Company", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            param[1] = new SqlParameter("@UserID", SqlDbType.NVarChar, 100);
            param[1].Value = user;
            param[2] = new SqlParameter("@StartDate", SqlDbType.Date);
            param[2].Value = Convert.ToDateTime(startdt);
            param[3] = new SqlParameter("@EndDt", SqlDbType.Date);
            param[3].Value = Convert.ToDateTime(enddt);
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetUserReports]", param);
        }

        public DataSet GetCompanyReport(string id, string startdt, string enddt)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Company", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            param[1] = new SqlParameter("@StartDate", SqlDbType.Date);
            param[1].Value = Convert.ToDateTime(startdt);
            param[2] = new SqlParameter("@EndDt", SqlDbType.Date);
            param[2].Value = Convert.ToDateTime(enddt);
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetCompanyReports]", param);
        }
        public DataSet GetComList()
        {

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetCompList");
        }
        public DataSet GetClientList(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetClientList]", param);
        }
       
        public DataSet Getuserlist()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetUserList");
        }
        public DataSet getuserlistid(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.NVarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetidUsers]", param);
        }
        public DataSet GetallinGrid(string startdt, string enddt, string company1)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@StartDate", SqlDbType.Date);
            param[0].Value = startdt;
            param[1] = new SqlParameter("@EndDt", SqlDbType.Date);
            param[1].Value = enddt;
            param[2] = new SqlParameter("@company1", SqlDbType.NVarChar, 100);
            param[2].Value = company1;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetuserinGrid]", param);
        }
        public DataSet GetcompinGrid(string startdt, string enddt, string company, string user)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@StartDate", SqlDbType.Date);
            param[0].Value = startdt;
            param[1] = new SqlParameter("@EndDt", SqlDbType.Date);
            param[1].Value = enddt;
            param[2] = new SqlParameter("@Company", SqlDbType.NVarChar, 100);
            param[2].Value = company;
            param[3] = new SqlParameter("@user", SqlDbType.NVarChar, 100);
            param[3].Value = user;
            
            
        // return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetcompReports]", param);

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetTotalSalReports]", param);
        }

    }
    public class DA_Search
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet FillCategory()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetSearchCategory]");
        }
        public DataSet GetMatchedResource(string comp, string state, string category, string city)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@compname", SqlDbType.NVarChar, 100);
            param[0].Value = comp;
            param[1] = new SqlParameter("@category", SqlDbType.NVarChar, 100);
            param[1].Value = state;
            param[2] = new SqlParameter("@state", SqlDbType.NVarChar, 100);
            param[2].Value = category;
            param[3] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[3].Value = city;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMatchedResource]", param);
        }
        public DataSet getmatchedresource1(string jobtitle, string category, string state, string city, string expfrom, string expto)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@jobtitle", SqlDbType.VarChar, 100);
            param[0].Value = jobtitle;
            param[1] = new SqlParameter("@category", SqlDbType.VarChar, 100);
            param[1].Value = category;
            param[2] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[2].Value = state;
            param[3] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[3].Value = city;
            param[4] = new SqlParameter("@expfrom", SqlDbType.VarChar, 10);
            param[4].Value = expfrom;
            param[5] = new SqlParameter("@expto", SqlDbType.VarChar, 10);
            param[5].Value = expto;

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMatchedResource1]", param);
        }

        public DataSet GetCity(string state)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[0].Value = state;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsgetcity]", param);
        }
    }
    //public class DA_Marketingsearch
    //{
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
    //    public DataSet FillCategory()
    //    {
    //        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetSearchCategory");
    //    }
    //    public DataSet FillDatalist()
    //    {
    //        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingList]");
    //    }
    //    public DataSet SearchMarKetList(string name, string expfrom, string expto, string industry)
    //    {
    //        SqlParameter[] param = new SqlParameter[4];
    //        param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
    //        param[0].Value = name;
    //        param[1] = new SqlParameter("@expfrom", SqlDbType.VarChar, 10);
    //        param[1].Value = expfrom;
    //        param[2] = new SqlParameter("@expto", SqlDbType.VarChar, 10);
    //        param[2].Value = expto;
    //        param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
    //        param[3].Value = industry;
    //        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketResource]", param);
    //    }
    //}
}
