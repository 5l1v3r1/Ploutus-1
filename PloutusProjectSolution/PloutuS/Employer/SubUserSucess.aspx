<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master" AutoEventWireup="true" CodeFile="SubUserSucess.aspx.cs" Inherits="Employer_SubUserSucess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        Sub User Created Sucessfully..<br /><a href="EmployerHomePage.aspx">Click here</a> to go Home Page
                        </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

