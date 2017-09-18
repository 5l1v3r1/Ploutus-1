<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="Resumes.aspx.cs" Inherits="Marketing_Resumes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Panel ID="panel2" runat="server" Width="1024px" BackColor="#E8E8E8">
        <table style="width: 1000px;">
            <tr>
                <td align="center">
                    <asp:TextBox ID="txtResume" TextMode="MultiLine" Width="1000px" Height="680px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnCancel" runat="server" OnClientClick="return confirm('Are you sure you want to Cancel the function ?');"
                        Text="Cancel" CssClass="btn" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:HiddenField ID="hdnDesc" runat="server" />
    <cc1:modalpopupextender ID="popsystem" runat="server" TargetControlID="hdnDesc" BackgroundCssClass="modalBackground"
        PopupControlID="panel2">
    </cc1:modalpopupextender>
</asp:Content>

