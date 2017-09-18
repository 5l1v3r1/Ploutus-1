<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="EmployerForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" style="height: 730px; width: 100%;">
        <tr>
            <td colspan="5">
                <asp:Label ID="lblCompany" runat="server" Text="Forgot Your Password?" CssClass="headding"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" style="padding-left: 50px;" align="left">
                <table class="tbl-s">
                    <tr>
                        <td colspan="2">
                            Enter your email address in the box below and click the Submit button to receive
                            the Forgot Password email.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email Address:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="btnlogin" runat="server" Text="Reset Password" CssClass="btn" OnClick="btnlogin_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
