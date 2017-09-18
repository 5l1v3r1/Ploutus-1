<%@ Page Title="Upload Profile" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false"
    CodeFile="MrktMngrUploadResumes.aspx.cs" Inherits="Marketing_MrktMngrUploadResumes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td>
                <table width="100%" border="0" style="border-bottom: 1px solid #FFC498; padding: 0px;"
                    cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Upload Profile
                        </td>
                        <td width="31%" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="35" alt="" />
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%;">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 80%; text-align: left;">
                    <tr>
                        <td style="padding-left: 10px; width: 134px;">
                            Name
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                            <asp:TextBox ID="txtFName" CssClass="txtbox1" MaxLength="100" runat="server" TabIndex="1"
                                Style="width: 180px;"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp; <span class="errmsg">&nbsp;*&nbsp;</span>
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
                        <td align="left">
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
                        <td align="left">
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
                        <td style="padding-left: 10px;">
                            Status
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="repStatus" runat="server" OnItemCommand="repStatus_ItemCommand">
                                        <ItemTemplate>
                                            <table style="width: auto; text-align: left;">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtStatus" TextMode="MultiLine" MaxLength="80" runat="server" Text='<%# Eval("Status") %>'
                                                            CssClass="txtboxMulti" TabIndex="4" Style="width: 179px;"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:ImageButton ID="ImageStatus" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                            CommandName="DeleteRows" />
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
                            Client
                        </td>
                        <td style="padding-left: 12px;">
                            <asp:DropDownList ID="ddlclient" runat="server" OnSelectedIndexChanged="ddlclient_SelectedIndexChanged"
                                AutoPostBack="true" CssClass="ddlbox1" Style="width: 182px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">
                            Position
                        </td>
                        <td style="padding-left: 12px;">
                            <asp:DropDownList ID="ddlposition" runat="server" CssClass="ddlbox1" Style="width: 182px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">
                            <asp:Label ID="lbltext" Text="Industry" runat="server"></asp:Label>
                        </td>
                        <td style="padding-left: 12px;">
                            <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddlbox1" Style="width: 182px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 100%; text-align: left;">
                            <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                <ContentTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; text-align: left;">
                                        <tr>
                                            <td style="padding: 0px; width: 240px;">
                                                Copy Resume
                                            </td>
                                            <td style="padding: 0px; width: 600px; background-color: White;">
                                                <asp:TextBox ID="txtResumeBuilder" BackColor="White" runat="server" Height="300px"
                                                    Width="600px" TextMode="MultiLine" TabIndex="6"></asp:TextBox>
                                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                    runat="server">
                                                </asp:HtmlEditorExtender>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right">
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
                        <td align="center" colspan="2">
                            <asp:Label ID="lblMsg" runat="server" CssClass="errmsg" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
