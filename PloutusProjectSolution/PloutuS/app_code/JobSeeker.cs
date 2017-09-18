using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for JobSeeker
/// </summary>
public class JobSeeker
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstrng"].ToString());

	public JobSeeker()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet JSUpload(string jsid, string filename)
    {
        SqlParameter[] param = new SqlParameter[2];

        param[0] = new SqlParameter("@jsid", SqlDbType.VarChar, 50);
        param[0].Value = jsid;
        param[1] = new SqlParameter("@filename", SqlDbType.VarChar, 50);
        param[1].Value = filename;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsFileUpload", param);

    }

    public string JSReg(string email, string pwd, int mode)
    {
        SqlParameter[] param = new SqlParameter[4];
  
        param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@Pwd", SqlDbType.VarChar, 50);
        param[1].Value = pwd;
        param[2] = new SqlParameter("@Mode", SqlDbType.Int);
        param[2].Value = mode;
        param[3] = new SqlParameter("@Message", SqlDbType.VarChar, 200);
        param[3].Direction = ParameterDirection.Output;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeeker", param);
        return Convert.ToString(param[3].Value);
    }


    public string JSInfo(string email, string filename, string fname, string lname, string homephone, string mobilephone, string workphone, string add1, string add2, string city,string state, string zip)
    {
        SqlParameter[] param = new SqlParameter[13];
        param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@filename", SqlDbType.VarChar, 10);
        param[1].Value = filename;
        param[2] = new SqlParameter("@Fname", SqlDbType.VarChar, 100);
        param[2].Value = fname;
        param[3] = new SqlParameter("@LName", SqlDbType.VarChar, 20);
        param[3].Value = lname;
        param[4] = new SqlParameter("@HomePhone", SqlDbType.VarChar, 20);
        param[4].Value = homephone;
        param[5] = new SqlParameter("@MobilePhone", SqlDbType.VarChar, 20);
        param[5].Value = mobilephone;
        param[6] = new SqlParameter("@WorkPhone", SqlDbType.VarChar, 20);
        param[6].Value = workphone;
        param[7] = new SqlParameter("@Add1", SqlDbType.VarChar, 20);
        param[7].Value = add1;
        param[8] = new SqlParameter("@Add2", SqlDbType.VarChar, 20);
        param[8].Value = add2;
        param[9] = new SqlParameter("@City", SqlDbType.VarChar, 20);
        param[9].Value = city;
        param[10] = new SqlParameter("@State", SqlDbType.VarChar, 20);
        param[10].Value = state;
        param[11] = new SqlParameter("@Zip", SqlDbType.VarChar, 20);
        param[11].Value = zip;
        param[12] = new SqlParameter("@Message", SqlDbType.VarChar, 200);
        param[12].Direction = ParameterDirection.Output;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeekerInfo", param);
        return Convert.ToString(param[12].Value);
    }


    public DataSet JSInfoUpdate(string email, string fname, string lname, string homephone, string mobilephone, string workphone, string add1, string add2, string city, string state, string zip)
    {
        SqlParameter[] param = new SqlParameter[11];
        param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@Fname", SqlDbType.VarChar, 100);
        param[1].Value = fname;
        param[2] = new SqlParameter("@LName", SqlDbType.VarChar, 20);
        param[2].Value = lname;
        param[3] = new SqlParameter("@HomePhone", SqlDbType.VarChar, 20);
        param[3].Value = homephone;
        param[4] = new SqlParameter("@MobilePhone", SqlDbType.VarChar, 20);
        param[4].Value = mobilephone;
        param[5] = new SqlParameter("@WorkPhone", SqlDbType.VarChar, 20);
        param[5].Value = workphone;
        param[6] = new SqlParameter("@Add1", SqlDbType.VarChar, 20);
        param[6].Value = add1;
        param[7] = new SqlParameter("@Add2", SqlDbType.VarChar, 20);
        param[7].Value = add2;
        param[8] = new SqlParameter("@City", SqlDbType.VarChar, 20);
        param[8].Value = city;
        param[9] = new SqlParameter("@State", SqlDbType.VarChar, 20);
        param[9].Value = state;
        param[10] = new SqlParameter("@Zip", SqlDbType.VarChar, 20);
        param[10].Value = zip;

        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeekerInfoupdate", param);
        //return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeekerQues", param);
    }

    public DataSet GetFullDetails(string p)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        param[0].Value = p;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJSFullDetails", param);

    }

    //public DataSet UpdateApplicationInfo(string Fname, string MName, string LName, string address, string city, string state, string zip, string phone, string mobile, string positions, string dateava,
    //    string persalary, string temporarysal, DateTime dAvailabilityTravel, string distance, string IsCitizen1, string IsLegal1, string IsAccomidation1, string AppliedPloutus1, string WorkedPloutus1,
    //    string ValidDrivingLicense1, string HaveTransport1, string SameDayAssignment1, string LongAssignment1, string violations1, string Employed1, string AddInfo, string p,int type)
    //{
    //    SqlParameter[] param = new SqlParameter[29];
    //    param[0] = new SqlParameter("@Fname", SqlDbType.NVarChar, 50);
    //    param[0].Value = Fname;
    //    param[1] = new SqlParameter("@MName", SqlDbType.NVarChar, 50);
    //    param[1].Value = MName;
    //    param[2] = new SqlParameter("@LName", SqlDbType.NVarChar, 50);
    //    param[2].Value = LName;
    //    param[3] = new SqlParameter("@address", SqlDbType.NVarChar, 50);
    //    param[3].Value = address;
    //    param[4] = new SqlParameter("@city", SqlDbType.NVarChar, 50);
    //    param[4].Value = city;
    //    param[5] = new SqlParameter("@state", SqlDbType.NVarChar, 50);
    //    param[5].Value = state;
    //    param[6] = new SqlParameter("@zip", SqlDbType.NVarChar, 50);
    //    param[6].Value = zip;
    //    param[7] = new SqlParameter("@phone", SqlDbType.NVarChar, 50);
    //    param[7].Value = phone;
    //    param[8] = new SqlParameter("@mobile", SqlDbType.NVarChar, 50);
    //    param[8].Value = mobile;
    //    param[9] = new SqlParameter("@positions", SqlDbType.NVarChar, 50);
    //    param[9].Value = positions;
    //    param[10] = new SqlParameter("@dateava", SqlDbType.DateTime);
    //    param[10].Value = dateava;
    //    param[11] = new SqlParameter("@persalary", SqlDbType.NVarChar, 50);
    //    param[11].Value = persalary;
    //    param[12] = new SqlParameter("@temporarysal", SqlDbType.NVarChar, 50);
    //    param[12].Value = temporarysal;
    //    param[13] = new SqlParameter("@AvailabilityTravel", SqlDbType.NVarChar, 50);
    //    param[13].Value = dAvailabilityTravel;
    //    param[14] = new SqlParameter("@distance", SqlDbType.NVarChar, 50);
    //    param[14].Value = distance;
    //    param[15] = new SqlParameter("@IsCitizen1", SqlDbType.NVarChar, 50);
    //    param[15].Value = IsCitizen1;
    //    param[16] = new SqlParameter("@IsLegal1", SqlDbType.NVarChar, 50);
    //    param[16].Value = IsLegal1;
    //    param[17] = new SqlParameter("@IsAccomidation1", SqlDbType.NVarChar, 50);
    //    param[17].Value = IsAccomidation1;
    //    param[18] = new SqlParameter("@AppliedPloutus1", SqlDbType.NVarChar, 50);
    //    param[18].Value = AppliedPloutus1;
    //    param[19] = new SqlParameter("@WorkedPloutus1", SqlDbType.NVarChar, 50);
    //    param[19].Value = WorkedPloutus1;
    //    param[20] = new SqlParameter("@ValidDrivingLicense1", SqlDbType.NVarChar, 50);
    //    param[20].Value = ValidDrivingLicense1;
    //    param[21] = new SqlParameter("@HaveTransport1", SqlDbType.NVarChar, 50);
    //    param[21].Value = HaveTransport1;
    //    param[22] = new SqlParameter("@SameDayAssignment1", SqlDbType.NVarChar, 50);
    //    param[22].Value = SameDayAssignment1;
    //    param[23] = new SqlParameter("@LongAssignment1", SqlDbType.NVarChar, 50);
    //    param[23].Value = LongAssignment1;
    //    param[24] = new SqlParameter("@violations1", SqlDbType.NVarChar, 50);
    //    param[24].Value = violations1;
    //    param[25] = new SqlParameter("@Employed1", SqlDbType.NVarChar, 50);
    //    param[25].Value = Employed1;
    //    param[26] = new SqlParameter("@AddInfo", SqlDbType.NVarChar, 50);
    //    param[26].Value = AddInfo;
    //    param[27] = new SqlParameter("@EmailID", SqlDbType.NVarChar, 50);
    //    param[27].Value = p;
    //    param[28] = new SqlParameter("@type", SqlDbType.Int);
    //    param[28].Value = type;
    //    return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateApplicationInfo", param);

    //}

    public int UpdateFirstUSer(string p,string sign,DateTime dtsign )
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        param[0].Value = p;
        param[1] = new SqlParameter("@sign", SqlDbType.NVarChar, 50);
        param[1].Value = sign;
        param[2] = new SqlParameter("@dtsign", SqlDbType.DateTime);
        param[2].Value = dtsign;
        return SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "spsUpdateFirstUser", param);

    }



    public DataSet GetMemActivity(string email)
    {
        SqlParameter param = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        param.Value = email;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJSLogininf", param);
    }


    public DataSet JSQues(string email, string jobtitle, string payrate, string paytype, string edu, string security, string workstatus, string linkedin)
    {
        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@JobTitle", SqlDbType.VarChar, 50);
        param[1].Value = jobtitle;
        param[2] = new SqlParameter("@PayRate", SqlDbType.VarChar, 100);
        param[2].Value = payrate;
        param[3] = new SqlParameter("@PayType", SqlDbType.VarChar, 50);
        param[3].Value = paytype;
        param[4] = new SqlParameter("@Edu", SqlDbType.VarChar, 50);
        param[4].Value = edu;
        param[5] = new SqlParameter("@Security", SqlDbType.VarChar, 50);
        param[5].Value = security;
        param[6] = new SqlParameter("@WorkStatus", SqlDbType.VarChar, 50);
        param[6].Value = workstatus;
        param[7] = new SqlParameter("@LinkedIn", SqlDbType.VarChar, 50);
        param[7].Value = linkedin;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeekerQues", param);
    }


    public DataSet JSReview (string email, int mode)
    {

        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@Mode", SqlDbType.Int);
        param[1].Value = mode;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsJobSeekerReview", param);
    }

    public string getLogin(string email, string pwd)
    {
        SqlParameter[] param = new SqlParameter[3];
        param[0] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        param[0].Value = email;
        param[1] = new SqlParameter("@pass", SqlDbType.NVarChar, 50);
        param[1].Value = pwd;
        param[2] = new SqlParameter("@message", SqlDbType.VarChar, 200);
        param[2].Direction = ParameterDirection.Output;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsMemCredentials", param);
        return Convert.ToString(param[2].Value);

    }  

    

   

    public DataSet UpdateApplicationInfo1(DateTime dateava, string persalary, string temporarysal, string dAvailabilityTravel, string distance, string IsCitizen1, string IsLegal1, string age, string AppliedPloutus1,
        DateTime dtapplied, string WorkedPloutus1, DateTime dtworked, string ValidDrivingLicense1, string HaveTransport1, string SameDayAssignment1, string LongAssignment1, string jobtype, string violations1, string ViolationDetails,
        string Employed1, string RefName, string RefRelation, string AddInfo, string p)
    {
        SqlParameter[] param = new SqlParameter[23];       
        param[0] = new SqlParameter("@dateava", SqlDbType.DateTime);
        param[0].Value = dateava;
        param[1] = new SqlParameter("@persalary", SqlDbType.NVarChar, 50);
        param[1].Value = persalary;
        param[2] = new SqlParameter("@temporarysal", SqlDbType.NVarChar, 50);
        param[2].Value = temporarysal;
        param[3] = new SqlParameter("@AvailabilityTravel", SqlDbType.NVarChar, 50);
        param[3].Value = dAvailabilityTravel;
        param[4] = new SqlParameter("@distance", SqlDbType.NVarChar, 50);
        param[4].Value = distance;
        param[5] = new SqlParameter("@IsCitizen1", SqlDbType.NVarChar, 50);
        param[5].Value = IsCitizen1;
        param[6] = new SqlParameter("@IsLegal1", SqlDbType.NVarChar, 50);
        param[6].Value = IsLegal1;
        param[7] = new SqlParameter("@age", SqlDbType.NVarChar, 50);
        param[7].Value = age;
        param[8] = new SqlParameter("@AppliedPloutus1", SqlDbType.NVarChar, 50);
        param[8].Value = AppliedPloutus1;
        param[9] = new SqlParameter("@AppliedDate", SqlDbType.DateTime);
        param[9].Value = dtapplied;
        param[10] = new SqlParameter("@WorkedPloutus1", SqlDbType.NVarChar, 50);
        param[10].Value = WorkedPloutus1;
        param[11] = new SqlParameter("@WorkedDate", SqlDbType.DateTime);
        param[11].Value = dtworked;
        param[12] = new SqlParameter("@ValidDrivingLicense1", SqlDbType.NVarChar, 50);
        param[12].Value = ValidDrivingLicense1;
        param[13] = new SqlParameter("@HaveTransport1", SqlDbType.NVarChar, 50);
        param[13].Value = HaveTransport1;
        param[14] = new SqlParameter("@SameDayAssignment1", SqlDbType.NVarChar, 50);
        param[14].Value = SameDayAssignment1;
        param[15] = new SqlParameter("@LongAssignment1", SqlDbType.NVarChar, 50);
        param[15].Value = LongAssignment1;
        param[16] = new SqlParameter("@jobtype", SqlDbType.NVarChar, 50);
        param[16].Value = jobtype;         
        param[17] = new SqlParameter("@violations1", SqlDbType.NVarChar, 50);
        param[17].Value = violations1;
        param[17] = new SqlParameter("@violationdetails", SqlDbType.NVarChar, 50);
        param[17].Value = ViolationDetails;
        param[18] = new SqlParameter("@Employed1", SqlDbType.NVarChar, 50);
        param[18].Value = Employed1;
        param[19] = new SqlParameter("@RefName", SqlDbType.NVarChar, 50);
        param[19].Value = RefName;
        param[20] = new SqlParameter("@RefRelation", SqlDbType.NVarChar, 50);
        param[20].Value = RefRelation;
        param[21] = new SqlParameter("@AddInfo", SqlDbType.NVarChar, 50);
        param[21].Value = AddInfo;
        param[22] = new SqlParameter("@EmailID", SqlDbType.NVarChar, 50);
        param[22].Value = p;      
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateApplicant", param);
    }

    public DataSet UpdateEmergencyDetails(string EmergencyName, string EmergencyRelation, string EmergencyPhoneNum,string email)
    {
        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@EmergencyName", SqlDbType.VarChar, 50);
        param[0].Value = EmergencyName;
        param[1] = new SqlParameter("@EmergencyRelation", SqlDbType.VarChar, 50);
        param[1].Value = EmergencyRelation;
        param[2] = new SqlParameter("@EmergencyPhoneNum", SqlDbType.VarChar, 50);
        param[2].Value = EmergencyPhoneNum;
        param[3] = new SqlParameter("@email", SqlDbType.VarChar, 50);
        param[3].Value = email;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateEmergencyDetails", param);
    }

    public DataSet UpdateEducation(string HighestEdu, string HighCollegeName, string HighCourse, string IsGraduated, string HighYear, string HighDiploma, string LevelEdu, string LevelCollegeName, 
        string LevelCourse, string LevelGraduated, string LevelYear, string LevelDiploma, string Specialization, string ISMilitary, string MilitaryDetails,string email)
    {
        SqlParameter[] param = new SqlParameter[16];
        param[0] = new SqlParameter("@HighestEdu", SqlDbType.VarChar, 50);
        param[0].Value = HighestEdu;
        param[1] = new SqlParameter("@HighCollegeName", SqlDbType.VarChar, 50);
        param[1].Value = HighCollegeName;
        param[2] = new SqlParameter("@HighCourse", SqlDbType.VarChar, 50);
        param[2].Value = HighCourse;
        param[3] = new SqlParameter("@IsGraduated", SqlDbType.VarChar, 50);
        param[3].Value = IsGraduated;
        param[4] = new SqlParameter("@HighYear", SqlDbType.VarChar, 50);
        param[4].Value = HighYear;
        param[5] = new SqlParameter("@HighDiploma", SqlDbType.VarChar, 50);
        param[5].Value = HighDiploma;
        param[6] = new SqlParameter("@LevelEdu", SqlDbType.VarChar, 50);
        param[6].Value = LevelEdu;
        param[7] = new SqlParameter("@LevelCollegeName", SqlDbType.VarChar, 50);
        param[7].Value = LevelCollegeName;
        param[8] = new SqlParameter("@LevelCourse", SqlDbType.VarChar, 50);
        param[8].Value = LevelCourse;
        param[9] = new SqlParameter("@LevelGraduated", SqlDbType.VarChar, 50);
        param[9].Value = LevelGraduated;
        param[10] = new SqlParameter("@LevelYear", SqlDbType.VarChar, 50);
        param[10].Value = LevelYear;
        param[11] = new SqlParameter("@LevelDiploma", SqlDbType.VarChar, 50);
        param[11].Value = LevelDiploma;
        param[12] = new SqlParameter("@Specialization", SqlDbType.VarChar, 50);
        param[12].Value = Specialization;
        param[13] = new SqlParameter("@ISMilitary", SqlDbType.VarChar, 50);
        param[13].Value = ISMilitary;
        param[14] = new SqlParameter("@MilitaryDetails", SqlDbType.VarChar, 50);
        param[14].Value = MilitaryDetails;
        param[15] = new SqlParameter("@email", SqlDbType.VarChar, 50);
        param[15].Value = @email;

        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateEducation", param);
    }

    public string UpdatePositionsRef(string obligations, string gaps, string addinfo, string RefEmp, string RefFullName, string RefRelation, string RefCompany, string RefPhone, string RefAddress, string p)
    {
        SqlParameter[] param = new SqlParameter[11];
        param[0] = new SqlParameter("@obligations", SqlDbType.NVarChar, 50);
        param[0].Value = obligations;
        param[1] = new SqlParameter("@gaps", SqlDbType.NVarChar, 50);
        param[1].Value = gaps;       
        param[2] = new SqlParameter("@addinfo", SqlDbType.NVarChar, 50);
        param[2].Value = addinfo;
        param[3] = new SqlParameter("@RefEmp", SqlDbType.NVarChar, 50);
        param[3].Value = RefEmp;
        param[4] = new SqlParameter("@RefFullName", SqlDbType.NVarChar, 50);
        param[4].Value = RefFullName;
        param[5] = new SqlParameter("@RefRelation", SqlDbType.NVarChar, 50);
        param[5].Value = RefRelation;
        param[6] = new SqlParameter("@RefCompany", SqlDbType.NVarChar, 50);
        param[6].Value = RefCompany;
        param[7] = new SqlParameter("@RefPhone", SqlDbType.NVarChar, 50);
        param[7].Value = RefPhone;
        param[8] = new SqlParameter("@RefAddress", SqlDbType.NVarChar, 50);
        param[8].Value = RefAddress;
        param[9] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        param[9].Value = p;
        param[10] = new SqlParameter("@ObFile", SqlDbType.VarChar, 200);
        param[10].Direction = ParameterDirection.Output;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "UpdatePositionsRef", param);
        return Convert.ToString(param[10].Value);
    }

    public DataSet InsertPositions(string CompanyName, DateTime EmpStartDt, DateTime EmpEndDt, string SupName, string Position, string Add, string Duties, string ReasonLeaving,string email,string memid)
    {
        SqlParameter[] param = new SqlParameter[10];
        param[0] = new SqlParameter("@CompanyName", SqlDbType.VarChar, 50);
        param[0].Value = CompanyName;
        param[1] = new SqlParameter("@EmpStartDt", SqlDbType.DateTime);
        param[1].Value = EmpStartDt;
        param[2] = new SqlParameter("@EmpEndDt", SqlDbType.DateTime);
        param[2].Value = EmpEndDt;
        param[3] = new SqlParameter("@SupName", SqlDbType.VarChar, 50);
        param[3].Value = SupName;
        param[4] = new SqlParameter("@Position", SqlDbType.VarChar, 50);
        param[4].Value = Position;
        param[5] = new SqlParameter("@Add", SqlDbType.VarChar, 50);
        param[5].Value = Add;
        param[6] = new SqlParameter("@Duties", SqlDbType.VarChar, 50);
        param[6].Value = Duties;
        param[7] = new SqlParameter("@ReasonLeaving", SqlDbType.VarChar, 50);
        param[7].Value = ReasonLeaving;
        param[8] = new SqlParameter("@email", SqlDbType.VarChar, 50);
        param[8].Value = email;
        param[9] = new SqlParameter("@memid", SqlDbType.VarChar, 50);
        param[9].Value = memid;
        return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdatePositions", param);
    }

    public void UpdateActivation(string email)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsUpdateActivation", param);
    }

    public void DeletePositions(string email)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@email", SqlDbType.VarChar, 50);
        param[0].Value = email;
        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "spsDeletePositions", param);
    }
}