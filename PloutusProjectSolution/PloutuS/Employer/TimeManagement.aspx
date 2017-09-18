<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="TimeManagement.aspx.cs" Inherits="Ploutos_TimeManagement" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td style="width: 100%; vertical-align: middle; padding-top: 50px; padding-bottom: 30px;"
                colspan="3" class="headding" align="center">
                TimeSheet Management
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnlMain" runat="server">
        <table width="900px" style="border: 1px solid silver" align="center">
            <tr>
                <td align="center">
                    <table cellpadding="4" cellspacing="4">
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Text="Select Users"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlusers" runat="server" CssClass="ddlboxsmall-post" AutoPostBack="true"
                                    DataTextField="firstname" DataValueField="id" OnSelectedIndexChanged="ddlusers_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                    InitialValue="--Select--" runat="server" ErrorMessage="Select Users" 
                                    ControlToValidate="ddlusers" ValidationGroup="TSM" Display="None">*</asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="cve1" runat="server" TargetControlID="RequiredFieldValidator1"></cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text="Select Day"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlday" runat="server" CssClass="ddlboxsmall-post" OnSelectedIndexChanged="ddlday_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                    InitialValue="--Select--" runat="server" ErrorMessage="Select Day" 
                                    ControlToValidate="ddlday" Display="None" SetFocusOnError="True" 
                                    ValidationGroup="TSM">*</asp:RequiredFieldValidator>
                                     <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator2"></cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label3" runat="server" Text="Select WorkType"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlDayType" runat="server" CssClass="ddlboxsmall-post">
                                    <asp:ListItem Value="--Select--">--Select--</asp:ListItem>
                                    <asp:ListItem Value="Working">Working</asp:ListItem>
                                    <asp:ListItem Value="Holiday">Holiday</asp:ListItem>
                                    <asp:ListItem Value="Leave">Leave</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="Select WorkType" Display="None" InitialValue="0" 
                                    SetFocusOnError="True" ValidationGroup="TSM" 
                                    ControlToValidate="ddlDayType">*</asp:RequiredFieldValidator>
                                     <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator3"></cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label4" runat="server" Text="Time In"></asp:Label>
                            </td>
                            <td align="left">
                                <MKB:TimeSelector ID="tsTimeIn" runat="server" Width="148px">
                                </MKB:TimeSelector>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label5" runat="server" Text="Time Out"></asp:Label>
                            </td>
                            <td align="left">
                                <MKB:TimeSelector ID="tsTimeOut" runat="server" Width="148px">
                                </MKB:TimeSelector>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="2" align="right">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" 
                                ValidationGroup="TSM" CssClass="btn" />
                        </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            <td>
            <asp:Panel ID="pnlgrid" runat="server" Visible="False">
            <table cellpadding="0" cellspacing="0">
             <tr>
                <td align="center" class="Gridhedding">
                    <table width="900px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="dlTsdet" runat="server" AllowPaging="false" GridLines="None" CellPadding="4"
                        AutoGenerateColumns="False" Width="924PX" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="day" HeaderText="Day"></asp:BoundField>
                            <asp:BoundField DataField="date" HeaderText="Date"></asp:BoundField>
                            <asp:BoundField DataField="WorkType" HeaderText="Work Type"></asp:BoundField>
                            <asp:BoundField DataField="timein" HeaderText="Time In"></asp:BoundField>
                            <asp:BoundField DataField="timeout" HeaderText="Time Out"></asp:BoundField>
                            <asp:BoundField DataField="totaltime" HeaderText="Total Time"></asp:BoundField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" OnClick="edittime"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                        <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                        <AlternatingRowStyle CssClass="saltertext1" />
                        <PagerStyle BackColor="#fce196" />
                    </asp:GridView>
                </td>
            </tr>
            <tr class="Gridhedding">
                <td align="right">
                    <%--<table cellpadding="0" border="0" cellspacing="0">
                        <tr class="textnormal">
                            <td align="right">
                                <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                &nbsp;
                            </td>
                            <td align="right">
                                <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                            </td>
                            <td align="right" valign="middle">
                                <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                    OnItemDataBound="dlPaging_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:LinkButton Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging" runat="server"
                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td align="left">
                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false"
                                    OnClick="lbtnNext_Click">Next</asp:LinkButton>
                            </td>
                            <td align="right">
                                &nbsp;
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
                            </td>
                        </tr>
                    </table>--%>
                </td>
            </tr>
            </table>
            </asp:Panel>
            
            </td>
            </tr>
           
        </table>
        <table width="924px" align="center" style="margin-top: 0px">
            <tr>
                <td align="right" style="padding-right: 10px; padding-top: 10px;">
                    <asp:LinkButton ID="LinkButton2" CssClass="stylink" runat="server" PostBackUrl="~/Employer/EmployerHomePage.aspx">Back</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="height: 100px;">
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlSub" Visible="false">
        <table cellpadding="0" cellspacing="0" width="1024px" style="padding-top: 50px; padding-bottom: 50px;">
            <tr>
                <td align="center">
                    <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" style="padding-right: 50px;">
                    <%-- <asp:LinkButton ID="LinkButton1" CssClass="stylink" runat="server" PostBackUrl="~/Employer/EmployerHomePage.aspx">Back</asp:LinkButton>--%>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
