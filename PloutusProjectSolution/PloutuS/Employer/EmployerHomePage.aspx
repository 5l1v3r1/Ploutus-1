<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="EmployerHomePage.aspx.cs" Inherits="EmployerHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>--%>
    <table cellpadding="0" cellspacing="0" border="0" style="height: 700px; width: 100%;">
        <tr>
            <td colspan="5" align="center" style="padding-top: 50px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
            </td>
        </tr>
<%--        <tr>
            <td style="height: 15px">
            </td>
        </tr>--%>
        <tr>
            <td valign="top" style="padding-left: 50px;" align="left">
                <table>
                    <tr>
                        <td valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; height: 250px"
                                class="org-stbl">
                                <tr>
                                    <td class="org-shearder-bg">
                                        Events
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellpadding="8" cellspacing="8">
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label1" runat="server" Text="Today's Events :" CssClass="lbl"></asp:Label>
                                                    <asp:LinkButton ID="lbtEvents" runat="server"> 0</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="lbltevents" runat="server" CssClass="lbl" Text="You have no events today!"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label2" runat="server" Text="Future Events :" CssClass="lbl"></asp:Label>
                                                    <asp:LinkButton ID="lbfevents" runat="server"> 0</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="lblfevents" runat="server" CssClass="lbl" Text="You have no events coming up in the future!"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--</div>--%>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 14px;">
                        </td>
                        <td valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; height: 250px;"
                                class="org-stbl">
                                <tr>
                                    <td colspan="2" class="org-shearder-bg">
                                        Recent Jobs
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: 0px; padding-left: 10px;">
                                        <asp:Label ID="Label4" runat="server" Text="Total Jobs :" CssClass="lbl"></asp:Label>
                                        &nbsp;<asp:Label ID="lbltotaljobs" runat="server" CssClass="lbl" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td align="right" style="padding-right: 10px;">
                                        <asp:Button ID="btnPostJob" runat="server" Text="Post Job" CssClass="sbtn-bg" OnClick="btnPostJob_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: 0px; padding-left: 10px" colspan="2">
                                        <strong>Recent Jobs </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="border: 0px; padding-left: 10px" colspan="2">
                                        <asp:GridView ID="gvRecent" runat="server" Width="420px" GridLines="None" CssClass="tbl"
                                            ShowHeader="true" HorizontalAlign="Left" EmptyDataText="No Recent Jobs">
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2" style="padding-right: 10px">
                                        <asp:LinkButton ID="lbmore" CssClass="lbl" runat="server" OnClick="lbmore_Click">more...</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; height: 250px;"
                                class="org-stbl">
                                <tr>
                                    <td colspan="2" class="org-shearder-bg">
                                        My Login
                                    </td>
                                </tr>

                                <tr>
                                <td>
                                <table cellpadding="5" cellspacing="5" width="450px">
                                    <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Button ID="btnEditContact" runat="server" Text="Edit Contact" CssClass="sbtn-bg"
                                                        OnClick="btnEditContact_Click" />
                                                </td>
                                                <td align="right" style="border: 0px; padding-right: 10px">
                                                    <asp:Button ID="btnchgnpwd" runat="server" Text="Change Password" CssClass="sbtn-bg"
                                                        OnClick="btnchgnpwd_Click" />
                                                </td>
                                            </tr>
                                </table>
                                </td>
                                </tr>




                                <tr>
                                    <td colspan="2">
                                        <table cellpadding="8" cellspacing="8" width="450px">
                                        
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label6" runat="server" Text="Website" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblWebsite" runat="server" CssClass="lbl" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label7" runat="server" Text=" Contact Person" CssClass="lbl"></asp:Label>
                                                </td>
                                                  <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblContactPerson" CssClass="lbl" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label8" runat="server" Text="Email" CssClass="lbl"></asp:Label>
                                                </td>
                                                  <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblEmail" CssClass="lbl" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label9" runat="server" Text="Phone Number" CssClass="lbl"></asp:Label>
                                                </td>
                                                  <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblPhone" CssClass="lbl" runat="server" Text=""></asp:Label>
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
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; height: 250px;"
                                class="org-stbl">
                                <tr>
                                    <td colspan="2" class="org-shearder-bg">
                                        Administration
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <table cellpadding="8" cellspacing="8" width="450px">
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label10" runat="server" Text="User Name" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="Label3" runat="server" CssClass="lable"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label11" runat="server" Text="Login Time" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblCurrentLogin" runat="server" CssClass="lable"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label12" runat="server" Text="Last Login Time" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblLastLogintime" runat="server" CssClass="lable"></asp:Label>
                                                </td>
                                            </tr>
                                              <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label13" runat="server" Text="Account Created on" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="lblCreatedDate" runat="server" CssClass="lable"></asp:Label>
                                                </td>
                                            </tr>
                                                 <tr>
                                                <td align="left" style="border: 0px; padding-left: 10px">
                                                    <asp:Label ID="Label14" runat="server" Text="Active Status" CssClass="lbl"></asp:Label>
                                                </td>
                                                <td>:</td>
                                                <td align="left">
                                                    <asp:Label ID="Active" Text="Active" runat="server" CssClass="lable"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%-- <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>--%>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        <td style="height:100px">
        
        </td>
        </tr>
    </table>
    <%--</div>--%>
</asp:Content>
