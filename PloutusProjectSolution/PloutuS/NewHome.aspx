<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="NewHome.aspx.cs" Inherits="NewHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr>
                        <td align="left" valign="top">
                            <div id="slider">
                                <img src="images/image-slider-1.jpg" alt="" />
                                <img src="images/image-slider-2.jpg" alt="" />
                                <img src="images/image-slider-3.jpg" alt="" />
                                <img src="images/image-slider-4.jpg" alt="" />
                                <img src="images/image-slider-5.jpg" alt="" />
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="1024" height="50" border="0" align="center" cellpadding="0" cellspacing="0"
                    bgcolor="#eeeeee" class="table">
                    <tr>
                        <td align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="0" align="left" valign="top">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <%--<img src="images/job-seaker-login.jpg" width="314" height="65" />--%>
                                        <asp:ImageButton ID="imgJsLogin" runat="server" ImageUrl="~/images1/upload_resume.jpg" OnClick="imgJsLogin_Click" />
                                    </td>
                                    <td width="15" align="left" valign="top">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <%--<img src="images/enterprice-login.jpg" width="323" height="65" />--%>
                                         <asp:ImageButton ID="imgEnterprice" runat="server" ImageUrl="~/images1/employer_login.jpg"
                                OnClick="imgEnterprice_Click" />
                                    </td>
                                    <td width="15" align="left" valign="top">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <%--<img src="images/job-search.jpg" width="297" height="65" />--%>
                                        <asp:ImageButton ID="imgJSeach" runat="server" ImageUrl="~/images1/Job_seaker.jpg"  OnClick="imgJSeach_Click" />
                                    </td>
                                    <td width="20" align="left" valign="top">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                    class="bodytext">
                    <tr>
                        <td width="28" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="314" height="50" align="left" valign="middle" class="headding">
                            What's ploutus&#8482;
                        </td>
                        <td width="25" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="313" align="left">
                            <span class="headding">Why ploutus&#8482;</span>
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td width="296" align="left">
                            <span class="headding">Are you looking for a job?</span>
                        </td>
                        <td width="25" align="left" valign="top">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="28" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="294" align="left" valign="top">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" class="stableborder">
                                <tr>
                                    <td>
                                        <img src="images/SYMBOL.jpg" width="294" height="107" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <p>
                                                        At ploutus™, our goals are to provide companies with custom technology advances
                                                        as well as our ability to create a foundation of saving time and money through our
                                                        Staffing Services, IT Consulting/IT Enabled Services, and the Outsourcing of Human
                                                        Resources, Sales and/or Marketing.
                                                        <br />
                                                        <br />
                                                        In addition, we not only want to help companies grow but we also want to help potential
                                                        employees succeed and grow within their chosen field, in which we help mentor and
                                                        guide people to find the precise job fit for their background and skills.</p>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left" valign="top">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" class="stableborder">
                                <tr>
                                    <td>
                                        <img src="images1/why-ploutos.jpg" width="294" height="107" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <p>
                                                        As organizations continue to evolve and improve their products or services, and
                                                        with the nature of having to stay competitive as well as profitable, many have turned
                                                        to third party outsourcing to save themselves both time and money.
                                                        <br />
                                                        Within ploutus™ we’ve created an all service platform to help companies with cost-effective
                                                        custom solutions to aid with Staffing Services, IT Consulting, IT Enabled Services
                                                        with the outsourcing of any department. Keeping up with trends and demands will
                                                        never have to be a burden, where organizations are able to balance budgets, cut
                                                        costs, but still grow their positive branding and overall production.<br />
                                                        Many potential employees during this downturn in the economy have also turned to
                                                        outside staffing services to assist them in finding jobs that can match their background
                                                        and skill sets.</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left" valign="top">
                            <table width="294" border="0" cellpadding="10" cellspacing="0" class="stableborder">
                                <tr>
                                    <td align="left" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <p>
                                                        For job seekers, an employment agency offers options to pursue career opportunities
                                                        that range from Temporary/Contract, to Temp-to-Hire, to permanent placements. Temporary
                                                        staffing is increasing in popularity because of not only the positive trends happen
                                                        in the economy with companies starting to hire again, but also with its flexibility
                                                        and variety of jobs across many industries. Job seekers rely on the professional
                                                        recruiters at ploutus™ every day to guide them through the employment process.</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="headding">
                                                    Are you looking for employees?
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p>
                                                        As the job market continues to grow so does the temporary staffing industry, with
                                                        more companies working with staffing agencies to support their hiring needs. ploutus™
                                                        partners with our customers to deliver staffing services that offer access to qualified
                                                        employees through a comprehensive screening, selection and performance management
                                                        process.</p>
                                                </td>
                                            </tr>
                                        </table>
                                       <%-- <p>
                                            &nbsp;</p>--%>
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
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                    class="bodytext">
                    <tr>
                        <td height="10" colspan="7" background="images/bootom-bg.jpg">
                            <img src="images/bootom-bg.jpg" width="5" height="10" />
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td width="314" align="left" valign="middle" bgcolor="#eeeeee" class="headding">
                            Email subscribe
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td width="313" align="left" bgcolor="#eeeeee">
                            <span class="headding">Contact </span>
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td width="296" align="left" bgcolor="#eeeeee">
                            <span class="headding">Follows</span>
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td align="left" valign="middle" bgcolor="#eeeeee">
                            <p>
                                &nbsp;</p>
                            <p>
                                &nbsp;</p>
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td align="left" bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td align="left" bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                        <td bgcolor="#eeeeee">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                    class="bodytext">
                    <tr>
                        <td height="10">
                            <img src="images/bootom-shape.jpg" width="1024" height="33" />
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center" valign="middle" bgcolor="#777777" class="copyrights" style=" border-color:#777777">
                            2014 © ploutoS LLC. All rights reserved.<br />
                        </td>
                    </tr>
                </table>
</asp:Content>

