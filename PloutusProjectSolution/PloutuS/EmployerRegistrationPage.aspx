<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="EmployerRegistrationPage.aspx.cs" Inherits="EmployerRegistrationPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 50px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="Label1" runat="server" Text="Enterprise Registration"></asp:Label>
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
                           <table class="tbl" width="900px">
    <tr>
                        <td class="shearder-bg" colspan="2">
                            Enterprise  Details
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Enterprise Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompanyName" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredCompanyName" runat="server" ControlToValidate="txtCompanyName"
                                Display="None" ErrorMessage="Please enter the Enterprise name" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="vcCompanyNamess" runat="server" TargetControlID="RequiredCompanyName">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Enterprise Category
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlboxlrg">
                            </asp:DropDownList>
                             <span class="errmsg">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                InitialValue="----------Select----------" runat="server" ControlToValidate="ddlCategory"
                                Display="None" ErrorMessage="Please select Category" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator2">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Website
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebSite" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                             (Eg:- https://www.mysite.com)
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtWebsite"
                                Display="None" ErrorMessage="Website format is Invalid" SetFocusOnError="true"
                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" 
                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RegularExpressionValidator1">
                            </cc1:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtWebSite"
                                Display="None" ErrorMessage="Please enter Website" SetFocusOnError="true" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidator4">
                            </cc1:ValidatorCalloutExtender>

                        </td>
                    </tr>
                    
                    
                    
                    
                    
                    
                </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <table class="tbl" width="900px"">
<tr>
                        <td class="shearder-bg" colspan="2">
                           Mailling Address
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" valign="top" >
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdd1" CssClass="lstboxlrg" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdd1"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter Address1" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RequiredFieldValidator1">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredCity" runat="server" ControlToValidate="txtCity"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter the City" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="vcCity" runat="server" TargetControlID="RequiredCity">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            State
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlState" CssClass="ddlboxlrg" runat="server">
                                <asp:ListItem Value="----------Select----------" Selected="False"></asp:ListItem>
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
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="ReqState" runat="server" ControlToValidate="ddlState"
                                Display="None" ErrorMessage="Please select the State" InitialValue="----------Select----------"
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="vcState" runat="server" TargetControlID="ReqState">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Zip Code
                        </td>
                        <td>
                            <asp:TextBox ID="txtZip" CssClass="txtbox-lrg1" runat="server" MaxLength="5"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="rfvzip" runat="server" 
                                ErrorMessage="Required ZipCode" ControlToValidate="txtZip" Display="None" 
                                ValidationGroup="Reg">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegZip" runat="server" ControlToValidate="txtZip"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter the valid Zipcode"
                                ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:ValidatorCalloutExtender ID="vcZip" runat="server" TargetControlID="RegZip">
                            </cc1:ValidatorCalloutExtender>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtZip"
                                                    ValidationExpression="\d+" Display="None" EnableClientScript="true" ErrorMessage="Please enter numbers only"
                                                    runat="server" />
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="server" TargetControlID="RegularExpressionValidator4">
                                                </cc1:ValidatorCalloutExtender>
                            


                        </td>
                    </tr>
                </table> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <table class="tbl" width="900px">
                    <tr>
                        <td class="shearder-bg" colspan="2">
                            Contact Info
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td class="style1" >
                            Contact Person
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtContact" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContact"
                                Display="None" ErrorMessage="Please enter Contact Person Name" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidator5">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Contact Number
                        </td>
                        <td>
                            <asp:TextBox ID="txtContactNumber" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                            <span class="errmsg">&nbsp;*</span>(Eg:-(123)456-7890)
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactNumber"
                                Display="None" ErrorMessage="Please enter Contact Number" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="RequiredFieldValidator7">
                            </cc1:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtContactNumber" Display="None" 
                                ErrorMessage="Please enter Contact Number" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" 
                                TargetControlID="RequiredFieldValidator6">
                            </cc1:ValidatorCalloutExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="txtContactNumber" Display="None" 
                                ErrorMessage="Format should be (###)###-####" SetFocusOnError="true" 
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" 
                                TargetControlID="RegularExpressionValidator3">
                            </cc1:ValidatorCalloutExtender>

                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Mobile
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtMobile" Display="None" 
                                ErrorMessage="Please enter Mobile " SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" 
                                TargetControlID="RequiredFieldValidator3">
                            </cc1:ValidatorCalloutExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="txtMobile" Display="None" 
                                ErrorMessage="Format should be (###)###-####" SetFocusOnError="true" 
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" 
                                TargetControlID="RegularExpressionValidator2">
                            </cc1:ValidatorCalloutExtender>

                            </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Email Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="e-mail should be **@**.**" SetFocusOnError="true"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RegEmail">
                            </cc1:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="Please enter the Email Address" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ReqEmail">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label ID="lblsuccess" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                </table>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">
                           <asp:Button ID="Button1" Text="Submit" runat="server" CssClass="btn" 
                                onclick="btnSubmit_Click1" ValidationGroup="Reg" 
                             /> &nbsp;&nbsp;
                            <asp:Button ID="Button2" Text="Back" runat="server" CssClass="btn" 
                                CausesValidation="False" onclick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


</asp:Content>


