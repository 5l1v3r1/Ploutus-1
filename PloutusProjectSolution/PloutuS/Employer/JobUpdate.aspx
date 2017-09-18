<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="JobUpdate.aspx.cs" Inherits="Employer_JobUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                         Job Update Successfully....<br /><a href="ViewJobs.aspx">Click Here</a> to View Jobs
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
