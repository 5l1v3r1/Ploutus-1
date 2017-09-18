<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="SearchdescUser.aspx.cs" Inherits="JobdescUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 680px;">
        <table cellpadding="0" cellspacing="0" border="0" style="min-height: 630px; width: 100%;
            background-color: white;">
            <tr>
                <td align="center" style="padding-top: 20px; padding-bottom: 30px;" class="headding1">
                    <asp:Label ID="lblhead" runat="server" Text="Job Description"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="pnl1" Corners="All"
                        BorderColor="#fecb51" Radius="20" runat="server">
                    </cc1:RoundedCornersExtender>
                    <asp:Panel ID="pnl1" Width="80%" CssClass="" runat="server">
                        <table cellpadding="0" cellspacing="0" border="0" style="min-height: 630px; width: 95%;
                            background-color: white;">
                            <tr>
                                <td style="height: 20px; border-width: 0px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="border: 0px;">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:UpdatePanel ID="uplink" runat="server">
                                                    <ContentTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="padding-left: 20px;" align="left">
                                                                    <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn" OnClientClick="history.go(-1)" OnClick="btnback_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Label ID="lblmsg" runat="server" Text="Label" CssClass="errmsg" Visible="False"></asp:Label>
                                                                </td>
                                                                <td style="padding-right: 20px;" align="right">
                                                                    <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:DataList ID="dlJobPosting" runat="server" Style="text-align: left; width: 100%">
                                                    <HeaderTemplate>
                                                        <table cellpadding="2" cellspacing="0" border="0" style="width: 100%">
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <table cellpadding="3" cellspacing="3" border="0" style="width: 100%">
                                                            <tr>
                                                             <td class="org-shearder-bgNew" colspan="3"> <%# Eval("JobTitle")%></td>
                                                                <%--<td colspan="3" style="font-size: 18px; font-weight: 700;">
                                                                    <%# Eval("JobTitle")%>
                                                                </td>--%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <tr>
                                                                        <td align="left">
                                                                            <table>
                                                                                <tr>
                                                                                    <td width="100px" class="lable">
                                                                                        Company
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        :
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        <asp:Label ID="lblCName" ForeColor="Red" runat="server" Text='<%# Eval("CompanyName")%>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="lable">
                                                                                        Location
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        :
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        <%# Eval("Location")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="vertical-align: top;">
                                                                                    <td class="lable">
                                                                                        JobType
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        :
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        <%# Eval("JobType")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="lable">
                                                                                        Rate
                                                                                        <td class="lable">
                                                                                            :
                                                                                        </td>
                                                                                        <td class="lable">
                                                                                            $
                                                                                            <%# Eval("Rate")%>
                                                                                        </td>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="font-size: 13px; font-weight: 700;">
                                                                            Are you looking for a challenging job opportunity in the
                                                                            <%# Eval("industry") %>
                                                                            industry? Do you have years of experience in
                                                                            <%# Eval("industry") %>
                                                                            and want to GROW your career….then we have the job for you!
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="font-weight: 600;">
                                                                            Job Description :
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <%# Eval("JobDescription")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="font-weight: 600;">
                                                                            Job Requirements :
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div id="divRequirements">
                                                                                <%# Eval("Responsibilities") %>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="font-weight: 600;">
                                                                            Knowledge & Experience:
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div id="divKnwExp" runat="server">
                                                                                <ul style="margin-top: 0pt; margin-bottom: 0pt;" type="disc">
                                                                                    <li>Required skills are
                                                                                        <%# Eval("skills") %></li>
                                                                                    <li>
                                                                                        <%# Eval("expfrom") %>
                                                                                        To
                                                                                        <%# Eval("expto") %>
                                                                                        years of experience in
                                                                                        <%# Eval("functionalarea") %></li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        **If you feel you’re a good match for this position please submit your resume and
                                                                        fill out our application online. We will have a Recruiter reach out to you if the
                                                                        qualifications fit your background.**
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" style="font-weight: 600;">
                                                                    If you have any questions, contact us anytime at:
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <p>
                                                                        <strong>Corporate Office</strong></p>
                                                                    <p>
                                                                        <span>USA</span>
                                                                        <br />
                                                                        ploutuS<strong>™</strong> LLC<br />
                                                                        9276 W. Irving Park Rd,<br />
                                                                        Schiller Park, IL 60176<br />
                                                                        Main: 847-829-7640<br />
                                                                        Toll Free: 1-855-ploutuS<br />
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
    </div>    
</asp:Content>
