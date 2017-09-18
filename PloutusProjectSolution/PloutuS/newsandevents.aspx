<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="newsandevents.aspx.cs" Inherits="newsandevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="1023" border="0" align="center" cellpadding="5" cellspacing="10" bgcolor="#FFFFFF">
        <tr>
            <td width="20%" align="left" valign="top" bgcolor="#EFEFEF">
                <table width="100%" border="0" cellspacing="5" cellpadding="5">
                    <tr>
                        <td>
                            <a href="industries.aspx" target="_self" class="leftLinks">Industries</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="newsandevents.aspx" target="_self" class="leftLinks">News &amp; Events</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="press-releases.aspx" target="_self" class="leftLinks">Press Releases</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="industry-news.aspx" target="_self" class="leftLinks">Industry News</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="upcoming-events.aspx" target="_self" class="leftLinks">Upcoming Events</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="Social-resposibility.aspx" target="_self" class="leftLinks">Social Responsibility</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="Workingwithploutos.aspx" target="_self" class="leftLinks">Working with ploutuS™</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="Career-at-ploutos.aspx" target="_self" class="leftLinks">Careers at ploutuS™</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="find-job-at-ploutos.aspx" target="_self" class="leftLinks">Current Job Openings</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" align="left" valign="top" bgcolor="#FFFFFF" class="bodytext">
                <table width="100%" border="0" cellpadding="5" cellspacing="0" bordercolor="#FFFFFF">
                    <tr>
                        <td align="left" valign="middle" class="headding-bg">
                            News And Events
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" bgcolor="#FFFFFF" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" bgcolor="#FFFFFF">
                            <%--<p>
                                ploutuS™ is an ISO 27001: 2005 Certified Company
                            </p>--%>
                            <asp:Label ID="lbl" runat="server" Font-Bold="true" ForeColor="Red" Text="ploutuS™ is an ISO 27001: 2005 Certified Company"></asp:Label>
                            <p>
                                With this standard, ploutuS™ as a certified company can provide organizations a
                                model to establish, implement, operate, monitor, review, maintain, and consistently
                                improve an Information Security Management System.
                            </p>
                            <p>
                                ploutuS™ has implemented our own Information Security Management System (ISMS),
                                as a strategic platform for all companies. The design and implementation of the
                                ploutuS™ ISMS is continually influenced by the client’s business needs and objectives,
                                security requirements, processes already employed, and the size and structure of
                                the organization itself.
                            </p>
                            <p>
                                With the establishment of the ploutuS™ ISMS we continually look to improve our product
                                and service as well as the overall objectives and guidelines of security itself.
                            </p>
                            <p>
                                Here’s a look at the overall objectives that we adhere to along with the consistent
                                improvement process as a service provider in the information technology security
                                environment:
                            </p>
                            <ul>
                                <b>
                                    <li>OVERALL AWARENESS</li>
                                    <li>CONTINUALTRAINING</li>
                                    <li>MEASURABLE PROCEDURES</li>
                                    <li>RISK MANAGEMENT</li>
                                    <li>AUDIT & CERTIFICATION</li>
                                    <li>CONFIDENTIAL INFORMATION UNDERSTANDING</li>
                                    <li>BUSINESS & LEGAL RESPONSIBILITIES</li>
                                    <li>ploutuS™ FACILITIES DEVELOPMENT & MAINTENANCE</li>
                                    <li>CONTINUALLY IMPROVING & EVOLVING</li></b>
                            </ul>
                            <%-- <p>
                                At ploutuS, we unremittingly strive towards doing new things to deliver the best
                                and for improving our work environment. We want our work place to be professional
                                as well as sociable. Our persistent effort is to establish a candid and an open
                                environment to proffer opportunity to all, to grow personally as well as professionally
                                so as to contribute their best to the organization.
                                <br />
                                We invariably commit our effort is to build positive &amp; trusting relationships
                                through open communication and valuing diverse perspectives of our people.<br />
                                <br />
                                Realizing an employee’s worth and potential in challenging times is what Ploutous
                                believes in, Our Human Resource team is our most valuable asset and continually
                                strives to pacing up with the competitive advantage.<br />
                                We always as a Team aspire to constantly live up to working towards a personal and
                                professional satisfying work experience….that is the Plotous Team.<br />
                                <br />
                                <strong>Equal Employment Opportunity Policy.</strong><br />
                                <br />
                                ploutuS's policy is that applicants are considered for employment solely on the
                                basis of their qualifications and competencies. ploutuS's hiring policy is geared
                                to ensure that ploutuS hires employee's without regard to their race, color, religion,
                                national, orgin, citizenship, age, sex, marital status, ancestry, physical or mental
                                conditions, veteran status or sexual.<br />
                                <br />
                                Information on race and gender may be requested from you solely to help us comply
                                with equal employment opportunity record keeping, reporting and other legal requirements.
                                Any such request will be on purely voluntary basis, ,please provide the information
                                only if you are comfortable doing so.</p>
                            <p>
                                <strong>Current Openings:</strong><br />
                                Secretary/Administrative<br />
                                Receptionists<br />
                                Customer Service<br />
                                Data Processing<br />
                                General Clerical<br />
                                Human Resource Generalist<br />
                                Human Resource Mangers<br />
                                Accounting &amp; Finance Jobs<br />
                                Administrative Jobs<br />
                                Call Center Jobs<br />
                                IT Software</p>--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="218" align="left" valign="top" bgcolor="#EFEFEF" class="bodytext">
                <h3>
                    &nbsp;</h3>
            </td>
        </tr>
    </table>
</asp:Content>
