<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MerchantSubUSer.ascx.cs" Inherits="UserControls_MerchantSubUSer" %>
<div id="ddtopmenubar">
<asp:Panel ID="pnl2" runat="server">
<table width="1024" border="0" cellspacing="0" cellpadding="0" id="Table1">
        <tr>
            <td>
                <ul id="css3menu1" class="topmenu">
                    <li class="topfirst"><a href="EmployerHomepage.aspx" target="_self" style="width: 150px;
                        height: 18px; line-height: 18px;">Home</a></li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 150px; height: 18px;
                        line-height: 18px;">Job Board</a>
                        <ul>
                            <li><a href="PostJob.aspx" style="width: 142px; height: 18px;">Post Job</a></li>
                            <li><a href="ViewJobs.aspx" style="width: 142px; height: 18px;">Manage Jobs</a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" target="_self" style="width: 150px;
                        height: 18px; line-height: 18px;">Applicant Tracking</a>
                        <ul>
                            <li><a href="HireCandidates.aspx" style="width: 142px; height: 18px;">Applied Candidates</a></li>
                            <li><a href="SchCandidates.aspx" style="width: 142px; height: 18px;">Selected Candidates</a></li>
                        </ul>
                    </li>
                     <li class="topmenu"><a href="#" target="_self" style="width: 150px;
                        height: 18px; line-height: 18px;">Employee Management</a>
                        <ul>
                            <li><a href="ContractEmployes.aspx" style="width: 142px; height: 18px;">Contract Employees</a></li>
                            <li><a href="PremanentEmployes.aspx" style="width: 142px; height: 18px;">Permanent Employees</a></li>
                              <li><a href="TimeManagement.aspx" style="width: 142px; height: 18px;">Time Management</a></li>
                            <li><a href="TimeSheetReport.aspx" style="width: 142px; height: 18px;">Reports</a></li>
                        </ul>
                    </li>
                    <li class="topmenu" style="width: 338px;"><a href="#">&nbsp;</a></li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Panel>
</div>