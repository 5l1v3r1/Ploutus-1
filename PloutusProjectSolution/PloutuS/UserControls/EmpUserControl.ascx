<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpUserControl.ascx.cs"
    Inherits="UserControls_EmpUserControl" %>
<div id="ddtopmenubar">
    <table width="1024" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <ul id="css3menu1" class="topmenu">
                    <li class="topfirst"><a href="UserHome.aspx" target="_self" style="width: 150px;
                        height: 18px; line-height: 18px;">Home</a></li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 150px; height: 18px;
                        line-height: 18px;">Enterprise</a>
                        <ul>
                            <li class="topmenu"><a href="JobCategoriesMain.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">Posted Jobs</a></li>
                            <li class="topmenu"><a href="Merchantlist.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">List of Enterprise</a></li>
                            <%--  <li class="topmenu"><a href="NewCompanies.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">Enterprise Activation</a></li>--%>
                            <li class="topmenu"><a href="PostedJobs.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">Hire Process</a>
                                <li class="topmenu"><a href="SearchEnterprise.aspx" style="width: 142px; height: 18px;
                                    line-height: 18px;">Search Enterprise</a> </li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 150px; height: 18px;
                        line-height: 18px;">JobSeekers</a>
                        <ul>
                            <li class="topmenu"><a href="Jobseekerslistbycat.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">List of JobSeekers</a></li>
                                <li class="topmenu"><a href="searchJobseekers.aspx" style="width: 142px; height: 18px;
                                line-height: 18px;">Search Jobseekers</a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 150px; height: 18px;
                        line-height: 18px;">Management</a>
                        <ul>
                            <li class="topmenu"><a href="InterviewSchedule.aspx" style="width: 140px; height: 18px;
                                line-height: 18px;">Interview schedule</a></li>
                            <li class="topmenu"><a href="ClientCandidates.aspx" style="width: 140px; height: 18px;
                                line-height: 18px;">Assigned Candidates</a></li>
                            <li class="topmenu"><a href="HireCanlists.aspx" style="width: 140px; height: 18px;
                                line-height: 18px;">Hired Candidates</a></li>
                            <li class="topmenu"><a href="TimeManagement.aspx" style="width: 158px; height: 18px;
                                line-height: 18px;">Timesheet Management</a></li>
                            <li class="topmenu"><a href="TimeSheetReport.aspx" style="width: 158px; height: 18px;
                                line-height: 18px;">Timesheet Reports</a></li>

                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 166px; height: 18px;
                        line-height: 18px;">Control Panel</a>
                        <ul>
                            <li class="topmenu"><a href="EmployRegistration.aspx" style="width: 158px; height: 18px;
                                line-height: 18px;">Create User</a></li>
                            <li class="topmenu"><a href="ListofUsers.aspx" style="width: 158px; height: 18px;
                                line-height: 18px;">List of Users</a></li>
                            <li class="topmenu"><a href="ResetPassword.aspx" style="width: 158px; height: 18px;
                                line-height: 18px;">Reset Password</a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" style="width: 130px; height: 18px; line-height: 18px;">
                    </a></li>
                </ul>
            </td>
        </tr>
    </table>
</div>
