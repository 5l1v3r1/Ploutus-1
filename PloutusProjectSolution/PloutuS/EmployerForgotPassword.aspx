<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="EmployerForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div id="MainDiv" runat="server" style="width: 100%; height: 630px">
        <br />
        <asp:Panel ID="pnlForgotpass" runat="server" Width="100%">
            <table cellpadding="0" cellspacing="0" border="0" width="100%;">
                <tr>
                    <td align="center" class="headding1" style="padding-top: 75px;">
                        <%--<asp:Label ID="lblhead" runat="server" Text="Enterprise Forgot Password"></asp:Label>--%>
                    </td>
                </tr>
                <tr>
                <td align="center">
                 <asp:Label ID="lblSuccess" runat="server" Visible="False"> An Email with the password is send to your registered email account. <a id="A1" href="EmployerLogin.aspx">Click here</a> to redirect to login page.</asp:Label>
                </td>
                </tr>
                <tr>
                <td align="center">
                <asp:Label ID="lblFail" runat="server" CssClass="errmsg" Visible="False"> Invalid Email ID. Please try with Email ID you registered with ploutuS.</asp:Label>
                </td>
                </tr>
                <tr>
                    <td align="center" style="padding-top: 70px;" valign="top">
                        <table cellpadding="0" cellspacing="0" class="tbl" style="height:250px;">
                            <tr>
                                <td align="center" class="shearder-bg">
                                    <asp:Label ID="Label1" runat="server" Text="Forgot Password" CssClass="lbl"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <br />  <br />  <br />
                                    
                                    <table cellpadding="3" cellspacing="3">
                                        <tr>
                                            <td align="left" style="padding-left: 20px; width: 60px;">
                                                <asp:Label ID="Label2" runat="server" Text="Email Id" CssClass="lbl"></asp:Label>
                                            </td>
                                            <td width="10px">
                                                :
                                            </td>
                                            <td style="padding-left: 20px; padding-right: 20px; width: 250px;">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox-lrg" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ErrorMessage="Please enter Email" Display="Dynamic" 
                                                    ValidationGroup="Forgot" CssClass="redstar" ControlToValidate="TextBox2" 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ErrorMessage="Invalid Email" ControlToValidate="TextBox2" 
                                                    CssClass="redstar" Display="Dynamic" SetFocusOnError="True" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                    ValidationGroup="Forgot">*</asp:RegularExpressionValidator>
                                                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1" runat="server">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
                                                    TargetControlID="RegularExpressionValidator1">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="right" style="padding-right: 35px;">
                                                  <asp:Button ID="btnlogin" runat="server" Text="Submit " CssClass="btn" 
                                                      OnClick="btnlogin_Click" ValidationGroup="Forgot" />
                                                &nbsp;<asp:Button ID="btnback" runat="server" Text="Back" CausesValidation="False" CssClass="btn"
                                                    OnClick="btnback_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
<%--        <div align="center" style="width: 100%;">
            <asp:Panel ID="pnlMsg" runat="server" Width="100%">
                <div align="center" style="width: 600px;">
                    <br />
                    <br />
                    <asp:Label ID="lblSuccess" runat="server" Visible="False"> An Email with the password is send to your registered email account. <a id="linkLogin" href=EmployerLogin.aspx>Click here</a> to redirect to login page.</asp:Label>
                    <asp:Label ID="lblFail" runat="server" CssClass="errmsg" Visible="False"> Invalid Email ID. Please try with Email ID you registered with ploutuS.</asp:Label>
                </div>
            </asp:Panel>
        </div>--%>
    </div>







    
</asp:Content>


