<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master"
    AutoEventWireup="true" CodeFile="MarketingLogin1.aspx.cs" Inherits="Marketing_MarketingLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="main" style="padding-top: 20px; padding-bottom: 30px; width: 1024px; height: 630px;">
        <tr>
            <td align="center" style="padding-left: 50px; padding-right: 50px;">
                <table width="600" border="0" cellpadding="0" cellspacing="0" class="org-shearder-bg">
                    <tr>
                        <td align="center">
                            Marketing Login
                        </td>
                    </tr>
                </table>
                <table width="600" border="0" cellpadding="10" cellspacing="0" class="org-stbl">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <p>
                                &nbsp;</p>
                            <table width="90%" cellpadding="5" cellspacing="0" class="slog-border">
                                <tr>
                                    <td width="108" align="left" valign="top">
                                        <img src="images/job-seeker-icon.jpg" width="108" height="110" alt="" />
                                    </td>
                                    <td align="center" valign="middle">
                                        <table width="90%" border="0" cellspacing="2" cellpadding="2">
                                            <tr>
                                                <td width="35%" align="right" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td width="45%" align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td colspan="2" align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    Login:
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="txtbox" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqEmail" runat="server" SetFocusOnError="true" Display="None"
                                                        ControlToValidate="txtEmail" ErrorMessage="Please enter the EMail" CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender runat="server" ID="vcEmail" TargetControlID="ReqEmail">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                                <td width="2%" align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td width="18%" align="left" valign="middle">
                                                    <span class="redstar">*</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    Password:
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtbox"
                                                        MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqPassword" runat="server" SetFocusOnError="true"
                                                        Display="None" ControlToValidate="txtPassword" ErrorMessage="Please enter the Password"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender runat="server" ID="vcPassword" TargetControlID="ReqPassword">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                                <td align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td align="left" valign="middle">
                                                    <span class="redstar">*</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td align="right" valign="middle">
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Login" CssClass="sbtn-main" OnClick="btnsubmit_Click" />
                                                </td>
                                                <td colspan="2" align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td align="right" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td colspan="2" align="left" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="44%" align="left" valign="middle">
                                        &nbsp;</td>
                                    <td width="56%" align="right" valign="middle">
                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#"
                                            CssClass="boxhead">Forgot Password</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                            <p>
                                &nbsp;</p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
