<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="EditJSRApplication.aspx.cs" Inherits="JSRApplication" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <table cellpadding="0" cellspacing="0" class="tbl" align="left" width="80%" style="padding-left: 50px;">
        <%--   <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job seeker Application"></asp:Label>
            </td>
        </tr>--%>
        <%-- <tr>
                        <td style="padding-left: 5px; font-size: 12px; font-weight: bold">Before Procedding to your account, Please complete the application.
                        
                        </td>
                    </tr>--%>
        <tr>
            <td style="padding-top: 50px;" align="left">
                <table class="tbl" style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="4" class="org-shearder-bgNew">
                            <asp:Label ID="Label29" Text="APPLICANT INFORMATION" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="padding-top: 20px; height: 35px;">
                            <asp:Label ID="Label2" runat="server" CssClass="lblApp" Text="Date available to start"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDateAva" CssClass="txtBoxApp" runat="server" MaxLength="10"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateAva">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 40px;">
                            <asp:Label ID="Label3" runat="server" CssClass="lblApp" Text="Wage Minimum:Permanent (Salary)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPerSalary" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2" style="height: 40px;">
                            <asp:Label ID="Label4" CssClass="lblApp" runat="server" Text="Temporary(Hourly) "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTemporarySal" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>

                        <td colspan="2" align="left" style="height: 70px; vertical-align: top">
                            <asp:Label ID="lbl33" runat="server" CssClass="lblApp" Text="Available to Travel? Please specify"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rblTravel" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem Value="Iam able to travel">	Iam able to travel</asp:ListItem>
                                <asp:ListItem Value="I am restricted in my ability to travel">	I am restricted in my ability to travel</asp:ListItem>
                                <asp:ListItem Value="I cannot travel">   I cannot travel</asp:ListItem>

                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label16" runat="server" CssClass="lblApp" Text="If restricted Distance/Timeframe you’ll drive for a position?"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDistance" CssClass="txtBoxApp" runat="server" MaxLength="200"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label7" runat="server" CssClass="lblApp" Text="Are you a citizen of the United States?"></asp:Label>
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
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label6" runat="server" CssClass="lblApp" Text="Are you legally eligible to work in the United States? </br><i>(Proof of eligibility will be required upon offer of employment) <i>"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rblLegal" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label1" runat="server" CssClass="lblApp" Text="Are you over the age of 18 years?</br><i>(If “No”, you may be required to provide authorization)<i>"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rblAge" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <%-- Can you with or without reasonable accommodation</br>perform the essential functions of this job?--%>
                            <asp:Label ID="Label10" runat="server" CssClass="lblApp" Text="Can you with or without reasonable accommodation </br> perform the essential functions of this job? 
