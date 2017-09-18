<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSREmergency.aspx.cs" Inherits="JSREmergency" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" align="left" width="90%" height="700px">
        <tr>
            <td align="left" valign="top" style="padding-top:50px;padding-left:50px;">
                <table >
                    <tr>
                        <td colspan="4" class="org-shearder-bgNew">
                            <asp:Label ID="Label29" Text="Emergency Contact Information" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:20px;">

                        </td>
                    </tr>

                    <tr >
                        <td style="height:40px;">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmergencyName" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtEmergencyName" ErrorMessage="Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Enter Name</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server"  TargetControlID="rfvName"></asp:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <tr>
                        <td style="height:40px;">
                            <asp:Label ID="Label2" runat="server" Text="Relation"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRelation" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvRel" runat="server" ControlToValidate="txtRelation" ErrorMessage="Enter Relation" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Enter Relation</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="rfvRel"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:40px;">
                            <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmergencyPhoneNum" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtEmergencyPhoneNum" ErrorMessage="Enter Phone Number" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Enter Phone Number</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="rfvPhone"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="4" style="padding-top: 50px;"></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <table align="left" valign="top" style="padding-left:50px" width="100%">
                    <tr>

                        <td  colspan="2" align="left">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnSaveContinue_Click" ValidationGroup="JSRApp"  />
                            <span></span>
                            <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" OnClick="btnSaveLater_Click"  />
                        </td>

                        <td align="right" style="padding-right: 0px">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
            <td height="10">
                <img src="images/bootom-shape.jpg" width="1024" height="33" />
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color: #777777" class="copyrights">2014 © ploutuS LLC. All rights reserved.<br />
            </td>
        </tr>
    </table>
</asp:Content>

