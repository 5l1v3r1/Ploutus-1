<%@ Page Title="Edit Jobs" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="EditJobsData.aspx.cs" Inherits="Employer_EditJobsData" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="cc2" %>
    <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
               <%-- <tr>
                    <td colspan="5" align="center" style="padding-top: 50px;" class="headding1">
                        <asp:Label ID="Label1" runat="server" Text="Job Posting"></asp:Label>
                    </td>
                </tr>--%>
                <tr>
                                <td class="errmsg" style="padding-left: 5px;">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label2" runat="server" Text="* fields are mandatory"></asp:Label>
                                </td>
                            </tr>
                <tr>
                 <td align="center">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                           Job Details
                                        </td>
                                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                        </td>
                                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                </tr>
                <tr>
                    <td align="center" style="padding-left: 50px;padding-right: 50px;">

                        <table cellspacing="5" cellpadding="5">
                           <%-- <tr>
                                <td class="errmsg" style="padding-left: 5px;">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                                </td>
                            </tr>--%>
                            <tr>
                                <td >
                                    <table class="tbl" width="900px" cellpadding="0" cellspacing="0" style="border-color:#FEF7E5" >
                                     <%--   <tr>
                                            <td class="Subhedding" colspan="3">
                                                Job Details
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td width="130px">
                                                <asp:Label ID="lblJobTitle" runat="server" Text="Job Title" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox-lrg11" MaxLength="100"></asp:TextBox>
                                                <span class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle"
                                                    Display="None" ErrorMessage="Please enter Job Title" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="vceJobTitle" runat="server" 
                                                    TargetControlID="rfvJobTitle">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="130px" valign="top">
                                                <asp:Label ID="lblJobDesc" runat="server" Text="Job Description" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" MaxLength="2000"
                                                    CssClass="lstboxlrg1"></asp:TextBox>
                                                <span style="vertical-align: top" class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtJobDesc"
                                                    Display="None" ErrorMessage="Please enter Job Description" SetFocusOnError="true"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="ValidatorCalloutExtender6" runat="server" 
                                                    TargetControlID="rfvDesc">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="130px">
                                                <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddIndustry" runat="server" Visible="false" CssClass="ddlboxlrg1" OnSelectedIndexChanged="ddIndustry_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                                 
                                                <cc2:dropdowncheckboxes ID="ddlcbIndustry" runat="server" 
                                                    CssClass="ddlboxlrg1" AutoPostBack="true" onselectedindexchanged="ddlcbIndustry_SelectedIndexChanged" 
                                                    >
                                               
                                                   
                                                </cc2:dropdowncheckboxes>
                                               
                                                
                                                 
                                                 <span class="errmsg">&nbsp;*</span>
                                            </td>
                                            
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvIndustry" runat="server" ErrorMessage="Please select Industry"
                                                    ControlToValidate="ddIndustry" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="ValidatorCalloutExtender1" runat="server" 
                                                    TargetControlID="rfvIndustry">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td width="130px">
                                        </td>
                                        <td>
                                        <asp:Label ID="lblIndus"  runat="server"  CssClass="lblIndus" Text=""></asp:Label>
                                        </td>
                                        </tr>
                                        <%--<tr>
                                            <td width="130px">
                                                <asp:Label ID="lblFunctionalArea" runat="server" Text="Functional Area" CssClass="lbl12"></asp:Label>
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
                                                <cc1:ValidatorCalloutExtender ID="vceFunctionalArea" runat="server" TargetControlID="rfvFunctionalArea">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td width="130px" style="height: 32px">
                                                <asp:Label ID="lblExperience" runat="server" Text="Experience" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td style="height: 32px">
                                                <asp:DropDownList ID="ddlmin" runat="server" CssClass="ddlboxsmall-post1">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlmax" runat="server" CssClass="ddlboxsmall-post1">
                                                </asp:DropDownList>
                                                <span class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td style="height: 32px">
                                                <asp:RequiredFieldValidator ID="rfvmax" runat="server" ErrorMessage="Please Select Max Salary"
                                                    ControlToValidate="ddlmax" Display="None" SetFocusOnError="true" InitialValue="Max"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="vcemax" runat="server" 
                                                    TargetControlID="rfvmax">
                                                </cc1:validatorcalloutextender>
                                                <asp:RequiredFieldValidator ID="rfvmin" runat="server" ErrorMessage="Please Select Min Salary"
                                                    ControlToValidate="ddlmin" Display="None" SetFocusOnError="true" InitialValue="Min"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="vcemin" runat="server" 
                                                    TargetControlID="rfvmin">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="130px">
                                                <asp:Label ID="lblRate" runat="server" Text="Rate ($)" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                             <asp:TextBox ID="txtRate" runat="server" CssClass="txtbox-lrg11" MaxLength="10"></asp:TextBox>
                                            </td>
                                            <%--<td>
                                                <asp:TextBox ID="txtRate" runat="server" CssClass="txtbox-s1" MaxLength="3"></asp:TextBox>
                                                &nbsp;/
                                                <asp:DropDownList ID="ddldolor" runat="server" CssClass="ddlboxsmall-post1">
                                                    <asp:ListItem>Per Hour</asp:ListItem>
                                                    <asp:ListItem>Per Day</asp:ListItem>
                                                </asp:DropDownList>
                                                <span class="errmsg">&nbsp;*</span>
                                                <asp:RequiredFieldValidator ID="rfvrate" runat="server" ErrorMessage="Please enter Rate"
                                                    ControlToValidate="txtRate" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="rfvrate">
                                                </cc1:ValidatorCalloutExtender>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtRate"
                                                    ValidationExpression="\d+" Display="None" EnableClientScript="true" ErrorMessage="Please enter numbers only"
                                                    runat="server" />
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RegularExpressionValidator2">
                                                </cc1:ValidatorCalloutExtender>
                                                +</td>--%>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="130px">
                                                <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddlboxlrg1" 
                                                    AutoPostBack="True" onselectedindexchanged="ddlLocation_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please select Location"
                                                    ControlToValidate="ddlLocation" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="vceLocation" runat="server" 
                                                    TargetControlID="rfvLocation">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td width="130px">
                                        </td>
                                        <td>
                                        <asp:TextBox ID="txtLoc" Visible="false"  runat="server" CssClass="txtbox-lrg11"></asp:TextBox>
                                        </td>
                                        <td>
                                        
                                        </td>
                                        </tr>
                                        <tr>
                                            <td width="130px">
                                                <asp:Label ID="lblSkills" runat="server" Text="Skills" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSkills" runat="server" CssClass="lstboxlrg1" 
                                                    TextMode="MultiLine"></asp:TextBox>
                                                <span style="vertical-align: top" class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSkills" runat="server" ErrorMessage="Please enter Skills"
                                                    ControlToValidate="txtSkills" Display="None" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:validatorcalloutextender ID="ValidatorCalloutExtender4" runat="server" 
                                                    TargetControlID="rfvSkills">
                                                </cc1:validatorcalloutextender>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td width="130px">
                                                <asp:Label ID="lblJobType" runat="server" Text="Job Type" CssClass="lbl12"></asp:Label>
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
                                                <cc1:ValidatorCalloutExtender ID="vceJobType" runat="server" TargetControlID="rfvJobType">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>--%>
                                        <%--<tr>
                                            <td width="130px">
                                                <asp:Label ID="lblVaciencies" runat="server" Text="No of Vacancies" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtVacancy" runat="server" CssClass="txtbox-s1" MaxLength="3"></asp:TextBox>
                                                <span class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvVacancy" runat="server" ErrorMessage="Please enter No of Vacancies"
                                                    ControlToValidate="txtVacancy" Display="None" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="rfvVacancy">
                                                </cc1:ValidatorCalloutExtender>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtVacancy"
                                                    ValidationExpression="\d+" Display="None" EnableClientScript="true" ErrorMessage="Please enter numbers only"
                                                    runat="server" />
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RegularExpressionValidator1">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>--%>
                                    </table>
                                </td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            <%--<tr>
                              <td align="center">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                           Desired Canditate Profile
                                        </td>
                                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                        </td>
                                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>--%>
                             <tr>
                    <td align="center" style="padding-left: 50px; padding-right: 50px; padding-top:0px;">

                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td>
                                    <table class="tbl" width="900px" cellpadding="0" cellspacing="0" style="border-color:#FEF7E5" >
                                       <%-- <tr>
                                            <td class="Subhedding" colspan="3">
                                                Desired Canditate Profile
                                            </td>
                                        </tr>--%>
                                        <%--<tr>
                                            <td width="130px" valign="top">
                                                <asp:Label ID="lblTechSkills" runat="server" Text="Job Responsibilities" CssClass="lbl12"></asp:Label>
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
                                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                                                CommandName="DeleteRows" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <table width="250px">
                                                                    <tr>
                                                                        <td align="right" valign="bottom" style="padding-right: 12px">
                                                                            <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text="Add Another Responsibilities"
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
                                        <%--<tr>
                                            <td width="130px">
                                                <asp:Label ID="lblSkills" runat="server" Text="Skills" CssClass="lbl12"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSkills" runat="server" CssClass="lstboxlrg" 
                                                    TextMode="MultiLine"></asp:TextBox>
                                                <span style="vertical-align: top" class="errmsg">&nbsp;*</span>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSkills" runat="server" ErrorMessage="Please enter Skills"
                                                    ControlToValidate="txtSkills" Display="None" SetFocusOnError="true" ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="rfvSkills">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>--%>
                                        <tr>
                            <td width="133px">
                            </td>
                                <td align="left" >
                                    <asp:Button ID="btPost" Text="Update" runat="server" CssClass="btn" OnClick="btPost_Click"
                                        ValidationGroup="Job" />
                                    &nbsp;
                                    <asp:Button ID="btCancel" Text="Back" runat="server" CssClass="btn" CausesValidation="False"
                                        OnClick="btCancel_Click" />
                                </td>
                            </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            
                            <tr align="center">
                                <td   style="height: 100px;">

                                <asp:Label ID="lblError" runat="server" CssClass="errmsg"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

