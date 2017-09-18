<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Message.aspx.cs" Inherits="Message" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <asp:Label ID="lblSuccess" runat="server" CssClass="headding1">
                        You have been registered successfully. <br /><a href="JobSeekerRegPro.aspx">Click here</a> to go to home page.
                        </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
