using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using BE_Ploutos;
using System.Data;

namespace DA_Ploutos
{
    public class DAJobSeeker
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public string registerJobSeeker(BEJobSeeker beReg)
        {
            SqlParameter[] param = new SqlParameter[22];
            param[0] = new SqlParameter("@Fname", SqlDbType.VarChar, 100);
            param[0].Value = beReg.firstName;
            param[1] = new SqlParameter("@MName", SqlDbType.VarChar, 5);
            param[1].Value = beReg.middleName;
            param[2] = new SqlParameter("@Lname", SqlDbType.VarChar, 100);
            param[2].Value = beReg.lastName;
            param[3] = new SqlParameter("@Add1", SqlDbType.VarChar);
            param[3].Value = beReg.address1;
            param[4] = new SqlParameter("@Add2", SqlDbType.VarChar);
            param[4].Value = beReg.address2;
            param[5] = new SqlParameter("@city", SqlDbType.VarChar, 200);
            param[5].Value = beReg.city;
            param[6] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[6].Value = beReg.state;
            param[7] = new SqlParameter("@zip", SqlDbType.VarChar, 20);
            param[7].Value = beReg.zip;
            param[8] = new SqlParameter("@Phone", SqlDbType.VarChar, 20);
            param[8].Value = beReg.phone;
            param[9] = new SqlParameter("@Mobile", SqlDbType.VarChar, 20);
            param[9].Value = beReg.mobile;
            param[10] = new SqlParameter("@Email", SqlDbType.VarChar, 200);
            param[10].Value = beReg.email;
            param[11] = new SqlParameter("@LegallyUs", SqlDbType.VarChar, 10);
            param[11].Value = beReg.legallyUs;
            param[12] = new SqlParameter("@RecentEmployer", SqlDbType.VarChar, 200);
            param[12].Value = beReg.mRecentEmp;
            param[13] = new SqlParameter("@JobTitle", SqlDbType.VarChar, 200);
            param[13].Value = beReg.jobTitle;
            param[14] = new SqlParameter("@FiledofExpertise", SqlDbType.VarChar, 200);
            param[14].Value = beReg.fieldExpertise;
            param[15] = new SqlParameter("@Exp", SqlDbType.VarChar, 20);
            param[15].Value = beReg.experience;
            param[16] = new SqlParameter("@PrefLoc", SqlDbType.VarChar, 50);
            param[16].Value = beReg.prefLoc;
            param[17] = new SqlParameter("@Education", SqlDbType.VarChar, 50);
            param[17].Value = beReg.HighEdu;
            param[18] = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            param[18].Value = beReg.password;
            param[19] = new SqlParameter("@filename", SqlDbType.VarChar, 10);
            param[19].Value = beReg.filename;
            param[20] = new SqlParameter("@Message", SqlDbType.VarChar, 50);
            param[20].Direction = ParameterDirection.Output;
            param[21] = new SqlParameter("@RegSession", SqlDbType.NVarChar, 50);
            param[21].Value = beReg.tempId;

            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsMemRegForUploadResume", param);
            return Convert.ToString(param[20].Value);
        }
        
        public DataSet getMemDetails(BEMemDetails beMem)
        {
            SqlParameter param = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param.Value = beMem.email;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetMemInfo", param);
        }

        public DataSet getMemCompleteDetails(BEMemDetails beMem)
        {
            SqlParameter param = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param.Value = beMem.email;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetMemCompleteDetails", param);
        }

        public string getLogin(BELogin beLogin)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param[0].Value = beLogin.email;
            param[1] = new SqlParameter("@pass", SqlDbType.NVarChar, 50);
            param[1].Value = beLogin.password;
            param[2] = new SqlParameter("@message", SqlDbType.VarChar, 200);
            param[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsMemCredentials", param);
            return Convert.ToString(param[2].Value);

        }

