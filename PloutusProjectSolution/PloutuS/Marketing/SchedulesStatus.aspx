<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="SchedulesStatus.aspx.cs" Inherits="Marketing_SchedulesStatus" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" class="headding">
                Schedules Information
            </td>
        </tr>
        <tr>
            <td style="height: 20px;">
                <asp:Label ID="lblErrMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="center">
                            <table style="border: 1px solid silver;" width="900px">
                                <tr>
                                    <td align="left" style="width: 111px">
                                        Schedule Type:
                                    </td>
                                    <td width="100px" align="left">
                                        <asp:DropDownList ID="ddlSelecType" runat="server" OnSelectedIndexChanged="ddlSelecType_SelectedIndexChanged"
                                            AutoPostBack="True">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="All" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Date Wise" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" style="width: 111px">
                                        Select Activity:
                                    </td>
                                    <td align="left">
                                        &nbsp;<asp:DropDownList ID="ddlActivities" runat="server" 
                                            Width="152px" onselectedindexchanged="ddlActivities_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Panel ID="pnldate" runat="server" Visible="false">
                                            <table>
                                                <tr>
                                                    <td width="100px" align="left">
                                                        Select Date
                                                    </td>
                                                    <td width="200px" align="left">
                                                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1"
                                                            TargetControlID="txtDate" runat="server">
                                                        </asp:CalendarExtender>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 10px;" align="center">
                            <table width="900px">
                                <tr>
                                    <td colspan="4" align="right">
                                        Sort Order :
                                        <asp:DropDownList ID="ddlsort" runat="server" OnSelectedIndexChanged="ddlsort_SelectedIndexChanged"
                                            AutoPostBack="True">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Sort By Name(A-Z)" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Sort By Name(Z-A)" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Sort By Date Ascending" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Sort By Date Descending" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="grdActivities" CssClass="tbl" CellPadding="0" CellSpacing="0" GridLines="None"
                                Width="900px" runat="server" AutoGenerateColumns="False" EmptyDataText="No activities yet"
                                OnRowEditing="grdActivities_RowEditing">
                                <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                <Columns>
                                    <%--<asp:BoundField DataField="jsname" HeaderText="Profile" />--%>
                                    <asp:TemplateField HeaderText="Profile">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" CssClass="sgrid-headiing-Green"
                                                NavigateUrl='<%# Eval("encryptid", "ListofActivities.aspx?id={0}") %>'><%# Eval("JsName")%></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="actdttime" HeaderText="Schedule Date" />
                                    <%-- <asp:BoundField DataField="acttime" HeaderText="Time" />--%>
                                    <asp:BoundField DataField="typeofact" HeaderText="Activity" />
                                    <asp:BoundField DataField="actcreatedby" HeaderText="ScheduledBy" />
                                    <asp:BoundField DataField="insertdt" HeaderText="CreateDate" />
                                    <%-- <asp:BoundField DataField="notes" HeaderText="Notes" />--%>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkView" runat="server" Font-Underline="false" Text="Pending"
                                                OnClick="view"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="View Profile">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" ForeColor="Red"
                                                NavigateUrl='<%# Eval("encryptid", "Listofusers.aspx?id={0}") %>'>View Profile</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <%-- <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgDel" OnClientClick="return confirm('Are you sure you want to delete this Activity');"
                                                ImageUrl="~/images/close.jpg" CommandArgument='<%# Eval("id")%>' CommandName="Del"
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Edit" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="left" CssClass="Subhedding" />
                                <PagerStyle BackColor="#FCE196" ForeColor="White" CssClass="Subhedding" HorizontalAlign="right" />
                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="x" style="padding: 10px; display: none; width: 700px;">
        <asp:Panel ID="pnl" runat="server" BackColor="#FFFFFF">
            <table width="100%">
                <tr>
                    <td class="headding" align="center">
                        <b>Activity Info</b>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table cellpadding="5" class="tbl" cellspacing="5" border="0">
                            <tr>
                                <td>
                                    Type of Activity
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txttypeact" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Activity Date
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtActdt1" runat="server"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender2"
                                        TargetControlID="txtActdt1" runat="server" Enabled="True">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Activity Time
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <MKB:TimeSelector ID="tsActTime1" runat="server" Hour="12" Minute="0" AmPm="AM" BorderColor="Silver"
                                        Date="" Second="0" SelectedTimeFormat="Twelve">
                                    </MKB:TimeSelector>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Notes
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtNotes1" TextMode="MultiLine" runat="server" Height="210px" Width="435px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Status
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem Value="1">Closed</asp:ListItem>
                                        <%--  <asp:ListItem Value="2">Pending</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                </td>
                                <td>
                                    <asp:Button ID="btnSaveStatus" Width="80px" OnClientClick="return confirm('Are you sure you want to close this Activity');"
                                        runat="server" Text="Save" OnClick="btnSaveStatus_Click" />
                                    <asp:Button ID="btncancel" runat="server" Width="80px" Text="Close" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 40px;">
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <asp:HiddenField ID="hdn" runat="server" />
    <asp:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
        BackgroundCssClass="Inactive" CancelControlID="btncancel">
    </asp:ModalPopupExtender>
</asp:Content>
