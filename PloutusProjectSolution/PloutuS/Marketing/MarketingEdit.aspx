<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="MarketingEdit.aspx.cs" Inherits="Marketing_MarketingEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Edit Details"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5" class="tbl" style="width: 900px;" border="0">
                   <tr>
                                                <td style="width: 220px;">
                                                    Name
                                                </td>
                                                <td style="width: 240px; padding-left:10px;">
                                                    <asp:TextBox ID="txtFName" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                        TabIndex="1"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMName" CssClass="txtbox-s" MaxLength="1" runat="server"
                                                        TabIndex="2"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLName" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                        TabIndex="3"></asp:TextBox>
                                                    <span class="errmsg">&nbsp;*&nbsp;</span>
                                                    <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                                        Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                                    </cc1:ValidatorCalloutExtender>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLName"
                                                        Display="None" ErrorMessage="Please enter the Last name" SetFocusOnError="true"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vcLastName" runat="server" TargetControlID="RequiredLastName">
                                                    </cc1:ValidatorCalloutExtender>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Mobile Number
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:TextBox ID="txtMobileNumber" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="4"></asp:TextBox>
                                                    <%--  <span class="errmsg">&nbsp;*</span>--%>
                                                    <cc1:FilteredTextBoxExtender ID="filter" runat="server" ValidChars="()-0123456789"
                                                        TargetControlID="txtMobileNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <%--  <asp:RequiredFieldValidator ID="ReqMobile" runat="server" ControlToValidate="txtMobileNumber"
                                                        SetFocusOnError="true" Display="None" ErrorMessage="Please Enter mobile number"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>--%>
                                                    <asp:RegularExpressionValidator ID="regmobile" ControlToValidate="txtMobileNumber"
                                                        runat="server" SetFocusOnError="true" Display="None" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"
                                                        ErrorMessage="Please Enter Valid PhoneNmber"></asp:RegularExpressionValidator>
                                                    <%--   <cc1:ValidatorCalloutExtender ID="vcMobileReq" runat="server" TargetControlID="ReqMobile">
                                                    </cc1:ValidatorCalloutExtender>--%>
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="regmobile">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cell Number&nbsp; (Alternative Number)
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:TextBox ID="txtCellNumber" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="5"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteCellNumber" runat="server" ValidChars="()-0123456789"
                                                        TargetControlID="txtCellNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RegularExpressionValidator ID="revCellNumber" ControlToValidate="txtCellNumber"
                                                        runat="server" SetFocusOnError="true" Display="None" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"
                                                        ErrorMessage="Please Enter Valid PhoneNmber"></asp:RegularExpressionValidator>
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="revCellNumber">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Home Number
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:TextBox ID="txtHomeNumber" MaxLength="15" runat="server" CssClass="txtbox-lrg1"
                                                        TabIndex="6"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteHomeNumber" runat="server" ValidChars="()-0123456789"
                                                        TargetControlID="txtHomeNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RegularExpressionValidator ID="revHomeNumber" ControlToValidate="txtHomeNumber"
                                                        runat="server" SetFocusOnError="true" Display="None" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"
                                                        ErrorMessage="Please Enter Valid PhoneNmber"></asp:RegularExpressionValidator>
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="revHomeNumber">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Email
                                                </td>
                                                <td colspan="3">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Repeater ID="repeater1" runat="server" OnItemCommand="repeater1_ItemCommand">
                                                                <ItemTemplate>
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:TextBox ID="txtEmail" MaxLength="80" runat="server" Text='<%# Eval("email") %>'
                                                                                    CssClass="txtbox-lrg1" TabIndex="7"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                                                    CommandName="DeleteRows" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <table cellpadding="0" cellspacing="0" >
                                                                        <tr>
                                                                        <td style=" width:230px;"></td>
                                                                            <td>
                                                                                <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add " CssClass="txtbox-s1"
                                                                                    CommandName="AddRows" TabIndex="7" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Experience
                                                </td>
                                                <td valign="middle" colspan="3" style="padding-left:8px;">
                                                    <asp:DropDownList ID="ddlYearsExp" runat="server" TabIndex="8">
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
                                                    <asp:DropDownList ID="ddlMonthsExp" runat="server" TabIndex="9">
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
                                                    <%--  <span class="errmsg">*</span>--%>
                                                    <%--   <asp:RequiredFieldValidator ID="rqvMonths" runat="server" ControlToValidate="ddlMonthsExp"
                                                        InitialValue="-1" ErrorMessage="Select months of experience" SetFocusOnError="true"
                                                        Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vceMonths" runat="server" TargetControlID="rqvMonths">
                                                    </cc1:ValidatorCalloutExtender>
                                                    <asp:RequiredFieldValidator ID="rqvYears" runat="server" ControlToValidate="ddlYearsExp"
                                                        InitialValue="-1" ErrorMessage="Select years of experience" SetFocusOnError="true"
                                                        Display="None" CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vceYears" runat="server" TargetControlID="rqvYears">
                                                    </cc1:ValidatorCalloutExtender>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    1<sup>st</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:DropDownList ID="ddlIndustries1" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                    </asp:DropDownList>
                                                    <%--   <asp:ListBox ID="ddlIndustries" runat="server" SelectionMode="Multiple" CssClass="lstbox"
                                                        TabIndex="10"></asp:ListBox>--%>
                                                    <span class="errmsg">*</span>
                                                    <asp:RequiredFieldValidator ID="ReqIndustries" runat="server" ControlToValidate="ddlIndustries1"
                                                        InitialValue="--Select--" SetFocusOnError="true" Display="None" ErrorMessage="Please select the Industries"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vcIndustries" runat="server" TargetControlID="ReqIndustries">
                                                    </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    2<sup>nd</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:DropDownList ID="ddlIndustries2" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                    </asp:DropDownList>
                                                    <%--   <asp:ListBox ID="ddlIndustries" runat="server" SelectionMode="Multiple" CssClass="lstbox"
                                                        TabIndex="10"></asp:ListBox>--%>
                                                  
                                                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlIndustries1"
                                                        InitialValue="--Select--" SetFocusOnError="true" Display="None" ErrorMessage="Please select the Industries"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="ReqIndustries">
                                                    </cc1:ValidatorCalloutExtender>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    3<sup>rd</sup> Priority Industry
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:DropDownList ID="ddlIndustry3" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                    </asp:DropDownList>
                                                    <%--   <asp:ListBox ID="ddlIndustries" runat="server" SelectionMode="Multiple" CssClass="lstbox"
                                                        TabIndex="10"></asp:ListBox>--%>
                                                  
                                                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlIndustries1"
                                                        InitialValue="--Select--" SetFocusOnError="true" Display="None" ErrorMessage="Please select the Industries"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="ReqIndustries">
                                                    </cc1:ValidatorCalloutExtender>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    State
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:DropDownList ID="ddlState" CssClass="ddlboxlrg" runat="server" 
                                                        TabIndex="11" AutoPostBack="true" onselectedindexchanged="ddlState_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <span class="errmsg">*</span>
                                                    <asp:RequiredFieldValidator ID="ReqState" runat="server" ControlToValidate="ddlState"
                                                        InitialValue="Select State" SetFocusOnError="true" Display="None" ErrorMessage="Please select the State"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vcState" runat="server" TargetControlID="ReqState">
                                                    </cc1:ValidatorCalloutExtender>
                                                   <%-- <cc1:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlState"
                                                        LoadingText="Loading State..." PromptText="Select State" PromptValue="Select State"
                                                        ServiceMethod="BindCountrydropdown" ServicePath="~/Marketing/WebService.asmx">
                                                    </cc1:CascadingDropDown>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    City
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:DropDownList ID="ddlcity" CssClass="ddlboxlrg" runat="server" TabIndex="12">
                                                    </asp:DropDownList>
                                                    <span class="errmsg">*</span>
                                                    <asp:RequiredFieldValidator ID="RequiredCity" runat="server" ControlToValidate="ddlcity"
                                                        InitialValue="Select City" SetFocusOnError="true" Display="None" ErrorMessage="Please enter the City"
                                                        CssClass="errmsg"></asp:RequiredFieldValidator>
                                                    <cc1:ValidatorCalloutExtender ID="vcCity" runat="server" TargetControlID="RequiredCity">
                                                    </cc1:ValidatorCalloutExtender>
                                                 <%--   <cc1:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlcity"
                                                        ParentControlID="ddlState" LoadingText="Loading City..." PromptText="Select City"
                                                        PromptValue="Select City" ServiceMethod="BindStatedropdown" ServicePath="WebService.asmx">
                                                    </cc1:CascadingDropDown>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    Address
                                                </td>
                                                <td colspan="3" style="padding-left:10px;">
                                                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" MaxLength="100" CssClass="txtbox-lrg1"
                                                        Height="70px" Width="230px" runat="server" TabIndex="13"></asp:TextBox>
                                                </td>
                                            </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn" Width="99px"
                                CausesValidation="true" OnClick="btnSave_Click" />
                            &nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn" Width="99px"
                                OnClientClick="history.go(-1);" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:Label ID="lblsucess" runat="server" ForeColor="Green"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2" style="padding-right: 30px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
