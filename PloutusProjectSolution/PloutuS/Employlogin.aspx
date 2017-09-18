<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Employlogin.aspx.cs" Inherits="Emplogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="1024px" style="height: 500px;">
        <tr>
            <td valign="top">
                <table cellpadding="0" cellspacing="0" border="0" width="100%;">
                <tr><td style=" height:30px;"></td></tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblhead" CssClass="headding" runat="server" Text="ploutuS Employee Login"></asp:Label>
                        </td>
                    </tr> <tr><td style=" height:30px;"></td></tr>
                    <tr>
                        <td align="center" valign="top">
                            <table cellpadding="0" cellspacing="0" style="border: 1px solid silver;" width="400px;">
                                <tr>
                                    <td align="center" class="Subhedding">
                                        Login
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellpadding="3" cellspacing="3">
                                            <tr>
                                                <td colspan="3" style="height: 7px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center">
                                                    <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="lbl">
                                                    Email Id
                                                </td>
                                                <td>
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtemailid" runat="server" CssClass="txtbox-lrg"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqUserName" runat="server" SetFocusOnError="true"
                                                        Display="None" ControlToValidate="txtemailid" ErrorMessage="Please Enter the Email Id"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender runat="server" ID="vcUserName" TargetControlID="ReqUserName">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="lbl">
                                                    Password
                                                </td>
                                                <td>
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtbox-lrg"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqPassword" runat="server" SetFocusOnError="true"
                                                        Display="None" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender runat="server" ID="vcPassword" TargetControlID="ReqPassword">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="right">
                                                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn" OnClick="btnlogin_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
