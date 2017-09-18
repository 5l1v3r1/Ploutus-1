<%@ Page Title="Hired Profiles" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="HiringProcess.aspx.cs" Inherits="Marketing_HiringProcess" %>
   <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script src="../Styles/jquery-ui.min.css" type="text/javascript"></script>
 
<link href="../CSS/jquery-ui.min.css" type="text/css" rel="Stylesheet" />
 <link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
 <script type="text/javascript">

     function pageLoad() {
         $("#<%=txtHireDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', maxDate: '0', changeMonth: true, changeYear: true
         , showButtonPanel: true
         });
     }
   
 </script>

<style type = "text/css">
.ui-datepicker { font-size:9pt !important}



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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            </td>
        </tr>
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                   Search HireProfile
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>
                
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnl" runat="server">
                    <table cellpadding="3" cellspacing="3" width="90%" class="MainSearchDiv1">
                        <tr>
                            <td align="left" class="SearchSubDiv1">
                                <table cellpadding="2" cellspacing="2" style="width: 100%">
                                    <tr>
                                        <td style="width: 20%;" align="center">
                                            <b>Name</b>
                                        </td>
                                        <td align="center" style="width: 10%;" >
                                            <b>Company</b>
                                        </td>
                                        <td style="width: 20%;" align="center">
                                            <b>HiredDate</b>
                                        </td>
                                        <td style="width: 10%;" align="center">
                                           <b>Industry</b>
                                        </td>
                                    
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="txtcomp" runat="server" Width="150px" Height="16px" CssClass="textbox"></asp:TextBox>
                                         <%--   <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtcomp"
                                                WatermarkText="Candidate name" WatermarkCssClass="Watermark">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtHireCompany" runat="server" Width="150px" Height="16px" CssClass="textbox"></asp:TextBox>
                                        </td>
                                       
                                         <td align="center">
                                            <asp:TextBox ID="txtHireDate" runat="server" Width="150px" Height="16px" CssClass="textbox"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                             <asp:DropDownList ID="ddlIndustry"  Width="150px" runat="server" CssClass="ddlc" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </td>
                                      
                                        <td align="center" style=" padding-right:100px">
                                            <asp:Button ID="btnsearch" runat="server" Width="100px" Text="Search" CssClass="btn" OnClick="btnsearch_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
                            <td style=" padding-top:20px;" align="center">
                            <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                   Selected Hired Candidate Details
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>
                               
                            </td>
                        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" Visible="false">
                    <table width="100%" align="center">
                        
                        <tr>
                            <td style=" padding-top:10px;" align="center">
                                <table cellpadding="0" cellspacing="0" width="90%">
                                    <tr>
                                      <td style="padding-right: 3px;" align="left">
                                            <asp:Label ID="Label2" runat="server" Text="Total Profiles: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                        <td style="padding-right: 3px;" align="right">
                                            <asp:Label ID="Label1" runat="server" Text="Sort By " Font-Bold="True"></asp:Label>
                                            <asp:DropDownList ID="ddlsort" runat="server" AutoPostBack="True" Width="150px" OnSelectedIndexChanged="ddlsort_SelectedIndexChanged">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Upload Date" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Name" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table width="90%" style="border: 1px solid silver;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                                AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text" >
                                                <HeaderTemplate>                       
                    
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                    <tr>
                                                                     
                                                                  
                                                                       <td colspan="2" align="center" class="lable" width="5%" style="padding: 5px;">
                                                                            Sno
                                                                        </td>
                                                                        <td colspan="2" align="center" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                            padding-left: 20px;">
                                                                            Name
                                                                        </td>
                                                                        <td colspan="2" align="center" class="lable" width="25%" style="padding: 5px;">
                                                                            Company
                                                                        </td>
                                                                          <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                           DateOfHired
                                                                        </td>
                                                                        <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                            Industry
                                                                        </td>
                                                                       <%-- <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                           AppointmentDate
                                                                        </td>
                                                                         <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                           FromDate
                                                                        </td>
                                                                        <td align="left" class="lable" width="10%" style="padding: 5px;">
                                                                            ToDate
                                                                        </td>--%>

                                                                       
                                                                    </tr>
                                                                    <tr>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                        <tr>
                                                            <td style="padding-left: 5px; padding-right: 5px;">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: s0px;">
                                                                    <tr>
                                                                     <td align="center" class="lable" width="5%" style="padding: 5px;">
                                                                            <asp:Label ID="sl" runat="server" Text="<%#Container.ItemIndex+1 %>"></asp:Label>
                                                                        </td>  
                                                                        <td colspan="2" align="center" class="sgrid-headiing-black" width="20%">
                                                                           
                                                                               <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encryptid", "SelectedHiredCandidateProfile.aspx?id={0}")%>'
                                                                               CssClass="sgrid-headiing-Green"> <%# Eval("name")%></asp:HyperLink>
                                                                            <%-- <%# Eval("Name")%>--%>
                                                                        </td>
                                                                        <td colspan="2" align="center" class="lable" width="25%">
                                                                            <%# Eval("CompanyName")%>
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" >
                                                                            <%# Eval("HiredDate", "{0:d}")%>
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" >
                                                                            <%# Eval("Industry")%>
                                                                        </td>
                                                                      <%--  <td align="center" class="lable" width="10%" >
                                                                            <%# Eval("ContractFromDate", "{0:d}")%>
                                                                         
                                                                            <asp:Label ID="lblJsID" Visible="false" runat="server" Text='<%#Eval("jsid") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="right" class="lable" width="15%" >
                                                                            <%# Eval("ContractToDate", "{0:d}")%>
                                                                        </td>--%>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table class="gridhead" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="right">
                                                        <table cellpadding="0" border="0">
                                                            <tr class="textnormal">
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnFirst" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                                    &nbsp;
                                                                </td>
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnPrevious" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                                </td>
                                                                <td align="center" valign="middle">
                                                                    <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                                                        OnItemDataBound="dlPaging_ItemDataBound">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton CssClass="grdlnk" Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging" runat="server"
                                                                                CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;&nbsp;<asp:LinkButton CssClass="grdlnk" ID="lbtnNext" runat="server" CausesValidation="false"
                                                                        OnClick="lbtnNext_Click">Next</asp:LinkButton>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="LinkButton3" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="LinkButton3_Click">Last</asp:LinkButton>
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
                        <tr><td ></td></tr>
                    </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlSub" Visible="false">
                    <table cellpadding="0" cellspacing="0" style="padding-top: 30px;" width="1024px">
                        <tr>
                            <td  align="center">
                                <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

