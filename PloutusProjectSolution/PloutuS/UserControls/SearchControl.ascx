<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchControl.ascx.cs"
    Inherits="UserControls_SearchControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<table cellpadding="0" cellspacing="0" border="0" style="font-size: 12px; font-family: Verdana;"
    width="1024">
    <tr>
        <td>
            <table bgcolor="silver" style="padding-left: 20px; width: 439px;">
                <tr>
                    
                    <td style="width:20px;">
                        <asp:TextBox ID="TextBox2" runat="server" Width="369px" 
                            Height="31px"></asp:TextBox>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" TargetControlID="TextBox2" runat="server" WatermarkText="Search">
                        </cc1:TextBoxWatermarkExtender>
                    </td>
                   
                   
                    <td align="left" style="width: 120px;">
                        <asp:Button ID="Button3" runat="server" CssClass="button" Text="Search" OnClick="Button1_Click"
                            CausesValidation="False" />
                    </td>
                   
                </tr>
            </table>
        </td>
    </tr>
</table>
