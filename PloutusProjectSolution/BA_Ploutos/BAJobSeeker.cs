using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BE_Ploutos;
using DA_Ploutos;
using System.Data;

namespace BA_Ploutos
{
    public class BAJobSeeker
    {
        DAJobSeeker DAreg = new DAJobSeeker();
        public string regJobSeeker(BEJobSeeker beReg)
        {
            return DAreg.registerJobSeeker(beReg);
        }

        public DataSet getMemCompleteDetails(BEMemDetails beMem)
        {
            return DAreg.getMemCompleteDetails(beMem);
        }

        public string getLogin(BELogin beLogin)
        {
            return DAreg.getLogin(beLogin);
        }

        public DataSet getMemDetails(BEMemDetails beMem)
        {
            return DAreg.getMemDetails(beMem);
        }

        public string getMemLastLogin(BEMemDetails beMem)
        {
            return DAreg.getMemLastLogin(beMem);
        }

        public void updateMemReg(BEJobSeeker beReg, BEMemDetails beMem)
        {
            DAreg.updateMemReg(beReg, beMem);
        }
        public string Updateresume(BEUpdateResume beresm)
        {
            return DAreg.updateresume(beresm);
        }
        public string UpdateJSpassword(BE_JSUpdatePassword beJspass)
        {
            return DAreg.updateJspassword(beJspass);
        }

        public DataSet GetMemActivity(BEJobSeeker bemem)
        {
            return DAreg.getMemActivity(bemem);
        }

        public DataSet GetCatogories()
        {
            return DAreg.getCatogories();
        }

        public DataSet GetPreferedLoactions()
        {
            return DAreg.getPreferedLoactions();
        }
    
        public void ActivateJobSeeker(BE_JsAppliedJobs beactivate)
        {
            DAreg.ActivateJobSeeker(beactivate);
        }

        public string ResetPswJobSeeker(BEMemDetails beMem)
        {
            return DAreg.ResetPswJobSeeker(beMem);
        }
    }

    public class BAEssentials
    {
        DAEssentials daEss = new DAEssentials();
        public DataSet getCategories()
        {
            return daEss.getCategories();
        }

        public DataSet getPreLoc()
        {
            return daEss.getPreLoc();
        }
        public DataSet getFunctionalAreas(BEEssentials beEss)
        {
            return daEss.getFunctionalArea(beEss);
        }
    }

    public class BAJobSearch
    {
        DAJobSearch daJob = new DAJobSearch();
        public DataSet getJobs(BEGetJobs beJobs)
        {
            return daJob.getJobs(beJobs);
        }
        //public DataSet getJobsApplied(BEMemDetails beMem)
        //{
        //    return daJob.getJobsApplied(beMem);
        //} 


        public DataSet getJobsApplied(BEMemDetails beApplied)
        {
            return daJob.getJobsApplied(beApplied);
        }
    }
  
    public class BA_Jobseeker
    {
        DA_viewjobs daviewjobs = new DA_viewjobs();
        public DataSet getjobseeker(int order)
        {
            return daviewjobs.getviewjobs(order);
        }
    }

    public class BA_JobAlerts
    {
        DA_JobAlerts daJob = new DA_JobAlerts();
        public void SetJobAlert(BEJobAlerts beJobAlert)
        {
            daJob.setJobAlerts(beJobAlert);
        }

        public DataSet GetJobAlerts(BEJobAlerts beJobAlert)
        {
          return  daJob.getJobAlerts(beJobAlert);
        }


        public DataSet GetJsJobAlertModify(BEJobAlerts bejob)
        {
            return daJob.getJsJobAlertModify(bejob);
        }

        public string DeleteJsJobAlert(BEJobAlerts bejob)
        {
            return daJob.deleteJsJobAlert(bejob);
        }
    }

    public class BA_JobSeekerCategories
    {
        DA_JobSeekerCategories jobcat = new DA_JobSeekerCategories();


        public DataSet Getjobseekercategories(string CatLoc, string Type)
        {
            return jobcat.getjobseekercategories(CatLoc, Type);
        }
    }
    public class BA_jobseekercatandloc
    {
        DA_JobSeekercatandloc jobseekercatloc = new DA_JobSeekercatandloc();
        public DataSet Getjobseekercat()
        {
            return jobseekercatloc.getjobseekercat();
        }
        public DataSet GetJssearchJobs(string FunAreaLoc, string Type, string Order, string MCat, string MType)
        {
            return jobseekercatloc.getjssearchJobs(FunAreaLoc, Type, Order, MCat, MType);
        }
        public DataSet GetJSJobloc()
        {
            return jobseekercatloc.getJsJobloc();
        }
    }

    public class BA_JobSeekerDesiredJobs
    {
        Da_JobSeekerDesiredJobs jobseekerdesired = new Da_JobSeekerDesiredJobs();


        public DataSet GetDesiredJobAlerts(BEJobAlerts beJobAlert)
        {
            return jobseekerdesired.getdesiredjobs(beJobAlert);
        }
    }
    public class BA_JSViewDetails
    {
        DA_JsAppliedJobs jsview = new DA_JsAppliedJobs();
        public DataSet GetDetails(string rowid)
        {
            return jsview.getDetails(rowid);
        }


        public string GetAppliedJobs(BE_JsAppliedJobs beview)
        {
            return jsview.getAppliedJobs(beview);
        }
    }
}
