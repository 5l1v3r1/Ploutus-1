<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="Listofusers1.aspx.cs" Inherits="Marketing_Listofusers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function validateActivity() {
            var date1 = document.getElementById('<%= txtActdt.ClientID %>');
            var acttype = document.getElementById('<%= ddlActivities.ClientID %>');
            if (acttype.value == 'Select') {
                alert("Please Select Type of Activity");
                return false;
            }
            if (date1.value == '') {
                alert("Activity date is Mandatory");
                return false;
            }

            var timeSel = document.getElementById('<%= tsActTime.ClientID %>');
            var inputs = timeSel.getElementsByTagName("input");

            var hour = inputs[0].value;
            var minutes = inputs[2].value;
            var meridiem = inputs[5].value;


            if (confirm("Are you sure you want to create activity on " + date1.value + " " + hour + ":" + minutes + ":" + meridiem + "")) {
                return true;
            }
            else {
                return false;
            }

        }
    </script>
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
                        <td valign="top" style="padding-top: 0px; padding-bottom: 0px;" align="center">
                            <table>
                                <tr>
                                    <td>
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
                                                                        <asp:Button ID="btnedit" runat="server" Text="Edit" OnClick="editdetails" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div>
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
                                                                    <td style="width: 250px;">
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 70px;">
                                                                                    Email
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left; width: 20px;">
                                                                                <asp:Label ID="lblEmail" Text='<%# Eval("emailid")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 200px;">
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
                                                                                <asp:Label ID="Label3" Text='<%# Eval("address")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 70px;">
                                                                                    Mobile
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label1" Text='<%# Eval("mobile")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 200px;">
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 70px;">
                                                                                    State
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label4" Text='<%# Eval("state")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                    Home
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label6" Text='<%# Eval("homeNum")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 70px;">
                                                                                    Cell
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label5" Text='<%# Eval("cell")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
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
                            <table cellpadding="0" cellspacing="0" width="900px">
                                <tr>
                                    <td align="left">
                                        <table width="900px" cellpadding="0" cellspacing="0" class="tbl" border="0">
                                            <tr>
                                                <td colspan="3" class="Subhedding">
                                                    Add New Activity
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-top: 10px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    Type of Activity
                                                </td>
                                                <td align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlActivities" runat="server" Width="152px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;" align="left">
                                                    Activity Date
                                                </td>
                                                <td align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtActdt" runat="server"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1"
                                                        TargetControlID="txtActdt" runat="server" Enabled="True">
                                                    </asp:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;" align="left">
                                                    Activity Time
                                                </td>
                                                <td align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <MKB:TimeSelector ID="tsActTime" runat="server" Hour="12" Minute="00" AmPm="AM" BorderColor="Silver"
                                                        Date="" Second="0" SelectedTimeFormat="Twelve">
                                                    </MKB:TimeSelector>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;" valign="top" align="left">
                                                    Notes
                                                </td>
                                                <td valign="top" align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtNotes" TextMode="MultiLine" MaxLength="999" runat="server" Height="210px"
                                                        Width="435px"></asp:TextBox>
                                                    <asp:Label ID="lblmaxlength" runat="server" Text="(Max Length 1000)" Font-Size="XX-Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnSubmit" runat="server" OnClientClick="return validateActivity();"
                                                        Text="Save Activity" OnClick="btnSubmit_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lblActMsg" ForeColor="Green" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="padding-left: 10px" align="left">
                                                                <asp:UpdatePanel ID="updownload" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton ID="lnkbtnDResume" runat="server" OnClick="lnkbtnDResume_Click">Download Resume</asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="lnkbtnDResume" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td style="padding-right: 40px" align="center">
                                                                <asp:LinkButton ID="lnkbtnUpdateResume" runat="server" OnClick="lnkbtnUpdateResume_Click">Update Resume</asp:LinkButton>
                                                            </td>
                                                            <td align="right">
                                                                <asp:LinkButton ID="lnkViewResume" runat="server" OnClick="lnkViewResume_Click">View Resume</asp:LinkButton>
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
                                                        EmptyDataText="No activities yet" OnRowEditing="grdActivities_RowEditing">
                                                        <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Edit" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                                <ItemStyle Width="50px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="typeofact" HeaderText="Activity" />
                                                            <asp:BoundField DataField="actdatetime" HeaderText="Scheduled Date and Time" />
                                                            <%--  <asp:BoundField DataField="acttime" HeaderText="Time" />--%>
                                                            <%--  <asp:BoundField DataField="notes" HeaderText="Notes" />--%>
                                                            <asp:BoundField DataField="actcreatedby" HeaderText="CreatedBy"></asp:BoundField>
                                                            <asp:BoundField DataField="insertdt" HeaderText="CreatedDate"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="Edit">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="edit"></asp:LinkButton></ItemTemplate>
                                                                <ItemStyle Width="50px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="view"></asp:LinkButton></ItemTemplate>
                                                                <ItemStyle Width="50px" />
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
        <tr>
            <td>
                <div id="Div2" style="display: none">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#E6E6EF">
                        <table style="height: 450px; width: 600px;">
                            <tr>
                                <td align="center">
                                    Resume
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtViewResume" TextMode="MultiLine" Width="700px" Height="480px"
                                        runat="server"></asp:TextBox>
                                    <%--   <div runat="server" id="xxxx" style="height: 530px; width: 600px; overflow: scroll;
                                        background-color: White;">
                                    </div>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblresumeMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnVRCancel" runat="server" Text="Close" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hfViewResume" runat="server" />
                <asp:ModalPopupExtender ID="mpViewResume" runat="server" TargetControlID="hfViewResume"
                    PopupControlID="Div2" BackgroundCssClass="Inactive" CancelControlID="btnVRCancel">
                </asp:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>
