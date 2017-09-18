<%@ Page Title="TimeSheet Management " Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="TimeManagement.aspx.cs" Inherits="Ploutos_TimeManagement" %>
<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<style>
.ajax__tab_header_verticalleft 
{
    width: 200px;
}
</style>

    <table cellpadding="0" cellspacing="0" style="width: 100%;">
      <%--<tr>
            <td style="width: 100%; vertical-align: middle; padding-top: 50px; padding-bottom: 30px;"
                colspan="3" class="headding" align="center">
                TimeSheet Management
            </td>
        </tr>--%>
          <tr>
             <td style="padding: 0px; padding-top: 20px;" align="left">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                           TimeSheet Management
                                        </td>
                                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                        </td>
                                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                                        </td>
                                    </tr>
                              </table>
              </td>
          </tr>
        <tr>
            <td align="center">
                <cc1:TabContainer ID="TimeSheet" runat="server" Width="750px" ActiveTabIndex="1"
                    Height="280px" AutoPostBack="True" 
                    OnActiveTabChanged="TimeSheet_ActiveTabChanged">
                    <cc1:TabPanel ID="tabCompany" runat="server">

                    <HeaderTemplate>
                    <div style="width:135px;height:400px;">
                      Company Wise                       
                    </div>
                 </HeaderTemplate>
                        <ContentTemplate>
                            <table width="900px" style="width: 297px;" align="center">
                                <tr>
                                    <td align="center" style="width: 289px">
                                        <table cellpadding="4" cellspacing="4">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="lblcom" runat="server" Text="Select Company"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlcompany" runat="server" CssClass="ddlboxsmall-post" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="--Select--"
                                                        runat="server" ErrorMessage="Select Company" ControlToValidate="ddlcompany" ValidationGroup="TSM"
                                                        Display="None">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="cve1"
                                                            runat="server" TargetControlID="RequiredFieldValidator1" Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label6" runat="server" Text="Select Users"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlCompUsers" runat="server" CssClass="ddlboxsmall-post" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlCompUsers_SelectedIndexChanged1">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="--Select--"
                                                        runat="server" ErrorMessage="Select Day" ControlToValidate="ddlCompUsers" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="TSM">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator2"
                                                            Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label2" runat="server" Text="Select Day"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlCompday" runat="server" CssClass="ddlboxsmall-post" 
                                                        AutoPostBack="True" onselectedindexchanged="ddlCompday_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="--Select--"
                                                        runat="server" ErrorMessage="Select Day" ControlToValidate="ddlCompday" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="TSM">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator2"
                                                            Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label3" runat="server" Text="Select WorkType"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlCompDayType" runat="server" CssClass="ddlboxsmall-post">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="Working">Working</asp:ListItem>
                                                        <asp:ListItem Value="Holiday">Holiday</asp:ListItem>
                                                        <asp:ListItem Value="Leave">Leave</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select WorkType"
                                                        Display="None" InitialValue="0" SetFocusOnError="True" ValidationGroup="TSM"
                                                        ControlToValidate="ddlCompDayType">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator3"
                                                            Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label4" runat="server" Text="Time In"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <MKB:TimeSelector ID="tsTimeIn" runat="server" Width="148px" AmPm="PM" BorderColor="Silver"
                                                        Date="01/01/0001 13:30:00" Hour="1" Minute="30" Second="0" SelectedTimeFormat="Twelve"></MKB:TimeSelector>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label5" runat="server" Text="Time Out"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <MKB:TimeSelector ID="tsTimeOut" runat="server" Width="148px" AmPm="PM" BorderColor="Silver"
                                                        Date="01/01/0001 13:30:00" Hour="1" Minute="30" Second="0" SelectedTimeFormat="Twelve"></MKB:TimeSelector>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnComp" CssClass="btn" runat="server" Text="Submit" ValidationGroup="TSM" OnClick="btnComp_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Users Wise">
                    
                    <HeaderTemplate>
                    <div style="width:135px;height:600px;">
                      Users Wise                       
                    </div>
                 </HeaderTemplate>                       
                        <ContentTemplate>
                            <table width="900px" style="width: 297px;" align="center">
                                <tr>
                                    <td align="center">
                                        <table cellpadding="4" cellspacing="4">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label7" runat="server" Text="Select Users"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlusers" runat="server" CssClass="ddlboxsmall-post" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlusers_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="--Select--"
                                                        runat="server" ErrorMessage="Select Users" ControlToValidate="ddlusers" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="u">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="val2" runat="server" TargetControlID="RequiredFieldValidator6" Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label8" runat="server" Text="Select Day"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlusersday" runat="server" CssClass="ddlboxsmall-post">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="--Select--"
                                                        runat="server" ErrorMessage="Select Day" ControlToValidate="ddlusersday" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="u">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="val3" runat="server" TargetControlID="RequiredFieldValidator7" Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label9" runat="server" Text="Select WorkType"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddluersdayttpe" runat="server" CssClass="ddlboxsmall-post">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="Working">Working</asp:ListItem>
                                                        <asp:ListItem Value="Holiday">Holiday</asp:ListItem>
                                                        <asp:ListItem Value="Leave">Leave</asp:ListItem>
                                                    </asp:DropDownList>
                                                   
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Select WorkType"
                                                        Display="None" InitialValue="0" SetFocusOnError="True" ValidationGroup="u" ControlToValidate="ddluersdayttpe">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                            ID="val4" runat="server" TargetControlID="RequiredFieldValidator8" Enabled="True">
                                                        </cc1:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label10" runat="server" Text="Time In"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <MKB:TimeSelector ID="TimeSelector1" runat="server" AmPm="PM" BorderColor="Silver"
                                                        Date="01/01/0001 13:30:00" Hour="1" Minute="30" Second="0" SelectedTimeFormat="Twelve"
                                                        Width="148px"></MKB:TimeSelector>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label11" runat="server" Text="Time Out"></asp:Label>
                                                </td>
                                                <td align="left">
                                                    <MKB:TimeSelector ID="TimeSelector2" runat="server" Width="148px" AmPm="PM" BorderColor="Silver"
                                                        Date="01/01/0001 13:30:00" Hour="1" Minute="30" Second="0" SelectedTimeFormat="Twelve"></MKB:TimeSelector>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnUsers" runat="server" OnClick="btnUsers_Click" Text="Submit" CssClass="btn" ValidationGroup="u" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="height: 20px;">
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel runat="server" ID="pnlGrid">
                    <table cellpadding="0" cellspacing="0" style="border: 1px solid silver;">
                       <%-- <tr>
                            <td align="center" class="Gridhedding">
                                <table cellpadding="0" cellspacing="0" width="924px">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="924px">
                                    <tr>
                                        <td align="right">
                                            <asp:GridView ID="gridComp" runat="server" CssClass="grid-box-bor" GridLines="None" CellPadding="4" AutoGenerateColumns="False"
                                                Width="924px" onselectedindexchanged="gridComp_SelectedIndexChanged" ShowFooter="false">
                                                <Columns>
                                                    <asp:BoundField DataField="day" HeaderText="Day"></asp:BoundField>
                                                    <asp:BoundField DataField="date" HeaderText="Date"></asp:BoundField>
                                                    <asp:BoundField DataField="WorkType" HeaderText="Work Type"></asp:BoundField>
                                                    <asp:BoundField DataField="timein" HeaderText="Time In"></asp:BoundField>
                                                    <asp:BoundField DataField="timeout" HeaderText="Time Out"></asp:BoundField>
                                                    <asp:BoundField DataField="totaltime" HeaderText="Total Time"></asp:BoundField>
                                                    <asp:BoundField DataField="rate" HeaderText="Rate/Day"></asp:BoundField>
                                                    <asp:BoundField DataField="totalrate" HeaderText="Amount($)"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" OnClick="edittime"></asp:LinkButton></ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                               <%-- <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                                <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                <AlternatingRowStyle CssClass="saltertext1" />
                                                <PagerStyle BackColor="#FCE196" ForeColor="White" HorizontalAlign="Center" />--%>                                                
                                               
                                                <EmptyDataRowStyle HorizontalAlign="Center" CssClass="errmsg"></EmptyDataRowStyle>
                                                <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="White" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#fce196" ForeColor="Black" HorizontalAlign="Center" />
                                                <RowStyle CssClass="grig-text" />
                                                <HeaderStyle CssClass="gridhead" />
                                                <AlternatingRowStyle CssClass="alternate-color" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       <%-- <tr class="Gridhedding">
                            <td align="right">
                            </td>
                        </tr>--%>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table width="924px" align="center" style="margin-top: 0px">
        <tr>
            <td align="right" style="padding-right: 10px; padding-top: 10px;">
                
            </td>
        </tr>
        <tr>
            <td style="height: 100px;">
            </td>
        </tr>
    </table>
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
