<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="ViewLogs.aspx.cs" Inherits="Marketing_ViewLogs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
   <%-- <script type="text/javascript">

        function pageLoad() {
            $("#<%=txtFromDate.ClientID %>").datepicker({
                dateFormat: 'mm/dd/yy', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtToDate.ClientID %>").datepicker({
                dateFormat: 'mm/dd/yy', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });
        }--%>

    </script>
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td>
                <table width="100%" border="0" style="border-bottom: 1px solid #FFC498; padding: 0px;"
                    cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">Search Logs
                        </td>
                        <td width="31%" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="35" alt="" />
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%;">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 80%; text-align: left;">
                    <tr>
                        <td style="padding-left: 10px; width: 134px;">Select Email ID:
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                            <asp:DropDownList ID="ddlEmailID" runat="server" CssClass="ddlbox1" Style="width: 182px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">Select From Date
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="txtbox"></asp:TextBox>
                        <%--  <asp:TextBox ID="txtFromDate" runat="server" CssClass="ddlboxsmall-post"></asp:TextBox>--%>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFromDate">
                                        </cc1:CalendarExtender>
                                       
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ErrorMessage="Select  from Date" ControlToValidate="txtFromDate" Display="None" 
                                            SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2"></cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">Select To Date
                        </td>
                        <td style="padding-left: 12px; width: 600px;">
                        <%--    <asp:TextBox ID="txtToDate" runat="server" CssClass="txtbox"></asp:TextBox>--%>

                            <asp:TextBox ID="txtToDate" runat="server" CssClass="txtbox"></asp:TextBox>
                                        
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtToDate">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ErrorMessage="Select To Date" ControlToValidate="txtToDate" Display="None" 
                                            SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                             <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3"></cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <asp:CompareValidator ID="cmpVal1" ControlToCompare="txtFromDate" ControlToValidate="txtToDate" Type="Date" Operator="GreaterThanEqual"
                                ForeColor="Red" ErrorMessage="ToDate should be greater than (or) equal to  FromDate" runat="server"></asp:CompareValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td align="left" class="auto-style1">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="company"
                                CssClass="btn" OnClick="btnSubmit_Click" />
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
    <table style="padding: 0px;" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" Visible="true">



                    <tr>
                        <td align="center" style="width: 100%;">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 70%; text-align: left;">
                                <tr>
                                    <td align="center">
                                        <asp:DataList ID="gvReports" runat="server" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                            AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                <tr>
                                                                    <td align="left" class="lable" style="width: 25%; padding-left: 10px;">EmailID
                                                                    </td>
                                                                    <td align="left" class="lable" style="width: 25%;">Login Time
                                                                    </td>
                                                                    <td align="left" class="lable" style="width: 25%">LogOut Time
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td>

                                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: 0px;">
                                                                <tr>


                                                                    <td  class="lable" style="width: 25%; padding-left: 10px;text-align:left;">
                                                                        <%# Eval("EmailId")%>
                                                                    </td>
                                                                    <td  class="lable" style="width: 25%;text-align:left;">
                                                                        <%# Eval("LoginTime")%>
                                                                    </td>
                                                                    <td  class="lable" style="width:25%; text-align:left;">
                                                                        <%# Eval("LogoutTime")%>
                                                                    </td>
                                                        </td>
                                                    </tr>
                                                </table>


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
                  
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlSub" Visible="false">
                    <table cellpadding="0" cellspacing="0" style="padding-top: 30px;" width="90%">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 40px;"></td>
        </tr>

    </table>


</asp:Content>

