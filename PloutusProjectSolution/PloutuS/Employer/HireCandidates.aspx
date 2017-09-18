<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Employer/MerchantMaster.master"
    CodeFile="HireCandidates.aspx.cs" Inherits="Employer_HireCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updatehired" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="width: 100%; height: 50px; vertical-align: middle; padding-top: 50px;
                        padding-bottom: 30px;" colspan="3" class="headding" align="center">
                        Applied Candidates
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlMain" runat="server">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 1024px;">
                    <tr>
                        <td valign="top" style="padding-left: 50px; padding-right: 50px" align="right">
                            <table>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label2" runat="server" Text="Sort By " CssClass="sgrid-headiing-black"></asp:Label>
                                        <asp:DropDownList ID="dddlsort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dddlsort_SelectedIndexChanged">
                                            <asp:ListItem Text="-----Select-----" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Candidate Name" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Posted Date" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Category" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="padding-left: 50px; padding-right: 50px" align="left">
                            <table width="900px" style="border: 1px solid silver" align="center" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td align="center" valign="top" class="Gridhedding">
                                        <table width="900px">
                                            <tr>
                                                <td align="right" colspan="2" valign="top">
                                                    <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:DataList ID="dljobdet" runat="server" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 900px"
                                            AlternatingItemStyle-CssClass="saltertext1" ItemStyle-CssClass="saltertext">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0" style="width: 900px;">
                                                    <tr>
                                                        <td>
                                                            <table border="0" class="gridtbl" cellpadding="0" cellspacing="0" style="width: 900px;">
                                                                <tr>
                                                                    <td align="left" class="sgrid-headiing-black" width="300px" style="padding: 10px;">
                                                                        Candidate:
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="sgrid-headiing-red" NavigateUrl='<%# Eval("id", "ViewCandidates.aspx?id={0}") %>'> <%# Eval("candidate")%></asp:HyperLink>
                                                                    </td>
                                                                    <td align="right" class="lbl" colspan="2" style="padding: 10px">
                                                                        Applied Position :
                                                                        <%# Eval("position")%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="lbl" style="padding: 10px" width="300px">
                                                                        Experience :
                                                                        <%# Eval("Exp")%>
                                                                        Years
                                                                    </td>
                                                                    <td class="lbl" style="padding: 10px; padding-left: 20px">
                                                                        Category :
                                                                        <%# Eval("Industry")%>
                                                                    </td>
                                                                    <td class="lbl" align="right" style="padding: 10px">
                                                                        Posted Date :
                                                                        <%# Eval("Selectdt")%>
                                                                    </td>
                                                                </tr>
                                                        </td>
                                                    </tr>
                                                </table>
                                                </td> </tr> </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr class="Gridhedding">
                                    <td align="right">
                                        <table cellpadding="0" border="0" cellspacing="0">
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
                <table width="924px" align="center" style="margin-top: 0px">
                    <tr>
                        <td align="right" style="padding-right: 10px; padding-top: 10px;">
                            <asp:LinkButton ID="LinkButton2" CssClass="stylink" runat="server" OnClick="lnkBack2_Click">Back</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 100px;">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlSub" Visible="false">
                <table cellpadding="0" cellspacing="0" width="1024px" style="padding-top: 50px; padding-bottom: 50px;">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right: 50px;">
                            <%--<asp:LinkButton ID="LinkButton1" CssClass="stylink" runat="server" OnClick="lnkBack2_Click">Back</asp:LinkButton>--%>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
