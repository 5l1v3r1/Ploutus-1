using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DA_Ploutos;
using System.Data;
using BE_Ploutos;

namespace BA_Ploutos
{
    public class BA_Marketing
    {
        DA_Marketing mar = new DA_Marketing();
        public System.Data.DataSet Getmarketingloginbyemailid(string emailid, string password)
        {
            return mar.getmarketingloginbyemailid(emailid, password);
        }
        public System.Data.DataSet ChangePassword(string emailid, string password)
        {
            return mar.ChangePassword(emailid, password);
        }


        public System.Data.DataSet getlogindetais(string id)
        {
            return mar.getlogindetails(id);
        }
        public System.Data.DataSet GetHireCandidateDetails(string id)
        {
            return mar.GetHireCandidateDetails(id);
        }
        public System.Data.DataSet UpdateHireCandidateDetails(string jsid, string apnmtdate, string cname, string clocatiion, string fromdate, string name, string position, string jobType, string salary, string salarytype, string todate)
        {
            return mar.UpdateHireCandidateDetails(jsid, apnmtdate, cname, clocatiion, fromdate, name, position, jobType, salary, salarytype, todate);
        }
        public DataSet fillcategory()
        {
            return mar.FillCategory();
        }
        public DataSet FillmarketList()
        {
            return mar.FillDatalist();
        }
        public DataSet FillmarketViewResumelist(int status)
        {
            return mar.FillmarketViewResumelist(status);
        }

        public DataSet FillHiringList()
        {
            return mar.FillHiringlist();
        }
        public DataSet HoldmarketList()
        {
            return mar.HoldDatalist();
        }
        public DataSet SearchHiringData(string name, string company, string date, string industry)
        {
            return mar.SearchHiringData(name, company, date, industry);
        }
        public DataSet SearchAcceptcanList(string name, string expfrom, string expto, string industry, string state, string city)
        {
            return mar.SearchAcceptcanList(name, expfrom, expto, industry, state, city);
        }
        public DataSet SearchMarketlist(string name, string expfrom, string expto, string industry, int status, string state, string city)
        {
            return mar.SearchMarKetList(name, expfrom, expto, industry, status, state, city);
        }
        public DataSet SearchRejectcanList(string name, string expfrom, string expto, string industry, string state, string city)
        {
            return mar.SearchRejectcanList(name, expfrom, expto, industry, state, city);
        }

        public DataSet SearchMarKetStatusList(string status)
        {
            return mar.SearchMarKetStatusList(status);
        }
        public DataSet GetAllMArketingActivities(string Jsid)
        {
            return mar.GetAllActivities(Jsid);
        }

        public void CreateActivity(BE_MarketingActivities BEMarketingAct)
        {
            mar.CreateActivity(BEMarketingAct);
        }
        public DataSet GetmarketingMemdetails(string Jsid)
        {
            return mar.GetmarketingMemdetails(Jsid);
        }
        public DataSet GetmarketingMemByJsID(string Jsid)
        {
            return mar.GetmarketingMemByJsID(Jsid);
        }


        public void Aceptcandiadte(string jsid)
        {
            mar.AcceptCandidate(jsid);
        }
        public void Rejectcandiadte(string jsid)
        {
            mar.RejectCandidate(jsid);
        }

        public DataSet postedprofiledetails()
        {
            return mar.postedprofiledetails();
        }

        public DataSet EventsDetails()
        {
            return mar.EventsDetails();
        }


        public DataSet FillmarketListAlready()
        {
            return mar.FillDatalistAlready();
        }

        public DataSet SearchMarketlistAlready(string p, string expfrom, string expto, string industry, int status, string state, string city)
        {
            return mar.SearchMarKetListAlready(p, expfrom, expto, industry, status, state, city);
        }

        public DataSet SearchViewUplodedData(string NaEmPh, string activity, string industry, string Date, string jsids, string clint)
        {
            return mar.SearchViewUplodedData(NaEmPh, activity, industry, Date, jsids, clint);
        }
        public DataSet SearchKeyWordFromDB(string keyword)
        {
            return mar.SearchKeyWordFromDB(keyword);
        }

       //Delete Profiles By Admin

        public int DeleteProfileByJsID(string Jsid) 
        {
            return mar.DeleteProfileByJsid(Jsid);
        }
    }
    public class BA_Industrieslist
    {
        DA_Industrieslist daindus = new DA_Industrieslist();
        public DataSet GetIndustriesList()
        {
            return daindus.GetIndustriesList();
        }
    }
    public class BA_Marketingactivities
    {
        DA_Marketing mar = new DA_Marketing();
        DA_MarketingActivities damarket = new DA_MarketingActivities();
        public DataSet GetAllMArketingActivities(string Jsid)
        {
            return damarket.GetAllActivities(Jsid);
        }

        public void CreateActivity(BE_MarketingActivities BEMarketingAct)
        {
            damarket.CreateActivity(BEMarketingAct);
        }
       
        public DataSet GetmarketingMemdetails(string Jsid)
        {
            return damarket.GetmarketingMemdetails(Jsid);
        }
        public void Aceptcandiadte(string jsid)
        {
            damarket.AcceptCandidate(jsid);
        }
        public void Rejectcandiadte(string jsid)
        {
            damarket.RejectCandidate(jsid);
        }

