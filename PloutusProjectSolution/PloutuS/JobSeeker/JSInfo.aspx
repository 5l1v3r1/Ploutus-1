<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JSInfo.aspx.cs" Inherits="JobSeeker_JSInfo" MasterPageFile="~/NewMain.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" style=" border:1px solid silver; ">
                <tr>
            <td style="padding-top: 20px; border: 0px solid white;" align="left">
                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Your Info</td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" alt=""/>
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
        <tr>
            <td align="center" style="width: 100%; padding-top:30px; padding-bottom:30px;">
                <table border="0" cellpadding="3" cellspacing="3" style="width: 80%; text-align: left; border:1px solid silver;">
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>



                         <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtLName" runat="server"  CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>
               


                     <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="button-big"></asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label4" runat="server" Text="Zip Code"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtZipCode" runat="server"  CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>


                     
                      <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label6" runat="server" Text="Home Phone"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtHomePhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>

                        <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label5" runat="server" Text="Mobile Phone"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>

                        <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label7" runat="server" Text="Work Phone"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtWorkPhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>




                        <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label8" runat="server" Text="Upload your Resume" style="font-size: large"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;" align="left">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Upload</asp:ListItem>
                                <asp:ListItem>Copy</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;" align="left">
                          <asp:Panel ID="pnlUpload" runat="server">
                              <asp:FileUpload ID="FileUpload1" runat="server" CssClass="button-big" />
                          </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;" align="left">
                              <asp:Panel ID="Panel1" runat="server">
                              <asp:TextBox ID="txtResumeBuilder" BackColor="White" runat="server" Height="300px"
                                                    Width="600px" TextMode="MultiLine" TabIndex="6"></asp:TextBox>
                                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                    runat="server">
                                                </asp:HtmlEditorExtender>
                          </asp:Panel> 
                        </td>
                    </tr>



                      <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                          <asp:Button ID="btnContApp" runat="server" Text="Continue Application"  CssClass="button-big" />
                        </td>
                    </tr>



                    <tr>
                        <td colspan="2" style="padding-left: 12px; width: 734px;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="padding-bottom:30px;">
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
                    <tr>
                        <td height="10">
                            <img src="images/bootom-shape.jpg" width="1024" height="33" />
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color:#777777" class="copyrights">
                            2014 © ploutuS LLC. All rights reserved.<br />
                        </td>
                    </tr>
                </table>

    <%--<table style="height: 750px; padding-top:0px; width: 80%; border-color:#FFC498; " border="1" cellpadding="0" cellspacing="0"  >
        <tr>
            <td valign="top">
<table style="height: 650px;">
        <tr>
            <td valign="bottom">
                <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtFname" runat="server" CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtLName" runat="server"   CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server"    CssClass="button-big"></asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label4" runat="server" Text="Zip Code"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtZipCode" runat="server"    CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label6" runat="server" Text="Home Phone"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtHomePhone" runat="server"   CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label7" runat="server" Text="Mobile Phone"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMobilePhone" runat="server"   CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label8" runat="server" Text="Work Phone" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtWorkPhone" runat="server"    CssClass="txtbox2"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Label ID="Label9" runat="server" Text="Upload your resume"></asp:Label>
            </td>
        </tr>
 
        <tr>
            <td align="left">
                <asp:RadioButtonList ID="rblResume" runat="server" RepeatDirection="Horizontal" Width="200px" OnSelectedIndexChanged="rblResume_SelectedIndexChanged">
                    <asp:ListItem>Upload</asp:ListItem>
                    <asp:ListItem>Copy</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlUpload" runat="server" Visible="false">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Panel ID="pnlCopy" runat="server" Visible="false">
                    <asp:TextBox ID="txtResumeBuilder" BackColor="White" runat="server" Height="300px"
                                                    Width="600px" TextMode="MultiLine" TabIndex="6"></asp:TextBox>
                                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                    runat="server">
                                                </asp:HtmlEditorExtender>
                </asp:Panel>
            </td>
        </tr>

        <tr>
            <td valign="bottom">
                <asp:Button ID="btnContinue" runat="server" Text="Continue Application" CssClass="button-big" />
            </td>
        </tr>

    </table>
            </td>
        </tr>
    </table>--%>

</asp:Content>


