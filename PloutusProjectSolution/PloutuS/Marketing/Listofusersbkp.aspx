﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="Listofusersbkp.aspx.cs" Inherits="Marketing_Listofusers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="1024px">
        <tr>
            <td>
                <table width="1024px">
                    <tr>
                        <td align="center" class="headding">
                            <asp:Label ID="lblMemInfo" runat="server" Text="Schedule Activities"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="924px">
                    <tr>
                        <td colspan="2" align="center">
                            <div class="subdiv">
                                <div style="float: left; text-align: center; font-weight: 700;" class="subdiv">
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="padding-top: 20px;" align="center">
                            <asp:DataList ID="dlMemInfo" runat="server" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lable"
                                AlternatingItemStyle-CssClass="gridbgwhite" ItemStyle-CssClass="gridbg">
                                <ItemTemplate>
                                    <table cellpadding="0" width="300px" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table width="300px" class="tbl" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="3" align="left" class="Subhedding">
                                                            Contact Info
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div align="left">
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Name</div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div class="subdiv2">
                                                                    <asp:Label ID="lblFname" Text=' <%# Eval("fname") %>' runat="server"></asp:Label>
                                                                </div>
                                                                <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                    <asp:Label ID="lblLName" Text='<%# Eval("lname") %>' runat="server"></asp:Label>
                                                                </div>
                                                                <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                    <asp:Label ID="lblMName" Text='<%# Eval("mname") %>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Address 1
                                                                    </div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div style="float: left; padding-left: 3px;">
                                                                    <asp:Label ID="lblAdd1" Text='<%# Eval("address")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Job Title</div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :
                                                                    </div>
                                                                </div>
                                                                <div style="float: left; text-align: left; padding-left: 5px;">
                                                                    <asp:Label ID="lblJobTitle" Text='<%# Eval("Jobtittle")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Mobile
                                                                    </div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div class="subdiv2">
                                                                    <asp:Label ID="lblMobile" Text='<%# Eval("mobile")%>' runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                    <div style="float: left; width: 90px;">
                                                                        Email
                                                                    </div>
                                                                    <div style="float: left; width: 10px;">
                                                                        :</div>
                                                                </div>
                                                                <div class="subdiv2">
                                                                    <asp:Label ID="lblEmail" Text='<%# Eval("emailid")%>' runat="server"></asp:Label>
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
                        <td valign="top" style="width: 624px;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TabContainer ID="TabContainer1" Width="624px" runat="server" ActiveTabIndex="0">
                                            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Add New Activity">
                                                <HeaderTemplate>
                                                    Add New Activity
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table cellpadding="5" cellspacing="5" border="0">
                                                        <tr>
                                                            <td colspan="3" align="center">
                                                                Add New Activity
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Type of Activity
                                                            </td>
                                                            <td align="center">
                                                                :
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="ddlActivities" runat="server">
                                                                </asp:DropDownList>
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
                                                                <asp:TextBox ID="txtActdt" runat="server"></asp:TextBox>
                                                                <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtActdt" runat="server"
                                                                    Enabled="True">
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
                                                                <MKB:TimeSelector ID="tsActTime" runat="server" Hour="12" Minute="0" AmPm="AM" BorderColor="Silver"
                                                                    Date="" Second="0" SelectedTimeFormat="Twelve">
                                                                </MKB:TimeSelector>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top" align="left">
                                                                Notes
                                                            </td>
                                                            <td valign="top" align="center">
                                                                :
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Height="210px" Width="435px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Button ID="btnSubmit" runat="server" Text="Save Activity" OnClick="btnSubmit_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="3">
                                                                <asp:Label ID="lblActMsg" ForeColor="Green" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                            <td style="height: 30px;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="grdActivities" GridLines="None" Width="590px" runat="server" AutoGenerateColumns="False"
                                                                    EmptyDataText="No activities yet" OnRowEditing="grdActivities_RowEditing">
                                                                    <AlternatingRowStyle CssClass="saltertext1" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Edit" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="actdt" HeaderText="Date" />
                                                                        <asp:BoundField DataField="acttime" HeaderText="Time"   />
                                                                        <asp:BoundField DataField="actcreatedby" HeaderText="User">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="typeofact" HeaderText="Type of activity" />
                                                                        <asp:BoundField DataField="notes" HeaderText="Notes" />
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="edit"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="view"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="50px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgDel" OnClientClick="return confirm('Are you sure you want to delete this Activity');"
                                                                                    ImageUrl="~/images/close.jpg" OnClick="Delete" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                                    <PagerStyle BackColor="#FCE196" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Resumes">
                                                <ContentTemplate>
                                                    <table style="height: 300px; width: 500px;">
                                                        <tr>
                                                            <td>
                                                                Resume
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtResume" TextMode="MultiLine" Width="600px" Height="530px" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:UpdatePanel ID="updownload" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton ID="lnkbtnDResume" runat="server" OnClick="lnkbtnDResume_Click">Download Resume</asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="lnkbtnDResume" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Label ID="lblresumeMsg" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblstatus" runat="server"></asp:Label>
                                                </td>
                                                <td align="right">
                                                    <asp:Button ID="btnAccept" runat="server" Text="Accept Candidate" OnClick="btnAccept_Click" />
                                                </td>
                                                <td style="padding-right: 15PX;" align="right">
                                                    <asp:Button ID="btnReject" runat="server" Text="Reject Cadidate" OnClick="btnReject_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <table width="924px">
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
        <tr>
            <td>
                <div id="x" style="display: none">
                    <asp:Panel ID="pnl" runat="server" BackColor="#E6E6EF">
                        <table cellpadding="5" cellspacing="5" border="0">
                            <tr>
                                <td colspan="3" align="center">
                                    <b>Activity Info</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Type of Activity
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlactvities1" runat="server" Width="150px">
                                    </asp:DropDownList>
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
                                <td align="right" colspan="3">
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="Update" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                </td>
                            </tr>
                            <%--   <tr>
                                <td align="right" colspan="3">
                                    <asp:Label ID="lbldone" runat="server" ForeColor="Green" />
                                </td>
                            </tr>--%>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hdn" runat="server" />
                <asp:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
                    BackgroundCssClass="Inactive" CancelControlID="btncancel">
                </asp:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>
