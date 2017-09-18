<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="ListofActivitiesAlready.aspx.cs" Inherits="Marketing_ListofActivities" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="1024px">
        <tr>
            <td valign="top" style="padding-top: 10px; padding-bottom: 0px;" align="center">
                <table>
                    <tr>
                        <td style=" padding-top:30px;">
                            <asp:DataList ID="dlMemInfo" runat="server" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lable"
                                AlternatingItemStyle-CssClass="gridbgwhite" ItemStyle-CssClass="gridbg">
                                <ItemTemplate>
                                    <table cellpadding="0" width="900px" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table width="900px" class="tbl" style="padding-bottom: 0px;" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="2" class="Subhedding" align="left">
                                                            Contact Info
                                                        </td>
                                                        <td align="right" style="padding-right: 20px;" class="Subhedding">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 300px;">
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Name</div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div class="subdiv2">
                                                                    <asp:Label ID="lblFname" Text=' <%# Eval("firstname") %>' runat="server"></asp:Label>
                                                                </div>
                                                                <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                    <asp:Label ID="lblLName" Text='<%# Eval("lastname") %>' runat="server"></asp:Label>
                                                                </div>
                                                                <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                    <asp:Label ID="lblMName" Text='<%# Eval("middlename") %>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td style="width: 300px;">
                                                            <div>
                                                                <div>
                                                                    <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                        <div style="float: left; width: 70px;">
                                                                            Mobile
                                                                        </div>
                                                                        <div style="float: left; width: 10px;">
                                                                            :</div>
                                                                    </div>
                                                                    <div style="float: left; width: 100px;">
                                                                        <asp:Label ID="Label1" Text='<%# Eval("mobile")%>' runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 70px;">
                                                                        City</div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :
                                                                    </div>
                                                                </div>
                                                                <div style="float: left; text-align: left; padding-left: 5px;">
                                                                    <asp:Label ID="Label2" Text='<%# Eval("city")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Address</div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :
                                                                    </div>
                                                                </div>
                                                                <div style="float: left; text-align: left; padding-left: 5px;">
                                                                    <asp:Label ID="Label3" Text='<%# Eval("addressline1")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 70px;">
                                                                        Email
                                                                    </div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div style="float: left; width: 20px;">
                                                                    <asp:Label ID="lblEmail" Text='<%# Eval("email")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 70px;">
                                                                        State
                                                                    </div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div style="float: left; width: 10px;">
                                                                    <asp:Label ID="Label4" Text='<%# Eval("state")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px;">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblerrmsg" runat="server" Text="Label" CssClass="errmsg" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 20px;" align="center">
                <table width="900px">
                    <tr>
                        <td align="center" colspan="2">
                            <table width="900px" class="tbl" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td class="Subhedding">
                                        Activities
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 10px; padding-bottom: 10px" align="center">
                                        <asp:GridView ID="grdActivities" GridLines="None" Width="850px" runat="server" AutoGenerateColumns="False"
                                            EmptyDataText="No activities yet">
                                            <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Edit" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="typeofact" HeaderText="Activity" />
                                                <asp:BoundField DataField="actdatetime" HeaderText="Scheduled Date and Time" />
                                                <asp:BoundField DataField="actcreatedby" HeaderText="CreatedBy"></asp:BoundField>
                                                <asp:BoundField DataField="insertdt" HeaderText="CreatedDate"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkView" runat="server" Font-Underline="false" Text='<%# Eval("Status")%>'
                                                            OnClick="view"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgDel" OnClientClick="return confirm('Are you sure you want to delete this Activity');"
                                                            ImageUrl="~/images/close.jpg" OnClick="Delete" runat="server" /></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="left" CssClass="saltertext1" />
                                            <PagerStyle BackColor="#FCE196" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="left" CssClass="saltertext" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 10px;" align="right">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblstatus" runat="server"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnAccept" runat="server" Text="Accept Profile" OnClick="btnAccept_Click" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnReject" runat="server" Text="Reject Profile" OnClick="btnReject_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <table width="900px">
                                <tr>
                                    <td class="boxhead" align="right">
                                        <asp:LinkButton ID="lnkbtnBack" OnClientClick="history.go(-1);" runat="server">Back</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 100px;">
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
                                        <asp:ListItem Value="2">Pending</asp:ListItem>
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
