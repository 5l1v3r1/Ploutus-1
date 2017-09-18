<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="SelectedCandidatesProfile.aspx.cs"
ValidateRequest="false" Inherits="Marketing_SelectedCandidatesProfile" %>
 <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>

 
<%--<link href="../CSS/jquery-ui.min.css" type="text/css" rel="Stylesheet" />--%>

   <script type="text/javascript">
       
        

        function pageLoad() {
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
    
  <%--  <script src="../Scripts/jquery-1.4.2.js" type="text/javascript"></script>--%>
   <script type="text/javascript" language="javascript">

    function CallHandler() {
        var id = $('#<%=hdnFielsJSID.ClientID%>').val();
         //event.stopPropagation();
        // event.preventDefault();
        //alert(id);
        $.ajax({
            url: "OpenOutlook.ashx",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: { 'jsid': id },
            responseType: "json",
            success: OnComplete,
            //error: OnFail

        });
         return true;
    }

    function OnComplete(result) {
        //alert([result.Id, result.Name, result.Email, result.Designation]);
        alert('Successfully sent mail details saved');
         return true;
    }
    function OnFail(result) {
        alert('Error occured please try again');
        return false;
    }
</script>           
  <script language="javascript" type="text/javascript">
      function validateActivity() {

          var acttype = document.getElementById('<%= ddlactvities1.ClientID %>');
          if (acttype.value == 'Select') {
              alert("Please Select Type of Activity");
              return false;
          }
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
       <table cellpadding="0" cellspacing="0" border="0" width="100%">  
   
       <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td align="center">
                            <div class="subdiv">
                                <div style="float: left; text-align: center; font-weight: 700;" class="subdiv">
                                    <asp:Label ID="lblMemInfo" runat="server" ForeColor="Red" Font-Size="14px" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
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
                        <td width="100%" valign="top" style="padding-top: 0px; padding-bottom: 0px;" align="center">
                            <table cellpadding="0" cellspacing="0" width="100%">
                             <tr>   <td width="100%" style=" padding:0px;"  colspan="3" align="left">
                                                                        <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                    Schedule Activities
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="38" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    <asp:Button ID="btnedit" runat="server" OnClick="editdetails" CausesValidation="false" CssClass="btn"
                                                                                        Text="Edit" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                <tr>
                                    <td align="left" style=" padding:0px;" width="100%">
                                        <asp:DataList ID="dlMemInfo" runat="server" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lable"
                                            AlternatingItemStyle-CssClass="gridbgwhite" Width="100%" ItemStyle-CssClass="gridbg" OnDataBinding="dlMemInfo_DataBinding"
                                            OnItemDataBound="dlMemInfo_ItemDataBound">
                                            <ItemTemplate>
                                                <table cellpadding="0" width="100%" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style=" padding:0px;" width="100%">
                                                            <table width="100%"  style="padding-bottom: 0px;" cellpadding="4" cellspacing="4">
                                                               
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
                                                                    </td>  </tr>
                                                                <tr>  <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                    Home</div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left; text-align: left; padding-left: 5px;">
                                                                                <asp:Label ID="Label2" Text='<%# Eval("homeNum")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>  </tr>
                                                                <tr>  <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                    Cell
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:DataList ID="dlInnerCell" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCell" runat="server" Text='<%# Eval("emailid1")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                    Mobile
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label1" Text='<%# Eval("mobile")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td></tr>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                    Email
                                                                                </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:DataList ID="dlInnerEmail" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("emailid1")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
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
                            <table cellpadding="0" cellspacing="0" border="0px" width="100%">
                                <tr>
                                    <td style=" padding:0px;"  align="left">
                                        <table width="100%" 
                                       cellpadding="0" cellspacing="0"  border="0">
                                            <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                View Resume
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
                                                <td style="  width:80%;">
                                                
                                                <div id="DisplayResume" runat="server" style="height: 400px; padding:20px; width:80%; background-color: White;
                                                    overflow: scroll; padding: 30px; padding-top: 5px;">
                                                </div>
                                              </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <table width="85%">
                                                        <tr>
                                                            <td style="padding-left: 10px; padding-top:20px; padding-bottom:20px;" align="left">
                                                                <asp:LinkButton ID="lnkbtnDResume" runat="server" CausesValidation="false" OnClick="lnkbtnDResume_Click">Download Resume</asp:LinkButton>
                                                            </td>
                                                            <td style="padding-right: 40px" align="center">
                                                            </td>
                                                            <td align="right">
                                                                <asp:LinkButton ID="lnkbtnUpdateResume" runat="server" ValidationGroup="none" CausesValidation="false"
                                                                    OnClick="lnkbtnUpdateResume_Click">Edit Resume</asp:LinkButton>
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
                      <%--<tr>
                                                <td >
                                                   <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             Activities
                                                            </td>
                                                            <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                <img src="../images1/sub-head-corer.jpg" width="29" height="40" />
                                                            </td>
                                                            <td width="60%" style=" float:right; text-align:right" class="mLinks" bgcolor="#FEF7E5">
                                                                                    <asp:Button ID="btnAddActivits" runat="server" Width="150px" CssClass="btnbg" OnClick="AddActivits"  CausesValidation="false"
                                                                                        Text="ADD Activities" />
                                                                                </td>
                                                        </tr>
                                                    </table>
                                                    
                                                </td>
                                            </tr>--%>
                      <%--<tr>
                        <td style="padding-top: 20px;" align="center">
                            <table width="100%">
                                <tr>
                                    <td align="center" colspan="2">
                                        <table width="100%"  cellpadding="0" cellspacing="0" border="0">
                                           
                                            <tr>
                                                <td style="padding-top: 10px; padding-bottom: 10px; padding-left:10px;" align="left">
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
                                                            <asp:BoundField DataField="notes" HeaderText="status">
                                                                <HeaderStyle HorizontalAlign="left" />
                                                                <ItemStyle HorizontalAlign="left" Width="73%" />
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
                    </tr>--%>
                      <tr>
                    <td> 
                             <div id="HiredDiv" style="display: none"  >
                    <asp:Panel ID="Panel2" runat="server" BackColor="#FEF7E5">
                       <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
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
                                            <td style="width: 220px;" align="left">
                                               Company Location
                                            </td>
                                            <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtCLocation" CssClass="txtbox-lrg1" MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 220px;" align="left" valign="top">
                                                Appointing Date
                                            </td>
                                            <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtAppntDate" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                               Contract Period FromDate
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtCntractFDate" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                               Contract Period ToDate
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtCntractTDate" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td align="left">
                                                Position 
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtPosition" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td align="left">
                                                Job Type 
                                            </td>
                                          <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtjobType" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr><td align="left">
                                               Salary
                                            </td>
                                            <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtSalary" CssClass="txtbox-lrg1"  MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
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
                                            <td align="left" colspan="3" style=" padding:0px; padding-top:20px;">
                                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn"  Visible="false" Width="99px"
                                                    CausesValidation="false" OnClick="btnSave_Click" />&nbsp;
                                                     <asp:Button ID="btnUpdateHired" runat="server" Text="Update" Visible="false" CssClass="btn" Width="99px"
                                                    CausesValidation="false" OnClick="UpdateHireData"  />
                                                &nbsp;
                                                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn" Width="99px"
                                                    CausesValidation="false"  />
                                            </td>
                                            
                                        </tr>
                                      
                                        </table>
                                      
                                        </td>
                            </tr>
                           
                           </table>
                           
                           
                                        </asp:Panel>
                                        </div>
                                      <asp:HiddenField ID="HiddenField1" runat="server" />
            
                <asp:ModalPopupExtender ID="mdPopHire" runat="server" TargetControlID="HiddenField1" PopupControlID="HiredDiv"
                    BackgroundCssClass="Inactive" CancelControlID="Button2">
                </asp:ModalPopupExtender>
                               </td>
                                          
                    </tr>
                    <tr><td style=" height:10px;"></td></tr>  
             
                      <tr>
                        <td style="padding-top: 10px;" align="right">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblstatus" runat="server"></asp:Label>
                                    </td>
                                      <td align="right">
                                        <asp:Button ID="Button1"  runat="server" CausesValidation="false" CssClass="btn" 
                                            Text="Send Mail" OnClick="btnSendMail_Click" OnClientClick="return CallHandler();"/>
                                            <asp:HiddenField ID="hdnFielsJSID" runat="server" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnHired"  runat="server" CausesValidation="false" CssClass="btn" Width="100px"
                                            Text="Hired Profile" onclick="btnHired_Click" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnReject" Visible="false" runat="server" CausesValidation="false" CssClass="btn" Width="100px"
                                            Text="Reject Profile" OnClick="btnReject_Click" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnHold" Visible="false" runat="server" CausesValidation="false" CssClass="btn" 
                                            Text="Hold Profile" OnClick="btnHold_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                      <tr>
                        <td colspan="2" align="center">
                            <table width="100%">
                                <tr>
                                    <td class="boxhead" align="right">
                                        <asp:LinkButton ID="lnkbtnBack" OnClientClick="history.go(-1);" runat="server">Back</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   
                </table>
            
                    <tr>
                        <td style="height: 100px;">
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
                                    Notes
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtNotes1"  TextMode="MultiLine" runat="server" Height="210px" Width="435px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="3">
                                <asp:Button ID="btnATvSave" runat="server" OnClientClick="return validateActivity();"
                                                        Text="Save Activity" Visible="false" CausesValidation="false" OnClick="btnSubmit_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnupdate" CausesValidation="false" Visible="false" runat="server" Text="Update"
                                        OnClick="Update" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btncancelActv" runat="server" Text="Cancel" CausesValidation="false" />
                                </td>
                            </tr>

                           </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hdn" runat="server" />
            
                <asp:ModalPopupExtender ID="mpeshow"  runat="server" TargetControlID="hdn" PopupControlID="x"
                    BackgroundCssClass="Inactive" CancelControlID="btncancelActv" >
                </asp:ModalPopupExtender>
                    </td>
        </tr>
        <tr>
            <td>
                <div id="x1" style="display:none;">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#FEF7E5">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             Edit Details
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
                                            <td align="left" style="width: 220px;">
                                                Name
                                            </td>
                                            <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtFName" CssClass="txtbox-lrg1" Width="250px" MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <span class="errmsg">&nbsp;*&nbsp;</span>
                                                <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                                    Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                                    CssClass="errmsg"></asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 220px;" align="left">
                                                Mobile Number
                                            </td>
                                            <td  colspan="3" align="left" style="padding: 0px;">
                                                <asp:Repeater ID="repContactNum" runat="server" OnItemCommand="repContactNum_ItemCommand">
                                                    <ItemTemplate>
                                                        <table  cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtCellNumber" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("cell") %>'
                                                                        CssClass="txtbox-lrg1" TabIndex="2"></asp:TextBox>
                                                                </td>
                                                                <td style=" padding:10px;">
                                                                    <asp:ImageButton ID="ImageContactNum" runat="server" ImageUrl="~/images/close.jpg"
                                                                        CausesValidation="false" CommandName="DeleteRows" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                                        CssClass="txtbox-s1" CommandName="AddRows" TabIndex="7" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 220px;" align="left" valign="top">
                                                Email
                                            </td>
                                            <td align="left" colspan="3" cellpadding="0" cellspacing="0" style="padding: 0px;">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Repeater ID="repeater1" runat="server" OnItemCommand="repeater1_ItemCommand">
                                                            <ItemTemplate>
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="txtEmail" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("email") %>'
                                                                                CssClass="txtbox-lrg1" TabIndex="7"></asp:TextBox>
                                                                        </td>
                                                                        <td style=" padding:10px;">
                                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                                                CommandName="DeleteRows" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                                                CssClass="txtbox-s1" CommandName="AddRows" TabIndex="7" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Experience
                                            </td>
                                            <td align="left" valign="middle" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlYearsExp"  Width="70px" runat="server" TabIndex="8">
                                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                    <asp:ListItem Value="13">13</asp:ListItem>
                                                    <asp:ListItem Value="14">14</asp:ListItem>
                                                    <asp:ListItem Value="15">15</asp:ListItem>
                                                    <asp:ListItem Value="16">16</asp:ListItem>
                                                    <asp:ListItem Value="17">17</asp:ListItem>
                                                    <asp:ListItem Value="18">18</asp:ListItem>
                                                    <asp:ListItem Value="19">19</asp:ListItem>
                                                    <asp:ListItem Value="20">20</asp:ListItem>
                                                    <asp:ListItem Value="21">21</asp:ListItem>
                                                    <asp:ListItem Value="22">22</asp:ListItem>
                                                    <asp:ListItem Value="23">23</asp:ListItem>
                                                    <asp:ListItem Value="24">24</asp:ListItem>
                                                    <asp:ListItem Value="25">25</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;
                                                <asp:Label ID="Label3" runat="server" Text="(Years) " CssClass="lbl"></asp:Label>
                                                <asp:DropDownList ID="ddlMonthsExp" Width="70px"  runat="server" TabIndex="9">
                                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;<asp:Label ID="Label4" runat="server" Text="(Months) " CssClass="lbl"></asp:Label>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                1<sup>st</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustries1" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                </asp:DropDownList>
                                                
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                2<sup>nd</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustries2" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                3<sup>rd</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustry3" runat="server" Height="22px" CssClass="ddlboxlrg">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                          <tr>
                                        <td align="left" valign="top">
                                              Address
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                         <asp:TextBox ID="txtAddress" TextMode="MultiLine" Height="60px"  MaxLength="80" runat="server" Text='<%# Eval("Address") %>'
                                                                                    CssClass="txtbox-lrg" TabIndex="11"></asp:TextBox>
                                                       
                                                       
                                         </td>
                                          </tr>
                                         <tr>
                                        <td align="left">
                                              State
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                         <asp:DropDownList ID="ddlstate" runat="server" Height="22px" Width="170" CssClass="ddlboxlrg">
                                         </asp:DropDownList>                                                      
                                                       
                                         </td>
                                          </tr>
                                         <tr>
                                        <td align="left">
                                              City
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                         <asp:TextBox ID="txtCity" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("City") %>'
                                                                                CssClass="txtbox-lrg1" TabIndex="7"></asp:TextBox>                                                     
                                                       
                                         </td>
                                          </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="left" colspan="3" style=" padding:0px; padding-top:20px;">
                                                <asp:Button ID="btnUpdateHd" runat="server" Text="Update" CssClass="btn" Width="99px"
                                                    CausesValidation="true" onclick="btnUpdateHd_Click"  />
                                                &nbsp;
                                                <asp:Button ID="btnCancelHd" runat="server" Text="Cancel" CssClass="btn" 
                                                    Width="99px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="Label5" runat="server" ForeColor="Green"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2" style="padding-right: 30px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td style=" height:10px;"></td></tr>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hdn1" runat="server" />
                <asp:ModalPopupExtender ID="mpedit" runat="server" TargetControlID="hdn1" PopupControlID="x1"
                    BackgroundCssClass="Inactive" CancelControlID="btnCancelHd">
                </asp:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="Div2" style="display: none;">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFFF">
                        <table style="height: 450px; width: 100%;">
                            <tr>
                                <td align="center">
                                    Resume
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; text-align:left;" align="center">
                                    <asp:TextBox ID="txtViewResume" TextMode="MultiLine" Width="700px" Height="480px"
                                        runat="server"></asp:TextBox>
                                    <asp:HtmlEditorExtender ID="htmlViewResume" TargetControlID="txtViewResume" EnableSanitization="false"
                                        runat="server">
                                    </asp:HtmlEditorExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblresumeMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px;" colspan="3" style="padding-right: 150px;" align="right">
                                    <asp:Button ID="btnUpdateResume" runat="server" CausesValidation="false" OnClick="UpdateResume"
                                        Text="Update" />&nbsp;&nbsp;
                                    <asp:Button ID="btnVRCancel" runat="server" Text="Close" />
                                </td>
                                <td align="right">
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
        </td>
        </tr>
      </table>
      

</asp:Content>