        public void Holdcandiadte(string jsid)
        {
            damarket.HoldCandidate(jsid);
        }

        public DataSet EditActivities(string Id)
        {
            return damarket.EditActivities(Id);
        }



        public DataSet GetAllScMrktActivities()
        {
            return damarket.GetAllScMrktActivities();
        }
        public void UpdateActivity(string jsid, string type, string actdate, string acttime, string notes)
        {
            damarket.UpdateActivity(jsid, type, actdate, acttime, notes);
        }
        public void DeletActivity(int id)
        {
            damarket.DeleteActivity(id);
        }

        public void ColseActivity(string id)
        {
            damarket.ColseActivity(id);
        }

        public void UpdatemarletJobseeker(string jsid, string fname, string lname, string mname, string cell, string home, string email, string mobile, string industry1, string industry2, string industry3, string fexp, string city, string state, string address)
        {
            damarket.UpdateMarketJobseker(jsid, fname, lname, mname, cell, home, email, mobile, industry1, industry2, industry3, fexp, city, state, address);
        }

        public DataSet LoadActivitiesByDate(string Date)
        {
            return damarket.LoadActivitiesByDate(Date);
        }

        public DataSet GetmarketingMemdetailsAlready(string Jsid)
        {
            return damarket.GetmarketingMemdetailsAlready(Jsid);
        }


        public void UpdatemarletJobseekerAlready(string jsid, string fname, string lname, string mname, string mobile, string cell, string homenum, string email, string fexp, string industry1, string industry2, string industry3, string state, string city, string address, string Client, string jobid, string jobtitle)
        {
            damarket.UpdateMarketJobsekerAlready(jsid, fname, lname, mname, mobile, cell, homenum, email, fexp, industry1, industry2, industry3, state, city, address, Client, jobid, jobtitle);
        }


        public DataSet GetAllMArketingActivitiesAlready(string Jsid)
        {
            return damarket.GetAllActivitiesAlready(Jsid);
        }

        public void CreateActivityAlready(BE_MarketingActivities BEMarketingAct)
        {
            damarket.CreateActivityAlready(BEMarketingAct);
        }

        public DataSet EditActivitiesAlready(string id)
        {
            return damarket.EditActivitiesAlready(id);
        }

        public void DeletActivityAlready(int id1)
        {
            damarket.DeleteActivityAlready(id1);
        }

        public void UpdateActivityAlready(string jsid, string type, string actdate, string acttime, string notes)
        {
            damarket.UpdateActivityAlready(jsid, type, actdate, acttime, notes);
        }

        public void AceptcandiadteAlready(string jsid)
        {
            mar.AcceptCandidateAlready(jsid);
        }

        public void RejectcandiadteAlready(string jsid)
        {
            mar.RejectCandidateAlready(jsid);
        }

        public DataSet GetAllScMrktActivitiesAlready()
        {
            return damarket.GetAllScMrktActivitiesAlready();
        }

        public void ColseActivityAlready(string p)
        {
            damarket.ColseActivityAlready(p);
        }

        public void CreateActivityForMerchant(BE_MarketingActivities BEMarketingAct)
        {
            damarket.CreateActivityForMerchant(BEMarketingAct);
        }

        public DataSet GetAllMerchantActivities(string MerchantID)
        {
            return mar.GetAllMerchantActivities(MerchantID);
        }

        public DataSet EditMerchantActivities(string id)
        {
            return damarket.EditMerchantActivities(id);
        }

        public void UpdateMerchantActivity(string ID, string activity, string actdate, string acttime, string notes)
        {
            damarket.UpdateMerchantActivity(ID, activity, actdate, acttime, notes);
        }

        public void DeleteMerchantActivity(int id1)
        {
            damarket.DeleteMerchantActivity(id1);
        }

        public DataSet GetAllCompDetails(string MerchantID)
        {
            return mar.GetAllCompDetails(MerchantID);
        }

        public void CreateCompContactInfo(BE_MarketingReg MarketingReg)
        {
            damarket.CreateCompContactInfo(MarketingReg);
        }

        public DataSet EditComDetailsActivities(string id)
        {
            return damarket.EditComDetailsActivities(id);
        }

        public void UpdateCompDetails(BE_MarketingReg MarketingReg)
        {
            damarket.UpdateCompDetails(MarketingReg);
        }

        public void DeleteCompDetails(int id1)
        {
            damarket.DeleteCompDetails(id1);
        }


        //Insert the Sending mails data into DB
        public int InsertSendMailDetails(string jsid, string To, string From, string Sub, string body, string RecFName)
        {
            return damarket.InsertSendMailDetails(jsid, To, From, Sub, body, RecFName);
        }


        public DataSet BindSentMailGrid()
        {
            return damarket.BindSentMailGrid();
        }
    }


    public class BA_HiredProfiles
    {








    }

    public class BA_Clients 
    {
        DA_Clients daclient = new DA_Clients();

        public void editClient(BE_Clients beviewselected) 
        {
            daclient.EditClients(beviewselected);
        }
        public void updateViamail(string email, string password)
        {
            daclient.updateViaEmail(email, password);
        }
        public string Clientreg(BE_Clients beviewselected) 
        {
            return daclient.ClientReg(beviewselected);
        }
    }


}
