<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Employer/MerchantMaster.master"
    CodeFile="TimeSheetReport.aspx.cs" Inherits="Employer_TimeSheetReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="cnt1" runat="server">
    <asp:UpdatePanel ID="updatehired" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="width: 100%; vertical-align: middle; padding-top: 50px; padding-bottom: 30px;"
                        colspan="3" class="headding" align="center">
                        TimeSheet Reports
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlMain" runat="server">
                <table width="900px" style="border: 1px solid silver" align="center">
                    <tr>
                        <td align="center">
                            <table cellpadding="4" cellspacing="4">
                        <%--        <tr>
                                    <td align="right">
                                        <asp:Label ID="Label1" runat="server" Text="Report Type"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                                            AutoPostBack="True" CssClass="ddlboxsmall-post">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Company" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Users" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>All Users</asp:ListItem>
                                            <asp:ListItem>Individuals</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Select Report Type" ControlToValidate="ddlType" Display="None" 
                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label2" runat="server" Text="Select User"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True" CssClass="ddlboxsmall-post">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ErrorMessage="Select User" ControlToValidate="ddlUser" Display="None" 
                                            InitialValue="--Select--" SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidator4"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="ddlboxsmall-post"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate">
                                        </cc1:CalendarExtender>
                                        <cc1:TextBoxWatermarkExtender ID="TBWE2" runat="server" TargetControlID="txtStartDate"
                                            WatermarkText="Select Start Date" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ErrorMessage="Select StartDate" ControlToValidate="txtStartDate" Display="None" 
                                            SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="ddlboxsmall-post"></asp:TextBox>
                                        <cc1:TextBoxWatermarkExtender ID="Textboxwatermarkextender1" runat="server" TargetControlID="txtEndDate"
                                            WatermarkText="Select End Date" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ErrorMessage="Select End Date" ControlToValidate="txtEndDate" Display="None" 
                                            SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3"></cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"  CssClass="btn"
                                            ValidationGroup="TSR" />
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
                                            <table width="900px">
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
                                            <asp:GridView ID="gvReports" runat="server" GridLines="None" CellPadding="4" AutoGenerateColumns="True"
                                                Width="100%">
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                                <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                <AlternatingRowStyle CssClass="saltertext1" />
                                                <PagerStyle BackColor="#fce196" />
                                                <FooterStyle CssClass="saltertext1" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td align="center">
                                    <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display" Visible="false"></asp:Label>
                                    </td>
                                    </tr>
                                    <tr class="Gridhedding">
                                        <td align="right">
                                        </td>
                                    </tr>
                                    <tr>
                                    <td align="right" >
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                        <asp:Button ID="btnImport" CssClass="btn" runat="server" Text="Import" 
                                            onclick="btnImport_Click" /></ContentTemplate>
                                            <Triggers>
                                            <asp:PostBackTrigger ControlID="btnImport" />
                                            </Triggers>
                                        </asp:UpdatePanel>
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
            <%--<table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="width: 100%; height: 50px; vertical-align: middle; padding-top: 50px;
                        padding-bottom: 30px;" colspan="3" class="headding" align="center">
                        Time Sheet Reports
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td align="center">
                        <asp:Panel ID="pnlMain" runat="server">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 600px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text="Report Type"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Company" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Users" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="Select User"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Start Date
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate">
                                                </asp:CalendarExtender>
                                                <asp:TextBoxWatermarkExtender ID="TBWE2" runat="server" TargetControlID="txtStartDate"
                                                    WatermarkText="Select Start Date" />
                                            </td>
                                            <td>
                                                End Date
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="Textboxwatermarkextender1" runat="server" TargetControlID="txtEndDate"
                                                    WatermarkText="Select End Date" />
                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate">
                                                </asp:CalendarExtender>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table width="900px" style="border: 1px solid silver" align="center">
                    <tr>
                        <td align="center" class="Gridhedding">
                            <table width="900px">
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
                            <asp:GridView ID="gvReports" runat="server" GridLines="None" CellPadding="4"
                                AutoGenerateColumns="True" Width="100%" >
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                <AlternatingRowStyle CssClass="saltertext1" />
                                <PagerStyle BackColor="#fce196" />
                                <FooterStyle CssClass="saltertext1" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr class="Gridhedding">
                        <td align="right">
                            <asp:Button ID="btnImport" runat="server" Text="Import to Excel" 
                                onclick="btnImport_Click" />
                        </td>
                    </tr>
                </table>
                <table width="924px" align="center" style="margin-top: 0px">
                    <tr>
                        <td align="right" style="padding-right: 10px; padding-top: 10px;">
                            <asp:LinkButton ID="LinkButton2" CssClass="stylink" runat="server" PostBackUrl="~/Employer/EmployerHomePage.aspx">Back</asp:LinkButton>
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
                        </td>
                    </tr>
                </table>
            </asp:Panel>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
