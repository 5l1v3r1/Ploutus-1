<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>Untitled Document</title>
    <link href="CSS/job-portal.css" rel="stylesheet" type="text/css" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                        <td align="left" valign="top">
                            <img src="images/banner1.jpg" width="1024" height="312" />
                        </td>
                    </tr>
                </table>
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#eeeeee"
                    class="table">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td width="314" align="left" valign="middle">
                            <asp:ImageButton ID="imgJsLogin" runat="server" ImageUrl="images/job-seaker-login.jpg"
                                Width="313" Height="88" OnClick="imgJsLogin_Click"></asp:ImageButton>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td width="313" align="left">
                            <asp:ImageButton ID="imgEnterprice" runat="server" ImageUrl="images/enterprice-login.jpg"
                                Width="313" Height="88" OnClick="imgEnterprice_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td width="296" align="left">
                            <asp:ImageButton ID="imgJSeach" runat="server" ImageUrl="images/job-search.jpg" Width="296"
                                Height="88" OnClick="imgJSeach_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                    class="bodytext">
                    <tr>
                        <td width="28" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="314" height="50" align="left" valign="middle">
                            <span class="headding">&nbsp;What's ploutuS</span>
                        </td>
                        <td width="25" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="313" align="left">
                            <span class="headding">&nbsp;Why ploutuS?</span>
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td width="296" align="left">
                            <span class="headding">&nbsp;Are you looking for a job?</span>
                        </td>
                        <td width="25" align="left" valign="top">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="28" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="294" align="left" valign="top" style="height: 200px;" class="stableborder">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" style="height: 200px;">
                                <tr>
                                    <td>
                                        <img src="images/SYMBOL.jpg" width="294" height="107" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <%--   <p>
                                            Within ploutuS™, our objective is the ability to offer clients successful solutions
                                            to all business process outsourcing services, including Temporary/Permanent Staffing,
                                            Outsourcing of Human Resource Department, Sales &amp; Marketing Consulting, IT &amp;
                                            ITES Consulting.</p>
                                        <p>
                                            Additionally, is our want to help others succeed in their chosen field, in which
                                            we help place, mentor, and guide people to ensure they find the ‘right’ job fit.</p>--%>
                                        <p>
                                            At ploutuS™, our goals are to provide companies with custom technology advances
                                            as well as our ability to create a foundation of saving time and money through our
                                            Staffing Services, IT Consulting/IT Enabled Services, and the Outsourcing of Human
                                            Resources, Sales and/or Marketing.
                                        </p>
                                        <p>
                                            In addition, we not only want to help companies grow but we also want to help potential
                                            employees succeed and grow within their chosen field, in which we help mentor and
                                            guide people to find the precise job fit for their background and skills.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left" valign="top" style="height: 200px;" class="stableborder">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" style="height: 200px;">
                                <tr>
                                    <td>
                                        <img src="images/why-ploutos.jpg" width="294" height="107" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <%-- <p>
                                            In the current competitive business market with the economy consistently changing,
                                            many organizations have had to reorganize, layoff, merge, pick themselves up and
                                            dust themselves off from what has been a long road to recovery. As a result, organizations
                                            have turned to business process outsourcing services to help supplement those departments
                                            that lack the workforce to keep up with demand. With such challenges companies face
                                            to balance the budgets, this third party outsourcing has help companies cut costs
                                            but still grow their positive branding and overall production. Many people during
                                            this time have also turned to outside services to help them find jobs that can match
                                            their skill set. venenatis egestas.
                                        </p>--%>
                                        <p>
                                            As organizations continue to evolve and improve their products or services, and
                                            with the nature of having to stay competitive as well as profitable, many have turned
                                            to third party outsourcing to save themselves both time and money.
                                        </p>
                                        <p>
                                            Within ploutuS™ we’ve created an all service platform to help companies with cost-effective
                                            custom solutions to aid with Staffing Services, IT Consulting, IT Enabled Services
                                            with the outsourcing of any department. Keeping up with trends and demands will
                                            never have to be a burden, where organizations are able to balance budgets, cut
                                            costs, but still grow their positive branding and overall production.
                                        </p>
                                        <p>
                                            Many potential employees during this downturn in the economy have also turned to
                                            outside staffing services to assist them in finding jobs that can match their background
                                            and skill sets.</p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left" valign="top" style="height: 200px;" class="stableborder">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" style="height: 200px;">
                                <tr>
                                    <td align="left" valign="top">
                                        <p>
                                            <%-- For job seekers, an employment agency offers options to pursue career opportunities
                                            that range from contract to permanent jobs. Temporary staffing is increasing in
                                            popularity because of its flexibility and variety of jobs across many industries.
                                            Job seekers rely on ploutuS professional recruiters every day to guide them through
                                            the employment process.--%>
                                            For job seekers, an employment agency offers options to pursue career opportunities
                                            that range from Temporary/Contract, to Temp-to-Hire, to permanent placements. Temporary
                                            staffing is increasing in popularity because of not only the positive trends happening
                                            in the economy with companies starting to hire again, but also with its flexibility
                                            and variety of jobs across many industries. Job seekers rely on the professional
                                            recruiters at ploutuS™ every day to guide them through the employment process.
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top" class="headding">
                                        Are you looking for employees?
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <%--  As the temporary staffing industry continues to grow, more companies are working
                                        with staffing agencies to support their hiring needs. ploutuS partners with our
                                        customers to deliver staffing services that offer access to qualified employees
                                        through a comprehensive screening, selection and performance management process.--%>
                                        As the job market continues to grow so does the temporary staffing industry, with
                                        more companies working with staffing agencies to support their hiring needs. ploutuS™
                                        partners with our customers to deliver staffing services that offer access to qualified
                                        employees through a comprehensive screening, selection and performance management
                                        process.
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="28" align="left">
                            &nbsp;
                        </td>
                        <td align="left" valign="middle">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
