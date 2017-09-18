using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE_Ploutos
{
    class BE_Marketing
    {
    }
    public class BE_MarketingActivities
    {
        private string _Jsid;
        private string _TypeofAct;
        private string _Actdt;
        private string _ActTime;
        private string _Notes;
        private string _ActCreatedBy;
        private string _phinview;
        private string _onsiteinview;
        private string _secindinview;
        private string _thirdinview;
        private string _offered;
        private string _acceptedoffer;
        private string _joindate;
        private string _rate;
        private string _MerchantId;
        private DateTime _CurrentDT;

        private string _id; 
         
        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }
        public DateTime CurrentDT
        {
            get { return _CurrentDT; }
            set { _CurrentDT = value; }
        }

        public string MerchantId
        {
            get { return _MerchantId; }
            set { _MerchantId = value; }
        }
        public string Jsid
        {
            get { return _Jsid; }
            set { _Jsid = value; }
        }
        public string TypeofAct
        {
            get { return _TypeofAct; }
            set { _TypeofAct = value; }
        }
        public string Actdt
        {
            get { return _Actdt; }
            set { _Actdt = value; }

        }
        public string ActTime
        {
            get { return _ActTime; }
            set { _ActTime = value; }
        }
        public string Notes
        {
            get { return _Notes; }
            set { _Notes = value; }
        }
        public string ActCreatedBy
        {
            get { return _ActCreatedBy; }
            set { _ActCreatedBy = value; }
        }
        public string phinview
        {
            get { return _phinview; }
            set { _phinview = value; }
        }
        public string onsiteinview
        {
            get { return _onsiteinview; }
            set { _onsiteinview = value; }
        }
        public string secondinview
        {
            get { return _secindinview; }
            set { _secindinview = value; }
        }
        public string thirdinview
        {
            get { return _thirdinview; }
            set { _thirdinview = value; }
        }
        public string offered
        {
            get { return _offered; }
            set { _offered = value; }
        }
        public string acceptedoffer
        {
            get { return _acceptedoffer; }
            set { _acceptedoffer = value; }
        }
        public string joindate
        {
            get { return _joindate; }
            set { _joindate = value; }
        }
        public string rate
        {
            get { return _rate; }
            set { _rate = value; }
        }

    }
    public class BE_MarketingReg
    {
        private string _firstName = string.Empty;
        private string _middleName = string.Empty;
        private string _lastName = string.Empty;
        private string _city = string.Empty;
        private string _state = string.Empty;
        private string _address = string.Empty;
        private string _mobile = string.Empty;
        private string _email = string.Empty;
        private string _altemail = string.Empty;
        private string _client = string.Empty;

      

        
        private string _experience = string.Empty;
        private string _Industry1 = string.Empty;
        private string _Industry2 = string.Empty;
        private string _Industry3 = string.Empty;
        private string _Cell = string.Empty;
        private string _HomeNumber = string.Empty;
        private string _MerchantId = string.Empty;
        private string _ContactNum = string.Empty;
        private string _Zip = string.Empty;
        private string _Ext = string.Empty;
        private string _status = string.Empty;

        private string _UploadBy = string.Empty;
        private string _jobTitle = string.Empty;

        public string JobTitle
        {
            get { return _jobTitle; }
            set { _jobTitle = value; }
        }


        public string Client
        {
            get { return _client; }
            set { _client = value; }
        }
        public string UploadBy 
        {
            get { return _UploadBy; }
            set { _UploadBy = value; }
        } 

        private string _certifiedIn = string.Empty; 
        public string CertifiedIn 
        {
            get { return _certifiedIn; }
            set { _certifiedIn = value; }
        }

        public string Ext
        {
            get { return _Ext; }
            set { _Ext = value; }
        }

        public string Zip
        {
            get { return _Zip; }
            set { _Zip = value; }
        }
        public string ContactNum
        {
            get { return _ContactNum; }
            set { _ContactNum = value; }
        }
        public string MerchantId
        {
            get { return _MerchantId; }
            set { _MerchantId = value; }
        }

        public string HomeNumber
        {
            get { return _HomeNumber; }
            set { _HomeNumber = value; }
        }
        public string Cell
        {
            get { return _Cell; }
            set { _Cell = value; }
        }
        public string firstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }
        public string middleName
        {
            get { return _middleName; }
            set { _middleName = value; }
        }
        public string lastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }
        public string city
        {
            get { return _city; }
            set { _city = value; }
        }
        public string state
        {
            get { return _state; }
            set { _state = value; }
        }
        public string address
        {
            get { return _address; }
            set { _address = value; }
        }
        public string mobile
        {
            get { return _mobile; }
            set { _mobile = value; }
        }
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string Altemail
        {
            get { return _altemail; }
            set { _altemail = value; }
        }
        public string experience
        {
            get { return _experience; }
            set { _experience = value; }
        }
        public string Industry1
        {
            get { return _Industry1; }
            set { _Industry1 = value; }
        }
        public string Industry2
        {
            get { return _Industry2; }
            set { _Industry2 = value; }
        }
        public string Industry3
        {
            get { return _Industry3; }
            set { _Industry3 = value; }
        }
        public string Status
        {
            get { return _status; }
            set { _status = value; }
        }
    }


    public class BE_MarketingHiring {

        private string _jsid;
        private string _candidateName;

        
        private string _companyName;
        private string _companyLocation;

       
        private DateTime _appointingDate;

       
        private DateTime _contractPodFrom;

      
        private DateTime _contractPodTo;

          
        private string _position;       
        private int _salary;
        private string _hiredBy;
        private string _salaryType;
        private string _jobType;


        public string CandidateName
        {
            get { return _candidateName; }
            set { _candidateName = value; }
        }   
           public DateTime AppointingDate
        {
            get { return _appointingDate; }
            set { _appointingDate = value; }
        }

        public DateTime ContractPodTo
        {
            get { return _contractPodTo; }
            set { _contractPodTo = value; }
        }   
        public DateTime ContractPodFrom
        {
            get { return _contractPodFrom; }
            set { _contractPodFrom = value; }
        }
        public string Position
        {
            get { return _position; }
            set { _position = value; }
        }
        public int Salary
        {
            get { return _salary; }
            set { _salary = value; }
        }
     
        public string CompanyName
        {
            get { return _companyName; }
            set { _companyName = value; }
        }

        public string CompanyLocation
        {
            get { return _companyLocation; }
            set { _companyLocation = value; }
        }


        public string Jsid
        {
            get { return _jsid; }
            set { _jsid = value; }
        }
       
        public string SalaryType
        {
            get { return _salaryType; }
            set { _salaryType = value; }
        }




        public string HiredBy
        {
            get { return _hiredBy; }
            set { _hiredBy = value; }
        }
        public string JobType
        {
            get { return _jobType; }
            set { _jobType = value; }
        }
    
    
    
    }

    public class BE_Clients  
    {
        private int _JobID = 0;
        private string _Firstname = string.Empty;
        private string _Middlename = string.Empty;
        private string _Lastname = string.Empty;
        private string _Addressline1 = string.Empty;
        private string _Addressline2 = string.Empty;
        private string _City = string.Empty;
        private string _State = string.Empty;
        private string _Zip = string.Empty;
        private string _Phone = string.Empty;
        private string _Mobile = string.Empty;
        private string _Email = string.Empty;
        private string _RecentEmployer = string.Empty;
        private string _JobTitle = string.Empty;
        private string _Exp = string.Empty;
        private string _LegallyUs = string.Empty;
        private string _Education = string.Empty;
        private string _Category = string.Empty;
        private string _Position = string.Empty;
        private string _Company = string.Empty;
        private string _Positiongiven = string.Empty;
        private string _Rate = string.Empty;
        private string _RateType = string.Empty;
        private string _Jobtype = string.Empty;
        private DateTime _Startdate;
        private string _Enddate;
        private DateTime _Joiningdate;
        private string _jobid = string.Empty;
        private string _Jobseekerid = string.Empty;
        private string _Website = string.Empty;
        private string _Contact = string.Empty;
        private string _MemID = string.Empty;
        private int _Role = 0;
        private string _RefID = string.Empty;
        private string _pwd = string.Empty;
        private int _ActiveStatus = 0;
        private string _ClientRegBy;

        public string ClientRegBy
        {
            get { return _ClientRegBy; }
            set { _ClientRegBy = value; }
        }

        public int ActiveStatus
        {
            get { return _ActiveStatus; }
            set { _ActiveStatus = value; }
        }
        public string pwd
        {
            get { return _pwd; }
            set { _pwd = value; }
        }
        public string RefID
        {
            get { return _RefID; }
            set { _RefID = value; }
        }
        public int Role
        {
            get { return _Role; }
            set { _Role = value; }
        }
        public int JobID
        {
            get { return _JobID; }
            set { _JobID = value; }
        }
        public string Firstname
        {
            get { return _Firstname; }
            set { _Firstname = value; }
        }
        public string Middlename
        {
            get { return _Middlename; }
            set { _Middlename = value; }
        }
        public string Lastname
        {
            get { return _Lastname; }
            set { _Lastname = value; }
        }
        public string Addressline1
        {
            get { return _Addressline1; }
            set { _Addressline1 = value; }
        }
        public string Addressline2
        {
            get { return _Addressline2; }
            set { _Addressline2 = value; }
        }
        public string City
        {
            get { return _City; }
            set { _City = value; }
        }
        public string State
        {
            get { return _State; }
            set { _State = value; }
        }
        public string Zip
        {
            get { return _Zip; }
            set { _Zip = value; }
        }
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }
        public string Mobile
        {
            get { return _Mobile; }
            set { _Mobile = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string RecentEmployer
        {
            get { return _RecentEmployer; }
            set { _RecentEmployer = value; }
        }
        public string JobTitle
        {
            get { return _JobTitle; }
            set { _JobTitle = value; }
        }
        public string Exp
        {
            get { return _Exp; }
            set { _Exp = value; }
        }
        public string LegallyUs
        {
            get { return _LegallyUs; }
            set { _LegallyUs = value; }
        }
        public string Education
        {
            get { return _Education; }
            set { _Education = value; }
        }
        public string Category
        {
            get { return _Category; }
            set { _Category = value; }
        }
        public string Position
        {
            get { return _Position; }
            set { _Position = value; }
        }
        public string Company
        {
            get { return _Company; }
            set { _Company = value; }
        }
        public string Positiongiven
        {
            get { return _Positiongiven; }
            set { _Positiongiven = value; }
        }
        public string Rate
        {
            get { return _Rate; }
            set { _Rate = value; }
        }
        public string RateType
        {
            get { return _RateType; }
            set { _RateType = value; }
        }
        public string Jobtype
        {
            get { return _Jobtype; }
            set { _Jobtype = value; }
        }
        public DateTime Startdate
        {
            get { return _Startdate; }
            set { _Startdate = value; }
        }
        public string Enddate
        {
            get { return _Enddate; }
            set { _Enddate = value; }
        }
        public DateTime Joiningdate
        {
            get { return _Joiningdate; }
            set { _Joiningdate = value; }
        }
        public string jobid
        {
            get { return _jobid; }
            set { _jobid = value; }
        }
        public string Jobseekerid
        {
            get { return _Jobseekerid; }
            set { _Jobseekerid = value; }
        }
        public string Website
        {
            get { return _Website; }
            set { _Website = value; }
        }
        public string Contact
        {
            get { return _Contact; }
            set { _Contact = value; }
        }
        public string MemID
        {
            get { return _MemID; }
            set { _MemID = value; }
        }

    }

    public class BE_Employer1 
    {
        private string _JobTitle = string.Empty;
        private string _jobdesc = string.Empty;
        private string _Industry = string.Empty;
        private string _Functionalarea = string.Empty;
        private string _Expmin = string.Empty;
        private string _Expmax = string.Empty;
        private string _Dollor = string.Empty;
        private string _Rate = string.Empty;
        private string _Location = string.Empty;
        private string _Jobtype = string.Empty;
        private int _Vacancies = 0;
        private string _Responsibilities = string.Empty;
        private string _Skills = string.Empty;
        private string _Jobpostedby = string.Empty;
        private string _Email = string.Empty;
        private string _Contactno = string.Empty;
        private string _Company = string.Empty;
        private string _JobID = string.Empty;
         
        public string JobTitle 
        {
            get { return _JobTitle; }
            set { _JobTitle = value; }
        }
        public string jobdesc
        {
            get { return _jobdesc; }
            set { _jobdesc = value; }
        }
        public string Industry
        {
            get { return _Industry; }
            set { _Industry = value; }
        }
        public string Functionalarea
        {
            get { return _Functionalarea; }
            set { _Functionalarea = value; }
        }
        public string Expmin
        {
            get { return _Expmin; }
            set { _Expmin = value; }
        }
        public string Expmax
        {
            get { return _Expmax; }
            set { _Expmax = value; }
        }
        public string Dollor
        {
            get { return _Dollor; }
            set { _Dollor = value; }
        }
        public string Rate
        {
            get { return _Rate; }
            set { _Rate = value; }
        }
        public string Location
        {
            get { return _Location; }
            set { _Location = value; }
        }
        public string Jobtype
        {
            get { return _Jobtype; }
            set { _Jobtype = value; }
        }
        public int Vacancies
        {
            get { return _Vacancies; }
            set { _Vacancies = value; }
        }
        public string Responsibilities
        {
            get { return _Responsibilities; }
            set { _Responsibilities = value; }
        }
        public string Skills
        {
            get { return _Skills; }
            set { _Skills = value; }
        }
        public string Jobpostedby
        {
            get { return _Jobpostedby; }
            set { _Jobpostedby = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Contactno
        {
            get { return _Contactno; }
            set { _Contactno = value; }
        }
        public string Company
        {
            get { return _Company; }
            set { _Company = value; }
        }
        public string JobID
        {
            get { return _JobID; }
            set { _JobID = value; }
        }

    }
}
