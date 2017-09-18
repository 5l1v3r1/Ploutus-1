<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JobSeekerQuestionnaireUpdate.aspx.cs" Inherits="JobSeekerQuestionnaire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                            <table class="tbl" style="width: 900px; height:600px; " border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Job Seeker Questionnaire</td>
                                </tr>

                                <tr><td></td></tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label1" runat="server" Text="Desired Job Title"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                          <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox2"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJobTitle" ErrorMessage="Enter Job Title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques">*</asp:RequiredFieldValidator>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPayRate" ErrorMessage="Enter desired pay rate" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left">
                                        <asp:RadioButtonList ID="rbPayType" runat="server" RepeatDirection="Horizontal" ValidationGroup="Ques">
                                <asp:ListItem>Hourly</asp:ListItem>
                                <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rbPayType" ErrorMessage="Select Pay Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques">*</asp:RequiredFieldValidator>
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
                                             <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">None</asp:ListItem>
                                            <asp:ListItem Value="2">GED</asp:ListItem>
                                            <asp:ListItem Value="3">High School</asp:ListItem>
                                            <asp:ListItem Value="4">Vocational School</asp:ListItem>
                                            <asp:ListItem Value="5">Associate Degree</asp:ListItem>
                                            <asp:ListItem Value="6">Bachelors Degree</asp:ListItem>
                                            <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                                            <asp:ListItem Value="8">Doctorate</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlEdu" ErrorMessage="Select Education" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1">*</asp:RequiredFieldValidator>
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
                                              <asp:ListItem Value="1">Yes</asp:ListItem>
                                              <asp:ListItem Value="2">No</asp:ListItem>
                                          </asp:DropDownList>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSecClear" ErrorMessage="Select Security Clearance" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1">*</asp:RequiredFieldValidator>
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
                                             <asp:ListItem Value="1">Ready to Work</asp:ListItem>
                                             <asp:ListItem Value="2">In Notice Period</asp:ListItem>
                                             <asp:ListItem></asp:ListItem>
                                         </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlWorkStatus" ErrorMessage="Select Work Status" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques" InitialValue="-1">*</asp:RequiredFieldValidator>
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

                                <tr><td></td></tr>

                                <tr>
                                    <td>
                                         <asp:Button ID="Button1" runat="server" Text="Update Questionnaire" CssClass="button-big" OnClick="Button1_Click1" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please find the below errors:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Ques" />
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




