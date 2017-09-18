<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Marketing/InnerMasterEmp.master" CodeFile="AddClients.aspx.cs" Inherits="Marketing_AddClients" %>

 <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" EnableViewState="false" runat="Server">

<table cellpadding="0" cellspacing="0" class="tbl" width="100%">
       
        <tr> 
         <td class="errmsg" style="padding-left: 5px;">
                            &nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                        </tr>
               
                                 <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                 Client  Details
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
                        <td>
                           <table class="tbl" width="900px" style="border-color:#FEF7E5;padding-left:100px;">
   
                      
                    <tr>
                        <td style=" width:210px;" >
                            Client Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompanyName" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredCompanyName" runat="server" ControlToValidate="txtCompanyName"
                                Display="None" ErrorMessage="Please enter the Enterprise name" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="vcCompanyNamess" runat="server" 
                                TargetControlID="RequiredCompanyName">
                            </cc1:validatorcalloutextender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Client Category
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlboxs">
                            </asp:DropDownList>
                             <%-- <span class="errmsg">*</span>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                InitialValue="----------Select----------" runat="server" ControlToValidate="ddlCategory"
                                Display="None" ErrorMessage="Please select Category" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender3" runat="server" 
                                TargetControlID="RequiredFieldValidator2">
                            </cc1:validatorcalloutextender>--%>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Website
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebSite" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                            
                            
                              <%--  <span class="errmsg">&nbsp;*</span>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtWebsite"
                                Display="None" ErrorMessage="Website format is Invalid" SetFocusOnError="true"
                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" 
                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender5" runat="server" 
                                TargetControlID="RegularExpressionValidator1">
                            </cc1:validatorcalloutextender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtWebSite"
                                Display="None" ErrorMessage="Please enter Website" SetFocusOnError="true" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender8" runat="server" 
                                TargetControlID="RequiredFieldValidator4">
                            </cc1:validatorcalloutextender>--%>

                        </td>
                    </tr>
                    
                    
                    
                    
                    
                    
                </table>
                        </td>
                    </tr>
                    <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                  Mailling Address
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
                        <td>
                          <table class="tbl" width="900px"" style="border-color:#FEF7E5;padding-left:100px;">


                       
                    <tr>
                        <td style=" width:210px;" valign="top" >
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdd1" CssClass="lstboxlrg" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdd1"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter Address1" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender9" runat="server" 
                                TargetControlID="RequiredFieldValidator1">
                            </cc1:validatorcalloutextender>--%>
                        </td>
                    </tr>
                     <%-- <tr>
                        <td style=" width:210px;" >
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                          <asp:RequiredFieldValidator ID="RequiredCity" runat="server" ControlToValidate="txtCity"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter the City" 
                                ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="vcCity" runat="server" 
                                TargetControlID="RequiredCity">
                            </cc1:validatorcalloutextender>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style=" width:210px;" >
                           Location
                        </td>
                        <td>
                          <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddlboxs" 
                                onselectedindexchanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>

                        <span class="errmsg">&nbsp;*</span>
                                   <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please select Location"
                                                    ControlToValidate="ddlLocation" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="vceLocation" runat="server" TargetControlID="rfvLocation">
                                                </cc1:ValidatorCalloutExtender>                                 
                      
                        </td>
                    </tr>
                    <tr>
                    <td style=" width:210px;" >
                          
                        </td>
                    <td>
                        <asp:TextBox ID="txtNewLoaction" runat="server" CssClass="txtbox-lrg1" Visible="false"></asp:TextBox>
                     </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Zip Code
                        </td>
                        <td>
                            <asp:TextBox ID="txtZip" CssClass="txtbox-lrg1" runat="server" MaxLength="5"></asp:TextBox>
                         <%-- <span class="errmsg">&nbsp;*</span>
                                <asp:RequiredFieldValidator ID="rfvzip" runat="server" 
                                ErrorMessage="Required ZipCode" ControlToValidate="txtZip" Display="None" 
                                ValidationGroup="Reg">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegZip" runat="server" ControlToValidate="txtZip"
                                SetFocusOnError="true" Display="None" ErrorMessage="Please enter the valid Zipcode"
                                ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:validatorcalloutextender ID="vcZip" runat="server" 
                                TargetControlID="RegZip">
                            </cc1:validatorcalloutextender>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtZip"
                                                    ValidationExpression="\d+" Display="None" EnableClientScript="true" ErrorMessage="Please enter numbers only"
                                                    runat="server" />
                                                    <cc1:validatorcalloutextender ID="ValidatorCalloutExtender13" runat="server" 
                                TargetControlID="RegularExpressionValidator4">
                                                </cc1:validatorcalloutextender>--%>
                            


                        </td>
                    </tr>
                </table> 
                        </td>
                    </tr>
      
         
               
                      <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                 Contact Info
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
                        <td >
                           <table class="tbl" width="900px" style="border-color:#FEF7E5;padding-left:100px;">
                
                       
                    
                    <tr>
                        <td style=" width:210px;" >
                            Contact Person
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtContact" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                            <%-- <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContact"
                                Display="None" ErrorMessage="Please enter Contact Person Name" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender6" runat="server" 
                                TargetControlID="RequiredFieldValidator5">
                            </cc1:validatorcalloutextender>--%>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Contact Number
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtContactNumber" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                          <%--  <span class="errmsg">&nbsp;*</span>(Eg:-(123)456-7890)
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactNumber"
                                Display="None" ErrorMessage="Please enter Contact Number" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender12" runat="server" 
                                TargetControlID="RequiredFieldValidator7">
                            </cc1:validatorcalloutextender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtContactNumber" Display="None" 
                                ErrorMessage="Please enter Contact Number" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender11" runat="server" 
                                TargetControlID="RequiredFieldValidator6">
                            </cc1:validatorcalloutextender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="txtContactNumber" Display="None" 
                                ErrorMessage="Format should be (###)###-####" SetFocusOnError="true" 
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender4" runat="server" 
                                TargetControlID="RegularExpressionValidator3">
                            </cc1:validatorcalloutextender>--%>

                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Mobile
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                      <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtMobile" Display="None" 
                                ErrorMessage="Please enter Mobile " SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender7" runat="server" 
                                TargetControlID="RequiredFieldValidator3">
                            </cc1:validatorcalloutextender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="txtMobile" Display="None" 
                                ErrorMessage="Format should be (###)###-####" SetFocusOnError="true" 
                                ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender10" runat="server" 
                                TargetControlID="RegularExpressionValidator2">
                            </cc1:validatorcalloutextender>--%>

                            </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Email Address
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtEmail" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <%--<span class="errmsg">&nbsp;*</span>
                            <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="e-mail should be **@**.**" SetFocusOnError="true"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender1" runat="server" 
                                TargetControlID="RegEmail">
                            </cc1:validatorcalloutextender>
                            <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="Please enter the Email Address" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <cc1:validatorcalloutextender ID="ValidatorCalloutExtender2" runat="server" 
                                TargetControlID="ReqEmail">
                            </cc1:validatorcalloutextender>--%>
                        </td>
                    </tr>
                       <tr><td></td>
                        <td align="left">
                           <asp:Button ID="Button1" Text="Submit" runat="server" CssClass="btn" onclick="btnSubmit_Click1" ValidationGroup="Reg" 
                               
                             /> &nbsp;&nbsp;
                            <asp:Button ID="Button2" Text="Cancle" runat="server" CssClass="btn"  CausesValidation="False" onclick="Button2_Click" /> 
                               
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

                 
               
               </table> 

    </asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .style1
    {
        width: 670px;
    }
</style>
</asp:Content>
