<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSRApplicationInfo.aspx.cs" Inherits="JSRApplication" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" align="center">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job seeker Application"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td style="padding-left: 5px; font-size: 12px; font-weight: bold">Before Procedding to your account, Please complete the application.
                        
                        </td>
                    </tr>
                    <tr>
                        <td class="errmsg" style="padding-left: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 100%;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">
                                        <asp:Label ID="Label29" Text="Application Information" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="width: 400px;">
                                        <asp:Label ID="Label8" runat="server" CssClass="lblApp" Text="First Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtBoxApp" MaxLength="50"></asp:TextBox>                                       
                                        
                                    </td>


                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label30" runat="server" CssClass="lblApp" Text="Middle Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMName" runat="server" CssClass="txtBoxSmallApp" MaxLength="2"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label31" runat="server" CssClass="lblApp" Text="Last Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLName" runat="server" CssClass="txtBoxApp" MaxLength="50"></asp:TextBox>
                                                                     
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label9" runat="server" CssClass="lblApp" Text="Address Line 1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddr1" CssClass="txtBoxApp" runat="server" MaxLength="50"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label11" runat="server" CssClass="lblApp" Text="City"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCity" CssClass="txtBoxApp" runat="server" MaxLength="50"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label12" runat="server" CssClass="lblApp" Text="State Province"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" CssClass="ddlBoxApp" runat="server">
                                            <asp:ListItem Value="Select" Selected="False"></asp:ListItem>
                                            <asp:ListItem Value="Alabama"></asp:ListItem>
                                            <asp:ListItem Value="Alaska"></asp:ListItem>
                                            <asp:ListItem Value="Arizona"></asp:ListItem>
                                            <asp:ListItem Value="Arkansas"></asp:ListItem>
                                            <asp:ListItem Value="California"></asp:ListItem>
                                            <asp:ListItem Value="Colorado"></asp:ListItem>
                                            <asp:ListItem Value="Connecticut"></asp:ListItem>
                                            <asp:ListItem Value="Delaware"></asp:ListItem>
                                            <asp:ListItem Value="Florida"></asp:ListItem>
                                            <asp:ListItem Value="Georgia"></asp:ListItem>
                                            <asp:ListItem Value="Hawaii"></asp:ListItem>
                                            <asp:ListItem Value="Idaho"></asp:ListItem>
                                            <asp:ListItem Value="Illinois"></asp:ListItem>
                                            <asp:ListItem Value="Indiana"></asp:ListItem>
                                            <asp:ListItem Value="Iowa"></asp:ListItem>
                                            <asp:ListItem Value="Kansas"></asp:ListItem>
                                            <asp:ListItem Value="Kentucky"></asp:ListItem>
                                            <asp:ListItem Value="Louisiana"></asp:ListItem>
                                            <asp:ListItem Value="Maine"></asp:ListItem>
                                            <asp:ListItem Value="Maryland"></asp:ListItem>
                                            <asp:ListItem Value="Massachusetts"></asp:ListItem>
                                            <asp:ListItem Value="Michigan"></asp:ListItem>
                                            <asp:ListItem Value="Minnesota"></asp:ListItem>
                                            <asp:ListItem Value="Mississippi"></asp:ListItem>
                                            <asp:ListItem Value="Missouri"></asp:ListItem>
                                            <asp:ListItem Value="Montana"></asp:ListItem>
                                            <asp:ListItem Value="Nebraska"></asp:ListItem>
                                            <asp:ListItem Value="Nevada"></asp:ListItem>
                                            <asp:ListItem Value="New Hampshire"></asp:ListItem>
                                            <asp:ListItem Value="New Jersey"></asp:ListItem>
                                            <asp:ListItem Value="New Mexico"></asp:ListItem>
                                            <asp:ListItem Value="New York"></asp:ListItem>
                                            <asp:ListItem Value="North Carolina"></asp:ListItem>
                                            <asp:ListItem Value="North Dakota"></asp:ListItem>
                                            <asp:ListItem Value="Ohio"></asp:ListItem>
                                            <asp:ListItem Value="Oklahoma"></asp:ListItem>
                                            <asp:ListItem Value="Oregon"></asp:ListItem>
                                            <asp:ListItem Value="Pennsylvania"></asp:ListItem>
                                            <asp:ListItem Value="Rhode Island"></asp:ListItem>
                                            <asp:ListItem Value="South Carolina"></asp:ListItem>
                                            <asp:ListItem Value="South Dakota"></asp:ListItem>
                                            <asp:ListItem Value="Tennessee"></asp:ListItem>
                                            <asp:ListItem Value="Texas"></asp:ListItem>
                                            <asp:ListItem Value="Utah"></asp:ListItem>
                                            <asp:ListItem Value="Vermont"></asp:ListItem>
                                            <asp:ListItem Value="Virginia"></asp:ListItem>
                                            <asp:ListItem Value="Washington"></asp:ListItem>
                                            <asp:ListItem Value="West Virginia"></asp:ListItem>
                                            <asp:ListItem Value="Wisconsin"></asp:ListItem>
                                            <asp:ListItem Value="Wyoming"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label13" runat="server" CssClass="lblApp" Text="Zip Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtZip" CssClass="txtBoxSmallApp" runat="server" MaxLength="5"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label14" CssClass="lblApp" runat="server" Text="Phone"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" CssClass="txtBoxApp" runat="server" MaxLength="20"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label15" CssClass="lblApp" runat="server" Text="Mobile"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtMobile" CssClass="txtBoxApp" runat="server" MaxLength="13"></asp:TextBox>

                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label1" CssClass="lblApp" runat="server" Text="Positions Interested"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPositions" CssClass="txtBoxApp" runat="server" MaxLength="200"></asp:TextBox>
                                    </td>
                                </tr>                             


                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSaveContinue" runat="server" Text="Submit Application" CssClass="button-Mediam" ValidationGroup="Ques" OnClick="btnSaveContinue_Click" />
                                        <span></span>
                                        <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" ValidationGroup="Info" OnClick="btnSaveLater_Click" />
                                    </td>

                                    <td align="right" style="padding-right: 0px">
                                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" ValidationGroup="Info" OnClick="btnBack_Click" />
                                    </td>
                                </tr>
                            </table>

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

