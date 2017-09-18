<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="ViewSelected.aspx.cs" Inherits="Employer_ViewSelected" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="panel1" runat="server">
        <ContentTemplate>
            <div style="width: 100%;">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="min-height: 670px;
                    padding-left: 50px; padding-right: 50px;">
                    <tr>
                        <td align="center" class="headding1" style="padding-top: 50px; padding-bottom: 30px;">
                            <asp:Label ID="Label19" runat="server" Text="Selected Candidate"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:DataList ID="dlUserProfile" runat="server">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 924px;">
                                        <tr>
                                            <td>
                                                <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                                    <tr>
                                                        <td class="shearder-bg" colspan="2">
                                                            <asp:Label ID="Label10" runat="server" Text=" User Details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="lblRFrstName" runat="server" CssClass="lbl" Text="Name"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("firstname")%>&nbsp;&nbsp;
                                                            <%# Eval("middlename")%>&nbsp;&nbsp;
                                                            <%# Eval("lastname")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                                    <tr>
                                                        <td class="shearder-bg" colspan="2">
                                                            <asp:Label ID="Label3" runat="server" Text="Contact Info" CssClass="lbl"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="lblRA1" runat="server" CssClass="lbl" Text="Address"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("addressline1")%>,&nbsp; &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                        </td>
                                                        <td>
                                                            <%# Eval("addressline2")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblCity" runat="server" CssClass="lbl" Text="City"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("city")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblState" runat="server" CssClass="lbl" Text="State"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("state")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblZip" runat="server" CssClass="lbl" Text="Zipcode"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("zip")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblPhone" runat="server" CssClass="lbl" Text="Phone Number"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("phone")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblMobile" runat="server" CssClass="lbl" Text="Mobile Number"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("mobile")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblEmail" runat="server" CssClass="lbl" Text="E-Mail ID"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("email")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0" >
                                                    <tr>
                                                        <td class="shearder-bg" colspan="2">
                                                            <asp:Label ID="Label4" runat="server" Text="Experience Details" CssClass="lbl"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="lblRecentEmp" runat="server" Text="Most Recent Employer"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("RecentEmployer")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblJobTitle" runat="server" Text="Job Title"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("JobTitle")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Exp")%>&nbsp; Years
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0" >
                                                    <tr>
                                                        <td class="shearder-bg" colspan="2">
                                                            <asp:Label ID="Label5" runat="server" Text="Eligibility Details" CssClass="lbl"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="lblRate" runat="server" Text="Can legally work for US?"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("LegallyUs")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblEducation" runat="server" Text="Education"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("education")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblFieldExpert" runat="server" Text="Field of Expertise"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Category")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                                    <tr>
                                                        <td class="shearder-bg" colspan="2">
                                                            <asp:Label ID="Label2" runat="server" Text=" Job Details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="lblApplied" runat="server" CssClass="lbl" Text="Applied for"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Position")%>&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px;">
                                                            <asp:Label ID="Label11" runat="server" CssClass="lbl" Text="Company"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("company")%>&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td class="shearder-bg" colspan="2">
                                        <asp:Label ID="Label1" runat="server" Text="Hire Process" CssClass="lbl"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <asp:Label ID="Label6" runat="server" Text="Select Position"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPosition" runat="server" MaxLength="25" CssClass="txtbox"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="txtPosition"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please Enter Position"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vcePosition" runat="server" TargetControlID="rfvPosition">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">
                                        <asp:Label ID="Label7" runat="server" Text="Rate($)"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRate" runat="server" MaxLength="3" CssClass="txtbox-s1"></asp:TextBox>
                                        /
                                        <asp:DropDownList ID="ddlRate" runat="server" Height="20px" Width="95px">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Per Hour</asp:ListItem>
                                            <asp:ListItem>Per Day</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:FilteredTextBoxExtender ID="ftbe" runat="server" TargetControlID="txtRate" FilterMode="ValidChars"
                                            ValidChars="1234567890" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRate"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please Enter Rate"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlRate"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please select rate type"
                                            InitialValue="--Select--"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">
                                        <asp:Label ID="Label8" runat="server" Text="Job Type"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlJobType" runat="server" OnSelectedIndexChanged="ddlJobType_SelectedIndexChanged"
                                            AutoPostBack="true" CssClass="ddlbox">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Contract</asp:ListItem>
                                            <asp:ListItem>Permanent</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlJobType"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please select Job Type" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate">
                                        </asp:CalendarExtender>
                                        <asp:textboxwatermarkextender id="TBWE2" runat="server" targetcontrolid="txtStartDate"
                                            watermarktext="Select Start Date"  />
                                     
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                        <asp:textboxwatermarkextender id="Textboxwatermarkextender1" runat="server" targetcontrolid="txtEndDate"
                                            watermarktext="Select End Date"  />
                                             <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px">
                                        <asp:Label ID="Label9" runat="server" Text="Joining Date"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtJoiningDate">
                                        </asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtJoiningDate"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please Enter Joining Date"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidator4">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <table style="width: 924px;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn" OnClick="Button2_Click" />
                                        &nbsp; &nbsp;
                                        <asp:Button ID="Button3" runat="server" CssClass="btn" Text="Back" CausesValidation="false"
                                            PostBackUrl="~/Employer/SchCandidates.aspx" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
