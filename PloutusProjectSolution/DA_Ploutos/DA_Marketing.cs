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
    public class DA_Marketing
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public DataSet getmarketingloginbyemailid(string emailid, string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@emailid", SqlDbType.NVarChar, 100);
            param[0].Value = emailid;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            param[1].Value = password;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsMarketingLogin]", param);
        }
        public DataSet ChangePassword(string emailid, string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@emailid", SqlDbType.NVarChar, 100);
            param[0].Value = emailid;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            param[1].Value = password;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsChangePwd]", param);
        }

        public DataSet GetClientCategory(string Company)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Company", SqlDbType.NVarChar, 50);
            param[0].Value = Company;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_GetClientCategory", param);
        }
        public DataSet getlogindetails(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@emailid", SqlDbType.VarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsgetMarketinglogindetails", param);

        }
        public DataSet GetHireCandidateDetails(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_GetHireCandidateDetails", param);

        }
        public DataSet UpdateHireCandidateDetails(string jsid, string apnmtdate, string cname, string clocatiion, string fromdate, string name, string position, string jobType, string salary, string salarytype, string todate)
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@apntmtdate", SqlDbType.VarChar, 100);
            param[1].Value = apnmtdate;
            param[2] = new SqlParameter("@cname", SqlDbType.VarChar, 100);
            param[2].Value = cname;
            param[3] = new SqlParameter("@fromdate", SqlDbType.VarChar, 100);
            param[3].Value = fromdate;
            param[4] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[4].Value = name;
            param[5] = new SqlParameter("@position", SqlDbType.VarChar, 100);
            param[5].Value = position;
            param[6] = new SqlParameter("@salary", SqlDbType.VarChar, 100);
            param[6].Value = salary;
            param[7] = new SqlParameter("@salarytype", SqlDbType.VarChar, 100);
            param[7].Value = salarytype;
            param[8] = new SqlParameter("@todate", SqlDbType.VarChar, 100);
            param[8].Value = todate;
            param[9] = new SqlParameter("@CompanyLocation", SqlDbType.NVarChar, 200);
            param[9].Value = clocatiion;
            param[10] = new SqlParameter("@JobType", SqlDbType.NVarChar, 50);
            param[10].Value = jobType;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_UpdateHireCandidateDetails", param);

        }
        public DataSet FillCategory()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketstateAndIndustries]");
        }

        public DataSet GetClientsDetails()
        {

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_GetClientDetails");

        }
        public DataSet GetJobposition(string MemID)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@MemId", SqlDbType.NVarChar, 100);
            param[0].Value = MemID;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_Getposition", param);
        }

        public DataSet FillDatalist()         
        {
           
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingList]");
        }

        public void updateCliensDetails(BE_Clients beview)
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = new SqlParameter("@CompanyName ", SqlDbType.VarChar, 50);
            param[0].Value = beview.Company;

            param[1] = new SqlParameter("@Category", SqlDbType.VarChar, 50);
            param[1].Value = beview.Category;

            param[2] = new SqlParameter("@Website", SqlDbType.VarChar, 100);
            param[2].Value = beview.Website;

            param[3] = new SqlParameter("@address1", SqlDbType.VarChar, 100);
            param[3].Value = beview.Addressline1;

            param[4] = new SqlParameter("@MemId", SqlDbType.NVarChar, 50);
            param[4].Value = beview.MemID;

            param[5] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[5].Value = beview.State;

            param[6] = new SqlParameter("@zipcode", SqlDbType.VarChar, 50);
            param[6].Value = beview.Zip;

            param[7] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[7].Value = beview.Email;

            param[8] = new SqlParameter("@ContactInfo", SqlDbType.VarChar, 50);
            param[8].Value = beview.Contact;

            param[9] = new SqlParameter("@Phone", SqlDbType.VarChar, 50);
            param[9].Value = beview.Phone;

            param[10] = new SqlParameter("@Mobile", SqlDbType.VarChar, 50);
            param[10].Value = beview.Mobile;

            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sps_updateClientdetails", param);
        }
        public DataSet FillmarketViewResumelist(int status)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@status", SqlDbType.Int, 100);
            param[0].Value = status;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingList_New]");
        }
        public DataSet FillHiringlist()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_GetHireCandidateData]");
        }
        public DataSet HoldDatalist()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetHoldList]");
        }


        public DataSet SearchHiringData(string name, string company, string date, string industry)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[0].Value = name;
            param[1] = new SqlParameter("@Cname", SqlDbType.VarChar, 100);
            param[1].Value = company;
            param[2] = new SqlParameter("@HDate", SqlDbType.VarChar,12);
            param[2].Value = date;
            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = industry;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_SearchHiringData]",param);
        }

        public DataSet SearchAcceptcanList(string name, string expfrom, string expto, string industry,string state, string city) 
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[0].Value = name;
            param[1] = new SqlParameter("@expfrom", SqlDbType.VarChar, 100);
            param[1].Value =expfrom;
            param[2] = new SqlParameter("@expto", SqlDbType.VarChar, 100);
            param[2].Value = expto;
            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = industry;
           
            param[4] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[4].Value = state;
            param[5] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[5].Value = city;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_SearchAcceptedCanData]", param);
        }
        public DataSet SearchMarKetList(string name, string expfrom, string expto, string industry, int status, string state, string city)
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[0].Value = name;
            param[1] = new SqlParameter("@expfrom", SqlDbType.VarChar, 10);
            param[1].Value = expfrom;
            param[2] = new SqlParameter("@expto", SqlDbType.VarChar, 10);
            param[2].Value = expto;
            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = industry;
            param[4] = new SqlParameter("@status", SqlDbType.Int);
            param[4].Value = status;
            param[5] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[5].Value = state;
            param[6] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[6].Value = city;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetmarkResource2]", param);
        }
        public DataSet SearchRejectcanList(string name, string expfrom, string expto, string industry,string state, string city) 
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[0].Value = name;
            param[1] = new SqlParameter("@expfrom", SqlDbType.VarChar, 100);
            param[1].Value = expfrom;
            param[2] = new SqlParameter("@expto", SqlDbType.VarChar, 100);
            param[2].Value = expto;
            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = industry;

            param[4] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[4].Value = state;
            param[5] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[5].Value = city;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_SearchRejectCanData]", param);
        }
        public DataSet SearchMarKetStatusList(string status)
        {
            SqlParameter[] param = new SqlParameter[1];
          
            param[0] = new SqlParameter("@status", SqlDbType.VarChar,1000);
            param[0].Value = status;

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetmarkResourceByStatus]", param);
        }
        public void CreateActivity(BE_MarketingActivities BEMarketingAct)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[0].Value = BEMarketingAct.Jsid;
            param[1] = new SqlParameter("@typeofact", SqlDbType.NVarChar, 200);
            param[1].Value = BEMarketingAct.TypeofAct;
            param[2] = new SqlParameter("@Actdt", SqlDbType.DateTime);
            param[2].Value = BEMarketingAct.Actdt;
            param[3] = new SqlParameter("@ActTime", SqlDbType.NVarChar, 100);
            param[3].Value = BEMarketingAct.ActTime;
            param[4] = new SqlParameter("@Notes", SqlDbType.NVarChar, 2000);
            param[4].Value = BEMarketingAct.Notes;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            param[5].Value = BEMarketingAct.ActCreatedBy;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateMarketingActivity", param);
        }

        public DataSet GetAllActivities(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetAllMarketingActivities", param);
        }
        public DataSet GetmarketingMemdetails(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMarketingMemDetails", param);
        }
        public DataSet GetmarketingMemByJsID(string Jsid) 
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMarketingListByJsID", param);
        }

        
        public void AcceptCandidate(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsAcceptCandidate]", param);
        }
        public void RejectCandidate(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsRejectCandidate]", param);
        }


        public DataSet postedprofiledetails()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sp_Mkthomepage");
        }

        public DataSet EventsDetails()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsMarkethomepage]");
        }

        public DataSet FillDatalistAlready()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingListAlready]");
        }

        public void AcceptCandidateAlready(string jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsAcceptCandidateAlready]", param);
        }

        public void RejectCandidateAlready(string jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsRejectCandidateAlready]", param);
        }

        public DataSet SearchMarKetListAlready(string p, string expfrom, string expto, string industry, int status, string state, string city)
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@name", SqlDbType.VarChar, 100);
            param[0].Value = p;
            param[1] = new SqlParameter("@expfrom", SqlDbType.VarChar, 10);
            param[1].Value = expfrom;
            param[2] = new SqlParameter("@expto", SqlDbType.VarChar, 10);
            param[2].Value = expto;
            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = industry;
            param[4] = new SqlParameter("@status", SqlDbType.Int);
            param[4].Value = status;
            param[5] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[5].Value = state;
            param[6] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[6].Value = city;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetmarkResourceAlready]", param);
        }

        public DataSet FillDatalistJobSeeker(string p)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@order", SqlDbType.Int);
            param[0].Value = p;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingListJobSeeker]");
        }

        public DataSet GetAllMerchantActivities(string MerchantID)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@MerchantID", SqlDbType.NVarChar, 20);
            param[0].Value = MerchantID;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetAllMerchantActivities]", param);
        }

        public DataSet GetAllCompDetails(string MerchantID)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@MerchantID", SqlDbType.VarChar, 20);
            param[0].Value = MerchantID;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetAllCompDetails]", param);
        }

        public DataSet SearchViewUplodedData(string NaEmPh, string activity, string industry, string Date, string jsids, string clint)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@NaEmPh", SqlDbType.NVarChar, 200);
            param[0].Value = NaEmPh;
            param[1] = new SqlParameter("@Activity", SqlDbType.NVarChar, 100);
            param[1].Value = activity;
            param[2] = new SqlParameter("@Date", SqlDbType.NVarChar, 100);
            param[2].Value = Date;
            param[3] = new SqlParameter("@Industry", SqlDbType.VarChar, 200);
            param[3].Value = industry;
            param[4] = new SqlParameter("@jsid", SqlDbType.NVarChar, 1000);
            param[4].Value = jsids;
            param[5] = new SqlParameter("@Client", SqlDbType.NVarChar, 200);
            param[5].Value = clint;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_SearchViewUplodedData]", param);
        }

        public DataSet SearchKeyWordFromDB(string keyword) 
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SearchStr", SqlDbType.NVarChar, 200);
            param[0].Value = keyword;

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[Sps_SearchKeyWordViewProfiles]", param);
        }

        //Delete profiles by JSID
        public int DeleteProfileByJsid(string jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = jsid;
            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsDeleteProfileByJsid]", param);
            
        }
        
    }
    public class DA_MarketingReg
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public int InsertMarketings(BE_MarketingReg bemarreg)
        {
            SqlParameter[] param = new SqlParameter[15];
            param[0] = new SqlParameter("@Fname", SqlDbType.VarChar, 100);
            param[0].Value = bemarreg.firstName;
            param[1] = new SqlParameter("@MName", SqlDbType.VarChar, 5);
            param[1].Value = bemarreg.middleName;
            param[2] = new SqlParameter("@Lname", SqlDbType.VarChar, 100);
            param[2].Value = bemarreg.lastName;
            param[3] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[3].Value = bemarreg.city;
            param[4] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[4].Value = bemarreg.state;
            param[5] = new SqlParameter("@address", SqlDbType.VarChar);
            param[5].Value = bemarreg.address;
            param[6] = new SqlParameter("@Mobile", SqlDbType.VarChar, 20);
            param[6].Value = bemarreg.mobile;
            param[7] = new SqlParameter("@Emailid", SqlDbType.VarChar, 400);
            param[7].Value = bemarreg.email;
            param[8] = new SqlParameter("@TotalExp", SqlDbType.VarChar, 20);
            param[8].Value = bemarreg.experience;
            param[9] = new SqlParameter("@Industry1", SqlDbType.VarChar, 50);
            param[9].Value = bemarreg.Industry1;
            param[10] = new SqlParameter("@Industry2", SqlDbType.VarChar, 50);
            param[10].Value = bemarreg.Industry2;
            param[11] = new SqlParameter("@Industry3", SqlDbType.VarChar, 50);
            param[11].Value = bemarreg.Industry3;
            param[12] = new SqlParameter("@Ext", SqlDbType.VarChar, 50);
            param[12].Value = bemarreg.Ext;
            param[13] = new SqlParameter("@Cell", SqlDbType.VarChar, 50);
            param[13].Value = bemarreg.Cell;
            param[14] = new SqlParameter("@Zip", SqlDbType.VarChar, 50);
            param[14].Value = bemarreg.Zip;


            DataSet ds = new DataSet();
            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sps_insertMrktReg", param);
           // return ds.Tables[0].Rows[0][0].ToString();
        }


        public int DeleteResumeNotFound(string jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = jsid;

            return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sp_Delete_UploadResumeNotfound", param);

        }

        public string InsertMarketing(BE_MarketingReg bemarreg)
        {
            SqlParameter[] param = new SqlParameter[19];
            param[0] = new SqlParameter("@Fname", SqlDbType.VarChar, 100);
            param[0].Value = bemarreg.firstName;
            param[1] = new SqlParameter("@MName", SqlDbType.VarChar, 5);
            param[1].Value = bemarreg.middleName;
            param[2] = new SqlParameter("@Lname", SqlDbType.VarChar, 100);
            param[2].Value = bemarreg.lastName;
            param[3] = new SqlParameter("@city", SqlDbType.VarChar, 50);
            param[3].Value = bemarreg.city;
            param[4] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[4].Value = bemarreg.state;
            param[5] = new SqlParameter("@address", SqlDbType.VarChar);
            param[5].Value = bemarreg.address;
            param[6] = new SqlParameter("@Mobile", SqlDbType.VarChar, 20);
            param[6].Value = bemarreg.mobile;
            param[7] = new SqlParameter("@Emailid", SqlDbType.VarChar, 400);
            param[7].Value = bemarreg.email;
            param[8] = new SqlParameter("@TotalExp", SqlDbType.VarChar, 20);
            param[8].Value = bemarreg.experience;
            param[9] = new SqlParameter("@Industry1", SqlDbType.VarChar, 50);
            param[9].Value = bemarreg.Industry1;
            param[10] = new SqlParameter("@Industry2", SqlDbType.VarChar, 50);
            param[10].Value = bemarreg.Industry2;
            param[11] = new SqlParameter("@Industry3", SqlDbType.VarChar, 50);
            param[11].Value = bemarreg.Industry3;
            param[12] = new SqlParameter("@Ext", SqlDbType.VarChar, 50);
            param[12].Value = ".docx";
            param[13] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 50);
            param[13].Value = bemarreg.ContactNum;
            param[14] = new SqlParameter("@Status", SqlDbType.VarChar, 1000);
            param[14].Value = bemarreg.Status;
            param[15] = new SqlParameter("@Certify", SqlDbType.VarChar, 50);
            param[15].Value = bemarreg.CertifiedIn;
            param[16] = new SqlParameter("@Client", SqlDbType.VarChar, 10);
            param[16].Value = bemarreg.Client;
            param[17] = new SqlParameter("@Jobtitle", SqlDbType.VarChar, 10);
            param[17].Value = bemarreg.JobTitle;
            param[18] = new SqlParameter("@UploadBy", SqlDbType.NVarChar, 100);
            param[18].Value = bemarreg.UploadBy; DataSet ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "sps_InsertResumData", param);
            return ds.Tables[0].Rows[0][0].ToString();
            // uploaddate,jsid,status,cell,homenum,JSMFile,)
        }

        public int FindExistEmailID(string Emails)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Emails", SqlDbType.VarChar, 100);
            param[0].Value = Emails;
            param[1] = new SqlParameter("@ECount", SqlDbType.Int);
            param[1].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sp_CheckEmailExists", param);
            return Convert.ToInt32(param[1].Value.ToString());
       
        }

    }
    public class DA_Industrieslist
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet GetIndustriesList()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetIndustriesList1");
        }
    }
    public class DA_MarketingActivities
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
        public void CreateActivity(BE_MarketingActivities BEMarketingAct)
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[0].Value = BEMarketingAct.Jsid;
            param[1] = new SqlParameter("@typeofact", SqlDbType.NVarChar, 200);
            param[1].Value = BEMarketingAct.TypeofAct;
            param[2] = new SqlParameter("@Actdt", SqlDbType.DateTime);
            param[2].Value = BEMarketingAct.Actdt;
            param[3] = new SqlParameter("@ActTime", SqlDbType.NVarChar, 100);
            param[3].Value = BEMarketingAct.ActTime;
            param[4] = new SqlParameter("@Notes", SqlDbType.NVarChar, 2000);
            param[4].Value = BEMarketingAct.Notes;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            param[5].Value = BEMarketingAct.ActCreatedBy;
            param[6] = new SqlParameter("@CreatedDt", SqlDbType.DateTime);
            param[6].Value = BEMarketingAct.CurrentDT;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateMarketingActivity", param);
        }
        
        
        public DataSet GetAllActivities(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetAllMarketingActivities", param);
        }
        public DataSet GetmarketingMemdetails(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetMarketingMemDetails", param);
        }
        public void AcceptCandidate(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsAcceptCandidate]", param);
        }
        public void RejectCandidate(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsRejectCandidate]", param);
        }

        public void HoldCandidate(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsHoldCandidate]", param);
        }

        public DataSet EditActivities(string Id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.VarChar, 100);
            param[0].Value = Id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsEditActivities]", param);
        }

        public DataSet GetAllScMrktActivities()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsMrktScActivities]");
        }
        public void UpdateActivity(string jsid, string type, string actdate, string acttime, string notes)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@ActivityType", SqlDbType.VarChar, 50);
            param[1].Value = type;
            param[2] = new SqlParameter("@activitydate", SqlDbType.DateTime);
            param[2].Value = actdate;
            param[3] = new SqlParameter("@activityTime", SqlDbType.VarChar, 20);
            param[3].Value = acttime;
            param[4] = new SqlParameter("@notes", SqlDbType.NVarChar, 1000);
            param[4].Value = notes;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateMrktActivities]", param);
        }
        public void DeleteActivity(int id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsDeleteActivities]", param);
        }

        public void ColseActivity(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsCloseActivities]", param);
        }
        public void UpdateResume(string jsid,string resume)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar,100);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@resume", SqlDbType.NVarChar, 1000000);
            param[1].Value = resume;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateJobSResume]", param);
        }

        public void UpdateMarketJobseker(string jsid, string fname, string lname, string mname, string cell, string home, string email, string mobile, string industry1, string industry2, string industry3, string exp, string city, string state, string adress)
        {
            SqlParameter[] param = new SqlParameter[15];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@fname", SqlDbType.VarChar, 50);
            param[1].Value = fname;
            param[2] = new SqlParameter("@lname", SqlDbType.VarChar, 50);
            param[2].Value = lname;
            param[3] = new SqlParameter("@mname", SqlDbType.VarChar, 10);
            param[3].Value = mname;
            param[4] = new SqlParameter("@email", SqlDbType.NVarChar, 400);
            param[4].Value = email;
            param[5] = new SqlParameter("@mobile", SqlDbType.VarChar, 20);
            param[5].Value = mobile;
            param[6] = new SqlParameter("@industry1", SqlDbType.VarChar, 100);
            param[6].Value = industry1;
            param[7] = new SqlParameter("@exp", SqlDbType.NVarChar, 10);
            param[7].Value = exp;
            param[8] = new SqlParameter("@city", SqlDbType.NVarChar, 50);
            param[8].Value = city;
            param[9] = new SqlParameter("@state", SqlDbType.NVarChar, 50);
            param[9].Value = state;
            param[10] = new SqlParameter("@address", SqlDbType.NVarChar, 100);
            param[10].Value = adress;
            param[11] = new SqlParameter("@cell", SqlDbType.NVarChar, 100);
            param[11].Value = cell;
            param[12] = new SqlParameter("@home", SqlDbType.NVarChar, 100);
            param[12].Value = home;
            param[13] = new SqlParameter("@industry2", SqlDbType.VarChar, 100);
            param[13].Value = industry2;
            param[14] = new SqlParameter("@industry3", SqlDbType.VarChar, 100);
            param[14].Value = industry3;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateMarkMemDetails]", param);
        }
        public DataSet LoadActivitiesByDate(string date)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Date", SqlDbType.VarChar, 60);
            param[0].Value = date;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsgetactivitiesbydate]", param);
        }

        public DataSet GetmarketingMemdetailsAlready(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 100);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsGetMarketingMemDetails1]", param);
        }

        public DataSet GetAllActivitiesAlready(string Jsid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetAllMarketingActivitiesAlready", param);
        }
        public void CreateActivityAlready(BE_MarketingActivities BEMarketingAct)
        {
            SqlParameter[] param = new SqlParameter[7];
            param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[0].Value = BEMarketingAct.Jsid;
            param[1] = new SqlParameter("@typeofact", SqlDbType.NVarChar, 200);
            param[1].Value = BEMarketingAct.TypeofAct;
            param[2] = new SqlParameter("@Actdt", SqlDbType.DateTime);
            param[2].Value = BEMarketingAct.Actdt;
            param[3] = new SqlParameter("@ActTime", SqlDbType.NVarChar, 100);
            param[3].Value = BEMarketingAct.ActTime;
            param[4] = new SqlParameter("@Notes", SqlDbType.NVarChar, 2000);
            param[4].Value = BEMarketingAct.Notes;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            param[5].Value = BEMarketingAct.ActCreatedBy;
            param[6] = new SqlParameter("@CreatedDt", SqlDbType.DateTime);
            param[6].Value = BEMarketingAct.CurrentDT;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateMarketingActivityAlready", param);
        }

        public DataSet EditActivitiesAlready(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.VarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsEditActivitiesAlready]", param);
        }

        public void UpdateActivityAlready(string jsid, string type, string actdate, string acttime, string notes)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@ActivityType", SqlDbType.VarChar, 50);
            param[1].Value = type;
            param[2] = new SqlParameter("@activitydate", SqlDbType.DateTime);
            param[2].Value = actdate;
            param[3] = new SqlParameter("@activityTime", SqlDbType.VarChar, 20);
            param[3].Value = acttime;
            param[4] = new SqlParameter("@notes", SqlDbType.NVarChar, 1000);
            param[4].Value = notes;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateMrktActivitiesAlready]", param);
        }

        public void DeleteActivityAlready(int id1)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id1;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsDeleteActivitiesAlready]", param);
        }

        public DataSet GetAllScMrktActivitiesAlready()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsMrktScActivitiesAlready]");
        }

        public void ColseActivityAlready(string p)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = p;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsCloseActivitiesalready]", param);
        }

        public void UpdateMarketJobsekerAlready(string jsid, string fname, string lname, string mname, string mobile, string cell, string homenum, string email, string fexp, string industry1, string industry2, string industry3, string state, string city, string address, string Client, string jobid, string jobtitile)
        {
            SqlParameter[] param = new SqlParameter[18];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 10);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@fname", SqlDbType.VarChar, 50);
            param[1].Value = fname;
            param[2] = new SqlParameter("@lname", SqlDbType.VarChar, 50);
            param[2].Value = lname;
            param[3] = new SqlParameter("@mname", SqlDbType.VarChar, 10);
            param[3].Value = mname;
            param[4] = new SqlParameter("@mobile", SqlDbType.NVarChar, 100);
            param[4].Value = mobile;
            param[5] = new SqlParameter("@cell", SqlDbType.NVarChar, 100);
            param[5].Value = cell;
            param[6] = new SqlParameter("@homenum", SqlDbType.NVarChar, 100);
            param[6].Value = homenum;
            param[7] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
            param[7].Value = email;
            param[8] = new SqlParameter("@exp", SqlDbType.NVarChar, 10);
            param[8].Value = fexp;
            param[9] = new SqlParameter("@industry1", SqlDbType.VarChar, 100);
            param[9].Value = industry1;
            param[10] = new SqlParameter("@industry2", SqlDbType.VarChar, 100);
            param[10].Value = industry2;
            param[11] = new SqlParameter("@industry3", SqlDbType.VarChar, 100);
            param[11].Value = industry3;
            param[12] = new SqlParameter("@state", SqlDbType.NVarChar, 50);
            param[12].Value = state;
            param[13] = new SqlParameter("@city", SqlDbType.NVarChar, 50);
            param[13].Value = city;
            param[14] = new SqlParameter("@address", SqlDbType.NVarChar, 100);
            param[14].Value = address;
            param[15] = new SqlParameter("@jobid", SqlDbType.VarChar, 50);
            param[15].Value = jobid;
            param[16] = new SqlParameter("@jobtitle", SqlDbType.VarChar, 50);
            param[16].Value = jobtitile;
            param[17] = new SqlParameter("@clientID", SqlDbType.VarChar, 50);
            param[17].Value = Client;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateMarkMemDetailsAlready]", param);
        }

        public void CreateActivityForMerchant(BE_MarketingActivities BEMarketingAct)
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@MerchantID", SqlDbType.NVarChar, 20);
            param[0].Value = BEMarketingAct.MerchantId;
            param[1] = new SqlParameter("@typeofact", SqlDbType.NVarChar, 200);
            param[1].Value = BEMarketingAct.TypeofAct;
            param[2] = new SqlParameter("@Actdt", SqlDbType.DateTime);
            param[2].Value = BEMarketingAct.Actdt;
            param[3] = new SqlParameter("@ActTime", SqlDbType.NVarChar, 100);
            param[3].Value = BEMarketingAct.ActTime;
            param[4] = new SqlParameter("@Notes", SqlDbType.NVarChar, 2000);
            param[4].Value = BEMarketingAct.Notes;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            param[5].Value = BEMarketingAct.ActCreatedBy;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateMerchantActivity", param);
        }

        public DataSet EditMerchantActivities(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.VarChar, 100);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsEditMerchantActivities]", param);
        }

        public void UpdateMerchantActivity(string ID, string activity, string actdate, string acttime, string notes)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@ID", SqlDbType.VarChar, 10);
            param[0].Value = ID;
            param[1] = new SqlParameter("@ActivityType", SqlDbType.VarChar, 50);
            param[1].Value = activity;
            param[2] = new SqlParameter("@activitydate", SqlDbType.DateTime);
            param[2].Value = actdate;
            param[3] = new SqlParameter("@activityTime", SqlDbType.VarChar, 20);
            param[3].Value = acttime;
            param[4] = new SqlParameter("@notes", SqlDbType.NVarChar, 1000);
            param[4].Value = notes;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsUpdateMerchantActivities]", param);
        }

        public void DeleteMerchantActivity(int id1)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id1;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsDeleteMerchantActivities]", param);
        }

        public void CreateCompContactInfo(BE_MarketingReg MarketingReg)
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@MerchantID", SqlDbType.VarChar, 20);
            param[0].Value = MarketingReg.MerchantId;
            param[1] = new SqlParameter("@contactperson", SqlDbType.VarChar, 50);
            param[1].Value = MarketingReg.firstName;
            param[2] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 15);
            param[2].Value = MarketingReg.ContactNum;
            param[3] = new SqlParameter("@mobile", SqlDbType.VarChar, 20);
            param[3].Value = MarketingReg.mobile;
            param[4] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[4].Value = MarketingReg.email;
            param[5] = new SqlParameter("@address", SqlDbType.VarChar, 100);
            param[5].Value = MarketingReg.address;
            param[6] = new SqlParameter("@city", SqlDbType.VarChar, 20);
            param[6].Value = MarketingReg.city;
            param[7] = new SqlParameter("@state", SqlDbType.VarChar, 20);
            param[7].Value = MarketingReg.state;
            param[8] = new SqlParameter("@Zip", SqlDbType.VarChar, 10);
            param[8].Value = MarketingReg.Zip;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsCreateComContactDetails", param);
        }

        public DataSet EditComDetailsActivities(string id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.VarChar, 10);
            param[0].Value = id;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[spsEditCompDetails]", param);
        }
        public void UpdateCompDetails(BE_MarketingReg MarketingReg)
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@ID", SqlDbType.VarChar, 20);
            param[0].Value = MarketingReg.MerchantId;
            param[1] = new SqlParameter("@contactperson", SqlDbType.VarChar, 50);
            param[1].Value = MarketingReg.firstName;
            param[2] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 15);
            param[2].Value = MarketingReg.ContactNum;
            param[3] = new SqlParameter("@mobile", SqlDbType.VarChar, 20);
            param[3].Value = MarketingReg.mobile;
            param[4] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[4].Value = MarketingReg.email;
            param[5] = new SqlParameter("@address", SqlDbType.VarChar, 100);
            param[5].Value = MarketingReg.address;
            param[6] = new SqlParameter("@city", SqlDbType.VarChar, 20);
            param[6].Value = MarketingReg.city;
            param[7] = new SqlParameter("@state", SqlDbType.VarChar, 20);
            param[7].Value = MarketingReg.state;
            param[8] = new SqlParameter("@Zip", SqlDbType.VarChar, 10);
            param[8].Value = MarketingReg.Zip;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsUpdateComDetails", param);
        }

        public void DeleteCompDetails(int id1)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id1;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[spsDeleteCompDetails]", param);
        }

        //Sending Mails Saved In DB
        public int InsertSendMailDetails(string jsid, string To, string From, string subject, string body, string RecFName)  
        {
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@jsid", SqlDbType.VarChar);
            param[0].Value = jsid;
            param[1] = new SqlParameter("@SendTo", SqlDbType.NVarChar);
            param[1].Value = To;
            param[2] = new SqlParameter("@SendFrom", SqlDbType.NVarChar);
            param[2].Value = From;
            param[3] = new SqlParameter("@Subject", SqlDbType.NVarChar);
            param[3].Value = subject;
            param[4] = new SqlParameter("@Body", SqlDbType.NVarChar);
            param[4].Value = body;
            param[5] = new SqlParameter("@RecFName", SqlDbType.NVarChar);
            param[5].Value = RecFName;
            return  SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "[sps_InsertSendMailDetails]", param);
        }

        public DataSet BindSentMailGrid()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sps_GetSentMails]");             
        }
    }


    public class DA_Clients 
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public void EditClients(BE_Clients beviewselected) 
        {
            SqlParameter[] param = new SqlParameter[12];
            param[0] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.Email;

            param[1] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[1].Value = beviewselected.Company;

            param[2] = new SqlParameter("@phone", SqlDbType.VarChar, 100);
            param[2].Value = beviewselected.Phone;

            param[3] = new SqlParameter("@city", SqlDbType.VarChar, 100);
            param[3].Value = beviewselected.City;

            param[4] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[4].Value = beviewselected.State;

            param[5] = new SqlParameter("@zipcode", SqlDbType.VarChar, 100);
            param[5].Value = beviewselected.Zip;

            param[6] = new SqlParameter("@address1", SqlDbType.VarChar, 100);
            param[6].Value = beviewselected.Addressline1;

            param[7] = new SqlParameter("@Website", SqlDbType.VarChar, 100);
            param[7].Value = beviewselected.Website;

            param[8] = new SqlParameter("@Contact", SqlDbType.VarChar, 100);
            param[8].Value = beviewselected.Contact;

            param[9] = new SqlParameter("@MemID", SqlDbType.VarChar, 100);
            param[9].Value = beviewselected.MemID;

            param[10] = new SqlParameter("@mobile", SqlDbType.VarChar, 100);
            param[10].Value = beviewselected.Mobile;

            param[11] = new SqlParameter("@Category", SqlDbType.VarChar, 100);
            param[11].Value = beviewselected.Category;

            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spUpdateEmployer", param);
        }
        public void updateViaEmail(string email, string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[0].Value = email;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 1000);
            param[1].Value = password;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "updatestatusViaEmail", param);
        }

        public string ClientReg(BE_Clients beview)
        {
            SqlParameter[] param = new SqlParameter[17];

            param[0] = new SqlParameter("@CompanyName ", SqlDbType.VarChar, 50);
            param[0].Value = beview.Company;

            param[1] = new SqlParameter("@Category", SqlDbType.VarChar, 50);
            param[1].Value = beview.Category;

            param[2] = new SqlParameter("@Website", SqlDbType.VarChar, 100);
            param[2].Value = beview.Website;

            param[3] = new SqlParameter("@address1", SqlDbType.VarChar, 100);
            param[3].Value = beview.Addressline1;

            param[4] = new SqlParameter("@city", SqlDbType.VarChar, 100);
            param[4].Value = beview.City;

            param[5] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[5].Value = beview.State;

            param[6] = new SqlParameter("@zipcode", SqlDbType.VarChar, 50);
            param[6].Value = beview.Zip;

            param[7] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[7].Value = beview.Email;

            param[8] = new SqlParameter("@ContactInfo", SqlDbType.VarChar, 50);
            param[8].Value = beview.Contact;

            param[9] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 50);
            param[9].Value = beview.Phone;

            param[10] = new SqlParameter("@Mobile", SqlDbType.VarChar, 50);
            param[10].Value = beview.Mobile;

            param[11] = new SqlParameter("@role", SqlDbType.Int);
            param[11].Value = beview.Role;

            param[12] = new SqlParameter("@RefID", SqlDbType.VarChar, 10);
            param[12].Value = beview.RefID;

            param[13] = new SqlParameter("@Pwd", SqlDbType.VarChar, 10);
            param[13].Value = beview.pwd;

            param[14] = new SqlParameter("@ActiveStatus", SqlDbType.Int);
            param[14].Value = beview.ActiveStatus;
            param[15] = new SqlParameter("@ClientRegBy", SqlDbType.NVarChar, 100);
            param[15].Value = beview.ClientRegBy;

            param[16] = new SqlParameter("@Message", SqlDbType.VarChar, 50);
            param[16].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spEmployerReg", param);
            return Convert.ToString(param[16].Value);
        } 

    }

    //public class DA_MarketHiringProces {

    //    //public int InsertHiredPfofile(BE_MarketingHiring marhir)
    //    //{

    //    //    SqlParameter[] param = new SqlParameter[8];

    //    //    param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
    //    //    param[0].Value = marhir.Jsid;
    //    //    param[1] = new SqlParameter("@CompnayName", SqlDbType.NVarChar, 200);
    //    //    param[1].Value = marhir.CompanyName;
    //    //    param[2] = new SqlParameter("@AppointingDate", SqlDbType.DateTime);
    //    //    param[2].Value = marhir.AppointingDate;
    //    //    param[3] = new SqlParameter("@ContractFromDate", SqlDbType.DateTime);
    //    //    param[3].Value = marhir.ContractPodFrom;
    //    //    param[4] = new SqlParameter("@ContractTooDate", SqlDbType.DateTime);
    //    //    param[4].Value = marhir.ContractPodTo;
    //    //    param[5] = new SqlParameter("@Position", SqlDbType.NVarChar, 200);
    //    //    param[5].Value = marhir.Position;
    //    //    param[6] = new SqlParameter("@Salary", SqlDbType.Int);
    //    //    param[6].Value = marhir.Salary;
    //    //    param[7] = new SqlParameter("@SalaryType", SqlDbType.NVarChar, 100);
    //    //    param[7].Value = marhir.SalaryType;
    //    //    param[8] = new SqlParameter("@HiredBy", SqlDbType.NVarChar, 100);
    //    //    param[8].Value = marhir.HiredBy;



    //    //    return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "sps_insertHiredProfile", param);
    //    //}

    //}
}