"></asp:Label>
                        </td>
                        <td align="left" style="height: 40px;">
                            <asp:RadioButtonList ID="IsAccomidation" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label17" runat="server" CssClass="lblApp" Text="Have you ever applied to Ploutus™LLC before?"></asp:Label>
                        </td>
                        <td align="left">

                            <asp:RadioButton ID="rbAppliedPloutusYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="AppliedPloutus" OnCheckedChanged="rbAppliedPloutusYes_CheckedChanged" />
                            <asp:RadioButton ID="rbAppliedPloutusNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="AppliedPloutus" OnCheckedChanged="rbAppliedPloutusNo_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblApplied" runat="server" CssClass="lblApp" Text="<i>If yes, please give date<i>" Visible="false"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAppliedPloutuse" CssClass="txtBoxApp" runat="server" MaxLength="10" Visible="false"></asp:TextBox>
                            <cc1:CalendarExtender ID="calAppliedDate" runat="server" TargetControlID="txtAppliedPloutuse">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label18" runat="server" CssClass="lblApp" Text="Have you ever worked for Ploutus™LLC before?"></asp:Label>
                        </td>
                        <td align="left">

                            <asp:RadioButton ID="rbWorkedPloutusYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="WorkedPloutus" OnCheckedChanged="rbWorkedPloutusYes_CheckedChanged" />
                            <asp:RadioButton ID="rbWorkedPloutusNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="WorkedPloutus" OnCheckedChanged="rbWorkedPloutusNo_CheckedChanged" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblWorkedPloutus" runat="server" CssClass="lblApp" Text="<i>If yes, please give date<i>" Visible="false"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtWorkedPloutus" CssClass="txtBoxApp" runat="server" MaxLength="10" Visible="false"></asp:TextBox>
                            <cc1:CalendarExtender ID="calWorked" runat="server" TargetControlID="txtWorkedPloutus">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label20" runat="server" CssClass="lblApp" Text="Do you have a valid driver’s license?</br><i> (For driving positions only)<i>"></asp:Label>
                        </td>
                        <td align="left" style="height: 40px;">
                            <asp:RadioButtonList ID="rblValidDrivingLicense" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label21" runat="server" CssClass="lblApp" Text="Do you have transportation?	"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rblHaveTransport" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label22" runat="server" CssClass="lblApp" Text="Will you accept a same day assignment"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rblSameDayAssignment" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label23" runat="server" CssClass="lblApp" Text="Will you accept a long term assignment"></asp:Label>
                        </td>
                        <td align="left" class="auto-style1">
                            <asp:RadioButtonList ID="rblLongAssignment" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label8" runat="server" CssClass="lblApp" Text="Are you available"></asp:Label>
                        </td>
                        <td align="left" class="auto-style1">
                            <asp:DropDownList ID="ddlJobType" runat="server" CssClass="txtBoxApp">
                                <asp:ListItem Value="0" Text="None">Select</asp:ListItem>
                                <asp:ListItem Value="Part time" Text="Part time">Part time</asp:ListItem>
                                <asp:ListItem Value="Full time" Text="Full time">Full time</asp:ListItem>
                                <asp:ListItem Value="Temparary" Text="Temparary">Temparary</asp:ListItem>
                                <asp:ListItem Value="Hire" Text="Hire">Hire</asp:ListItem>
                                <asp:ListItem Value="Direct Hire" Text="Direct Hire">Direct Hire</asp:ListItem>
                                <asp:ListItem Value="Contract" Text="Contract">Contract</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label24" runat="server" CssClass="lblApp" Text="Have you been convicted of any moving violations in the past 5 years?"></asp:Label>
                        </td>
                        <td align="left">
                            <%--<asp:RadioButtonList ID="rblviolations" runat="server" RepeatDirection="Horizontal"
                                CssClass="rdbtn">
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>--%>

                            <asp:RadioButton ID="rbviolationYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="violations" OnCheckedChanged="rbviolationYes_CheckedChanged" />
                            <asp:RadioButton ID="rbviolationNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="violations" OnCheckedChanged="rbviolationNo_CheckedChanged" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblViolationDetails" runat="server" CssClass="lblApp" Text="  <i>Please provide the details <i>" Visible="false"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtViolationDetails" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" MaxLength="500" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 40px;">
                            <asp:Label ID="Label27" runat="server" CssClass="lblApp" Text="Is anyone related to you employed by Ploutus™LLC?"></asp:Label>
                        </td>
                        <td align="left">


                            <asp:RadioButton ID="rbEmployedYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="employed" OnCheckedChanged="rbEmployedYes_CheckedChanged" />
                            <asp:RadioButton ID="rbEmployedNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="employed" OnCheckedChanged="rbEmployedNo_CheckedChanged" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="vertical-align: top;">
                            <asp:Label ID="lblRefName" runat="server" CssClass="lblApp" Text="<i>Reference name<i>" Visible="false"></asp:Label>
                        </td>
                        <td align="left" style="vertical-align: top;">
                            <asp:TextBox ID="txtRefName" CssClass="txtBoxApp" runat="server" MaxLength="100" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblRefRelation" runat="server" CssClass="lblApp" Text="<i>Reference relation<i>" Visible="false"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtRefRelation" CssClass="txtBoxApp" runat="server" MaxLength="100" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="height: 125px; vertical-align: top">
                            <asp:Label ID="Label28" runat="server" CssClass="lblApp" Text="Additional Information?"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAdditionalInfo" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" MaxLength="500"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="left">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Update" CssClass="button-Mediam" ValidationGroup="Ques" OnClick="btnSaveContinue_Click" />
                            <span></span>
                            <%--<asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" ValidationGroup="Info" OnClick="btnSaveLater_Click" />--%>
                        </td>

                        <td align="right" style="padding-right: 0px">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" ValidationGroup="Info" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="padding-top: 50px;"></td>
                    </tr>


                </table>
            </td>
        </tr>

    </table>
    <%--Footer--%>
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

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            height: 48px;
        }
    </style>
</asp:Content>


