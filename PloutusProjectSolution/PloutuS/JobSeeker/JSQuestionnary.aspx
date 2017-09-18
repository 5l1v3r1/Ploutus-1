<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JSQuestionnary.aspx.cs" Inherits="JobSeeker_JSQuestionnary" MasterPageFile="~/NewMain.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" style="border: 1px solid silver;">
        <tr>
            <td style="padding-top: 20px; border: 0px solid white;" align="left">
                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5; border-bottom: 1px solid #FFC498; padding: 0px;"
                    cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">Complete the Questionnaire</td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" alt="" />
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5"></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td align="center" style="width: 100%; padding-top: 30px; padding-bottom: 30px;">
                <table border="0" cellpadding="3" cellspacing="3" style="width: 80%; text-align: left; border: 1px solid silver;">
                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label1" runat="server" Text="Desired Job Title"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJobTitle" ErrorMessage="Enter desired job title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>



                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label2" runat="server" Text="Desired Pay Rate"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtPayRate" runat="server" CssClass="txtbox2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPayRate" ErrorMessage="Enter pay rate" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Ques">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;" align="left">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Hourly</asp:ListItem>
                                <asp:ListItem>Annually</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label3" runat="server" Text="Highest Level of Education"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:DropDownList ID="ddlEdu" runat="server" CssClass="button-big"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label4" runat="server" Text="Do you have security clearence?"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:DropDownList ID="ddlSecClear" runat="server" CssClass="button-big"></asp:DropDownList>
                        </td>
                    </tr>


                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label5" runat="server" Text="Work Status"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:DropDownList ID="ddlWorkStatus" runat="server" CssClass="button-big"></asp:DropDownList>
                        </td>
                    </tr>


                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label6" runat="server" Text="Add a link to your linkedin profile"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="padding-left: 10px; width: 134px;">&nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Button ID="Button1" runat="server" Text="Complete Application" CssClass="button-big" OnClick="Button1_Click" />
                        </td>
                    </tr>



                    <tr>
                        <td colspan="2" style="padding-left: 12px; width: 734px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="padding-bottom: 30px;"></td>
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






