<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSRPositions.aspx.cs" Inherits="JSEducation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="tbl" border="0" cellpadding="0" cellspacing="0" width="90%" align="left">

        <tr>
            <td align="left" valign="top" style="padding-top: 50px; padding-left: 50px;">
                <table>
                    <tr>
                        <td colspan="4" class="org-shearder-bgNew" align="left" valign="top" style="padding-top: 50px; padding-left: 50px;">
                            <asp:Label ID="Label15" Text="Positions" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>

                        <td>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound"
                                OnItemCommand="Repeater1_ItemCommand">


                                <ItemTemplate>

                                    <table>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label4" runat="server" Text="Company Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCompanyName" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("CompanyName") %>'></asp:TextBox>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label5" runat="server" Text="Employment Start Date"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmpStartDt" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("EmpStartDt") %>'></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEmpStartDt">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label6" runat="server" Text="Employment End Date"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmpEndDt" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("EmpEndDt") %>'></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEmpEndDt">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label7" runat="server" Text="Name & Title of Supervisor"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSupName" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("SupName") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label8" runat="server" Text="Position"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPosition" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("Position") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40px">
                                                <asp:Label ID="Label9" runat="server" Text="Address"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAdd" CssClass="txtBoxApp" runat="server" MaxLength="100" Text='<%# Eval("Address") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="115px">
                                                <asp:Label ID="Label10" runat="server" Text="Describe your Duties"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDuties" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" Text='<%# Eval("Duties") %>' MaxLength="500"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td height="115px">
                                                <asp:Label ID="Label11" runat="server" Text="Reason for Leaving"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtReasonLeaving" CssClass="txtMultiBox" runat="server" TextMode="MultiLine" Text='<%# Eval("ReasonLeaving") %>' MaxLength="500"></asp:TextBox></td>
                                        </tr>
                                    </table>

                                    <tr>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <table>
                                        </tr>
                    
                    
                        <td>
                            <asp:Button ID="btnAddPosition" runat="server" Text="Add more positions" CommandName="AddRows" CssClass="button-Mediam" />
                        </td>
                                        <td></td>
                                        </tr>
                                    </table>

                                </FooterTemplate>
                            </asp:Repeater>




                        </td>
                    </tr>
                    <tr>
            <td style="padding-top: 30px; padding-bottom: 30px">
                <table align="left" valign="top">
                    <tr>

                        <td colspan="2" align="left">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnSaveContinue_Click" />
                            <span></span>
                            <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" OnClick="btnSaveLater_Click" />
                        </td>

                        <td align="right" style="padding-right: 0px">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
                </table>
            </td>
        </tr>
        

    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
            <td height="10">
                <img src="images/bootom-shape.jpg" width="1024" height="33" />
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color: #777777" class="copyrights">2014 © ploutuS LLC. All rights reserved.<br />
            </td>
        </tr>
    </table>
</asp:Content>

