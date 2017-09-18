using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE_Ploutos
{
    public class BE_getJobApplicants
    {
        private string _skills = string.Empty;
        private string _location = string.Empty;
        private string _expFrom = string.Empty;
        private string _expTo = string.Empty;

        public string skills
        {
            get { return _skills; }
            set { _skills = value; }
        }


        public string location
        {
            get { return _location; }
            set { _location = value; }
        }

        public string expFrom
        {
            get { return _expFrom; }
            set { _expFrom = value; }
        }
        public string expTo
        {
            get { return _expTo; }
            set { _expTo = value; }
        }

    }

    public class BE_Employer
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
        private int _status;
        private string jobid;

        public string Jobid
        {
            get { return jobid; }
            set { jobid = value; }
        }
        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }
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



    public class BE_ViewSelected
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

    public class BE_SubUSers
    {
        private string _Username = string.Empty;
        private string _PhoneNum = string.Empty;
        private string _Email = string.Empty;
        private string _Reference=string.Empty;
        private DateTime _RegDate;
        private int _status;
        private string _Company;
        private string _MemID;
        private int _id;

        public int id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string MemID
        {
            get { return _MemID; }
            set { _MemID = value; }
        }

        public string Username
        {
            get { return _Username; }
            set { _Username = value; }
        }

        public string PhoneNumber
        {
            get { return _PhoneNum; }
            set { _PhoneNum = value; }
        }

        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }

        public string Reference
        {
            get { return _Reference; }
            set { _Reference = value; }
        }

        public DateTime RegDate
        {
            get { return _RegDate; }
            set { _RegDate = value; }
        }

        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }

        public string Company
        {
            get { return _Company; }
            set { _Company = value; }
        }
    }    
        
}

                
               
               
                
               
              
               
              
               
               
                
                
                
                
              
              