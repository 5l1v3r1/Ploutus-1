using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using BE_Ploutos;

namespace DA_Ploutos
{
    public class DA_GetJobApplicants
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getJobApplicants(BE_getJobApplicants beApp)
        {
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@skills", SqlDbType.VarChar, 100);
            param[0].Value = beApp.skills;
            param[1] = new SqlParameter("@location", SqlDbType.VarChar, 50);
            param[1].Value = beApp.location;
            param[2] = new SqlParameter("@expFrom", SqlDbType.VarChar, 10);
            param[2].Value = beApp.expFrom;
            param[3] = new SqlParameter("@expTo", SqlDbType.VarChar, 10);
            param[3].Value = beApp.expTo;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetJobApplicants", param);
        }
    }

    public class DA_hiredprocess
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet gethirecandidates(int order, string company)
        {
            SqlParameter param = new SqlParameter("@order", SqlDbType.Int);
            param.Value = order;
            SqlParameter param1 = new SqlParameter("@company", SqlDbType.NVarChar, 50);
            param1.Value = company;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[spsHiring]", param, param1);
        }

        public DataSet getClientView(string memid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@memid", SqlDbType.NVarChar, 50);
            param[0].Value = memid;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "sps_getclientview", param);
        }

        public DataSet getClientPostData(string memid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@memid", SqlDbType.NVarChar, 50);
            param[0].Value = memid;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "sps_getpostdata", param);
        }

        public int InsertHiredPfofile(BE_MarketingHiring marhir)
        {
            SqlParameter[] param = new SqlParameter[12];
            param[0] = new SqlParameter("@jsid", SqlDbType.NVarChar, 20);
            param[0].Value = marhir.Jsid;
            param[1] = new SqlParameter("@CompnayName", SqlDbType.NVarChar, 200);
            param[1].Value = marhir.CompanyName;
            param[2] = new SqlParameter("@AppointingDate", SqlDbType.DateTime);
            param[2].Value = marhir.AppointingDate;
            param[3] = new SqlParameter("@ContractFromDate", SqlDbType.DateTime);
            param[3].Value = marhir.ContractPodFrom;
            param[4] = new SqlParameter("@contractToDate", SqlDbType.DateTime);
            param[4].Value = marhir.ContractPodTo;
            param[5] = new SqlParameter("@Position", SqlDbType.NVarChar, 100);
            param[5].Value = marhir.Position;
            param[6] = new SqlParameter("@Salary", SqlDbType.Int);
            param[6].Value = marhir.Salary;
            param[7] = new SqlParameter("@SalartType", SqlDbType.NVarChar, 100);
            param[7].Value = marhir.SalaryType;
            param[8] = new SqlParameter("@HiredBy", SqlDbType.NVarChar, 100);
            param[8].Value = marhir.HiredBy;
            param[9] = new SqlParameter("@CompanyLocation", SqlDbType.NVarChar, 200);
            param[9].Value = marhir.CompanyLocation;
            param[10] = new SqlParameter("@JobType", SqlDbType.NVarChar, 50);
            param[10].Value = marhir.JobType;
            param[11] = new SqlParameter("@CandidateName", SqlDbType.NVarChar, 50);
            param[11].Value = marhir.CandidateName;





            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "sps_insertHiredProfile", param);
        }

        public int UpdateHiredProfile(string id, string CompanyName, DateTime AppointingDate, DateTime ContractPodFrom, DateTime ContractPodTo, string Position, string JobType, int Salary, string SalaryType)
        {

            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@id", SqlDbType.VarChar, 200);
            param[0].Value = id;
            param[1] = new SqlParameter("@CompnayName", SqlDbType.NVarChar, 200);
            param[1].Value =CompanyName;
            param[2] = new SqlParameter("@AppointingDate", SqlDbType.DateTime);
            param[2].Value = AppointingDate;
            param[3] = new SqlParameter("@ContractFromDate", SqlDbType.DateTime);
            param[3].Value = ContractPodFrom;
            param[4] = new SqlParameter("@contractToDate", SqlDbType.DateTime);
            param[4].Value = ContractPodTo;
            param[5] = new SqlParameter("@Position", SqlDbType.NVarChar, 100);
            param[5].Value =Position;
            param[6] = new SqlParameter("@Salary", SqlDbType.Int);
            param[6].Value =Salary;
            param[7] = new SqlParameter("@SalartType", SqlDbType.NVarChar, 100);
            param[7].Value = SalaryType;
            param[8] = new SqlParameter("@JobType", SqlDbType.NVarChar, 50);
            param[8].Value = JobType;

            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "Sps_UpdateHiredPFData", param);
        
        }

        public DataSet FillHiredCandidateGridData(string Jsid) {


            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Jsid", SqlDbType.NVarChar, 20);
            param[0].Value = Jsid;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Sps_GetHiredDate", param);
               
        }
        public DataSet FillCopanys() {

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Sps_GetCompanyDetails");
        }
        public DataSet FillCompanyNames()
        {

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "sps_CompaniesDDL");
        }
        public DataSet SearchCompany(string cname, string clocation)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Cname", SqlDbType.VarChar, 100);
            param[0].Value = cname;
            param[1] = new SqlParameter("@CLocation", SqlDbType.VarChar, 100);
            param[1].Value = clocation;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "sps_SearchCompanyList", param);
        }

        public DataSet GetEachCompanyDetails(string cname) { 
        
        
        
        
        
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@CompanyName", SqlDbType.NVarChar, 200);
            param[0].Value = cname;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Sps_GetEachCompanyDetails", param);
        
        
        
        
        }


          public DataSet EditHiredData(int id)
        {

            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = new SqlParameter("@id", SqlDbType.Int);
            parm[0].Value = id;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "Sps_EditHiredData", parm);

        }

    }
    public class DA_viewjobs1
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getviewjobs(int order, string company, string title)
        {
            SqlParameter param = new SqlParameter("@order", SqlDbType.Int);
            param.Value = order;
            SqlParameter param1 = new SqlParameter("@company", SqlDbType.NVarChar, 50);
            param1.Value = company;
            SqlParameter param2 = new SqlParameter("@title", SqlDbType.NVarChar, 100);
            param2.Value = title;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsViewJobs", param, param1, param2);
        }
    }
    public class DA_ScheduleJobs
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet getScheduleCandidates(string company)
        {

            SqlParameter param1 = new SqlParameter("@company", SqlDbType.NVarChar, 50);
            param1.Value = company;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsSelectedCandidates", param1);
        }
    }
    public class DA_postjobs
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet Getindustries()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "[spsgetIndustries]");
        }
        public DataSet GetLocations()
        {
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spGetLocations");
        }
        public int PostJob(BE_Employer beemp)
        {
            SqlParameter[] param = new SqlParameter[17];
            param[0] = new SqlParameter("@jobtitle", SqlDbType.VarChar, 100);
            param[0].Value = beemp.JobTitle;

            param[1] = new SqlParameter("@jobDescription", SqlDbType.VarChar, 100);
            param[1].Value = beemp.jobdesc;

            param[2] = new SqlParameter("@industry", SqlDbType.VarChar, 200);
            param[2].Value = beemp.Industry;

            param[3] = new SqlParameter("@functionalarea", SqlDbType.VarChar, 100);
            param[3].Value = beemp.Functionalarea;

            param[4] = new SqlParameter("@expmin", SqlDbType.VarChar, 100);
            param[4].Value = beemp.Expmin;

            param[5] = new SqlParameter("@expmax", SqlDbType.VarChar, 100);
            param[5].Value = beemp.Expmax;

            param[6] = new SqlParameter("@rate", SqlDbType.VarChar, 100);
            param[6].Value = beemp.Rate;

            param[7] = new SqlParameter("@location", SqlDbType.VarChar, 100);
            param[7].Value = beemp.Location;

            param[8] = new SqlParameter("@jobtype", SqlDbType.VarChar, 100);
            param[8].Value = beemp.Jobtype;

            param[9] = new SqlParameter("@Vacancies", SqlDbType.VarChar, 100);
            param[9].Value = beemp.Vacancies;

            param[10] = new SqlParameter("@responsibilities", SqlDbType.VarChar, 100);
            param[10].Value = beemp.Responsibilities;

            param[11] = new SqlParameter("@skills", SqlDbType.VarChar, 1000);
            param[11].Value = beemp.Skills;

            param[12] = new SqlParameter("@jobpostedby", SqlDbType.VarChar, 100);
            param[12].Value = beemp.Jobpostedby;

            param[13] = new SqlParameter("@contactno", SqlDbType.VarChar, 100);
            param[13].Value = beemp.Contactno;

            param[14] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[14].Value = beemp.Email;

            param[15] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[15].Value = beemp.Company;
            param[16] = new SqlParameter("@status", SqlDbType.Int);
            param[16].Value = beemp.Status;
            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsjobsposting", param);
        }
        public int updatejob(BE_Employer beemp)
        {
            SqlParameter[] param = new SqlParameter[18];
            param[0] = new SqlParameter("@jobtitle", SqlDbType.VarChar, 100);
            param[0].Value = beemp.JobTitle;

            param[1] = new SqlParameter("@jobDescription", SqlDbType.VarChar, 1000);
            param[1].Value = beemp.jobdesc;

            param[2] = new SqlParameter("@industry", SqlDbType.VarChar, 200);
            param[2].Value = beemp.Industry;

            param[3] = new SqlParameter("@functionalarea", SqlDbType.VarChar, 100);
            param[3].Value = beemp.Functionalarea;

            param[4] = new SqlParameter("@expmin", SqlDbType.VarChar, 100);
            param[4].Value = beemp.Expmin;

            param[5] = new SqlParameter("@expmax", SqlDbType.VarChar, 100);
            param[5].Value = beemp.Expmax;

            param[6] = new SqlParameter("@rate", SqlDbType.VarChar, 100);
            param[6].Value = beemp.Rate;

            param[7] = new SqlParameter("@location", SqlDbType.VarChar, 100);
            param[7].Value = beemp.Location;

            param[8] = new SqlParameter("@jobtype", SqlDbType.VarChar, 100);
            param[8].Value = beemp.Jobtype;

            param[9] = new SqlParameter("@Vacancies", SqlDbType.VarChar, 100);
            param[9].Value = beemp.Vacancies;

            param[10] = new SqlParameter("@responsibilities", SqlDbType.VarChar, 100);
            param[10].Value = beemp.Responsibilities;

            param[11] = new SqlParameter("@skills", SqlDbType.VarChar, 1000);
            param[11].Value = beemp.Skills;

            param[12] = new SqlParameter("@jobpostedby", SqlDbType.VarChar, 100);
            param[12].Value = beemp.Jobpostedby;

            param[13] = new SqlParameter("@contactno", SqlDbType.VarChar, 100);
            param[13].Value = beemp.Contactno;

            param[14] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[14].Value = beemp.Email;

            param[15] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[15].Value = beemp.Company;
            param[16] = new SqlParameter("@status", SqlDbType.Int);
            param[16].Value = beemp.Status;
            param[17] = new SqlParameter("@jobid", SqlDbType.NVarChar, 100);
            param[17].Value = beemp.Jobid;
            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsJobsPostingUpdate", param);
        }
      
    }
    public class DA_EditJobs
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public int EditJobs(BE_Employer beemp)
        {
            SqlParameter[] param = new SqlParameter[15];

            param[0] = new SqlParameter("@jobid", SqlDbType.VarChar, 100);
            param[0].Value = beemp.JobID;

            param[1] = new SqlParameter("@jobtitle", SqlDbType.VarChar, 100);
            param[1].Value = beemp.JobTitle;

            param[2] = new SqlParameter("@jobDescription", SqlDbType.VarChar, 100);
            param[2].Value = beemp.jobdesc;

            param[3] = new SqlParameter("@industry", SqlDbType.VarChar, 100);
            param[3].Value = beemp.Industry;

            param[4] = new SqlParameter("@functionalarea", SqlDbType.VarChar, 100);
            param[4].Value = beemp.Functionalarea;

            param[5] = new SqlParameter("@expmin", SqlDbType.VarChar, 100);
            param[5].Value = beemp.Expmin;

            param[6] = new SqlParameter("@expmax", SqlDbType.VarChar, 100);
            param[6].Value = beemp.Expmax;

            param[7] = new SqlParameter("@rate", SqlDbType.VarChar, 100);
            param[7].Value = beemp.Rate;

            param[8] = new SqlParameter("@location", SqlDbType.VarChar, 100);
            param[8].Value = beemp.Location;

            param[9] = new SqlParameter("@jobtype", SqlDbType.VarChar, 100);
            param[9].Value = beemp.Jobtype;

            param[10] = new SqlParameter("@Vacancies", SqlDbType.VarChar, 100);
            param[10].Value = beemp.Vacancies;

            param[11] = new SqlParameter("@skills", SqlDbType.VarChar, 1000);
            param[11].Value = beemp.Skills;

            param[12] = new SqlParameter("@jobpostedby", SqlDbType.VarChar, 100);
            param[12].Value = beemp.Jobpostedby;

            param[13] = new SqlParameter("@contactno", SqlDbType.VarChar, 100);
            param[13].Value = beemp.Contactno;

            param[14] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[14].Value = beemp.Email;



            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsjobsupdate", param);
        }
    }

    public class DA_ViewSelected
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet ViewSelectedCandidates(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = beviewselected.JobID;

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsViewCandidates", param);
        }
        public int SubmitViewSelected(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[28];
            param[0] = new SqlParameter("@firstname", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.Firstname;

            param[1] = new SqlParameter("@middlename", SqlDbType.VarChar, 100);
            param[1].Value = beviewselected.Lastname;

            param[2] = new SqlParameter("@lastname", SqlDbType.VarChar, 100);
            param[2].Value = beviewselected.Lastname;

            param[3] = new SqlParameter("@addressline1", SqlDbType.VarChar, 100);
            param[3].Value = beviewselected.Addressline1;

            param[4] = new SqlParameter("@addressline2", SqlDbType.VarChar, 100);
            param[4].Value = beviewselected.Addressline2;

            param[5] = new SqlParameter("@city", SqlDbType.VarChar, 100);
            param[5].Value = beviewselected.City;

            param[6] = new SqlParameter("@state", SqlDbType.VarChar, 100);
            param[6].Value = beviewselected.State;

            param[7] = new SqlParameter("@zip", SqlDbType.VarChar, 100);
            param[7].Value = beviewselected.Zip;

            param[8] = new SqlParameter("@phone", SqlDbType.VarChar, 100);
            param[8].Value = beviewselected.Phone;

            param[9] = new SqlParameter("@mobile", SqlDbType.VarChar, 100);
            param[9].Value = beviewselected.Mobile;

            param[10] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[10].Value = beviewselected.Email;

            param[11] = new SqlParameter("@RecentEmployer", SqlDbType.VarChar, 100);
            param[11].Value = beviewselected.RecentEmployer;

            param[12] = new SqlParameter("@JobTitle", SqlDbType.VarChar, 100);
            param[12].Value = beviewselected.Jobtype;

            param[13] = new SqlParameter("@Exp", SqlDbType.VarChar, 100);
            param[13].Value = beviewselected.Exp;

            param[14] = new SqlParameter("@LegallyUs", SqlDbType.VarChar, 100);
            param[14].Value = beviewselected.LegallyUs;

            param[15] = new SqlParameter("@education", SqlDbType.VarChar, 100);
            param[15].Value = beviewselected.Education;

            param[16] = new SqlParameter("@Category", SqlDbType.VarChar, 100);
            param[16].Value = beviewselected.Category;

            param[17] = new SqlParameter("@Position", SqlDbType.VarChar, 100);
            param[17].Value = beviewselected.Position;

            param[18] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[18].Value = beviewselected.Company;

            param[19] = new SqlParameter("@positiongiven", SqlDbType.VarChar, 100);
            param[19].Value = beviewselected.Positiongiven;

            param[20] = new SqlParameter("@rate", SqlDbType.VarChar, 100);
            param[20].Value = beviewselected.Rate;


            param[21] = new SqlParameter("@jobtype", SqlDbType.VarChar, 100);
            param[21].Value = beviewselected.Jobtype;

            param[22] = new SqlParameter("@startdate", SqlDbType.DateTime);
            param[22].Value = beviewselected.Startdate;

            param[23] = new SqlParameter("@enddate", SqlDbType.VarChar, 50);
            param[23].Value = beviewselected.Enddate;

            param[24] = new SqlParameter("@joiningdate", SqlDbType.DateTime);
            param[24].Value = beviewselected.Joiningdate;

            param[25] = new SqlParameter("@jobid", SqlDbType.VarChar, 100);
            param[25].Value = beviewselected.jobid;

            param[26] = new SqlParameter("@jobseekerid", SqlDbType.VarChar, 100);
            param[26].Value = beviewselected.Jobseekerid;

            param[27] = new SqlParameter("@ratetype", SqlDbType.VarChar, 50);
            param[27].Value = beviewselected.RateType;



            return SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsSubmitSelectedCanditates", param);
        }


    }
    public class DA_Employer
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public void EditEmployee(BE_ViewSelected beviewselected)
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

        public string EmpReg(BE_ViewSelected beview)
        {
            SqlParameter[] param = new SqlParameter[16];

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

            param[15] = new SqlParameter("@Message", SqlDbType.VarChar, 50);
            param[15].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spEmployerReg", param);
            return Convert.ToString(param[15].Value);
        }
    }
    public class DA_ContarctEmployee
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet ContractEmp(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.Company;

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsContarctEmployes", param);
        }

        public DataSet ViewContractEmployee(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@JobID", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.JobID;

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsViewContarctEmployee", param);
        }
    }


    public class DA_PremanentEmployee
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet PremanentEmp(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.Company;

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsPremanentEmployes", param);
        }
        public DataSet ViewPremanentEmployee(BE_ViewSelected beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@JobID", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.JobID;

            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsViewPremanentEmployee", param);
        }


    }


    public class DA_SubUsers
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public string SubUserReg(BE_ViewSelected beview)
        {
            SqlParameter[] param = new SqlParameter[16];
            param[0] = new SqlParameter("@ContactInfo", SqlDbType.VarChar, 50);
            param[0].Value = beview.Contact;

            param[1] = new SqlParameter("@Mobile", SqlDbType.VarChar, 50);
            param[1].Value = beview.Mobile;

            param[2] = new SqlParameter("@email", SqlDbType.VarChar, 50);
            param[2].Value = beview.Email;

            param[3] = new SqlParameter("@CompanyName ", SqlDbType.VarChar, 50);
            param[3].Value = beview.Company;

            param[4] = new SqlParameter("@RefID", SqlDbType.VarChar, 10);
            param[4].Value = beview.RefID;

            param[5] = new SqlParameter("@Pwd", SqlDbType.VarChar, 50);
            param[5].Value = beview.pwd;

            param[6] = new SqlParameter("@role", SqlDbType.Int);
            param[6].Value = beview.Role;

            param[7] = new SqlParameter("@Category", SqlDbType.VarChar, 50);
            param[7].Value = beview.Category;

            param[8] = new SqlParameter("@ContactNum", SqlDbType.VarChar, 50);
            param[8].Value = beview.Phone;

            param[9] = new SqlParameter("@city", SqlDbType.VarChar, 100);
            param[9].Value = beview.City;

            param[10] = new SqlParameter("@state", SqlDbType.VarChar, 50);
            param[10].Value = beview.State;

            param[11] = new SqlParameter("@zipcode", SqlDbType.VarChar, 50);
            param[11].Value = beview.Zip;

            param[12] = new SqlParameter("@address1", SqlDbType.VarChar, 100);
            param[12].Value = beview.Addressline1;

            param[13] = new SqlParameter("@Website", SqlDbType.VarChar, 100);
            param[13].Value = beview.Website;

            param[14] = new SqlParameter("@ActiveStatus", SqlDbType.Int);
            param[14].Value = beview.ActiveStatus;

            param[15] = new SqlParameter("@Message", SqlDbType.VarChar, 50);
            param[15].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spEmployerReg", param);
            return Convert.ToString(param[15].Value);
        }
        public DataSet GetSubUSers(BE_SubUSers beviewselected)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@company", SqlDbType.VarChar, 100);
            param[0].Value = beviewselected.Company;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsgetSubUsers", param);
        }
        public DataSet GetUsersListInSubUsers(BE_Employer beemp)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@email", SqlDbType.VarChar, 100);
            param[0].Value = beemp.Company;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsGetDetails", param);

        }
        public DataSet CheckNumUsers(BE_SubUSers besub)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@MemID", SqlDbType.VarChar, 100);
            param[0].Value = besub.MemID;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsCheckUsers", param);
        }
    }

    public class DA_ActiveSubUSer
    {
        string connectionString = ConfigurationManager.AppSettings["connstrng"].ToString();
        public DataSet updatestatus(string userid)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
            param[0].Value = userid;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsActive", param);
        }
        public DataSet countSubUser(BE_SubUSers besubuser)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@refid", SqlDbType.NVarChar, 100);
            param[0].Value = besubuser.MemID;
            //param[1] = new SqlParameter("@id", SqlDbType.Int);
            //param[1].Value = besubuser.MemID;
            return SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure, "spsCountSubUser", param);
        }
        public void deleteSubUser(BE_SubUSers besub)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
            param[0].Value = besub.Email;
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "spsDeleteSubUser", param);
        }
    }

    public class DA_TimeSheet
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


    }

}  
      
       
       
         
       
      
      
       
        
        
        
       
      
       
