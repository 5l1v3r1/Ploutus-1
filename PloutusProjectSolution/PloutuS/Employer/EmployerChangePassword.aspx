<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="EmployerChangePassword.aspx.cs" Inherits="MerchantChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="MainDiv" runat="server" style="height: 630px">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <%--   <tr>
                <td align="center" style="padding-top: 20px; padding-bottom: 30px;" class="headding1">
                    <asp:Label ID="lblhead" runat="server" Text="Job Seeker Change Password"></asp:Label>
                </td>
            </tr>--%>
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
                                    width: 420px;" border="0">
                                    <tr>
                                        <td colspan="4" align="center">
                                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 120px;">
                                            <asp:Label ID="Label4" runat="server" Text="Current Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtOldPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="16"></asp:TextBox>
                                        </td>
                                        <td>
                                           <%-- <asp:RegularExpressionValidator ID="regPassword" runat="server" ControlToValidate="txtOldPassword"
                                                Display="None" ErrorMessage="Password should be minimum 8 charecters" SetFocusOnError="true"
                                                ValidationExpression="^.*(?=.{8,16})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*$" CssClass="errmsg"></asp:RegularExpressionValidator>--%>
                                            <asp:RequiredFieldValidator ID="ReqOldPassword" runat="server" SetFocusOnError="true"
                                                Display="None" ControlToValidate="txtOldPassword" ErrorMessage="Please enter the old password"
                                                CssClass="errmsg"></asp:RequiredFieldValidator>
                                            <%--<cc1:ValidatorCalloutExtender ID="vcePassword" runat="server" TargetControlID="regPassword">
                                            </cc1:ValidatorCalloutExtender>--%>
                                            <cc1:ValidatorCalloutExtender ID="vcOldPassword" runat="server" TargetControlID="ReqOldPassword">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label5" runat="server" Text="New Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="16"></asp:TextBox>
                                        </td>
                                        <td>
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
                                            <asp:Label ID="Label9" runat="server" Text="Re-Type Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtRePassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="16"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="refvrepass" runat="server" ErrorMessage="ReType New Password" ControlToValidate="txtRePassword"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="Passwords dosen't match"
                                                ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" SetFocusOnError="true"
                                                Display="None" CssClass="errmsg"></asp:CompareValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcRePassword" runat="server" TargetControlID="comparePassword">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding-right: 60px;" colspan="4">
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
                                <table >
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




<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="MainDiv" runat="server" style="height: 630px">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td align="center" style="padding-top: 50px; padding-bottom: 50px;" class="headding1">
                    <asp:Label ID="lblhead" runat="server" Text="Enterprise Change Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px; padding-right: 50px;" valign="top" align="center">
                    <table class="tbl">
                        <tr>
                            <td align="center" class="shearder-bg">
                                <asp:Label ID="Label3" runat="server" Text="Change Password" CssClass="lbl"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="3" align="center">
                                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label4" runat="server" Text="Old Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtOldPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ReqOldPassword" runat="server" SetFocusOnError="true"
                                                Display="None" ControlToValidate="txtOldPassword" ErrorMessage="Please enter the old password">
                                            </asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcOldPassword" runat="server" TargetControlID="ReqOldPassword">
                                            </cc1:ValidatorCalloutExtender>
                                            <asp:Label ID="Label1" runat="server" CssClass="errormsg"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label5" runat="server" Text="New Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ReqNewPassword" runat="server" SetFocusOnError="true"
                                                Display="None" ControlToValidate="txtNewPassword" ErrorMessage="Please enter the new password">
                                            </asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcNewPassword" runat="server" TargetControlID="ReqNewPassword">
                                            </cc1:ValidatorCalloutExtender>
                                            <cc1:PasswordStrength ID="pwdStrengt" runat="server" TargetControlID="txtNewPassword"
                                                MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1"
                                                MinimumUpperCaseCharacters="1" PrefixText="">
                                            </cc1:PasswordStrength>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label9" runat="server" Text="Re-Type Password"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtRePassword" runat="server" CssClass="txtbox" TextMode="Password"
                                                MaxLength="15"></asp:TextBox>
                                            <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="Passwords doesn't match"
                                                ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" SetFocusOnError="true"
                                                Display="None"></asp:CompareValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcRePassword" runat="server" TargetControlID="comparePassword">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                        <td align="right">
                                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                                            &nbsp;<asp:Button ID="btnback" CausesValidation="false" runat="server" Text="Back"
                                                CssClass="btn" OnClick="btnback_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center">
                                            <asp:Label ID="lblSuccess" runat="server" CssClass="errmsg">Password changed Successfully! <a href="EmployerHomePage.aspx" class="errormsg">Click here</a> to go to home page.</asp:Label>
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
</asp:Content>--%>
