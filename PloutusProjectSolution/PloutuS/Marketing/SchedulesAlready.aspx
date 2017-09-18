<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="SchedulesAlready.aspx.cs" Inherits="Marketing_Schedules" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" class="headding">
                JobSeeker Schedules Information
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
                        <td>
                            <%--<asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table style="border: 1px solid silver;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center">
                                        <asp:GridView ID="grdActivities" CellPadding="0" CellSpacing="0" GridLines="None"
                                            Width="900px" runat="server" AutoGenerateColumns="False" EmptyDataText="No activities yet">
                                            <AlternatingRowStyle CssClass="saltertext1" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Profile" HeaderStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" CssClass="sgrid-headiing-Green"
                                                            NavigateUrl='<%# Eval("encryptid", "ListofactivitiesAlready.aspx?id={0}") %>'><%# Eval("JsName")%></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="pendingcnt" HeaderText="Act-Pending" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="closedcnt" HeaderText="Act-Closed" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="actcreatedby" HeaderText="ScheduledBy" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="insertdt" HeaderText="CreatedDate" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="left" CssClass="Subhedding" />
                                            <PagerStyle BackColor="#FCE196" ForeColor="White" CssClass="Subhedding" HorizontalAlign="right" />
                                            <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table class="Gridhedding" cellpadding="0" cellspacing="0" width="900px">
                                            <tr>
                                                <td align="right">
                                                    <table cellpadding="0" border="0">
                                                        <tr class="textnormal">
                                                            <td align="right">
                                                                <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                                &nbsp;
                                                            </td>
                                                            <td align="right">
                                                                <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                            </td>
                                                            <td align="center" valign="middle">
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
                                                            <td align="left">
                                                                &nbsp;
                                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="LinkButton3_Click">Last</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hdn" runat="server" />
    <asp:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
        BackgroundCssClass="Inactive" CancelControlID="btncancel">
    </asp:ModalPopupExtender>
</asp:Content>
