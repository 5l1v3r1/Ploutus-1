<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Marketing/InnerMasterEmp.master" CodeFile="EmployerRegSuccess.aspx.cs" Inherits="EmployerRgSuccess" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="1024px" style="min-height: 600px;">
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" style="width: 80%;" >
                    <tr style="height: 0px">
                        <td>
                        </td>
                    </tr>
                    <tr align="center" style="height: 80px">
                        <td style="height:500px">
                        <asp:Label ID="lblSuccess" runat="server" CssClass="bodytext">
                        Registration successful. Login credentials will send to his mail shortly<br /><%--<a href="EmployerLogin.aspx">Click Here</a> to go Login Page .--%>
                        </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

