<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="UpdateResumesData.aspx.cs" Inherits="UpdateResumesData" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellpadding="0" style="padding-left:30px; padding-right:30px" cellspacing="0" class="tbl" width="80%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Upload Profile"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5" class="tbl" style="width: 900px;" border="0">
            
         <tr>

                        <td colspan="4" style="padding-left:30px; padding-right:30px">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="5"  style="padding-top: 0px; padding-bottom: 0px;" class="headding1">
                                            <%-- <asp:Panel  ID="pnlUploadResume"  runat="server">--%>
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="text-align:right; width: 220px; padding-left:140px">
                                                                <asp:Label ID="lblUpload" runat="server" Text="Upload File" CssClass="lbl"></asp:Label>
                                                            </td>
                                                            <td align="center" colspan="5" style="padding-left: 10px;">
                                                                <asp:FileUpload ID="AsyncFileUpload1" runat="server" CssClass="button" TabIndex="18" />
                                                                <span class="errmsg">&nbsp;*</span>
                                                                <asp:RequiredFieldValidator ID="rfvFile" runat="server" ControlToValidate="AsyncFileUpload1"
                                                                    Display="None" ErrorMessage="Select your resume to upload." SetFocusOnError="true"
                                                                    CssClass="errmsg"></asp:RequiredFieldValidator>
                                                                <cc1:ValidatorCalloutExtender ID="vceFile" runat="server" TargetControlID="rfvFile">
                                                                </cc1:ValidatorCalloutExtender>
                                                            </td>
                                                            <td align="left"> <asp:Button ID="btnSave" runat="server" CausesValidation="false" Text="Save" OnClick="btnSubmit_Click"
                                                                CssClass="btn" Width="99px" TabIndex="20" /></td>
                                                        </tr>
                                                    </table>
                                              <%--  </asp:Panel>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="padding-top: 0px; padding-bottom: 0px;">
                                        <%--  <asp:Panel ID="pnlBuildResume"  runat="server">--%>
                                                    <table>
                                                        <tr>
                                                           <td style="padding-left: 10px; width: 220px">
                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                                                    <ContentTemplate>
                                                                    <iframe  Height="562px"  Width="600px" runat="server" id="iframe1"></iframe>
                                                                       <%-- <asp:TextBox ID="txtResumeBuilder" runat="server" Height="562px" Width="600px" TextMode="MultiLine"
                                                                            TabIndex="19"></asp:TextBox>--%>
                                                                       <%-- <cc1:HtmlEditorExtender ID="HtmlEditorExtender2" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                                            runat="server">
                                                                        </cc1:HtmlEditorExtender>--%>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                              <%-- </asp:Panel>--%>
                                            </td>
                                            
                                             
                                            <td colspan="4" style=" padding-right: 50px;">
                            <table>
                                <tr>
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td style="width: 220px;">
                                                   Fiest Name
                                                </td>
                                                <td style="width: 240px; padding-left: 10px;">
                                                    <asp:TextBox ID="txtFName" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                        TabIndex="1"></asp:TextBox>
                                                </td>
                                               
                                              
                                            </tr>
                                            <tr>
                                                <td>
                                                    Last Name
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtLName" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="3"></asp:TextBox>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Mobile Number
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtMobileNumber" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="4"></asp:TextBox>
                                                   
                                                    <cc1:FilteredTextBoxExtender ID="filter" runat="server" ValidChars="()-0123456789"
                                                        TargetControlID="txtMobileNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cell Number&nbsp; (Alternative Number)
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtCellNumber" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="5"></asp:TextBox>
                                                 
                                                </td>
                                            </tr>
                                              </td>
                                            </tr>


                                             <tr>
                                                <td>
                                                    Email
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtEmail" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="7"></asp:TextBox>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   Alternative Email
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtAEmail" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="8"></asp:TextBox>
                                                  
                                                </td>
                                            </tr>




                                      

                                            <tr>
                                                <td>
                                                    Experience
                                                </td>
                                                <td valign="middle" colspan="3" style="padding-left: 8px;">
                                                    <asp:DropDownList ID="ddlYearsExp" runat="server" TabIndex="9">
                                                        <asp:ListItem Value="-1">Select</asp:ListItem>
                                                        <asp:ListItem Value="0">0</asp:ListItem>
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                        <asp:ListItem Value="6">6</asp:ListItem>
                                                        <asp:ListItem Value="7">7</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                        <asp:ListItem Value="9">9</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                        <asp:ListItem Value="11">11</asp:ListItem>
                                                        <asp:ListItem Value="12">12</asp:ListItem>
                                                        <asp:ListItem Value="13">13</asp:ListItem>
                                                        <asp:ListItem Value="14">14</asp:ListItem>
                                                        <asp:ListItem Value="15">15</asp:ListItem>
                                                        <asp:ListItem Value="16">16</asp:ListItem>
                                                        <asp:ListItem Value="17">17</asp:ListItem>
                                                        <asp:ListItem Value="18">18</asp:ListItem>
                                                        <asp:ListItem Value="19">19</asp:ListItem>
                                                        <asp:ListItem Value="20">20</asp:ListItem>
                                                        <asp:ListItem Value="21">21</asp:ListItem>
                                                        <asp:ListItem Value="22">22</asp:ListItem>
                                                        <asp:ListItem Value="23">23</asp:ListItem>
                                                        <asp:ListItem Value="24">24</asp:ListItem>
                                                        <asp:ListItem Value="25">25</asp:ListItem>
                                                    </asp:DropDownList>
                                                    &nbsp;
                                                    <asp:Label ID="Label27" runat="server" Text="(Years) " CssClass="lbl"></asp:Label>
                                                    <asp:DropDownList ID="ddlMonthsExp" runat="server" TabIndex="10">
                                                        <asp:ListItem Value="-1">Select</asp:ListItem>
                                                        <asp:ListItem Value="0">0</asp:ListItem>
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                        <asp:ListItem Value="6">6</asp:ListItem>
                                                        <asp:ListItem Value="7">7</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                        <asp:ListItem Value="9">9</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                        <asp:ListItem Value="11">11</asp:ListItem>
                                                        <asp:ListItem Value="12">12</asp:ListItem>
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:Label ID="Label28" runat="server" Text="(Months) " CssClass="lbl"></asp:Label>&nbsp;
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    1<sup>st</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:DropDownList ID="ddlIndustries1" runat="server" Height="22px" CssClass="ddlboxlrg" TabIndex="11">
                                                    </asp:DropDownList>
                                                   <span class="errmsg">*</span>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    2<sup>nd</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:DropDownList ID="ddlIndustries2" runat="server" Height="22px" CssClass="ddlboxlrg" TabIndex="12">
                                                    </asp:DropDownList>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    3<sup>rd</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:DropDownList ID="ddlIndustry3" runat="server" Height="22px" CssClass="ddlboxlrg" TabIndex="13">
                                                    </asp:DropDownList>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    State
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                 <asp:TextBox ID="txtState" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="14"></asp:TextBox>
                                                  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    City
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                 <asp:TextBox ID="txtCity" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="15"></asp:TextBox>
                                                   
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>
                                                 Zip
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                 <asp:TextBox ID="txtZip" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="16"></asp:TextBox>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Address
                                                </td>
                                                <td colspan="3" style="padding-left: 10px;">
                                                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" MaxLength="100" CssClass="txtbox-lrg1"
                                                        Height="70px" Width="230px" runat="server" TabIndex="16"></asp:TextBox>
                                                </td>
                                            </tr>
                                             </td>
                                            </tr>
                            </table>
                                   </td>
                                </tr>
                            </table>
                       







                    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="height: 54px; padding-left:130px">
                                                <table align="center">
                                                    <tr>
                                                        
                                                        <td colspan="3" align="right" style="padding-left: 10px;">
                                                           &nbsp
                                                                <asp:Button ID="btnSaveDb" runat="server" CausesValidation="false" Text="SaveDB" 
                                                                CssClass="btn" Width="99px" TabIndex="20" onclick="btnSaveDb_Click" />

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                          <tr>
                        <td colspan="4" align="center">
                            <asp:Label ID="lblMsg" Font-Bold="true" Font-Size="Small" runat="server" CssClass="errmsg"
                                Text=""></asp:Label>
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
                <td >
                
                
                </td>
                </tr>
                



                   </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25px;">
            </td>
        </tr>
    </table>



    <script language="javascript" type="text/javascript">
// <![CDATA[

       

// ]]>
    </script>
</asp:Content>

