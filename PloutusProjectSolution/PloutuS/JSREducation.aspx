﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSREducation.aspx.cs" Inherits="JSEducation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="tbl" border="0" cellpadding="0" cellspacing="0" width="90%">
        <tr>
            <td align="left" valign="top" style="padding-top: 50px; padding-left: 50px;">
                <table>
                    <tr>
                        <td colspan="4" class="org-shearder-bgNew">
                            <asp:Label ID="Label15" Text="Applicant Education" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Label ID="Label16" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label17" runat="server" Text="Highest Level of  Education"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlHighestEdu" runat="server" CssClass="txtBoxApp">
                                <asp:ListItem Value="-1" Text="">--Select--</asp:ListItem>
                                <asp:ListItem Value="PHD" Text="PHD">High School</asp:ListItem>
                                <asp:ListItem Value="Diploma" Text="Diploma">Diploma</asp:ListItem>
                                <asp:ListItem Value="Associates" Text="Associates">Associates</asp:ListItem>
                                <asp:ListItem Value="Under graduate" Text="Under graduate">Under graduate</asp:ListItem>
                                <asp:ListItem Value="Post graduate" Text="Post graduate">Post graduate</asp:ListItem>
                                <asp:ListItem Value="PHD" Text="PHD">PHD</asp:ListItem>
                            </asp:DropDownList>
                            <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvHighEdu" runat="server" ControlToValidate="ddlHighestEdu" ErrorMessage="Select Highest Education" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Highest Education</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="rfvHighEdu"></asp:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label18" runat="server" Text="College name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHighCollegeName" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvHighColName" runat="server" ControlToValidate="txtHighCollegeName" ErrorMessage="Enter College Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Enter College Name</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="rfvHighColName"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label19" runat="server" Text="Course of Study"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHighCourse" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvHighCourse" runat="server" ControlToValidate="txtHighCollegeName" ErrorMessage="Enter Course Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Enter Course Name</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="rfvHighCourse"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label21" runat="server" Text="Graduated?"></asp:Label>
                        </td>
                        <td align="left" style="margin-left: 40px">
                            <asp:RadioButtonList ID="rblHighGraduated" runat="server" RepeatDirection="Horizontal">
                                <%-- CssClass="rdbtn">--%>
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvHighGrad" runat="server" ControlToValidate="rblHighGraduated" ErrorMessage="Select Graduation" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Graduation</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="rfvHighGrad"></asp:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label22" runat="server" Text="Year Graduated"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlHighYear" runat="server" CssClass="txtBoxApp">
                            </asp:DropDownList>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvHighYear" runat="server" ControlToValidate="ddlHighYear" ErrorMessage="Select Graduation Year" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Graduation Year</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="rfvHighYear"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label23" runat="server" Text="Diploma/Degree:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHighDiploma" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvDiploma" runat="server" ControlToValidate="txtHighDiploma" ErrorMessage="Select Diploma/Degree" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Diploma/Degree</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="rfvDiploma"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label1" runat="server" Text="Level of  Education"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLevelEdu" runat="server" CssClass="txtBoxApp">
                                <asp:ListItem Value="-1" Text="">--Select--</asp:ListItem>
                                <asp:ListItem Value="1" Text="PHD">High School</asp:ListItem>
                                <asp:ListItem Value="2" Text="Diploma">Diploma</asp:ListItem>
                                <asp:ListItem Value="3" Text="Associates">Associates</asp:ListItem>
                                <asp:ListItem Value="4" Text="Under graduate">Under graduate</asp:ListItem>
                                <asp:ListItem Value="5" Text="Post graduate">Post graduate</asp:ListItem>
                                <asp:ListItem Value="6" Text="PHD">PHD</asp:ListItem>
                            </asp:DropDownList>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvLevelEdu" runat="server" ControlToValidate="ddlLevelEdu" ErrorMessage="Select Level Education" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Level Education</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="rfvLevelEdu"></asp:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label2" runat="server" Text="College name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLevelCollegeName" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvCollegeName" runat="server" ControlToValidate="txtLevelCollegeName" ErrorMessage="Select College Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select College Name</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="rfvCollegeName"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label3" runat="server" Text="Course of Study"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLevelCourse" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="txtLevelCourse" ErrorMessage="Select Course" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Course</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="rfvCourse"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label4" runat="server" Text="Graduated?"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:RadioButtonList ID="rbLevelGraduated" runat="server" RepeatDirection="Horizontal">

                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                              <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvLvlGrad" runat="server" ControlToValidate="rbLevelGraduated" ErrorMessage="Select Graduation" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Graduation</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="rfvLvlGrad"></asp:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label5" runat="server" Text="Year Graduated"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLevelYear" runat="server" CssClass="txtBoxApp">
                            </asp:DropDownList>
                              <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvYearGrad" runat="server" ControlToValidate="ddlLevelYear" ErrorMessage="Select year of Graduation" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select year of Graduation</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="rfvYearGrad"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label6" runat="server" Text="Diploma/Degree:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLevelDiploma" CssClass="txtBoxApp" runat="server" MaxLength="100"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                                    <asp:RequiredFieldValidator ID="rfvLvlDegree" runat="server" ControlToValidate="txtLevelDiploma" ErrorMessage="Select Diploma/Degree" ForeColor="Red" SetFocusOnError="True" ValidationGroup="JSRApp">Select Diploma/Degree</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="rfvLvlDegree"></asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td height="115px">
                            <asp:Label ID="Label24" runat="server" Text="Please list any academic honors, scholarships, offices held, etc. <br><i>(Do not list any which reflect your race, ethnicity, religion, gender,<br> national origin, age, disabilities or veteran status)</i> </br></br> Describe any specialized training, apprenticeships, licenses or skills: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSpecialization" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" MaxLength="500"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            <asp:Label ID="Label26" runat="server" Text="Have you received any job-related training in the United States Military?"></asp:Label>
                        </td>
                        <td>                          
                            
                               <asp:RadioButton ID="rbMilitaryYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="Military" OnCheckedChanged="rbMilitaryYes_CheckedChanged"  />
                            <asp:RadioButton ID="rbMilitaryNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="Military" OnCheckedChanged="rbMilitaryNo_CheckedChanged" />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMilitaryDetails" runat="server" Text="<i>If yes, please give dates and explanation:</i> " Visible="false"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMilitaryDetails" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" MaxLength="500" Visible="false"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-top:30px;padding-bottom:30px">
                <table align="left" valign="top" style="padding-left:50px" width="100%">
                    <tr>

                        <td  colspan="2" align="left">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnSaveContinue_Click"  ValidationGroup="JSRApp" />
                            <span></span>
                            <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" OnClick="btnSaveLater_Click"  />
                        </td>

                        <td align="right" style="padding-right: 50px">
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

