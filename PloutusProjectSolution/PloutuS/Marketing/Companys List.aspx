<%@ Page Title="Companys list" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="Companys List.aspx.cs" Inherits="Marketing_Companys_List" %>
     <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="padding: 0px;" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server">
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
                            <td align="center">
                                <asp:Panel ID="pnl" runat="server">
                                    <table cellpadding="2" cellspacing="2" width="90%" class="MainSearchDiv1">
                                        <tr>
                                            <td align="left" class="SearchSubDiv1">
                                                <table  cellpadding="10" cellspacing="10" style="width:1000px">
                                                    <tr>
                                                        <td align="center">
                                                            <b>Company Name</b>
                                                        </td>
                                                        <td align="center">
                                                            <asp:DropDownList ID="ddlindustry" Width="160px" runat="server" Height="22px" CssClass="ddlc">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td  align="center">
                                                            <b>Company Location</b>
                                                        </td>
                                                        <td align="center">
                                                            <asp:DropDownList ID="ddlstate" runat="server" Height="22px" Width="160px" CssClass="ddlc">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Button ID="btnsearch" runat="server" Width="100px" Text="Search" OnClick="btnsearch_Click"
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
                         <tr>
                            <td style=" padding-top:20px;" align="center">
                            <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                   Selected Company Details
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
                            <td style="padding-top: 20px;" align="center">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding-left: 70px;" align="left">
                                            <asp:Label ID="Label2" runat="server" Text="Total Number Of Companys: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblCount" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px;" align="left">
                                            <table width="100%">
                                                <tr>
                                                    <td align="center" colspan="1">
                                                        <table width="90%" style="border: 1px solid silver;" cellpadding="0" cellspacing="0"
                                                            border="0">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:DataList ID="dlCompanys" runat="server" Font-Bold="False" Font-Italic="False"
                                                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                                                        AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text">
                                                                        <HeaderTemplate>
                                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td>
                                                                                        <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                                            <tr>
                                                                                                <td align="center" class="lable" width="3%" style="padding: 5px;">
                                                                                                    S.no
                                                                                                </td>
                                                                                                <td colspan="2" align="center" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                                                    padding-left: 20px;">
                                                                                                    CompanyName
                                                                                                </td>
                                                                                                <td colspan="2" align="center" class="lable" width="25%" style="padding: 5px;">
                                                                                                    CompanyLocation
                                                                                                </td>
                                                                                                <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                                                    Employess
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                                <tr>
                                                                                    <td style="padding-left: 5px; padding-right: 5px;">
                                                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: 0px;">
                                                                                            <tr>
                                                                                                <td align="center" class="lable" width="3%" style="padding: 5px;">
                                                                                                    <asp:Label ID="sl" runat="server" Text="<%#Container.ItemIndex+1 %>"></asp:Label>
                                                                                                </td>
                                                                                                <td colspan="2" align="center" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                                                    padding-left: 40px;">
                                                                                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="sgrid-headiing-Green" NavigateUrl='<%# Eval("encryptid", "CompanyEmployesDetails.aspx?companyname={0}") %>'> <%# Eval("CompanyName")%></asp:HyperLink>
                                                                                                </td>
                                                                                                <td colspan="2" align="center" class="lable" width="25%">
                                                                                                    <%# Eval("Location")%>
                                                                                                </td>
                                                                                                <td align="center" class="lable" width="15%">
                                                                                                    <%# Eval("Employess")%>
                                                                                                </td>
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
                                            </table>
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
</asp:Content>
