<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="EditJobs.aspx.cs" Inherits="Employer_EditJobs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 50px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="Label1" runat="server" Text="Edit Jobs"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td class="errmsg" style="padding-left: 5px;">
                            &nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" width="900px" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td class="Subhedding" colspan="3">
                                        Job Details
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblJobTitle" runat="server" Text="Job Title" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox-lrg1" MaxLength="100"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle"
                                            Display="None" ErrorMessage="Please enter Job Title" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vceJobTitle" runat="server" TargetControlID="rfvJobTitle">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px" valign="top">
                                        <asp:Label ID="lblJobDesc" runat="server" Text="Job Description" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" MaxLength="2000"
                                            CssClass="lstboxlrg"></asp:TextBox>
                                        <span style="vertical-align: top" class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtJobDesc"
                                            Display="None" ErrorMessage="Please enter Job Description" SetFocusOnError="true"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="rfvDesc">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddIndustry" runat="server" CssClass="ddlboxlrg" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddIndustry_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvIndustry" runat="server" ErrorMessage="Please select Industry"
                                            ControlToValidate="ddIndustry" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="rfvIndustry">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblFunctionalArea" runat="server" Text="Functional Area" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlFunctionalArea" runat="server" CssClass="ddlboxlrg">
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvFunctionalArea" runat="server" ErrorMessage="Please Select Functional Area"
                                            ControlToValidate="ddlFunctionalArea" Display="None" SetFocusOnError="true" InitialValue="--------Select-----------"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vceFunctionalArea" runat="server" TargetControlID="rfvFunctionalArea">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px" style="height: 32px">
                                        <asp:Label ID="lblExperience" runat="server" Text="Experience" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td style="height: 32px">
                                        <asp:DropDownList ID="ddlmin" runat="server" CssClass="ddlboxsmall-post">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlmax" runat="server" CssClass="ddlboxsmall-post">
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td style="height: 32px">
                                        <asp:RequiredFieldValidator ID="rfvmax" runat="server" ErrorMessage="Please Select Max Salary"
                                            ControlToValidate="ddlmax" Display="None" SetFocusOnError="true" InitialValue="Max"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vcemax" runat="server" TargetControlID="rfvmax">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="rfvmin" runat="server" ErrorMessage="Please Select Min Salary"
                                            ControlToValidate="ddlmin" Display="None" SetFocusOnError="true" InitialValue="Min"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vcemin" runat="server" TargetControlID="rfvmin">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblRate" runat="server" Text="Rate ($)" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRate" runat="server" CssClass="txtbox-lrg1" MaxLength="20"></asp:TextBox>
                                        &nbsp; <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvrate" runat="server" ErrorMessage="Please enter Rate"
                                            ControlToValidate="txtRate" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="rfvrate">
                                        </asp:ValidatorCalloutExtender>
                                        
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddlboxlrg">
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please select Location"
                                            ControlToValidate="ddlLocation" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vceLocation" runat="server" TargetControlID="rfvLocation">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblJobType" runat="server" Text="Job Type" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlJobType" runat="server" CssClass="ddlboxlrg">
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvJobType" runat="server" ErrorMessage="Please Select Job Type"
                                            ControlToValidate="ddlJobType" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                            ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vceJobType" runat="server" TargetControlID="rfvJobType">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblVaciencies" runat="server" Text="No of Vacancies" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVacancy" runat="server" CssClass="txtbox-s1" MaxLength="3"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvVacancy" runat="server" ErrorMessage="Please enter No of Vacancies"
                                            ControlToValidate="txtVacancy" Display="None" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="rfvVacancy">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtVacancy"
                                            ValidationExpression="\d+" Display="None" EnableClientScript="true" ErrorMessage="Please enter numbers only"
                                            runat="server" />
                                        <asp:validatorcalloutextender id="ValidatorCalloutExtender8" runat="server" targetcontrolid="RegularExpressionValidator1">
                                                </asp:validatorcalloutextender>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" width="900px" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td class="Subhedding" colspan="3">
                                        Desired Canditate Profile
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td width="130px" valign="top">
                                        <asp:Label ID="lblTechSkills" runat="server" Text="Job Responsibilities" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Repeater ID="repeater1" runat="server" OnItemCommand="repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <table width="250px" class="tbl-bd">
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtJobRes" Text='<%# Eval("skill") %>' runat="server" CssClass="txtbox-lrg1"
                                                                        MaxLength="1000"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/close.jpg"
                                                                        CausesValidation="false" CommandName="DeleteRows" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    <table width="250px">
                                                    <tr>
                                                    <td align="right" valign="bottom" style="padding-right:12px">
                                                      <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text="Add Rows"
                                                            CommandName="AddRows" />
                                                    </td>
                                                    </tr>
                                                    </table>
                                                      </FooterTemplate>
                                                </asp:Repeater>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td width="130px">
                                        <asp:Label ID="lblSkills" runat="server" Text="Skills" CssClass="lbl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSkills" runat="server" CssClass="lstboxlrg" 
                                            MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvSkills" runat="server" ErrorMessage="Please enter Skills"
                                            ControlToValidate="txtSkills" Display="None" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="rfvSkills">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                <td></td></tr>
                            </table>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right">
                            <asp:Button ID="btUpdate" Text="Update" runat="server" CssClass="btn" ValidationGroup="Job"
                                OnClick="btUpdate_Click" />
                            &nbsp;
                            <asp:Button ID="btCancel" Text="Back" runat="server" CssClass="btn" CausesValidation="False"
                                OnClick="btCancel_Click" />
                        </td>
                    </tr>
                    <tr align="center">
                        <td style="height: 100px;">
                         <asp:Label ID="lblError" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
