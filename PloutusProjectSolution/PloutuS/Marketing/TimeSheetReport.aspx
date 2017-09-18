<%@ Page Title="TimeSheet Report" Language="C#" AutoEventWireup="true" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    CodeFile="TimeSheetReport.aspx.cs" Inherits="Employer_TimeSheetReport" %>
<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

 <link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function pageLoad() {
            $("#<%=txtStartDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtEndDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy',  changeMonth: true, changeYear: true
         , showButtonPanel: true
            });



          

        }
    
    </script>
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
     <%--   <tr>
            <td style="width: 100%; vertical-align: middle; padding-top: 50px; padding-bottom: 30px;"
                colspan="3" class="headding" align="center">
                TimeSheet Reports
            </td>
        </tr>--%>
           <tr>
                            <td style="padding: 0px; padding-top: 20px;" align="left">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                            TimeSheet Reports
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
            <td align="left">
                <table width="500px" style=" border:0px solid #FFC498;" style="width: 297px;" align="center">
                    <tr>
                        <td align="left" style="width: 289px">
                            <table cellpadding="4" cellspacing="4" >
                                <tr>
                                    <td width="200px" align="left">
                                        <asp:Label ID="lblcom" runat="server" Text="Select Company"></asp:Label>
                                    </td><td>:</td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlcompany" runat="server" CssClass="ddlboxbg" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="reqcom" InitialValue="--Select--" runat="server"
                                            ValidationGroup="TSR" ErrorMessage="Select Company" ControlToValidate="ddlcompany"
                                            Display="None">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="cve1"
                                                runat="server" TargetControlID="reqcom" Enabled="True">
                                            </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label6" runat="server" Text="Select Users"></asp:Label>
                                    </td><td>:</td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlCompUsers" runat="server" CssClass="ddlboxbg" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlCompUsers_SelectedIndexChanged1">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="requsers" InitialValue="--Select--" runat="server"
                                            ValidationGroup="TSR" ErrorMessage="Select Day" ControlToValidate="ddlCompUsers"
                                            Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                ID="ValidatorCalloutExtender3" runat="server" TargetControlID="requsers" Enabled="True">
                                            </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                                    </td><td>:</td>
                                    <td align="left">
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="ddlboxsmall-post"></asp:TextBox>

                                        <%--<cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate">
                                        </cc1:CalendarExtender>--%>
                                     <%--   <cc1:TextBoxWatermarkExtender ID="TBWE2" runat="server"  TargetControlID="txtStartDate"
                                            WatermarkText="--------Select Start Date--------" />--%>
                                       <%-- <asp:RequiredFieldValidator ID="reqstartdate" runat="server" ErrorMessage="Select StartDate"
                                            ControlToValidate="txtStartDate" Display="None" SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="reqstartdate">
                                        </cc1:ValidatorCalloutExtender>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
                                    </td><td>:</td>
                                    <td align="left">
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="ddlboxsmall-post"></asp:TextBox>
                                       
                                       <%-- <cc1:TextBoxWatermarkExtender ID="Textboxwatermarkextender1" runat="server" TargetControlID="txtEndDate"
                                            WatermarkText="--------Select End Date--------" />--%>
                                        <%--<cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate">
                                        </cc1:CalendarExtender>--%>
                                       <%-- <asp:RequiredFieldValidator ID="reqEnddate" runat="server" ErrorMessage="Select End Date"
                                            ControlToValidate="txtEndDate" Display="None" SetFocusOnError="True" ValidationGroup="TSR">*</asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="reqEnddate">
                                        </cc1:ValidatorCalloutExtender>--%>
                                    </td>
                                </tr>
                                <tr>
                                   <td align="left">
                                    <asp:CompareValidator ID="cmpVal1" ControlToCompare="txtStartDate" ControlToValidate="txtEndDate" Type="Date" Operator="GreaterThanEqual" ForeColor="Red" ErrorMessage="EndDate should be greater than (or) equal to  StartDate" runat="server"></asp:CompareValidator>
                                   
                                   </td>
                                    <td colspan="3" align="center" style="padding-left:100px;">
                                        <asp:Button ID="btnComp" runat="server" Text="Submit" ValidationGroup="company" 
                                            OnClick="btnComp_Click" CssClass="btn" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="100%">
    <tr><td style=" height:20px;"></td></tr>
        <tr>
            <td align="center">
                <asp:Panel runat="server" Visible="false" ID="pnlGrid">
                 <table cellpadding="0" style=" width:924px; " cellspacing="0">
                   <%-- <tr> <td class="headding" style=" font-size:small; padding-top:0px;" align="left">
                Working Report
            </td></tr> --%>
             <tr>
                            <td style="padding: 0px; padding-top: 20px;" align="left">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                            Working Report
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
             <tr><td style=" height:5px;"></td></tr></table>
                    <table cellpadding="0" style=" border:1px solid silver" cellspacing="0">
                    
          
                      <%--  <tr>
                            <td  align="center" class="Gridhedding">
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
                            <td >
                                <table cellpadding="0" cellspacing="0" width="924px">
                                    <tr>
                                        <td align="right">
                                            <asp:GridView ID="gvReports" runat="server" GridLines="None" CellPadding="4" AutoGenerateColumns="True"
                                                Width="100%"   >
                                                <%--<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                                <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                <AlternatingRowStyle CssClass="alternate-color" />
                                                <PagerStyle BackColor="#fce196" />
                                                <FooterStyle CssClass="saltertext1" />--%>

                                                <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="black" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle CssClass="gridhead" />
                            <RowStyle CssClass="grig-text" />
                            <HeaderStyle CssClass="gridhead" />
                            <AlternatingRowStyle CssClass="alternate-color" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="Gridhedding">
                            <td align="left">
                            <table cellpadding="0" width="100%" cellspacing="0"><tr> <td style=" padding-left:10px;" align="left"> Total no of   : <asp:Label ID="lblTotalhr" runat="server" ></asp:Label></td>
                           <td style=" padding-right:50px;" align="right">Total Amount($)  : <asp:Label ID="lblTotAmount" runat="server" ></asp:Label></td></tr></table>
                           </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table width="924px" align="center" style="margin-top: 0px">
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnImport" runat="server" Text="Import" 
                            OnClick="btnImport_Click1" Visible="False" CssClass="btn" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnImport" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-right: 10px; padding-top: 10px;">
                
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
