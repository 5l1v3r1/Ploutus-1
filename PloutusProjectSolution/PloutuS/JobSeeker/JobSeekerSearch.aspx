<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="JobSeekerSearch.aspx.cs" Inherits="JobSeeker_JobSeekerSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Div1" align="left" runat="server" style="width: 100%; min-height: 630px;">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            
            <tr>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DataList ID="dlJobAlert" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="border: 1px solid silver;" width="924px">
                                <tr align="center">
                                    <td colspan="3" style="padding-right: 3px;" align="center" class="org-shearder-bgNew">
                                        JobAlert
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td style="width: 300px; padding-left: 10px;" align="left">
                                        Keywords:&nbsp;<%# Eval("Keywords") %></td>
                                    <td style="width: 300px" align="left">
                                        Experience:&nbsp;<%# Eval("YearsExp")%>&nbsp;&nbsp;To&nbsp;&nbsp;
                                        <%# Eval("MonthsExp")%>&nbsp;
                                    </td>
                                    <td align="right" style="padding-right: 10px;">
                                        Location: &nbsp;<%# Eval("Category")%></td>
                                </tr>
                                <tr style="height:25px">
                                    <td style="width: 300px; padding-left: 10px;" align="left">
                                        Category:&nbsp;<%# Eval("Category") %></td>
                                    <td style="width: 300px" align="left">
                                        Functional Area:&nbsp;<%# Eval("FunctionalArea") %></td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td style="height: 20px;">
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 100%;" colspan="3">
                    <asp:Label ID="Label8" runat="server" CssClass="headding" Text="Search Jobs"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlMain" runat="server">
                    <table width="1024px" align="center">
                        <tr>
                            <td align="center">
                                <table cellpadding="0" cellspacing="0" style="border: 1px solid silver;" width="924px">
                                    <tr>
                                        <td style="padding-right: 3px;" align="right" class="org-shearder-bgNew">
                                            <asp:Label ID="lblPageInfo" runat="server" CssClass="lbl"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dlPostedJobs" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 924px"
                                                CssClass="lable" AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                        <tr>
                                                            <td colspan="2" align="left" class=" sgrid-headiing-black" style="padding: 5px;">
                                                                <asp:Label ID="title" runat="server" Text="Title :" CssClass="sgrid-headiing-black"></asp:Label>
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("encryptid", "JobSeekerdescUser.aspx?id={0}") %>'
                                                                    CssClass="sgrid-headiing-red"> <%# Eval("JobTitle")%> </asp:HyperLink>
                                                            </td>
                                                            <td align="right" colspan="2"  style="padding: 5px;">
                                                                Location:
                                                                <%# Eval("Location")%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"  width="300" style="padding: 5px; padding-left: 20px;">
                                                                Company:
                                                                <%# Eval("CompanyName")%>
                                                            </td>
                                                            <td align="left"  style="padding: 5px; padding-left: 20px;">
                                                                Experience :
                                                                <%# Eval("exp")%>
                                                                Years
                                                            </td>
                                                            <td align="right"  style="padding: 5px;">
                                                                PostedDate :
                                                                <%# Eval("posteddate")%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table style="width: 924px;" cellpadding="0" border="0" class="Gridhedding">
                                                <tr>
                                                    <td align="right" style="width: 90%; padding-right: 1px;">
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
                            <td align="center">
                                <table width="924px">
                                    <tr>
                                        <td align="right">
                                            <asp:LinkButton ID="lnkBack" CssClass="stylink" runat="server" OnClick="lnkBack_Click">Back</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlSub" Visible="false">
                    <table cellpadding="0" cellspacing="0" width="1024px">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
