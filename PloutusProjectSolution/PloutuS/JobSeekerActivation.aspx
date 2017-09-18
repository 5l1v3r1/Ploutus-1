<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="JobSeekerActivation.aspx.cs" Inherits="JobSeekerActivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="1024px" style="height: 600px;">
        <tr>
            <td align="center">
                <table class="tbl" cellpadding="0" cellspacing="0" style="width: 80%;">
                    <tr style="height: 0px">
                        <td>
                        </td>
                    </tr>
                    <tr style="height: 80px;">
                        <td align="center">
                        
                            <asp:Label ID="lblConfirmation" runat="server" CssClass="headding1">
                        Your account has been activated successfully.<br /><a href="JobSeekerLogin.aspx">Click here</a> to login.
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
