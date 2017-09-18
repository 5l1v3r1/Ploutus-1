using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DA_Ploutos;
using System.Data;
using BE_Ploutos;


namespace BA_Ploutos
{
    class BA_Employee
    {
    }
    public class BA_SearchJobSeeker1
    {
        DA_JobSeeker daJobseeker = new DA_JobSeeker();
        public DataSet GetJobseekersByCategory(string Type)
        {
            return daJobseeker.GetJobseekersByCategory(Type);
        }

        public DataSet GetJobseekers(string Category)
        {
            return daJobseeker.GetJobseekers(Category);
        }

        public DataSet GetSingleMemDetails(string Id)
        {
            return daJobseeker.GetSingleMemDetails(Id);
        }



        public DataSet GetUnselectJobseekers(string Category, string exp, string title)
        {
            return daJobseeker.GetUnselectJobseekers(Category, exp, title);
        }
    }
    public class BA_Employloginbyemailid1
    {
        DA_EmpLoginByEmailid emplgnemailid = new DA_EmpLoginByEmailid();
        public DataSet Getemploginbyemailid(string emailid, string password)
        {
            return emplgnemailid.Getemploginbyemailid(emailid, password);
        }
        public DataSet getloginforActivation(string id)
        {
            return emplgnemailid.getloginforActivation(id);
        }
        public void activeCom(string id)
        {
            emplgnemailid.ActivateComp(id);
        }
    }
    public class BA_JobCategories
    {
        DA_JobCategories jobcat = new DA_JobCategories();


        public DataSet Getjobcategories(string CatLoc, string Type)
        {
            return jobcat.Getjobcategories(CatLoc, Type);
        }
    }
    public class BA_MerActivation
    {
        DA_Meractivation meractive = new DA_Meractivation();
        public DataSet GetMerchantsList()
        {
            return meractive.GetMerchantsListstatus();
        }
        public DataSet GetSingleMemDetails(string Id)
        {
            return meractive.GetSingleMemDetails(Id);
        }
    }
    public class BA_Merchants
    {
        DA_Merchants mer = new DA_Merchants();
        public DataSet GetPostingJobs()
        {
            return mer.GetPostingJobs();
        }
        public DataSet GetPostingJobs(string FunAreaLoc, string Type,string Order,string MCat,string MType)
        {
            return mer.GetPostingJobs(FunAreaLoc, Type,Order,MCat,MType);
        }

        public DataSet GetMerchantsList(int Type,string Order)
        {
            return mer.GetMerchantsList(Type,Order);
        }

        public DataSet GetSearchMerchantsList(int Type, string Order, string companyname, string location)
        {
            return mer.GetSearchMerchantsList(Type, Order, companyname, location);
        }


        public DataSet GetMerchantDetails(int Id)
        {
            return mer.GetMerchantDetails(Id);
        }

   public DataSet GetFileName(string id)
        {
            return mer.GetJSMFile(id);
        }

       
        public DataSet GetPostedJobsInfo(string id)
        {
            return mer.GetPostedJobsInfo(id);
        }

        public DataSet GetRecentPostJobs(string OrderBy,int Type)
        {
            return mer.GetRecentPostJobs(OrderBy, Type);
        }
        public void upadetstatus(int id)
        {
            mer.updatestutus(id);
        }
        public void upadateViaEmail(int id, string password)
        {
            mer.updateViaEmail(id, password);
        }
    }
  
    public class BA_ViewDetails
    {
        DA_ViewDetails view = new DA_ViewDetails();
        public DataSet GetDetails(string rowid)
        {
            return view.GetDetails(rowid);
        }

        public DataSet GetComAndJobDetails(string Jobid)
        {
            return view.GetComAndJobDetails(Jobid);
        }
    }
    public class BAUserHome1
    {
        DAUserHome User = new DAUserHome();
        public DataSet Getuserinfo(string id)
        {
            return User.Getuserinfo(id);
        }
        public DataSet GetLastLoginInfo(string id)
        {
            return User.GetLastLoginInfo(id);
        }
    }
    public class BA__changepassword
    {
        DA_changepassword dachange = new DA_changepassword();
        public DataSet getoldpassword(string id)
        {
            return dachange.GetpasswordDetails(id);
        }
        public void upadtepassword(string id, string newpassword)
        {
            dachange.updatepassword(id, newpassword);
        }
    }
    public class BA_EmployRegistration
    {
        DA_EmployRegistration daempr = new DA_EmployRegistration();

        public DataSet GetRole()
        {
            return daempr.GetRole();
        }
    }
    public class BA_ResetPassword
    {
        DA_ResetPassword DAR = new DA_ResetPassword();

        public DataSet Getroleid()
        {
            return DAR.Getroleid();
        }
        public DataSet Getuserid(int role)
        {
            return DAR.Getuserid(role);
        }
        public int resetpwd(string Emailid, string pwd)
        {
            return DAR.resetpwd(Emailid, pwd);
        }
    }
    public class BA_Listofusers
    {
        DA_Listofusers daluser = new DA_Listofusers();

