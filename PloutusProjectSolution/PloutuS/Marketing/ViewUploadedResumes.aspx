<%@ Page Title="View Profiles" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="ViewUploadedResumes.aspx.cs" Inherits="Marketing_Search" %>

<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/jquery-ui.min.css" type="text/css" rel="Stylesheet" />
    <link href="../StyleDate/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function pageLoad() {
            $("#<%=txtUploadDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', maxDate: '0', changeMonth: true, changeYear: true
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
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnflagV" runat="server" />
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td style="padding: 0px; padding-top: 20px; border: 0px solid white;" align="left">
                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Search JobSeeker
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
                <asp:Panel ID="pnl" runat="server">
                    <table width="100%" style="width: 100%; padding: 1px;" class="MainSearchDiv1">
                        <tr>
                            <td align="center" class="SSubDiv1">
                                <table style="width: 100%; padding: 3px; text-align: center;">
                                    <tr>
                                        <td align="center">
                                            <b>Keyword</b>
                                        </td>
                                        <td align="center">
                                            <b>Name/Email/Phone/Status</b>
                                        </td>
                                        <td>
                                            <b>Activities</b>
                                        </td>
                                        <td>
                                            <b>Industry</b>
                                        </td>
                                        <td>
                                            <b>Date</b>
                                        </td>
                                        <td>
                                            <b>Client</b>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtKeyword" runat="server" CssClass="txtbx1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNameEmailPhone" runat="server" CssClass="txtbx2"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlActivities" runat="server" CssClass="ddlbx1" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddlbx1" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUploadDate" runat="server" CssClass="txtbx3"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlClient" runat="server" CssClass="ddlbx1" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnsearch" runat="server" Text=" Search " OnClick="btnsearch_Click"
                                                CssClass="btn" />
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
    <table style="padding: 0px;" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" Visible="false">
                    <table width="100%" align="center">
                        <tr>
                            <td style="padding: 0px; padding-top: 20px;" align="left">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                            View Profiles
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
                            <td style="padding-top: 20px;" align="center">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding-right: 3px;" align="left">
                                            <asp:Label ID="Label2" runat="server" Text="Total Profiles: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                        <td style="padding-right: 3px;" align="right">
                                            <asp:Label ID="Label1" runat="server" Text="Sort By " Font-Bold="True"></asp:Label>
                                            <asp:DropDownList ID="ddlsort" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlsort_SelectedIndexChanged">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Upload Date" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Name" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Client" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table width="100%;" style="border: 1px solid silver;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                                AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text"
                                                OnInit="dljobseekerdet_Init" OnItemDataBound="dljobseekerdet_ItemDataBound" OnItemCommand="dljobseekerdet_ItemCommand">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                    <tr>
                                                                        <td align="left" class="lable" style="width: 50px; padding-left: 10px;">
                                                                            SNo
                                                                        </td>
                                                                        <td align="left" class="lable" style="width: 150px;">
                                                                            Name
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 500px;">
                                                                            Status
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 200px;">
                                                                            Client Name
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 80px;">
                                                                            Date
                                                                        </td>
                                                                        <td style="width: 20px;">
                                                                        </td>
                                                                        <td style="width: 20px;">
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
                                                                        <td align="left" class="lable" style="width: 50px; padding-left: 10px;">
                                                                            &nbsp;<asp:Label ID="sl" runat="server" Text="<%#Container.ItemIndex+1 %>"></asp:Label>
                                                                        </td>
                                                                        <td align="left" class="sgrid-headiing-black" style="width: 150px;">
                                                                            <asp:LinkButton CssClass="sgrid-headiing-Green" ID="lnkbtnName" runat="server" CommandArgument='<%#Eval("jsid")%>'
                                                                                CommandName="HpkName" Text='<%# Eval("Name")%>'></asp:LinkButton>
                                                                        </td>
                                                                        <td align="left" class="lable" style="width: 500px;">
                                                                            <%# Eval("status")%>
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 200px;">
                                                                            <%# Eval("ClientName")%>
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 80px;">
                                                                            <%# Eval("uploaddate")%>
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 20px;">
                                                                            <asp:ImageButton ID="imgView" runat="server" ImageUrl="~/icons/gif_46_040.gif" Height="15"
                                                                                Width="15" CommandArgument='<%#Eval("jsid")%>' CommandName="ViewResume" />
                                                                        </td>
                                                                        <td align="center" class="lable" style="width: 20px;">
                                                                        <asp:UpdatePanel runat="server" ID="dsfd">
                                                            <ContentTemplate>
                                                                            <asp:ImageButton ID="imgDwnld" runat="server" ImageUrl="~/icons/gif_46_028.gif" Height="15"
                                                                                Width="15" CommandArgument='<%#Eval("jsid")%>' CommandName="DwnldResume" />
                                                                                 </ContentTemplate>
                                                            <Triggers>
                                                            <asp:PostBackTrigger ControlID="imgDwnld" />
                                                            </Triggers>
                                                            </asp:UpdatePanel>
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
                                    <tr>
                                        <td align="center">
                                            <table class="gridhead" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="right">
                                                        <table cellpadding="0" border="0">
                                                            <tr class="textnormal">
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnFirst" CssClass="grdlnk" runat="server" CausesValidation="false"
                                                                        OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                                    &nbsp;
                                                                </td>
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnPrevious" CssClass="grdlnk" runat="server" CausesValidation="false"
                                                                        OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                                </td>
                                                                <td align="center" valign="middle">
                                                                    <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                                                        OnItemDataBound="dlPaging_ItemDataBound">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton CssClass="grdlnk" Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging"
                                                                                runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging"
                                                                                Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" CssClass="grdlnk" runat="server" CausesValidation="false"
                                                                        OnClick="lbtnNext_Click">Next</asp:LinkButton>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;
                                                                    <asp:LinkButton CssClass="grdlnk" ID="lbtnLast" runat="server" 
                                                                        CausesValidation="false" onclick="lbtnLast_Click">Last</asp:LinkButton>
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
            <td style="height: 40px;">
            </td>
        </tr>
        <tr>
            <td>
                <div id="x" style="display: none">
                    <asp:Panel ID="Panel1" runat="server" BackColor="White">
                        <table cellpadding="5" cellspacing="5" border="0">
                            <tr>
                                <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                    <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                        border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                Resume
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
                                <td>
                                    <div id="displayResume" runat="server" style="height: 500px; overflow: scroll; width: 550px;
                                        float: left; text-align: left; padding: 50px; padding-top: 5px;">
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
                <asp:HiddenField ID="hdn" runat="server" />
                <cc1:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
                    BackgroundCssClass="Inactive" CancelControlID="btncancel">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>
