<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="SelectedHiredCandidateProfile.aspx.cs" Inherits="Marketing_SelectedHiredCandidateProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function pageLoad() {
            $("#<%=txtApnmtDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtFromDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtToDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtAppntDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtCntractFDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

            $("#<%=txtCntractTDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', minDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
            });

        }
    
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=btnUpdate.ClientID %>').click(function () {
                var salary = $('#<%=ddlSalaryType.ClientID %>').val();
                if (salary == "") {
                    alert("Please select Salary Type");
                    return false;
                }
                if (salary == "--Select--") {
                    alert("Please select a Salary Type");
                    return false;
                }
            });
        });
    </script>
    <style type="text/css">
        .ui-datepicker
        {
            font-size: 9pt !important;
        }
        
        
        
        .ui-datepicker
        {
            font-size: 11.5pt;
        }
        .ui-widget-content .ui-icon
        {
            background-image: url(../images2/ui-icons_222222_256x240.png);
        }
        .ui-widget-header .ui-icon
        {
            background-image: url(../images2/ui-icons_222222_256x240.png);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <%--<div id="HiredDiv" style="display: none"  >--%>
                            <%-- <asp:Panel ID="Panel2" runat="server" BackColor="#E6E6EF">--%>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                        <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                            border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                    Hire Candidate Details
                                                </td>
                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="38" />
                                                </td>
                                                <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnEdit" CssClass="btn" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnUpdate" CssClass="btn" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" />
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnResume" runat="server" Text="ViewResume" CssClass="btn" onclick="btnResume_Click" />
                                                       
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 50px; padding-right: 50px;">
                                        <table cellspacing="5" cellpadding="5" style="width: 700px;" border="0">
                                            <tr>
                                                <td style="width: 220px;" align="left">
                                                    Name
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtName" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 220px;" align="left">
                                                    Company Name
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtCName" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td style="width: 220px;" align="left">
                                                    Company Location
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtLocation" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 220px;" align="left" valign="top">
                                                    Appointing Date
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtApnmtDate" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Contract Period FromDate
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtFromDate" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Contract Period ToDate
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtToDate" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Position
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtPosition" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                        <td align="left">
                                                Job Type 
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtjobType"   MaxLength="100" runat="server"
                                                    Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                            <tr>
                                                <td align="left">
                                                    Salary
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:TextBox ID="txtSalary" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Salary Type
                                                </td>
                                                <td align="left" style="width: 260px; padding: 0px;">
                                                    <asp:DropDownList ID="ddlSalaryType" runat="server" CssClass="ddlbox1" Enabled="false"
                                                        Height="25px" Width="176px">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                        <asp:ListItem>Day</asp:ListItem>
                                                        <asp:ListItem>Hours</asp:ListItem>
                                                        <asp:ListItem>Month</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td align="left" colspan="3" style="padding: 0px; padding-top: 20px;">
                                                  
                                                </td>
                                                <div id="msg">
                                                </div>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                        <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                            border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="10%" valign="middle" bgcolor="#FFC498" class="headding">
                                                    Activities
                                                </td>
                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                </td>
                                                
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px;" align="left">
                                        <table width="100%">
                                            <tr>
                                                <td align="center" colspan="1">
                                                    <table width="90%" style="border: 1px solid silver;" cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                            <td style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;" align="left">
                                                                <asp:GridView ID="grdActivities" GridLines="None" Width="100%" runat="server" AutoGenerateColumns="False"
                                                                    EmptyDataText="No activities yet">
                                                                    <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <HeaderTemplate>
                                                                                Sno.
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="typeofact" HeaderText="Activity">
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="notes" HeaderText="Status">
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="73%" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="insertdt" HeaderText="CreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" Text="Edit"
                                                                                    OnClick="edit"></asp:LinkButton></ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkView" runat="server" CausesValidation="false" Text="View"
                                                                                    OnClick="view"></asp:LinkButton></ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataRowStyle HorizontalAlign="Center" CssClass="errmsg"></EmptyDataRowStyle>
                                                                    <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="White" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle HorizontalAlign="Center" CssClass="grig-text" />
                                                                    <HeaderStyle HorizontalAlign="Center" CssClass="gridhead" />
                                                                    <AlternatingRowStyle CssClass="alternate-color" />
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
                                  <%--  <td width="100%" style="padding: 0px;" colspan="3" align="left">--%>
                                      <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                        <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                            border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="10%" valign="middle" bgcolor="#FFC498" class="headding">
                                                    Hired Profiles
                                                </td>
                                                <td width="31%" align="left" valign="bottom" style="padding: 0px;" bgcolor="#FEF7E5">
                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                </td>
                                                <%--<td width="60%" style=" float:right; text-align:right" class="mLinks" bgcolor="#FEF7E5">
                                                                                    <asp:Button ID="btnAdHirData" runat="server" Width="150px" CssClass="btnbg" OnClick="AdHirData" CausesValidation="false"
                                                                                        Text="ADDHiredProfiles" />
                                                                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                <td style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px;" align="left">
                                        <table width="100%">
                                        <tr>
                                <td align="center" colspan="1">
                                                    <table width="90%" style="border: 1px solid silver;" cellpadding="0" cellspacing="0" border="0" >
                                                       <tr>
                                    <td style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;" align="left">
                                        <asp:GridView ID="grvHiredata" GridLines="None" Width="100%" runat="server" AutoGenerateColumns="False"
                                            EmptyDataText="No activities yet">
                                            <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Sno.
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="1%" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="AppointingDate" HeaderText="AppointingDate">
                                                    <HeaderStyle HorizontalAlign="left" />
                                                    <ItemStyle HorizontalAlign="left" Width="8%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Position" HeaderText="Position">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Salary" HeaderText="Salary">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEditHierData" runat="server" CausesValidation="false" Text="Edit"
                                                            OnClick="EditHiredData"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkViewHierData" runat="server" CausesValidation="false" Text="View"
                                                            OnClick="ViewHierData"></asp:LinkButton></ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataRowStyle HorizontalAlign="Center" CssClass="errmsg"></EmptyDataRowStyle>
                                            <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="White" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" CssClass="grig-text" />
                                            <HeaderStyle HorizontalAlign="Center" CssClass="gridhead" />
                                            <AlternatingRowStyle CssClass="alternate-color" />
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
                                    <td>
                                        <div id="x" style="display: none">
                                            <asp:Panel ID="pnl" runat="server" BackColor="#FEF7E5">
                                                <table cellpadding="5" cellspacing="5" border="0">

                                                 <tr>
                                                <td colspan="3">
                                                <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             <asp:Label ID="lblActivityTitle" Text=" " runat="server"></asp:Label>
                                                              
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
                                                        <td >
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
                                                        <td  valign="top" align="left">
                                                            Notes
                                                        </td>
                                                        <td valign="top" align="center">
                                                            :
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtNotes1" TextMode="MultiLine" runat="server" Height="210px" Width="435px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="3">
                                                            <asp:Button ID="btnATvSave" runat="server" OnClientClick="return validateActivity();"
                                                                Text="Save Activity" Visible="false" CausesValidation="false" OnClick="btnSubmit_Click" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="Button1" CausesValidation="false" Visible="false" runat="server"
                                                                Text="Update" OnClick="Update" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btncancelActv" runat="server" Text="Cancel" CausesValidation="false" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </div>
                                        <asp:HiddenField ID="hdn" runat="server" />
                                        <asp:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
                                            BackgroundCssClass="Inactive" CancelControlID="btncancelActv">
                                        </asp:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="HiredDiv" style="display: none">
                                            <asp:Panel ID="Panel2" runat="server" BackColor="#FEF7E5">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                                            <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                                                border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                        Hire Details
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
                                                        <td style="padding-left: 50px; padding-right: 50px;">
                                                            <table cellspacing="5" cellpadding="5" style="width: 700px;" border="0">
                                                                <tr>
                                                                    <td style="width: 220px;" align="left">
                                                                        Company Name
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="txtCompanyName" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                                            TabIndex="1"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 220px;" align="left" valign="top">
                                                                        Appointing Date
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="txtAppntDate" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                                            TabIndex="1"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        Contract Period FromDate
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="txtCntractFDate" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                                            TabIndex="1"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        Contract Period ToDate
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="txtCntractTDate" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                                            TabIndex="1"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        Position
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="TextBox1" CssClass="txtbox-lrg1" MaxLength="100" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                        <td align="left">
                                                Job Type 
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtgjtype" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>


                                                                <tr>
                                                                    <td align="left">
                                                                        Salary
                                                                    </td>
                                                                    <td align="left" style="width: 260px; padding: 0px;">
                                                                        <asp:TextBox ID="TextBox2" CssClass="txtbox-lrg1" MaxLength="100" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        Salary Type
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:DropDownList ID="ddlSalType" runat="server" Width="152px">
                                                                            <asp:ListItem Value="-1">-----Select---</asp:ListItem>
                                                                            <asp:ListItem Value="0">Day</asp:ListItem>
                                                                            <asp:ListItem Value="1">Hours</asp:ListItem>
                                                                            <asp:ListItem Value="2">Month</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" colspan="3" style="padding: 0px; padding-top: 20px;">
                                                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" Visible="false"
                                                                            Width="99px" CausesValidation="false" OnClick="btnSave_Click" />&nbsp;
                                                                        <asp:Button ID="btnUpdateHired" runat="server" Text="Update" Visible="false" CssClass="btn"
                                                                            Width="99px" CausesValidation="false" OnClick="UpdateHireData" />
                                                                        &nbsp;
                                                                        <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn" Width="99px"
                                                                            CausesValidation="false" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <tr>
                                                    <td style="height: 10px;">
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                        </div>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:ModalPopupExtender ID="mdPopHire" runat="server" TargetControlID="HiddenField1"
                                            PopupControlID="HiredDiv" BackgroundCssClass="Inactive" CancelControlID="Button2">
                                        </asp:ModalPopupExtender>
                                    </td>
                                </tr>
                            </table>
                            <tr>
                                <td style="height: 10px;">
                                </td>
                            </tr>
                            <%--</asp:Panel>
                                        </div>--%>
                        </td>
                    </tr>
                        <tr>
            <td>
                <div id="y" style="display: none">
                    <asp:Panel ID="Panel1" runat="server" BackColor="White">
                        <table cellpadding="5" cellspacing="5" border="0">
                            <tr>
                                <td>
                                    <div id="displayResume" runat="server" style="height: 500px; overflow: scroll; width: 550px; float:left; text-align:left;
                                        padding: 50px; padding-top: 5px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btncancel" runat="server" Text="Close" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hdnResume" runat="server" />
                <asp:ModalPopupExtender ID="mpeshowResume" runat="server" TargetControlID="hdnResume" PopupControlID="y"
                    BackgroundCssClass="Inactive" CancelControlID="btncancel">
                </asp:ModalPopupExtender>
            </td>
        </tr>
                </table>
            </td>
        </tr>
        </table>
</asp:Content>
