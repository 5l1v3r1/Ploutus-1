<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="MarketingHomePage.aspx.cs" Inherits="Marketing_MarketingHomePage" %>
<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
        <tr>
            <td valign="top" height="0px">
                <%-- <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; background-color: #E6E6E6;
                    min-height: 50px" align="center">
                    <tr style="padding: 3px">
                        <td style="width: 250px; padding-left: 10px">
                            <asp:Label ID="lbllogin" runat="server" CssClass="lable" Text="LoginTime:" Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblLogtime" runat="server" CssClass="lable"></asp:Label>
                        </td>
                        <td style="width: 250px;">
                            <asp:Label ID="lbluser" runat="server" CssClass="lable" Text="Username: " Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblUserName1" runat="server" CssClass="lable"></asp:Label>
                        </td>
                        <td style="width: 250px;">
                            <asp:Label ID="lblLastLogin" runat="server" CssClass="lable" Text="Last Visit: "
                                Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblLastLogintime" runat="server" CssClass="lable"></asp:Label>
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <tr>
            <td style="height: 30px;">
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle" style="padding-left: 52px;">
                <asp:Label ID="lblUserName" CssClass="headding" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 30px;">
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" align="left">
                <table>
               
                    <tr>
                        <td valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; "
                                >
                                 <tr>
                                 <td>
                                 <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">
                           Events
                        </td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                        </td>
                        <%--<td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>--%>
                    </tr>
                </table></td>
                                    
                                </tr>
                                <tr>
                                    <td class="org-stbl" valign="top">
                                        <table style="height: 250px; padding-top:0px; width: 100%"
                                            <tr>
                                                <td valign="top">
                                                    <table cellpadding="6" cellspacing="6">
                                                        <tr>
                                                            <td style="border: 0px; padding-left: 10px">
                                                                Pending Events
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                            <asp:Label ID="lnkPendingEvent" runat="server"></asp:Label>
                                                              <%--  <asp:LinkButton ID="lnkPendingEvent" runat="server">0</asp:LinkButton>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border: 0px; padding-left: 10px">
                                                                Today's Events
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                             <asp:Label ID="lnkToday" runat="server"></asp:Label>
                                                               <%-- <asp:LinkButton ID="lnkToday" runat="server">0</asp:LinkButton>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px">
                                                                Future Events
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                             <asp:Label ID="lnkFuture" runat="server"></asp:Label>
                                                              <%--  <asp:LinkButton ID="lnkFuture" runat="server">0</asp:LinkButton>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border: 0px; padding-left: 10px">
                                                                Closed Events
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                             <asp:Label ID="lnkClosed" runat="server"></asp:Label>
                                                              <%--  <asp:LinkButton ID="lnkClosed" runat="server">0</asp:LinkButton>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-left: 10px">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 14px;">
                        </td>
                        <td valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; "
                              >
                                  <tr>
                                 <td>
                                 <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">
                            Posted Profiles
                        </td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                        </td>
                       <%-- <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>--%>
                    </tr>
                </table></td>
                                    
                                </tr>
                              
                                <tr>
                                    <td valign="top">
                                        <table  class="org-stbl" style="height: 250px; width: 100%">
                                            <tr>
                                                <td valign="top">
                                                    <table cellpadding="6" cellspacing="6">
                                                        <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px; padding-top: 10px">
                                                                Posted Profiles
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                            <asp:Label ID="lnkposted" runat="server"></asp:Label>
                                                              <%-- <asp:LinkButton ID="lnkposted" runat="server">0</asp:LinkButton>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px; padding-top: 10px">
                                                                Pending Profiles
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkpending" runat="server" OnClick="lnkpending_Click">0</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                       <%-- <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px">
                                                                Selected Candidates
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkselect" runat="server" OnClick="lnkselect_Click">0</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px">
                                                                Rejected Candidates
                                                            </td>
                                                            <td>
                                                                :
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkreject" runat="server" OnClick="lnkreject_Click">0</asp:LinkButton>
                                                            </td>
                                                        </tr>--%>
                                                        <%--<tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px">
                                                                Today Interview schedules
                                                            </td>
                                                            <td>:</td>
                                                            <td> 
                                                                <asp:LinkButton ID="lnkTodayInterSche" runat="server" onclick="LinkButton3_Click" 
                                                                    >0</asp:LinkButton></td>
                                                        </tr>
                                                         <tr>
                                                            <td align="left" style="border: 0px; padding-left: 10px">
                                                                Hired Candidates
                                                            </td>
                                                            <td>:</td>
                                                            <td> <asp:LinkButton ID="LinkButton2" runat="server" 
                                                                    >0</asp:LinkButton></td>
                                                        </tr>--%>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 14px">
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 100px;">
            </td>
        </tr>
    </table>
</asp:Content>