        public DataSet Getlistusers()
        {
            return daluser.Getlistusers();
        }
    }
    public class BA_Process
    {
        DA_Process process = new DA_Process();
        public int SelectUsers(string jsids, string JobId,int Type)
        {
            return process.SelectUsers(jsids, JobId, Type);
        }
    }
    public class BA_emphomepage
    {
        DA_emphomepage daemp = new DA_emphomepage();
        public DataSet getlogindetais(string id)
        {
            return daemp.getlogindetails(id);
        }
    }
    //public class BA_HiringProcess
    //{
    //    //DA_MHiringProcess hire = new DA_MHiringProcess();
    //    public DataSet GetHiredCandidates(int type,string Company)
    //    {
    //        return hire.GetHiredCandidates(type, Company);
    //    }

    //    public DataSet GetHiredCompanies()
    //    {
    //        return hire.GetHiredCompanies();
    //    }
    //}
    public class BA_jobcatandloc
    {
        DA_Jobcatandloc jobcatloc = new DA_Jobcatandloc();
        public DataSet getjobcat()
        {
            return jobcatloc.getjobcat();
        }
        public DataSet GetJobloc()
        {
            return jobcatloc.GetJobloc();
        }
    }
    public class BA_jobseekerlist
    {
        DA_Jobseekerslist jbsl = new DA_Jobseekerslist();

        public DataSet Getjobseekercat()
        {
            return jbsl.Getjobseekercat();
        }
        public DataSet Getjobseekerloc()
        {
            return jbsl.Getjobseekerloc();
        }
    }
    public class BA_Memsubcatlist
    {
        DA_Memsubcatlist daml = new DA_Memsubcatlist();

        public DataSet GetMemcatloclist(string CatLoc, string Type)
        {
            return daml.GetMemcatloclist(CatLoc, Type);
        }
    }

    public class BA_MemList
    {
        DA_MemList daml = new DA_MemList();
        public DataSet GetMemList(string jobLoc, string type, string maincat, string maintype)
        {
            return daml.GetMemList(jobLoc, type, maincat, maintype);
        }
    }
    public class BA_Activities
    {
        DA_Activities act = new DA_Activities();
        public DataSet GetAllActivities(string Jsid)
        {
            return act.GetAllActivities(Jsid);
        }

        public void CreateActivity(BE_Activity BEAct)
        {
            act.CreateActivity(BEAct);
        }
        public DataSet GetscheduleInfo(int Type)
        {
            return act.GetScheduInfo(Type);
        }
        public void Hiringactivity(BE_Activity BEAct)
        {
            act.Hiringactivity(BEAct);
        }

        public void DeleteActivity(string Id)
        {
            act.DeleteActivity(Id);
        }
        public DataSet Getnewdsactivities(string Jsid)
        {
            return act.Getnewdsactivities(Jsid);
        }

    }
    public class BA_Timesheet1
    {
        DA_TimeSheet1 datime = new DA_TimeSheet1();
        public DataSet GetTimeSheetInfo(string id)
        {
            return datime.GetTimeSheetInfo(id);
        }
        public DataSet GetComList()
        {
            return datime.GetComList();
        }
        public void InsertTimeSheet(string x, string y, string day, string psic, string totaltime, string worktype, string company)
        {
            datime.InsertTimeSheet(x, y, day, psic, totaltime, worktype, company);
        }
        public void InsertOff(string day, string psic, string worktype)
        {
            datime.Insoff(day, psic, worktype);
        }

        public DataSet GetTimes(string sid, string ids)
        {
            return datime.GetTimeToEdit(sid, ids);
        }

        public DataSet GetUserReports(string id, string user, string startdt, string enddt)
        {
            return datime.GetUserReport(id, user, startdt, enddt);
        }

        public DataSet GetCompanyReports(string id, string startdt, string enddt)
        {
            return datime.GetCompanyReport(id, startdt, enddt);
        }
        public DataSet GetUsers(string id)
        {
            return datime.GetUsers(id);
        }
        public DataSet GetclientCandidates(string id)
        {
            return datime.GetClientList(id);
        }

       
        public DataSet Getuserlist()
        {
            return datime.Getuserlist();
        }
        public DataSet getuserlistid(string id)
        {
            return datime.getuserlistid(id);
        }
        public DataSet GetallinGrid(string startdt, string enddt, string company1)
        {
            return datime.GetallinGrid(startdt, enddt, company1);
        }
        public DataSet GetcompinGrid(string startdt, string enddt, string Company, string user)
        {
            return datime.GetcompinGrid(startdt, enddt, Company, user);
        }
    }
    public class BA_Search
    {
        DA_Search dasearch = new DA_Search();
        public DataSet fillcategory()
        {
            return dasearch.FillCategory();
        }
        public DataSet getmatchedresource(string compname, string category, string state, string city)
        {
            return dasearch.GetMatchedResource(compname, category, state, city);
        }
        public DataSet getmatchedresource1(string jobtitle, string category, string state, string city, string expfrom, string expto)
        {
            return dasearch.getmatchedresource1(jobtitle, category, state, city, expfrom, expto);
        }
        public DataSet getCity(string state)
        {
            return dasearch.GetCity(state);
        }

    }
    //public class BA_Marketing
    //{
    //    DA_Marketingsearch mar = new DA_Marketingsearch();
    //    public DataSet fillcategory()
    //    {
    //        return mar.FillCategory();
    //    }
    //    public DataSet FillmarketList()
    //    {
    //        return mar.FillDatalist();
    //    }
    //    public DataSet SearchMarketlist(string name, string expfrom, string expto, string industry)
    //    {
    //        return mar.SearchMarKetList(name, expfrom, expto, industry);
    //    }
    //}
}
