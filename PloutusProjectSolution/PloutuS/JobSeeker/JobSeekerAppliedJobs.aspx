<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="JobSeekerAppliedJobs.aspx.cs" Inherits="JobSeeker_JobSeekerAppliedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 680px;">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr align="center" style="height: 100px; vertical-align: middle;">
                <td style="width: 100%;" colspan="3" class="headding1">
                    <asp:Label ID="Label8" runat="server"  Text="Applied Jobs"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlMain" runat="server">
            <table align="center" style="width: 1020px" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
                        <table cellpadding="0" cellspacing="0" style="border: 1px solid silver;" width="924px">
                            <tr>
                                <td style="padding-right: 3px; height: 30px;" align="right" class="org-shearder-bgNew">
                                    <asp:Label ID="lblPageInfo" runat="server" CssClass="lbl"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="dljobdet" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 924px"
                                        CssClass="lable" AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                <tr>
                                                    <td colspan="2" align="left" class=" sgrid-headiing-black" style="padding: 5px;">
                                                        <asp:Label ID="title" runat="server" Text="Title :" CssClass="sgrid-headiing-black"></asp:Label>
                                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# Eval("id", "JobSeekerdescUser.aspx?id={0}") %>'
                                                            CssClass="sgrid-headiing-red"><%#Eval("Jobtitle") %></asp:HyperLink>
                                                    </td>
                                                    <td align="right"  style="padding: 5px;">
                                                        PostedDate :
                                                        <%# Eval("posteddate")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left"  style="padding: 5px; padding-left: 20px;">
                                                        Experience :
                                                        <%# Eval("expfrom")%>
                                                        To
                                                        <%# Eval("expto")%>Years
                                                    </td>
                                                    <td align="right" colspan="2"  style="padding: 5px;">
                                                        Location:
                                                        <%# Eval("Location")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table style="width: 924px;" class="org-shearder-bgNew">
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
                        <table style="width: 924px;">
                            <tr>
                                <td align="right" style="width: 90%; padding-right: 1px;">
                                    <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn"  OnClientClick="return history.go(-1);" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        &nbsp;
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
    </div>
    <%--<div id="Div1" align="left" runat="server" style="width: 100%; min-height: 630px;">
        <table cellpadding="0" cellspacing="0">           
            <tr>
                <td align="center" class="headding" style="padding-top: 20px; padding-bottom:30px;">
                    Applied Jobs
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" class="tblLeft" align="center">
                        <tr>
                            <td align="right" style="padding-right: 90px;">
                                <asp:Label ID="lblPageInfo" runat="server" Font-Names="Verdana" CssClass="lbl"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="div-datagrid" style="width: 100%; min-height: 150px;">
                                    <asp:DataList ID="dljobdet" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 890px"
                                        CssClass="lable" AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" border="1" style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td colspan="2" align="left" class="lbl">
                                                                    <asp:Label ID="title" runat="server" Text="Title :" CssClass="sgrid-headiing-black"></asp:Label>
                                                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" NavigateUrl='<%# Eval("id", "JobdescUser.aspx?id={0}") %>'
                                                                        CssClass="sgrid-headiing-red"><%#Eval("Jobtitle") %></asp:HyperLink>
                                                                    
                                                                </td>
                                                                <td align="right" class="lbl" style="padding: 5px;">
                                                                    PostedDate :
                                                                    <%# Eval("posteddate")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="lbl" style="width:300px; padding: 15px;">
                                                                    Experience :
                                                                    <%# Eval("expfrom")%>
                                                                    To
                                                                    <%# Eval("expto")%>Years
                                                                </td>
                                                                <td align="left" class="lbl" style="padding: 5px;">
                                                                    Location:
                                                                    <%# Eval("Location")%>
                                                                </td>
                                                                <td align="right" colspan="2" style="padding: 5px;">
                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right:90px;">
                                <table cellpadding="0" cellspacing="0">
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
                        <tr>
                            <td align="right" style="padding-right: 90px; padding-top:15px;">
                                <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn" OnClick="btnback_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>--%>
</asp:Content>
