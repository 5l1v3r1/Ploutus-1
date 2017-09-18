<%@ Page Title="Upload Profile" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false" CodeFile="CandidateUploadProfile1.aspx.cs" Inherits="CandidateUploadProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


    <%@ MasterType VirtualPath="~/JobSeeker/InnerMaster.master" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--   <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
--%>

  <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
         <td style="padding: 0px; padding-top: 20px;" align="left">
                <table width="100%" border="0" align="left" style="border-bottom: 1px solid #FFC498 ; padding:0px;"
                    cellpadding="0"  cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498"  class="headding">
                            Upload Profile
                        </td>
                        <td width="31%" align="left" valign="top" style=" padding:0px;"   bgcolor="#FEF7E5">
                            <img src="images1/sub-head-corer.jpg" width="29" height="32" />
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>
                    </tr>
                </table>
            </td>
          
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="2" cellpadding="2" border="0">
                    <tr>
                        <td colspan="4">
                            <table>
                                <tr>
                                    <td colspan="4">
                                        <table>
                                           <%-- <tr>
                                                <td >
                                                    Name
                                                </td>
                                                <td style="width: 240px;padding-left: 10px;">
                                                    <asp:TextBox ID="txtFName" CssClass="txtbox-lrg" MaxLength="100" runat="server"
                                                        TabIndex="1"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <span class="errmsg">&nbsp;*&nbsp;</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                                        Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <asp:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                                    </asp:ValidatorCalloutExtender>
                                                    </td>
                                            </tr>--%>
                                                <tr>
                                    <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label1" runat="server" Text="First Name " CssClass="lbl"></asp:Label>
                                    </td>
                                    <td style="width: 265px;">
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox><span
                                            class="errmsg">&nbsp;*</span>

                                            <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                            Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                    </tr>
                                   <tr>
                                    <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label2" runat="server" Text="Last Name " CssClass="lbl"></asp:Label>
                                    </td>
                                    <td style="width: 265px;">
                                        <asp:TextBox ID="txtLName" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span> 
                                       
                                        <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLName"
                                            Display="None" ErrorMessage="Please enter the Last name" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="vcLastName" runat="server" TargetControlID="RequiredLastName">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>   
                                
                                
                                                                    <tr>
                                                <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Mobile Number " CssClass="lbl"></asp:Label>
                                    </td>
                                     <td style="width: 400px;">
                                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span> 
                                         <asp:Label ID="Label26" runat="server" Text="&nbsp;&nbsp;(xxx)xxx-xxxx" CssClass="lbl"></asp:Label>
                                        <asp:RequiredFieldValidator ID="ReqMobile" runat="server" ControlToValidate="txtContactNo"
                                            SetFocusOnError="true" Display="None" ErrorMessage="Please enter the mobile number"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <asp:validatorcalloutextender ID="vcMobileReq" runat="server" 
                                             TargetControlID="ReqMobile">
                                        </asp:validatorcalloutextender>
                                      
                                        <asp:RegularExpressionValidator ID="revMobile" runat="server" CssClass="errmsg" ControlToValidate="txtContactNo"
                                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" SetFocusOnError="true"
                                            Display="None" ErrorMessage="Mobile number should be in (xxx)xxx-xxxx format"></asp:RegularExpressionValidator>
                                        <asp:validatorcalloutextender ID="vceMobile" runat="server" 
                                             TargetControlID="revMobile">
                                        </asp:validatorcalloutextender>
                                       
                                  <%--      <asp:RequiredFieldValidator ID="RequiredContactNo" runat="server" ControlToValidate="txtContactNo"
                                            Display="None" ErrorMessage="Please enter the ContactNumber" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredContactNo">
                                        </asp:ValidatorCalloutExtender>--%>
                                    </td>
                                              
                                            </tr>
                                            <tr>
                                               <%-- <td valign="top">
                                                    Email
                                                </td>--%>
                                                              <td style="width: 225px;">
                                        &nbsp;<asp:Label ID="Label4" runat="server" Text="Email Addres " CssClass="lbl"></asp:Label>
                                    </td>
                                     <td style="width: 265px;">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtbox-lrg1" MaxLength="50"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span> 
                                       
                                        <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="txtEmail"
                                            Display="None" ErrorMessage="Please enter the Emaile" SetFocusOnError="true"
                                            CssClass="errmsg"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredEmail">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                               
                                            </tr>
                                           
                                          
                                          </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                  <%--  <td></td>--%>
                        <td colspan="4">
                            <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                <ContentTemplate>
                                    <table>
                                      <tr>
                                            <td colspan="4">
                                                <asp:Panel ID="pnlBuildResume"  runat="server">
                                                    <table>
                                                        <tr>
                                                            <%--<td align="left" valign="top" style="width: 220px;">
                                                                Copy Resume
                                                            </td>--%>
                                                             <td align="left" valign="top" style="width: 220px;">
                                        &nbsp;<asp:Label ID="Label5" runat="server" Text=" Copy Resume " CssClass="lbl"></asp:Label>
                                    </td>
                                                            <td  align="center" style="padding: 0px; background-color:White;">
                                                                
                                                                   <%-- <div ID="txtResumeBuilder" runat="server"   style="Height:300px; Width:600px;   border:1px solid silver;"></div>--%>
                                                                        <asp:TextBox ID="txtResumeBuilder"  BackColor="White" runat="server" Height="300px" Width="600px" TextMode="MultiLine"
                                                                          TabIndex="6" ></asp:TextBox>
                                                                   
                                                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"  runat="server">
                                                                </asp:HtmlEditorExtender>
                                                           
                                                                    
                                                            </td>
                                                        </tr>
                                                        <tr> 
                                                        <td></td>
                                                        </tr>
                                                         <tr> 
                                                        <td></td>
                                                        </tr>
                                                        <tr>
                                                        <td padding-top="50px" align="left" style="width: 220px;"></td>
                                                     <td align="left">
                                                     <asp:button id="btnsave" runat="server"  text="save" onclick="btnSubmit_Click" cssclass="btn" width="99px" tabindex="7"/>                                                                
                                                        </td>
                                                    </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>                                     
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Label ID="lblMsg" Font-Bold="true" Font-Size="Small" runat="server" CssClass="errmsg"
                                Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
      <%--  <tr>
            <td style="height: 25px;">
            </td>
        </tr>--%>
    </table>
      <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                    class="bodytext">
                    <tr>
                        <td height="10">
                            <img src="images/bootom-shape.jpg" width="1024" height="33" />
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center" valign="middle" bgcolor="#777777" class="copyrights">
                            2014 © ploutoS LLC. All rights reserved.<br />
                        </td>
                    </tr>
                </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 316px;
        }
    </style>
</asp:Content>


