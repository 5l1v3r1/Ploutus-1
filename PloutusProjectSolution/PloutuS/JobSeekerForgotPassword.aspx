<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="JobSeekerForgotPassword.aspx.cs" Inherits="JobSeekerForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" style="width: 100%; height: 630px">
        <tr>
            <td align="center" style="padding-top: 20px; padding-bottom: 30px; vertical-align: top;">
                <asp:Panel ID="pnlForgotpass" runat="server">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td style="padding-left: 50px; padding-right: 50px; height: 50px; vertical-align: top;
                                padding-top: 50px;">
                                <asp:Label ID="lblFail" runat="server" CssClass="errmsg" Visible="False"> Invalid Email ID. Please try with Email ID you registered with ploutuS.</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 50px; padding-right: 50px;">
                                <table cellpadding="0" cellspacing="0" class="tbl" style="height: 200px;">
                                    <tr>
                                        <td align="center" class="shearder-bg">
                                            <asp:Label ID="Label1" runat="server" Text="Forgot Password" CssClass="lbl"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <br />
                                            <table cellpadding="3" cellspacing="3" border="0" style="padding-left: 20px; padding-right: 20px;
                                                width: 380px; height: 150px">
                                                <tr>
                                                    <td align="left" style="width: 60px;">
                                                        <asp:Label ID="Label2" runat="server" Text="Email Id" CssClass="lbl"></asp:Label>
                                                    </td>
                                                    <td width="10px">
                                                        :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox-lrg1" 
                                                            MaxLength="50"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter EmailId"
                                                            ControlToValidate="TextBox2" CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right">
                                                        <asp:Button ID="btnlogin" runat="server" Text="Submit" CssClass="btn" OnClick="btnlogin_Click" />
                                                        &nbsp;<asp:Button ID="btnback" runat="server" Text="Back" CausesValidation="False"
                                                            CssClass="btn" OnClick="btnback_Click" />
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
                <asp:Panel ID="pnlMsg" runat="server" Width="100%">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <asp:Label ID="lblSuccess" runat="server">An Email with the Password is send to your registered Email Account. <a id="linkLogin" href="JobSeekerLogin.aspx">Click Here</a> to redirect to login page.</asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
