<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubUser.aspx.cs" MasterPageFile="~/Employer/MerchantMaster.master"
    Inherits="Employer_SubUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="pnl" runat="server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 50px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="Label1" runat="server" Text="Sub-User Registration"></asp:Label>
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
                                    <td class="shearder-bg" colspan="2">
                                        Sub-User Contact Information
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" style="height: 40px">
                                        Sub-User Name
                                    </td>
                                    <td class="style2" style="height: 40px">
                                        <asp:TextBox ID="txtSubUserName" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSubUserName"
                                            Display="None" ErrorMessage="Please enter Sub-User Name" SetFocusOnError="true"
                                            ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidator5">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 210px;">
                                        Mobile
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" MaxLength="15"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" 
                                            ErrorMessage="Please enter Mobile Number" ControlToValidate="txtMobile"  ValidationGroup="Reg"
                                            Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegPhone" runat="server" ControlToValidate="txtMobile"  ValidationGroup="Reg"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Format should be (###)###-####"
                                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RegPhone">
                                        </cc1:ValidatorCalloutExtender>
                                         <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="rfvMobile">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 210px;">
                                        Email Address
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmail"
                                            Display="None" ErrorMessage="e-mail should be **@**.**" SetFocusOnError="true"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RegEmail">
                                        </cc1:ValidatorCalloutExtender>
                                        <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail"
                                            Display="None" ErrorMessage="Please enter the Email Address" SetFocusOnError="true"
                                            ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ReqEmail">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 210px; height: 35px;">
                                        Password
                                    </td>
                                    <td style="height: 35px">
                                        <asp:TextBox ID="txtPassword" CssClass="txtbox-lrg1" runat="server" 
                                            MaxLength="50" TextMode="Password"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword"  ValidationGroup="Reg"
                                            Display="None" ErrorMessage="Please enter Password" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidator6">
                                        </cc1:ValidatorCalloutExtender>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 210px;">
                                        Confirm Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtConPwd" CssClass="txtbox-lrg1" runat="server" 
                                            MaxLength="50" TextMode="Password"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="refvrepass" runat="server" ErrorMessage="ReType New Password" ControlToValidate="txtConPwd"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="Passwords dosen't match"
                                                ControlToCompare="txtPassword" ControlToValidate="txtConPwd" SetFocusOnError="true"
                                                Display="None" CssClass="errmsg"></asp:CompareValidator>
                                            <cc1:ValidatorCalloutExtender ID="vcRePassword" runat="server" TargetControlID="comparePassword">
                                            </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Label ID="lblsuccess" runat="server" CssClass="errmsg" ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="Button1" Text="Register" runat="server" CssClass="btn"
                                ValidationGroup="Reg" onclick="Button1_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="Button2" Text="Back" runat="server" CssClass="btn" 
                                CausesValidation="False" onclick="Button2_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="pnlStatus" runat="server">
<table cellpadding="0" cellspacing="0" class="tbl" width="100%">
     <tr>
     <td align="center"  style="height:600px">
         <asp:Label ID="Label2" runat="server" ForeColor="Red" 
             
             Text="You Cannot create more than two Users. "></asp:Label>
     </td>
     </tr>
     </table>
</asp:Panel>
     
</asp:Content>
