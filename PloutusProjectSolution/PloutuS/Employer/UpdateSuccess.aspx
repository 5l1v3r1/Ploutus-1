<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateSuccess.aspx.cs" MasterPageFile="~/Employer/MerchantMaster.master" Inherits="Employer_UpdateSuccess" %>


<asp:Content ID="conetnt1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" width="1024px" style="min-height: 600px;">
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" style="width: 80%;">
                    <tr style="height: 0px">
                        <td>
                        </td>
                    </tr>
                    <tr align="center" style="height: 80px">
                        <td>
                        <asp:Label ID="lblSuccess" runat="server" CssClass="bodytext">
                        Successfully Updated.<br /><a href="EmployerHomePage.aspx">Click here</a> to go Home Page
                        </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>