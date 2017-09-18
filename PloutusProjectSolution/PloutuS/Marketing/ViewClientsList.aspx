<%@ Page Title="View Clients List" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="ViewClientsList.aspx.cs" Inherits="Marketing_ViewClientsList" %>

<%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<table width="1024" height="700">
        <tr>
            <td align="center" valign="middle">
                <img src="images/page-under-construction.jpg" alt="" />
            </td>
        </tr>
    </table>--%>
    <%--<table cellpadding="0" cellspacing="0" style="width: 100%;">      
     <tr align="center" style="height:30px;">
            <td style="width: 100%;" colspan="3">
               
            </td>
        </tr>  
        <tr align="center" style="height: 50px;">
            <td style="width: 100%;" colspan="3">
                <b>
                   </b>
            </td>
        </tr>
    </table>--%>
    <asp:Panel ID="pnlMain" runat="server">
        <table align="center" style="width: 100%;">
            <tr>
                <td align="center" style="padding-top: 13px;">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="border-color: #FEF7E5">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                            Search Clients
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
                                <table width="90%" class="MainSearchDiv1">
                                    <tr>
                                        <td align="center" width="100%" class="SearchSubDiv1">
                                            <table cellpadding="5" cellspacing="5" align="center">
                                                <tr>
                                                    <td align="right">
                                                        <b>Company Name</b>
                                                    </td>
                                                    <td align="right">
                                                        <asp:DropDownList ID="ddlindustry" Width="160px" runat="server" Height="26px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="right">
                                                        <b>Company Location</b>
                                                    </td>
                                                    <td align="right">
                                                        <asp:DropDownList ID="ddlstate" runat="server" Height="26px" Width="160px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnsearch" runat="server" Width="100px" Text="Search" OnClick="btnsearch_Click"
                                                            CssClass="btn" />
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
                <td align="center" style="border-color: #FEF7E5; padding-top: 20px;">
                    <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                        border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                View Clients
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
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl" runat="server">
        <table align="center" style="width: 90%;">
            <tr>
                <td align="right">
                    <table cellpadding="0" cellspacing="0" width="1024px">
                        <tr>
                            <td align="right">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Sort By :"></asp:Label>
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dddlsort" Height="26px" Width="160px" runat="server"
                                                AutoPostBack="True" OnSelectedIndexChanged="dddlsort_SelectedIndexChanged">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Company Name" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Registration date" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid silver;">
                        <tr>
                            <td class="gridhead" align="right">
                                <%--   <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:DataList ID="dlMerchantList" runat="server" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Width="100%"
                                    AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                    <ItemTemplate>
                                        <table cellpadding="3" cellspacing="3" style="width: 100%;">
                                            <tr>
                                                <td style="padding-left: 30px; padding-right: 30px">
                                                    <table cellpadding="5" class="gridtbl" cellspacing="5" border="0" style="width: 100%;">
                                                        <tr>
                                                            <td colspan="2" align="left" class="sgrid-headiing-black" width="70%" style="padding: 5px;">
                                                                Company Name :
                                                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="sgrid-headiing-red" NavigateUrl='<%# Eval("encryptid", "MerchantCompleteInfo.aspx?id={0}") %>'><%# Eval("CompanyName")%></asp:HyperLink>
                                                            </td>
                                                            <td align="right" class="lable" style="padding: 5px;">
                                                                Phone :
                                                                <%# Eval("ContactNo")%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="lable" width="35%" style="padding: 5px;">
                                                                Email :
                                                                <%# Eval("email")%>
                                                            </td>
                                                            <td align="left" width="35%" class="lable" style="padding: 5px;">
                                                                Contact Person :
                                                                <%#Eval("name") %>
                                                            </td>
                                                            <td align="right" colspan="2" class="lable" style="padding: 0px; padding-right: 0px">
                                                                Location :
                                                                <%# Eval("location")%>
                                                            </td>
                                                            <%-- <td align="right" class="lable" style="padding: 5px;">
                                                        <asp:HyperLink ID="HyperLink2" runat="server" CssClass="boxhead" NavigateUrl='<%# Eval("encryptid", "MerchantCompleteInfo.aspx?id={0}") %>'>View</asp:HyperLink>
                                                    </td>--%>
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
                            <td class="gridhead" align="right">
                                <table style="width: 924px">
                                    <tr>
                                        <td align="right">
                                            <table cellpadding="0" border="0">
                                                <tr class="textnormal">
                                                    <td align="right">
                                                        <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                        &nbsp;
                                                    </td>
                                                    <td align="right">
                                                        <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                    </td>
                                                    <td align="center" valign="middle">
                                                        <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                                            OnItemDataBound="dlPaging_ItemDataBound">
                                                            <ItemTemplate>
                                                                <asp:LinkButton Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging" runat="server"
                                                                    CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false"
                                                            OnClick="lbtnNext_Click">Next</asp:LinkButton>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;
                                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
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
                <td align="center">
                </td>
            </tr>
            <tr>
                <td align="right">
                    <table style="width: 1000px">
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="lnkBack" CssClass="boxhead" runat="server" OnClick="lnkBack_Click">Back</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlSub" Visible="false">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="padding-top: 15px;" align="center">
                    <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table>
        <tr>
            <td style="height: 100px;">
            </td>
        </tr>
    </table>
</asp:Content>
