using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE_Ploutos
{
    //Created by : Krishna
    //Date : 28-06-2013
    //Purpose : creating Bussiness Entities for JobSeeker registration
    public class BEJobSeeker
    {
        private string _tempID = string.Empty;
        private string _firstName = string.Empty;
        private string _middleName = string.Empty;
        private string _lastName = string.Empty;
        private string _address1 = string.Empty;
        private string _address2 = string.Empty;
        private string _city = string.Empty;
        private string _state = string.Empty;
        private string _zip = string.Empty;
        private string _phone = string.Empty;
        private string _mobile = string.Empty;
        private string _email = string.Empty;
        private string _legallyUs = string.Empty;
        private string _mRecentEmp = string.Empty;
        private string _jobTitle = string.Empty;
        private string _fieldExpertise = string.Empty;
        private string _experience = string.Empty;
        private string _prefLoc = string.Empty;
        private string _HighEdu = string.Empty;
        private string _password = string.Empty;
        private string _filename = string.Empty;
        private string _ext = string.Empty;
        private string _status = string.Empty;
        private string _Industry1 = string.Empty;
        private string _Industry2 = string.Empty;
        private string _Industry3 = string.Empty;

        public string Ext
        {
            get { return _ext; }
            set { _ext = value; }
        }

        public string tempId
        {
            get { return _tempID; }
            set { _tempID = value; }
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
        public string address1
        {
            get { return _address1; }
            set { _address1 = value; }
        }
        public string address2
        {
            get { return _address2; }
            set { _address2 = value; }
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
        public string zip
        {
            get { return _zip; }
            set { _zip = value; }
        }
        public string phone
        {
            get { return _phone; }
            set { _phone = value; }
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
        public string legallyUs
        {
            get { return _legallyUs; }
            set { _legallyUs = value; }
        }
        public string mRecentEmp
        {
            get { return _mRecentEmp; }
            set { _mRecentEmp = value; }
        }
        public string jobTitle
        {
            get { return _jobTitle; }
            set { _jobTitle = value; }
        }
        public string fieldExpertise
        {
            get { return _fieldExpertise; }
            set { _fieldExpertise = value; }
        }
        public string experience
        {
            get { return _experience; }
            set { _experience = value; }
        }
        public string prefLoc
        {
            get { return _prefLoc; }
            set { _prefLoc = value; }
        }
        public string HighEdu
        {
            get { return _HighEdu; }
            set { _HighEdu = value; }
        }
        public string password
        {
            get { return _password; }
            set { _password = value; }
        }
        public string filename
        {
            get { return _filename; }
            set { _filename = value; }
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

    public class BEMemDetails
    {
        private string _email = string.Empty;
        private string _password = string.Empty;

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string password
        {
            get { return _password; }
            set { _password = value; }
        }
    }

    public class BELogin
    {
        private string _email = string.Empty;
        private string _password = string.Empty;

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string password
        {
            get { return _password; }
            set { _password = value; }
        }
    }

    public class BEGetJobs
    {
        private string _category = string.Empty;
        private string _location = string.Empty;
        private string _jobtitle = string.Empty;
        private string _searchoption = string.Empty;

        public string category
        {
            get { return _category; }
            set { _category = value; }
        }
        public string location
        {
            get { return _location; }
            set { _location = value; }
        }
        public string jobtitle
        {
            get { return _jobtitle; }
            set { _jobtitle = value; }
        }
        public string searchoption
        {
            get { return _searchoption; }
            set { _searchoption = value; }
        }
    }
    public class BEEssentials
    {
        private string _catagory = string.Empty;

        public string catagory
        {
            get { return _catagory; }
            set { _catagory = value; }
        }

    }

    public class BEJobAlerts
    {
        private int _id = 0;
        private string _jobseekerid = string.Empty;
        private DateTime _createddate = DateTime.Now;
        private string _keywords = string.Empty;
        private string _location = string.Empty;
        private string _category = string.Empty;
        private string _functionalarea = string.Empty;
        private int _expYears = 0;
        private int _expMonths = 0;
        private int _type = 0;

        public int id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string jobSeekerID
        {
            get { return _jobseekerid; }
            set { _jobseekerid = value; }
        }
        public DateTime createdDate
        {
            get { return _createddate; }
            set { _createddate = value; }
        }
        public string keywords
        {
            get { return _keywords; }
            set { _keywords = value; }
        }
        public string location
        {
            get { return _location; }
            set { _location = value; }
        }
        public string category
        {
            get { return _category; }
            set { _category = value; }
        }
        public string functionalarea
        {
            get { return _functionalarea; }
            set { _functionalarea = value; }
        }
        public int expYears
        {
            get { return _expYears; }
            set { _expYears = value; }
        }
        public int expMonths
        {
            get { return _expMonths; }
            set { _expMonths = value; }
        }
        public int type
        {
            get { return _type; }
            set { _type = value; }
        }
    }

    public class BEUpdateResume
    {
        private string _filename = string.Empty;
        private string _email = string.Empty;

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string filename
        {
            get { return _filename; }
            set { _filename = value; }
        }
    }
    public class BE_JSUpdatePassword
    {
        private string _oldpassword = string.Empty;
        private string _password = string.Empty;
        private string _email = string.Empty;

        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string oldpassword
        {
            get { return _oldpassword; }
            set { _oldpassword = value; }
        }
        public string password
        {
            get { return _password; }
            set { _password = value; }
        }
    }
    public class BE_JsAppliedJobs
    {
        private string _email = string.Empty;
        private string _JId = string.Empty;
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string JId
        {
            get { return _JId; }
            set { _JId = value; }
        }
    }

}
