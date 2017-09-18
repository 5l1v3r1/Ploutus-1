<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="FindJob.aspx.cs" Inherits="FindJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="vertical-align: top; text-align: left; float: left;">
        <div style="vertical-align: top;">
            <asp:Image ID="imgFindJob" Width="1024" runat="server" ImageUrl="~/images/findjob.JPG" />
        </div>
        <div style="font-weight: 700; font-size: medium; font-family: Verdana; padding-left: 40px;">
            Find A Job</div>
        <div style="font-weight: 700; font-size: small; font-family: Verdana; padding-left: 40px;">
        </div>
        <div style="font-weight: 700; font-size: small; font-family: Verdana; padding-left: 40px;">
            <asp:DataList ID="tbljobdet" runat="server" Font-Bold="False" Font-Italic="False"
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                width: 100%" RepeatColumns="2">
                <HeaderTemplate>
                    <h4>
                        Browse Jobs By Category</h4>
                </HeaderTemplate>
                <ItemTemplate>
                    <table cellpadding="4" cellspacing="4" border="0">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkJob" runat="server" NavigateUrl='<%# Eval("Jobtitl") %>' Text='<%# Eval("Jobtitl")+"("+Eval("count")+")" %>'
                                    PostBackUrl='<%#"~/refine.aspx?value="+Eval("Jobtitl") %>'></asp:LinkButton></li>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList></div>
        <div style="font-weight: 700; font-size: small; font-family: Verdana; padding-left: 40px;">
            <asp:DataList ID="tbljobdet1" runat="server" Font-Bold="False" Font-Italic="False"
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="text-align: justify;
                width: 100%" RepeatColumns="2">
                <HeaderTemplate>
                    <h4>
                        Browse Jobs By State</h4>
                </HeaderTemplate>
                <ItemTemplate>
                    <table cellpadding="4" cellspacing="4" border="0">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkJob" runat="server"  PostBackUrl='<%#"~/refine.aspx?value="+Eval("loc") %>' NavigateUrl='<%# Eval("loc") %>' Text='<%# Eval("loc")+"("+Eval("count")+")" %>'></asp:LinkButton></li>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList></div>
    </div>
</asp:Content>
