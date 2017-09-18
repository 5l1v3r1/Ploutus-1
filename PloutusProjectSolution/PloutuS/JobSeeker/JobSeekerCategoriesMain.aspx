<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="JobSeekerCategoriesMain.aspx.cs" Inherits="JS_jobcategoryandstate" %>

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
                            <td align="center" class="headding1">
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
                                <table class="tbl" width="924px;" style="border-color:#FEF7E5" cellpadding="0" cellspacing="0" border="0">
                                   
                                      <tr>
            <td style="padding:0px;padding-top: 20px;" align="left">
                <table width="100%" border="0" align="left" style="border-bottom: 1px solid #FFC498;
                    padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Browse Jobs By Category
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
                                            <asp:DataList ID="dlJobPosting" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                                width: 924px;border-color:#FEF7E5" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <table cellpadding="4" cellspacing="2" border="0">
                                                        <tr>
                                                            <td style="width: 308px;">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encIndustry", "JobSeekerCategories.aspx?id={0}&id1=1") %>'
                                                                    CssClass="boxhead"><%# Eval("Industry") + "(" + Eval("count") + ")"%></asp:HyperLink>
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
                                <table class="tbl" width="924px" style="border-color:#FEF7E5" cellpadding="0" cellspacing="0" border="0">
                                    <%--<tr>
                                        <td align="left" class="Subhedding">
                                            Browse Jobs By State
                                        </td>
                                    </tr>--%>
                                       <tr>
            <td style="padding:0px;padding-top: 20px;" align="left">
                <table width="100%" border="0" align="left" style="border-bottom: 1px solid #FFC498;
                    padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                             Browse Jobs By State
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
                                            <asp:DataList ID="dlJobPosting1" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                                                width: 924px" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <table cellpadding="4" cellspacing="4" border="0">
                                                        <tr>
                                                            <td style="width: 308px;">
                                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("EncLoc", "JobSeekerCategories.aspx?id={0}&id1=2") %>'
                                                                    CssClass="boxhead"><%# Eval("loc") + "(" + Eval("count") + ")"%></asp:HyperLink>
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
