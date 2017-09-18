<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Assembly="AjaxControlToolKit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="MainDiv" runat="server" style="height: 630px">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td style="padding-left: 50px; padding-right: 50px; padding-top: 100px" align="center">
                    <table class="tbl" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" class="shearder-bg">
                                <asp:Label ID="Label3" runat="server" Text="Change Password" CssClass="lbl"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" style="padding-left: 20px; padding-right: 20px;
                                    width: 440px;" border="0">
                                    <tr>
                                        <td colspan="4" align="center">
                                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 130px;">
                                            <asp:Label ID="Label4" runat="server" Text="Current Password" CssClass="lbl"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left" style="width: 170px;">
                                            <asp:TextBox ID="txtOldPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="50"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="ReqOldPassword" runat="server" SetFocusOnError="true"
                                                Display="None" ControlToValidate="txtOldPassword" ErrorMessage="Please enter the old password"
                                                CssClass="errmsg"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcOldPassword" runat="server" TargetControlID="ReqOldPassword">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label5" runat="server" Text="New Password" CssClass="lbl"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="16"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RegularExpressionValidator ID="regnew" runat="server" ControlToValidate="txtNewPassword"
                                                Display="None" ErrorMessage="Password should follow below conditions" SetFocusOnError="true"
                                                ValidationExpression="^.*(?=.{8,16})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*$" CssClass="errmsg"></asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="vleregpas" runat="server" TargetControlID="regnew">
                                            </cc1:ValidatorCalloutExtender>
                                            <asp:RequiredFieldValidator ID="ReqNewPassword" runat="server" SetFocusOnError="true"
                                                Display="None" ControlToValidate="txtNewPassword" ErrorMessage="Please enter the new password"
                                                CssClass="errmsg"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcNewPassword" runat="server" TargetControlID="ReqNewPassword">
                                            </cc1:ValidatorCalloutExtender>
                                            <cc1:PasswordStrength ID="passwordStrength" runat="server" TargetControlID="txtNewPassword"
                                                StrengthIndicatorType="Text" TextCssClass="" PrefixText="" TextStrengthDescriptions="Weak;Average;Strong"
                                                TextStrengthDescriptionStyles="ajaxpasscss;ajaxpasscss1;ajaxpasscss2">
                                            </cc1:PasswordStrength>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label9" runat="server" Text="Re-Type Password" CssClass="lbl"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtRePassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="16"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="refvrepass" runat="server" ErrorMessage="ReType New Password"
                                                ControlToValidate="txtRePassword" CssClass="errmsg" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcereqPass" runat="server" TargetControlID="refvrepass">
                                            </cc1:ValidatorCalloutExtender>
                                            <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="Passwords dosen't match"
                                                ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" SetFocusOnError="true"
                                                Display="None" CssClass="errmsg"></asp:CompareValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcRePassword" runat="server" TargetControlID="comparePassword">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding-right: 80px;" colspan="4">
                                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                                            &nbsp;<asp:Button ID="btnback" CausesValidation="false" runat="server" Text="Back"
                                                CssClass="btn" OnClick="btnback_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <asp:Label ID="lblSuccess" runat="server" CssClass="errmsg">Password Successfully changed! </asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="commentstxt">
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>Must be 8-16 characters</li>
                                                <li>Must include an upper case character</li>
                                                <li>Must include a lower case character</li>
                                                <li>Must include a number</li>
                                                <li>Must include at least one of the following characters: </li>
                                                <li><b style="font-size: 12px">~ ! @ # $ % ^ &amp; * ( ) _ - + =</b></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
