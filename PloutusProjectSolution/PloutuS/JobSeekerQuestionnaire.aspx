<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JobSeekerQuestionnaire.aspx.cs" Inherits="JobSeekerQuestionnaire" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job Seekers Questionnaire"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">

                <table cellspacing="5" cellpadding="5">

                    <tr>
                        <td style="width: 100%">
                            <table class="tbl" style="width: 900px; height: 600px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td class="errmsg" style="padding-left: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="(*) fields are mandatory"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Job Seeker Questionnaire</td>
                                </tr>

                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Desired Job Title"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle" ErrorMessage="Enter Job Title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcJobTitle" runat="server" TargetControlID="rfvJobTitle">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Desired Pay Rate"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPayRate" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvPayRate" runat="server" ControlToValidate="txtPayRate" ErrorMessage="Enter desired pay rate" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcPayRate" runat="server" TargetControlID="rfvPayRate">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Pay Type"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:50%">
                                            <tr>
                                                <td style="width:20%; ">
                                                    <asp:RadioButtonList ID="rbPayType" runat="server" RepeatDirection="Horizontal" ValidationGroup="Ques">
                                                        <asp:ListItem>Hourly</asp:ListItem>
                                                        <asp:ListItem>Annually</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td style="width:20%"> <span class="errmsg">&nbsp;*</span></td>
                                                <td style="width:20%; padding-left:0px;" >
                                                    <asp:RequiredFieldValidator ID="rfvPayType" runat="server" ControlToValidate="rbPayType" ErrorMessage="Select Pay Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcPayType" runat="server" TargetControlID="rfvPayType">
                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                        </table>

                                       
                                        
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Highest Level of Education"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlEdu" runat="server" CssClass="ddl-big">
                                            <asp:ListItem Value="-1">Select</asp:ListItem>
                                            <asp:ListItem Value="1">None</asp:ListItem>
                                            <asp:ListItem Value="2">GED</asp:ListItem>
                                            <asp:ListItem Value="3">High School</asp:ListItem>
                                            <asp:ListItem Value="4">Vocational School</asp:ListItem>
                                            <asp:ListItem Value="5">Associate Degree</asp:ListItem>
                                            <asp:ListItem Value="6">Bachelors Degree</asp:ListItem>
                                            <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                                            <asp:ListItem Value="8">Doctorate</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvEdu" runat="server" ControlToValidate="ddlEdu" ErrorMessage="Select Education" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcEdu" runat="server" TargetControlID="rfvEdu">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Do you have security clearence?"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlSecClear" runat="server" CssClass="ddl-big">
                                            <asp:ListItem Value="-1">Select</asp:ListItem>
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvSecurity" runat="server" ControlToValidate="ddlSecClear" ErrorMessage="Select Security Clearance" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcSecurity" runat="server" TargetControlID="rfvSecurity">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Work Status"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlWorkStatus" runat="server" CssClass="ddl-big">
                                            <asp:ListItem Value="-1">Select</asp:ListItem>
                                            <asp:ListItem Value=">Ready to Work">Ready to Work</asp:ListItem>
                                            <asp:ListItem Value="In Notice Period">In Notice Period</asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvWorkStatus" runat="server" ControlToValidate="ddlWorkStatus" ErrorMessage="Select Work Status" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcWorkStatus" runat="server" TargetControlID="rfvWorkStatus">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Add a link to your linkedin profile"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="txtbox2"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" ValidationGroup="Ques" OnClick="btnSaveContinue_Click" />
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

                                <tr>
                                    <td>
                                        <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please find the below errors:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Ques" />--%>
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




