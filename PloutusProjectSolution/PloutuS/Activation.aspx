<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Activation.aspx.cs" Inherits="Activation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="5" cellspacing="5" width="100%">
    <tr>
    <td align="center" style="width:25%; padding-top:10px">
     <asp:Label ID="Label1" runat="server" CssClass="headding" Text="Activation Page"></asp:Label>
    </td>
    </tr>
    <tr>
    <td align="center" style="width:25%">
        <asp:Label ID="lblmesg" runat="server" ForeColor="Green"></asp:Label>
        </td>
        </tr>
         <tr>
    <td style="width:25%" align="center" >
           <asp:LinkButton ID="lnklogin" runat="server" Text="Click here" OnClick="lnklogin_Click"> To Login</asp:LinkButton>
         </td>
        </tr>
    </table>
</asp:Content>

