<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="SearchCategoriesMain.aspx.cs" Inherits="JS_jobcategoryandstate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 680px;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table width="100%" border="0">
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="headding">
                                Find Jobs
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px;">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="924px" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center">
                                <table class="tbl" width="924px" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td align="left" class="org-shearder-bgNew">
                                            Browse Jobs By Category
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dlJobPosting" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                                width: 924px" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <table cellpadding="4" cellspacing="2" border="0">
                                                        <tr>
                                                            <td style="width: 308px;">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encIndustry", "SearchCategories.aspx?id={0}&id1=1") %>'
                                                                    CssClass="boxhead"><%# Eval("Industry")+"("+Eval("count")+")" %></asp:HyperLink>
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
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 40px;">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <table class="tbl" width="924px" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td align="left" class="org-shearder-bgNew">
                                            Browse Jobs By State
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dlJobPosting1" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                                width: 924px" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <table cellpadding="4" cellspacing="4" border="0">
                                                        <tr>
                                                            <td style="width: 308px;">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encloc", "SearchCategories.aspx?id={0}&id1=2") %>'
                                                                    CssClass="boxhead"><%# Eval("loc")+"("+Eval("count")+")" %></asp:HyperLink>
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
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
