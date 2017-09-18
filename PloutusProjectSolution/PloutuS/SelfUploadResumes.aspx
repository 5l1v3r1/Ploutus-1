<%@ Page Title="Upload Profile" Language="C#" MasterPageFile="~/master_noheader.master"
    AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false"
    CodeFile="SelfUploadResumes.aspx.cs" Inherits="SelfUploadResumes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
     <link href="CSS/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
    <link href="jquery-ui.min.css" type="text/css" rel="Stylesheet" />
    <link href="StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>

    <style type="text/css">
        .ui-datepicker
        {
            font-size: 9pt !important;
        }
        
        .ui-datepicker
        {
            font-size: 11.5pt;
        }
        .ui-widget-content .ui-icon
        {
            background-image: url(../images2/ui-icons_222222_256x240.png);
        }
        .ui-widget-header .ui-icon
        {
            background-image: url(../images2/ui-icons_222222_256x240.png);
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" style=" border:1px solid silver; background-color:#FEF7E5;">
                <tr>
            <td style="padding-top: 20px; border: 0px solid white;" align="left">
                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Upload Resume
                        </td>
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
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            Name
                        </td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtFName" CssClass="txtbox1" MaxLength="100" runat="server" TabIndex="1"
                                Style="width: 180px;"></asp:TextBox>
                             <span class="errmsg"></span>
                            <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                CssClass="errmsg"></asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                            </asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">
                            Contact Number
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="repContactNum" runat="server" OnItemCommand="repContactNum_ItemCommand">
                                        <ItemTemplate>
                                            <table style="width: auto; text-align: left;">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtContactNum" MaxLength="80" runat="server" Text='<%# Eval("ContactNum") %>'
                                                            CssClass="txtbox1" TabIndex="2" Style="width: 180px;"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:ImageButton ID="ImageContactNum" runat="server" ImageUrl="~/images/close.jpg"
                                                            CausesValidation="false" CommandName="DeleteRows" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                            CssClass="txtbox-s1" CommandName="AddRows" TabIndex="7" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">
                            Email
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="repemail" runat="server" OnItemCommand="repemail_ItemCommand1">
                                        <ItemTemplate>
                                            <table style="width: auto; text-align: left;">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtEmail" MaxLength="80" runat="server" Text='<%# Eval("email") %>'
                                                            CssClass="txtbox1" TabIndex="3" Style="width: 180px;"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:ImageButton ID="Imageemail" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                            CommandName="DeleteRows" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                            CssClass="txtbox-s1" CommandName="AddRows" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" style="padding-left: 12px; width: 734px;">
                            <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                <ContentTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; text-align: left;">
                                        <tr>
                                            <td style="padding: 0px; width: 150px;">
                                                Copy Resume
                                            </td>
                                            <td style="padding: 12px; width: 600px;">
                                                <table><tr><td style="background-color:white;">
                                                <asp:TextBox ID="txtResumeBuilder" BackColor="White" runat="server" Height="300px"
                                                    Width="600px" TextMode="MultiLine" TabIndex="6"></asp:TextBox>
                                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                    runat="server">
                                                </asp:HtmlEditorExtender></td></tr></table>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right" style="padding: 12px;">
                                                <br />
                                                <asp:Button ID="btnsave" runat="server" Text="SAVE" OnClick="btnSubmit_Click" CssClass="btn"
                                                    TabIndex="7" />
                                            </td>
                                            <td>
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
                        <td align="center" colspan="2" style="padding-bottom:30px;">
                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg" Text=""></asp:Label>
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
</asp:Content>
