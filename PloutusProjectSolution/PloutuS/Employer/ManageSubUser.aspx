<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Employer/MerchantMaster.master"
    CodeFile="ManageSubUser.aspx.cs" Inherits="Employer_ManageSubUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td style="width: 100%; vertical-align: middle; padding-top: 50px; padding-bottom: 30px;"
                colspan="3" class="headding" align="center">
                Manage Sub-Users
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnlMain" runat="server">
        <table width="900px" cellpadding="0" cellspacing="0" style="border: 1px solid silver" align="center">
            <tr>
                <td align="center" class="Gridhedding">
                    <table  width="900px">
                        <tr>
                            <td class="Gridhedding" align="right" colspan="2">
                                <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="dljobdet" runat="server" AllowPaging="false" GridLines="None" CellPadding="4"
                        AutoGenerateColumns="False" Width="100%" PageSize="10" 
                        OnRowUpdating="dljobdet_RowUpdating" onrowcommand="dljobdet_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ContactPerson" HeaderText="User Name"></asp:BoundField>
                            <asp:BoundField DataField="Mobile" HeaderText="Phone No"></asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                            <asp:BoundField DataField="RefID" HeaderText="Reference"></asp:BoundField>
                            <asp:BoundField DataField="RegDate" HeaderText="Reg Date"></asp:BoundField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span onclick="return confirm('Are you sure You want to change status?')">
                                        <asp:LinkButton ID="lnstatus" runat="server" CommandArgument='<%#Eval("activestatus") + "," +Eval("Email")%>'  Text='<%# Eval("activestatus") %>' CommandName="Update"></asp:LinkButton>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        </Columns>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                        <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                        <AlternatingRowStyle CssClass="saltertext1" />
                        <PagerStyle BackColor="#fce196" />
                    </asp:GridView>
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
                            <td align="right" valign="middle">
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
                            <td align="right">
                                &nbsp;
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="924px" align="center" style="margin-top: 0px">
            <tr>
                <td align="right" style="padding-right: 10px; padding-top: 10px;">
                    <asp:LinkButton ID="LinkButton2" CssClass="stylink" runat="server" PostBackUrl="~/Employer/EmployerHomePage.aspx">Back</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="height: 100px;" align="center">
                    <asp:Label ID="lblCount" runat="server" Text="You Should not Activate More Than Two Users"
                        ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlSub" Visible="false">
        <table cellpadding="0" cellspacing="0" width="1024px" style="padding-top: 50px; padding-bottom: 50px;">
            <tr>
                <td align="center">
                    <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label><br />
                </td>
            </tr>
            <tr>
                <td align="right" style="padding-right: 50px;">
                    <%-- <asp:LinkButton ID="LinkButton1" CssClass="stylink" runat="server" PostBackUrl="~/Employer/EmployerHomePage.aspx">Back</asp:LinkButton>--%>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
