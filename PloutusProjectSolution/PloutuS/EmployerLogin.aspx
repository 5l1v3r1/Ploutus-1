<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="EmployerLogin.aspx.cs" Inherits="EmployerLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="main" style="padding-top: 20px; padding-bottom: 30px; width: 1024px; height: 530px;">
        <tr>
            <td align="center" style="padding-left: 50px; padding-right: 50px;">
                <table width="600" border="0" cellpadding="10" cellspacing="0" class="org-shearder-bg">
                    <tr>
                        <td>
                            Employer Login
                        </td>
                    </tr>
                </table>
                <table width="600" border="0" cellpadding="10" cellspacing="0" class="org-stbl">
                    <tr>
                        <td align="center" valign="top">
                            <form id="form" name="form1" method="post" action="" autocomplete="off">
                            <p>
                                <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label></p>
                            <table width="90%" cellpadding="5" cellspacing="0" class="slog-border">
                            <tr><td style="height:10px"></td></tr>
                                <tr>
                                    <td width="108" align="left" valign="top">
                                        <img src="images/Enterprise-icon.jpg" width="108" height="110" />
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
                                                    <asp:TextBox ID="txtUId" runat="server" CssClass="txtbox" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqEmail" runat="server" SetFocusOnError="true" Display="None"
                                                        ControlToValidate="txtUId" ErrorMessage="Please enter the EMail" CssClass="errmsg"></asp:RequiredFieldValidator>
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
                                                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="txtbox"
                                                        MaxLength="15"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ReqPassword" runat="server" SetFocusOnError="true"
                                                        Display="None" ControlToValidate="txtPassword" ErrorMessage="Please enter the Password"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender runat="server" ID="ValidatorCalloutExtender1" TargetControlID="ReqPassword">
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
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Login" CssClass="sbtn-main" 
                                                        OnClick="btnsubmit_Click" />
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
                           
                            <table width="90%" border="0" cellspacing="5" cellpadding="5">
                                <tr>
                                    <td width="44%" align="left" valign="middle">
                                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/EmployerRegistrationPage.aspx"
                                            CssClass="boxhead" Visible="false">Register Here</asp:HyperLink>
                                    </td>
                                    <td width="56%" align="right" valign="middle">
                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/EmployerForgotPassword.aspx"
                                            CssClass="boxhead">Forgot Password</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>

                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%--<div id="MainDiv" runat="server" style="height: 630px">
        <table cellpadding="0" cellspacing="0" border="0" width="100%;">
            <tr>
                <td style="height: 20px">
                </td>
            </tr>
              <tr>
                <td style="height: 20px">
                </td>
            </tr>
              <tr>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lblhead" CssClass="headding-c" runat="server" Text="Enterprise Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td style="height: 20px">
                </td>
            </tr><tr>
                <td style="height: 20px">
                </td>
            </tr><tr>
                <td style="height: 20px">
                </td>
            </tr><tr>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" border="0" width="350px;" class="tbl">
                        <tr>
                            <td align="left" class="Subhedding">
                                <asp:Label ID="Label4" runat="server" Text="Login" CssClass="lbl"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="errmsg">
                                (*) Fields are Mandatory
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 10px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblID" runat="server" Text="Label">Email Id</asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblPwd" runat="server" Text="Label">Password</asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                        <td align="left">
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="left">
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="left">
                                            
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                           
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>--%>
</asp:Content>
