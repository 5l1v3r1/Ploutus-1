<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSRActivation.aspx.cs" Inherits="JSREmailAct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="5" cellspacing="5" width="100%">
        <tr>
            <td align="center" style="width: 25%; padding-top: 10px">
                <asp:Label ID="Label1" runat="server" CssClass="headding" Text="Activation Page"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 50%">
                <asp:Label ID="lblmesg" runat="server" Text="" ForeColor="Green"> 
                        Your account has been activated successfully.<br /><a href="JobSeekerRegPro.aspx">Click here</a> to login.</asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 25%" align="center"></td>
        </tr>
    </table>
</asp:Content>

