<%@ Page Title="" Language="C#" MasterPageFile="Site.master"
    AutoEventWireup="true" CodeFile="SearchCategories.aspx.cs" Inherits="Js_JobCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style=" min-height:680px;">
        <table width="100%" cellpadding="0" cellspacing="0">
         <tr><td style="height:20px;"></td></tr>
            <tr>
                <td align="center">
                   
                        <asp:Label ID="lblHeading" runat="server" CssClass="headding" Text="Search Jobs"></asp:Label>
                  
                </td>
            </tr>
             <tr><td style="height:20px;"></td></tr>
            <tr>
                <td align="center">
                  
                       
                        <table class="tbl" width="924px" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left" class="Subhedding">
                                    Browse Jobs By Category
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="dlJobsBycat" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                        width: 924px" RepeatColumns="3">
                                        <ItemTemplate>
                                            <table cellpadding="4" cellspacing="4" border="0">
                                                <tr>
                                                    <td style=" width:308px;">
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("EncFunArea", "SearchDetails.aspx?id={0}&id1=1") %>'
                                                            CssClass="boxhead"><%# Eval("FunctionalArea") + "(" + Eval("count") + ")"%></asp:HyperLink>
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
            <tr><td style="height:40px;"></td></tr>
            <tr>
                <td align="center">
                  
                        <table class="tbl" width="620px" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left" class="Subhedding">
                                    Browse Jobs By Location
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="dlJobsByState" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                        width: 924px" RepeatColumns="3">
                                        <ItemTemplate>
                                            <table cellpadding="4" cellspacing="4" border="0">
                                                <tr>
                                                    <td style=" width:308px;">
                                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encloc", "SearchDetails.aspx?id={0}&id1=2") %>'
                                                            CssClass="boxhead"><%# Eval("Location") + "(" + Eval("count") + ")"%></asp:HyperLink>
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
           <tr><td style=" height:20px;"></td></tr>
             <tr><td align="center"><table width="924px"><tr><td align="right">
                 <asp:LinkButton ID="lnbtnBack" runat="server" OnClientClick="history.go(-1)" onclick="lnbtnBack_Click">Back</asp:LinkButton></td></tr></table></td></tr>
             <tr><td style=" height:20px;"></td></tr>
        </table>
    </div>
</asp:Content>
