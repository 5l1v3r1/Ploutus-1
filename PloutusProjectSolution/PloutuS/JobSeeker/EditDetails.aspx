<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="EditDetails.aspx.cs" Inherits="EditDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job Seekers Edit Profile"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td class="errmsg" style="padding-left: 5px;">
                            &nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px; border-color:#FFC498" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">
                                        <asp:Label ID="Label29" Text="Contact Info" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label1" runat="server" Text="Name " ></asp:Label>
                                    </td>
                                    <td style="width: 265px;">
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox><span
                                            class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td style="width: 80px;">
                                        <asp:TextBox ID="txtMName" runat="server" CssClass="txtbox-s1" MaxLength="2"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                            Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                        </cc1:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLName"
                                            Display="None" ErrorMessage="Please enter the Last name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcLastName" runat="server" TargetControlID="RequiredLastName">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label2" runat="server" Text="Address Line 1" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtAddr1" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredAddress" runat="server" ControlToValidate="txtAddr1"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please enter the Address"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcAddress1" runat="server" TargetControlID="RequiredAddress">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Address Line 2" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtAddr2" runat="server" CssClass="txtbox-lrg1" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label4" runat="server" Text="City" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtCity" CssClass="txtbox-lrg1" runat="server" MaxLength="75"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredCity" runat="server" ControlToValidate="txtCity"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please enter the City" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcCity" runat="server" TargetControlID="RequiredCity">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label5" runat="server" Text="State Province" ></asp:Label>
                                    </td>
                                    <td colspan="3">
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
                                        <span class="errmsg">*</span>
                                        <asp:RequiredFieldValidator ID="ReqState" runat="server" ControlToValidate="ddlState"
                                            InitialValue="Select" SetFocusOnError="true" Display="None" ErrorMessage="Please select the State"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcState" runat="server" TargetControlID="ReqState">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label6" runat="server" Text="Zip Code" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtZip" CssClass="txtbox-lrg1" runat="server" MaxLength="5"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RegularExpressionValidator ID="RegZip" runat="server" ControlToValidate="txtZip"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Zipcode must be 5 charecters only."
                                            ValidationExpression="\d{5}(-\d{4})?" CssClass="errmsg"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcZip" runat="server" TargetControlID="RegZip">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label7" runat="server" Text="Phone" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtPhone" CssClass="txtbox-lrg1" runat="server" MaxLength="15"></asp:TextBox>
                                        <%--<cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtPhone"
                                            Mask="(999)999-9999">
                                        </cc1:MaskedEditExtender>--%>
                                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                                         ErrorMessage="Phone number should be in (xxx)xxx-xxxx format" CssClass="errmsg"
                                            SetFocusOnError="true" Display="None"></asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcePhoneReg" runat="server" TargetControlID="revPhone"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label8" runat="server" Text="Mobile" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" MaxLength="15"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="ReqMobile" runat="server" ControlToValidate="txtMobile"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please enter the mobiel number"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcMobileReq" runat="server" TargetControlID="ReqMobile">
                                        </cc1:ValidatorCalloutExtender>
                                        <%--<cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="txtMobile"
                                            Mask="(999)999-9999">
                                        </cc1:MaskedEditExtender>--%>
                                        <asp:RegularExpressionValidator ID="regMobile" runat="server" ControlToValidate="txtMobile" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                                         ErrorMessage="Phone number should be in (xxx)xxx-xxxx format" CssClass="errmsg"
                                            SetFocusOnError="true" Display="None"></asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="vceMobile" runat="server" TargetControlID="regMobile"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label9" runat="server" Text="Email Address" ></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtEmail" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmail"
                                            SetFocusOnError="true" Display="None" ErrorMessage="e-mail should be **@**.**"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errmsg"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcEmail" runat="server" TargetControlID="RegEmail">
                                        </cc1:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please enter the Email Address"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcEmailReq" runat="server" TargetControlID="ReqEmail">
                                        </cc1:ValidatorCalloutExtender>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;border-color:#FFC498" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td colspan="2" class="org-shearder-bgNew">
                                        <asp:Label ID="Label20" runat="server" Text="Experience Details"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label10" runat="server" Text="Can you work legally in the US ?"
                                            ></asp:Label>
                                    </td>
                                    <td style="float: left;">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rbLegallyUs" runat="server" RepeatDirection="Horizontal"
                                                        CssClass="rdbtn">
                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                        <asp:ListItem Value="No">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td>
                                                    <span style="float: left;" class="errmsg">*</span>
                                                    <asp:RequiredFieldValidator ID="rqvRadio" runat="server" ControlToValidate="rbLegallyUs"
                                                        ErrorMessage="Please select relevant option" SetFocusOnError="true" Display="None"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vceRadio" runat="server" TargetControlID="rqvRadio">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label11" runat="server" Text="Most Recent Employer" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMRecentEmployer" runat="server" CssClass="txtbox-lrg1" MaxLength="150"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rqvRecentEmp" runat="server" ControlToValidate="txtMRecentEmployer"
                                            ErrorMessage="Enter recent Employer" SetFocusOnError="true" Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceRecentEmp" runat="server" TargetControlID="rqvRecentEmp">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label12" runat="server" Text="Job Title"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox-lrg1" MaxLength="100"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rqvJobTitle" runat="server" ControlToValidate="txtJobTitle"
                                            ErrorMessage="Enter job title" SetFocusOnError="true" Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceJobTitle" runat="server" TargetControlID="rqvJobTitle">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label13" runat="server" Text="Field of Expertise" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlFieldExpertise" runat="server" CssClass="ddlboxlrg">
                                        </asp:DropDownList>
                                        <span class="errmsg">*</span>
                                        <asp:RequiredFieldValidator ID="rqvField" runat="server" ControlToValidate="ddlFieldExpertise"
                                            ErrorMessage="Select field you are expertised in." InitialValue="Select" SetFocusOnError="true"
                                            Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceField" runat="server" TargetControlID="rqvField">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label14" runat="server" Text="Years Experience" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlYearsExp" runat="server" CssClass="ddlboxsm">
                                            <asp:ListItem Value="-1">--</asp:ListItem>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                            <asp:ListItem Value="13">13</asp:ListItem>
                                            <asp:ListItem Value="14">14</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="16">16</asp:ListItem>
                                            <asp:ListItem Value="17">17</asp:ListItem>
                                            <asp:ListItem Value="18">18</asp:ListItem>
                                            <asp:ListItem Value="19">19</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="21">21</asp:ListItem>
                                            <asp:ListItem Value="22">22</asp:ListItem>
                                            <asp:ListItem Value="23">23</asp:ListItem>
                                            <asp:ListItem Value="24">24</asp:ListItem>
                                            <asp:ListItem Value="25">25</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="Label27" runat="server" Text="(Years) " ></asp:Label>
                                        <asp:DropDownList ID="ddlMonthsExp" runat="server" CssClass="ddlboxsm">
                                            <asp:ListItem Value="-1">--</asp:ListItem>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="Label28" runat="server" Text="(Months) " ></asp:Label>
                                        <span class="errmsg">*</span>
                                        <asp:RequiredFieldValidator ID="rqvMonths" runat="server" ControlToValidate="ddlMonthsExp"
                                            InitialValue="-1" ErrorMessage="Select months of experience" SetFocusOnError="true"
                                            Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceMonths" runat="server" TargetControlID="rqvMonths">
                                        </cc1:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="rqvYears" runat="server" ControlToValidate="ddlYearsExp"
                                            InitialValue="-1" ErrorMessage="Select years of experience" SetFocusOnError="true"
                                            Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceYears" runat="server" TargetControlID="rqvYears">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;border-color:#FFC498" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td colspan="2" class="org-shearder-bgNew">
                                        <asp:Label ID="Label21" runat="server" Text="Eligibility Details "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 225px; vertical-align: top;">
                                        &nbsp;<asp:Label ID="Label15" runat="server" Text="Geographic Preference" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="lbPreLoc" runat="server" SelectionMode="Multiple" CssClass="lstboxlrg">
                                        </asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:Label ID="Label16" runat="server" Text="Highest Education" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlHEdu" runat="server" CssClass="ddlboxlrg">
                                            <asp:ListItem Value="-1">Select Highest Education Level</asp:ListItem>
                                            <asp:ListItem Value="1">None</asp:ListItem>
                                            <asp:ListItem Value="2">GED</asp:ListItem>
                                            <asp:ListItem Value="3">High School</asp:ListItem>
                                            <asp:ListItem Value="4">Vocational School</asp:ListItem>
                                            <asp:ListItem Value="5">Associate Degree</asp:ListItem>
                                            <asp:ListItem Value="6">Bachelors Degree</asp:ListItem>
                                            <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                                            <asp:ListItem Value="8">Doctorate</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">*</span>
                                        <asp:RequiredFieldValidator ID="rqvHighestEdu" runat="server" ControlToValidate="ddlHEdu"
                                            Display="None" ErrorMessage="Select your Highest Education" InitialValue="-1"
                                            SetFocusOnError="true" CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vceHighestEdu" runat="server" TargetControlID="rqvHighestEdu">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-bottom: 100px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                                CssClass="btn" />&nbsp; &nbsp;
                            <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn" OnClick="btnback_Click"
                                CausesValidation="False" />
                            <asp:Label ID="lblSuccess" runat="server" CssClass="errmsg">Update successful. </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>
