using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DA_Ploutos;
using System.Data;
using BE_Ploutos;

namespace BA_Ploutos
{
    public class BA_GetJobApplicants
    {
        DA_GetJobApplicants daJS = new DA_GetJobApplicants();
        public DataSet getJobApplicants(BE_getJobApplicants beApp)
        {
            return daJS.getJobApplicants(beApp);
        }
    }

    public class BA_hiringprocess
    {
        DA_hiredprocess dahired = new DA_hiredprocess();
        public DataSet gethiredprocess(int order, string company)
        {
            return dahired.gethirecandidates(order, company);
        }
    }
    public class BA_Jobseeker1
    {
        DA_viewjobs1 daviewjobs = new DA_viewjobs1();
        public DataSet getjobseeker(int order, string company, string jobtitle)
        {
            return daviewjobs.getviewjobs(order, company, jobtitle);
        }
    }
    public class BA_ScheduleJobs
    {
        DA_ScheduleJobs daschedulejobs = new DA_ScheduleJobs();
        public DataSet getScheduleCandidates(string company)
        {
            return daschedulejobs.getScheduleCandidates(company);
        }
    }
    public class BA_postjobs
    {
        DA_postjobs pst = new DA_postjobs();
        public DataSet getindustries()
        {
            return pst.Getindustries();
        }
       
        public DataSet getLocations()
        {
            return pst.GetLocations();
        }
        public int postjob( BE_Employer beemployer)
        {
            return pst.PostJob(beemployer);
        }
        public int updatejob(BE_Employer beemployer)
        {
            return pst.updatejob(beemployer);
        }
    }
    public class BA_EditJobs
    {
        DA_EditJobs edit = new DA_EditJobs();
        public int editjobs(BE_Employer beemp)
        {
            return edit.EditJobs(beemp);
        }
    }
    public class BA_ViewSelected
    {
        DA_ViewSelected daviewselected = new DA_ViewSelected();
      

        public DataSet getSelectedCandidates(BE_ViewSelected beviewselected)
        {
            return daviewselected.ViewSelectedCandidates(beviewselected);
        }

        public int submitSelectedCanditates(BE_ViewSelected beviewselected)
        {
            return daviewselected.SubmitViewSelected(beviewselected);
        }
    }

    public class BA_Employer
    {
        DA_Employer daemployer = new DA_Employer();

        public void editemployee(BE_ViewSelected beviewselected)
        {
            daemployer.EditEmployee(beviewselected);
        }
        public void updateViamail(string email, string password)
        {
            daemployer.updateViaEmail(email, password);
        }
        public string empreg(BE_ViewSelected beviewselected)
        {
            return daemployer.EmpReg(beviewselected);
        }
    }
    public class BA_ContractEmp
    {
        DA_ContarctEmployee dacontractEmp = new DA_ContarctEmployee();
        public DataSet getContractEmp(BE_ViewSelected beviewselected)
        {
           return dacontractEmp.ContractEmp(beviewselected);
        }

        public DataSet getViewContractEmp(BE_ViewSelected beviewselected)
        {
            return dacontractEmp.ViewContractEmployee(beviewselected);
        }
    }
    public class BA_PremanentEmp
    {
        DA_PremanentEmployee dapremanentemp = new DA_PremanentEmployee();
        public DataSet getPremanentEmp(BE_ViewSelected beviewselected)
        {
            return dapremanentemp.PremanentEmp(beviewselected);
        }
        public DataSet getViewPremanentEmp(BE_ViewSelected beviewselected)
        {
            return dapremanentemp.ViewPremanentEmployee(beviewselected);
        }
    }

    public class BA_SubUsers
    {
        DA_SubUsers dasubusers = new DA_SubUsers();
        DA_ActiveSubUSer sub = new DA_ActiveSubUSer();

        public DataSet getSubUSers(BE_SubUSers besubusers)
        {
            return dasubusers.GetSubUSers(besubusers);
        }
        public DataSet getUserListInSubUser(BE_Employer beemp)
        {
            return dasubusers.GetUsersListInSubUsers(beemp);
        }
        public DataSet getNumUsers(BE_SubUSers besub)
        {
            return dasubusers.CheckNumUsers(besub);
        }
        public DataSet countSubUser(BE_SubUSers besub)
        {
            return sub.countSubUser(besub);
        }
        public void DeleteSubUser(BE_SubUSers besub)
        {
            sub.deleteSubUser(besub);
        }
        public string SubUserReg(BE_ViewSelected beview)
        {
            return dasubusers.SubUserReg(beview);
        }
    }

    public class BA_Timesheet
    {
        DA_TimeSheet datime = new DA_TimeSheet();
        public DataSet GetTimeSheetInfo(string id)
        {
            return datime.GetTimeSheetInfo(id);
        }
        public DataSet GetUsers(string id)
        {
            return datime.GetUsers(id);
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
    }

}
   