        public string getMemLastLogin(BEMemDetails beMem)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param[0].Value = beMem.email;
            param[1] = new SqlParameter("@lastlogouttime", SqlDbType.NVarChar, 50);
            param[1].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetMemLastLogin", param);
            return Convert.ToString(param[1].Value);
        }

        public void updateMemReg(BEJobSeeker beReg, BEMemDetails beMem)
        {
            SqlParameter[] param = new SqlParameter[19];
            param[0] = new SqlParameter("@firstname", SqlDbType.VarChar, 100);
            param[0].Value = beReg.firstName;
            param[1] = new SqlParameter("@middlename", SqlDbType.VarChar, 5);
            param[1].Value = beReg.middleName;
            param[2] = new SqlParameter("@lastname", SqlDbType.VarChar, 100);
            param[2].Value = beReg.lastName;
            param[3] = new SqlParameter("@address1", SqlDbType.VarChar);
            param[3].Value = beReg.address1;
            param[4] = new SqlParameter("@address2", SqlDbType.VarChar);
            param[4].Value = beReg.address2;
            param[5] = new SqlParameter("@city", SqlDbType.VarChar, 200);
            param[5].Value = beReg.city;
            param[6] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[6].Value = beReg.state;
            param[7] = new SqlParameter("@zip", SqlDbType.VarChar, 20);
            param[7].Value = beReg.zip;
            param[8] = new SqlParameter("@Phone", SqlDbType.VarChar, 20);
            param[8].Value = beReg.phone;
            param[9] = new SqlParameter("@Mobile", SqlDbType.VarChar, 20);
            param[9].Value = beReg.mobile;
            param[10] = new SqlParameter("@Email", SqlDbType.VarChar, 200);
            param[10].Value = beReg.email;
            param[11] = new SqlParameter("@LegallyUs", SqlDbType.VarChar, 10);
            param[11].Value = beReg.legallyUs;
            param[12] = new SqlParameter("@RecentEmp", SqlDbType.VarChar, 200);
            param[12].Value = beReg.mRecentEmp;
            param[13] = new SqlParameter("@JobTitle", SqlDbType.VarChar, 200);
            param[13].Value = beReg.jobTitle;
            param[14] = new SqlParameter("@category", SqlDbType.VarChar, 200);
            param[14].Value = beReg.fieldExpertise;
            param[15] = new SqlParameter("@Exp", SqlDbType.VarChar, 20);
            param[15].Value = beReg.experience;
            param[16] = new SqlParameter("@preferredLoc", SqlDbType.VarChar, 50);
            param[16].Value = beReg.prefLoc;
            param[17] = new SqlParameter("@Education", SqlDbType.VarChar, 50);
            param[17].Value = beReg.HighEdu;
            param[18] = new SqlParameter("@memEmail", SqlDbType.NVarChar, 50);
            param[18].Value = beMem.email;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsUpdateMemberReg", param);

        }

        public string updateresume(BEUpdateResume beresm)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@filename", SqlDbType.NVarChar, 100);
            param[0].Value = beresm.filename;
            param[1] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param[1].Value = beresm.email;
            param[2] = new SqlParameter("@message", SqlDbType.VarChar, 200);
            param[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsUpdateJobseekerResume", param);
            return Convert.ToString(param[2].Value);
        }

        public string updateJspassword(BE_JSUpdatePassword beJspass)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 100);
            param[0].Value = beJspass.email;
            param[1] = new SqlParameter("@OldPassword", SqlDbType.VarChar, 50);
            param[1].Value = beJspass.oldpassword;
            param[2] = new SqlParameter("@Password", SqlDbType.VarChar, 50);
            param[2].Value = beJspass.password;
            param[3] = new SqlParameter("@message", SqlDbType.VarChar, 200);
            param[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsJobSeekerChangePass", param);
            return Convert.ToString(param[3].Value);
        }

        public DataSet getMemActivity(BEJobSeeker bemem)
        {
            SqlParameter param = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param.Value = bemem.email;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsJSLogininf", param);
        }

        public DataSet getCatogories()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsgetCategories");
        }

        public DataSet getPreferedLoactions()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsgetPreLoc");
        }

        public void ActivateJobSeeker(BE_JsAppliedJobs beactivate)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param[0].Value = beactivate.email;
            param[1] = new SqlParameter("@regSession", SqlDbType.NVarChar, 50);
            param[1].Value = beactivate.JId;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsActivateJobSeeker", param);
        }

        public string ResetPswJobSeeker(BEMemDetails beMem)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param[0].Value = beMem.email;
            param[1] = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            param[1].Value = beMem.password;
            param[2] = new SqlParameter("@result", SqlDbType.NVarChar, 50);
            param[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsSetForgotPassword", param);
            return Convert.ToString(param[2].Value);
        }

        public string InsertCandidateData(BEJobSeeker bemarreg)
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
            param[5].Value = bemarreg.address1;
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
            param[12].Value = "docx";
            param[13] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 50);
            param[13].Value = bemarreg.phone;
            param[14] = new SqlParameter("@Status", SqlDbType.VarChar, 1000);
            param[14].Value = bemarreg.Status;
            DataSet ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "sps_inSertCandidateResumData", param);
            return ds.Tables[0].Rows[0][0].ToString();
        }
    }

    public class DAEssentials
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getCategories()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsgetCategories");
        }

        public DataSet getPreLoc()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsgetPreLoc");
        }
        public DataSet getFunctionalArea(BEEssentials beEss)
        {
            SqlParameter param = new SqlParameter("@id", SqlDbType.Int);
            param.Value = Convert.ToInt32(beEss.catagory);
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetFunctionalArea", param);
        }

    }

    public class DAJobSearch
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getJobs(BEGetJobs beJobs)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@category", SqlDbType.NVarChar, 50);
            param[0].Value = beJobs.category;
            param[1] = new SqlParameter("@location", SqlDbType.NVarChar, 50);
            param[1].Value = beJobs.location;
            param[2] = new SqlParameter("@jobtitle", SqlDbType.NVarChar, 50);
            param[2].Value = beJobs.jobtitle;
            param[3] = new SqlParameter("@searchoption", SqlDbType.NVarChar, 50);
            param[3].Value = beJobs.searchoption;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetJobs", param);
        }
        public DataSet getJobsApplied(BEMemDetails beMem)
        {
            SqlParameter param = new SqlParameter("@email", SqlDbType.NVarChar, 50);
            param.Value = beMem.email;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetJobsApplied", param);
        }
    }

    public class DA_viewjobs
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getviewjobs(int order)
        {
            SqlParameter param = new SqlParameter("@order", SqlDbType.Int);
            param.Value = order;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsViewJobs", param);
        }
    }
    public class DA_JobAlerts
    {
        string connnectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public void setJobAlerts(BEJobAlerts beAlerts)
        {
            SqlParameter[] param = new SqlParameter[10];
            param[0] = new SqlParameter("@jobSeekerID", SqlDbType.NVarChar, 100);
            param[0].Value = beAlerts.jobSeekerID;
            param[1] = new SqlParameter("@createdDate", SqlDbType.DateTime);
            param[1].Value = beAlerts.createdDate;
            param[2] = new SqlParameter("@keywords", SqlDbType.NVarChar, 100);
            param[2].Value = beAlerts.keywords;
            param[3] = new SqlParameter("@location", SqlDbType.VarChar, 100);
            param[3].Value = beAlerts.location;
            param[4] = new SqlParameter("@category", SqlDbType.NVarChar, 150);
            param[4].Value = beAlerts.category;
            param[5] = new SqlParameter("@functionalarea", SqlDbType.NVarChar, 150);
            param[5].Value = beAlerts.functionalarea;
            param[6] = new SqlParameter("@expYears", SqlDbType.Int);
            param[6].Value = beAlerts.expYears;
            param[7] = new SqlParameter("@expMonths", SqlDbType.Int);
            param[7].Value = beAlerts.expMonths;
            param[8] = new SqlParameter("@id", SqlDbType.Int);
            param[8].Value = beAlerts.id;
            param[9] = new SqlParameter("@type", SqlDbType.Int);
            param[9].Value = beAlerts.type;
            SqlHelper.ExecuteNonQuery(connnectionString, CommandType.StoredProcedure, "spsSetJobAlert", param);
        }

        public DataSet getJobAlerts(BEJobAlerts beAlerts)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@jobSeekerID", SqlDbType.NVarChar, 100);
            param[0].Value = beAlerts.jobSeekerID;
            param[1] = new SqlParameter("@type", SqlDbType.Int);
            param[1].Value = beAlerts.type;
            param[2] = new SqlParameter("@id", SqlDbType.Int);
            param[2].Value = beAlerts.id;
            return SqlHelper.ExecuteDataset(connnectionString, CommandType.StoredProcedure, "spsGetJobAlerts", param);
        }


        public DataSet getJsJobAlertModify(BEJobAlerts bejob)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@type", SqlDbType.Int);
            param[0].Value = bejob.type;
            param[1] = new SqlParameter("@id", SqlDbType.Int);
            param[1].Value = bejob.id;
            return SqlHelper.ExecuteDataset(connnectionString, CommandType.StoredProcedure, "spsJsJobAlertModify", param);
        }

        public string deleteJsJobAlert(BEJobAlerts bejob)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = bejob.id;
            param[1] = new SqlParameter("@message", SqlDbType.VarChar, 200);
            param[1].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteDataset(connnectionString, CommandType.StoredProcedure, "spsDeleteJsJobAlert", param);
            return Convert.ToString(param[1].Value);
        }
    }

    public class DA_JobSeekerCategories
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());
       
        public DataSet getjobseekercategories(string CatLoc, string Type)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@CatLoc", SqlDbType.NVarChar, 100);
            param[0].Value = CatLoc;
            param[1] = new SqlParameter("@Type", SqlDbType.Int);
            param[1].Value = Type;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjobseekersubcatloc", param);
        }
    }
    public class DA_JobSeekercatandloc
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet getjobseekercat()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjsjobstitle");
        }
        //public DataSet getJobseekerloc()
        //{
        //    return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "[sp_Getjobloc]");
        //}

        public DataSet getjssearchJobs(string FunAreaLoc, string Type, string Order, string MCat, string MType)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@FunAreaLoc", SqlDbType.NVarChar, 100);
            param[0].Value = FunAreaLoc;
            param[1] = new SqlParameter("@Type", SqlDbType.Int);
            param[1].Value = Type;
            param[2] = new SqlParameter("@Order", SqlDbType.Int);
            param[2].Value = Order;
            param[3] = new SqlParameter("@MCat", SqlDbType.VarChar, 200);
            param[3].Value = MCat;
            param[4] = new SqlParameter("@MType", SqlDbType.Int);
            param[4].Value = MType;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjsssearchJobs", param);
        }

        public DataSet getJsJobloc()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetJsjobloc");
        }
    }

    public class Da_JobSeekerDesiredJobs
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet getdesiredjobs(BEJobAlerts beJobAlert)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@location", SqlDbType.VarChar, 100);
            param[0].Value = beJobAlert.location;
            param[1] = new SqlParameter("@category", SqlDbType.VarChar, 100);
            param[1].Value = beJobAlert.category;
            param[2] = new SqlParameter("@keyword", SqlDbType.VarChar, 100);
            param[2].Value = beJobAlert.keywords;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetJobSeekerDesiredJobs", param);
        }
    }

    public class DA_JsAppliedJobs
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

        public DataSet getDetails(string rowid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@rowid", SqlDbType.Int);
            param[0].Value = rowid;
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsGetjobdetails", param);
        }

        public string getAppliedJobs(BE_JsAppliedJobs beview)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[0].Value = beview.email;
            param[1] = new SqlParameter("@jobid", SqlDbType.VarChar, 20);
            param[1].Value = beview.JId;
            param[2] = new SqlParameter("@Message", SqlDbType.VarChar, 20);
            param[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "SpsJobSeekerApply", param);
            return Convert.ToString(param[2].Value);
        }
    }
}
