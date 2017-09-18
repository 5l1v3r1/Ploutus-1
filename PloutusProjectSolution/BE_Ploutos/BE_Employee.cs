using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BE_Ploutos
{
    class BE_Employee
    {
    }
    public class BE_Activity
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
}
