<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true" CodeFile="ApplicationInfo.aspx.cs" Inherits="JobSeeker_ApplicationInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                                    <td align="center">
                                        <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 400px;">
                                        <asp:Label ID="Label8" runat="server" Text="First Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                            Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>


                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label30" runat="server" Text="Middle Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMName" runat="server" CssClass="txtbox-s1" MaxLength="2"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label31" runat="server" Text="Last Name "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">*</span><asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLName"
                                            Display="None" ErrorMessage="Please enter the Last name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcLastName" runat="server" TargetControlID="RequiredLastName">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label9" runat="server" Text="Address Line 1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddr1" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label11" runat="server" Text="City"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCity" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label12" runat="server" Text="State Province"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" CssClass="ddlboxlrg" runat="server">
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
                                        <asp:Label ID="Label13" runat="server" Text="Zip Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtZip" CssClass="txtbox-lrg1" runat="server" MaxLength="5"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label14" runat="server" Text="Phone"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" CssClass="txtbox-lrg1" runat="server" MaxLength="20"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label15" runat="server" Text="Mobile"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" MaxLength="13"></asp:TextBox>

                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label1" runat="server" Text="Positions Interested"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPositions" CssClass="txtbox-lrg1" runat="server" MaxLength="200"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Date Available to Start"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateAva" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateAva">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label3" runat="server" Text="Wage Minimum:Permanent (Salary)"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPerSalary" CssClass="txtboxsm" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label4" runat="server" Text="Temporary(Hourly) "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTemporarySal" CssClass="txtboxsm" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>

                                    <td colspan="2" align="left">
                                        <asp:Label ID="lbl33" runat="server" Text="Available to Travel? Please specify"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="4" align="left">
                                        <asp:RadioButtonList ID="rdAvailabilityTravel" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem Value="1">	Iam able to travel</asp:ListItem>
                                            <asp:ListItem Value="2">	I am restricted in my ability to travel</asp:ListItem>
                                            <asp:ListItem Value="3">   I cannot travel</asp:ListItem>

                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label16" runat="server" Text="If restricted Distance/Timeframe you’ll drive for a position?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" CssClass="txtbox-lrg1" runat="server" MaxLength="200"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label5" runat="server" Text="If restricted Distance/Timeframe you’ll drive for a position?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDistance" CssClass="txtbox-lrg1" runat="server" MaxLength="200"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label7" runat="server" Text="Are you a citizen of the United States?	"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="IsCitizen" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label6" runat="server" Text="Are you legally eligible to work in the United States? "></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="IsLegal" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label10" runat="server" Text="Can you with or without reasonable accommodation perform the essential functions of this job? 
"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="IsAccomidation" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label17" runat="server" Text="Have you ever applied to Ploutus™LLC before?"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="AppliedPloutus" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label18" runat="server" Text="Have you ever worked for Ploutus™LLC before?"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="WorkedPloutus" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label20" runat="server" Text="Do you have a valid driver’s license? (For driving positions only)	"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="ValidDrivingLicense" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label21" runat="server" Text="Do you have transportation?	"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="HaveTransport" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label22" runat="server" Text="Will you accept a same day assignment"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="SameDayAssignment" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left" class="auto-style1">
                                        <asp:Label ID="Label23" runat="server" Text="Will you accept a long term assignment"></asp:Label>
                                    </td>
                                    <td align="left" class="auto-style1">
                                        <asp:RadioButtonList ID="LongAssignment" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label24" runat="server" Text="Have you been convicted of any moving violations in the past 5 years?	"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="violations" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label27" runat="server" Text="Is anyone related to you employed by Ploutus™LLC?"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList ID="Employed" runat="server" RepeatDirection="Horizontal"
                                            CssClass="rdbtn">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left">
                                        <asp:Label ID="Label28" runat="server" Text="Additional Information"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtAddInfo" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="left"></td>
                                    <td align="left">
                                        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn" OnClick="btnNext_Click" />
                                        <asp:Button ID="btnSkip" runat="server" CssClass="btn" Text="Skip"
                                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to skip the form filling?');" OnClick="btnSkip_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
                </td>
            </tr>
        </table>
</asp:Content>

