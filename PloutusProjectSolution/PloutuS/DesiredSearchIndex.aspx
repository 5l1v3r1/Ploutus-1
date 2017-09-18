<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DesiredSearchIndex.aspx.cs" Inherits="DesiredSearchIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="0" cellspacing="0" border="1" style="width: 100%; background-color: white;">
        <tr>
            <td align="center" valign="middle" style="border: 0px;">
            <br />
                <h5>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" CssClass="h4"></asp:Label></h5>
                <table cellpadding="0" cellspacing="0" border="0" style="height: 630px; width: 80%;
                    padding-top: 20px">
                    <tr>
                        <td align="center" valign="top">                            
                            <asp:DataList ID="dljobdet" runat="server" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                Width="509px" CssClass="lable" AlternatingItemStyle-CssClass="gridbgwhite" ItemStyle-CssClass="gridbg">
                                <ItemTemplate>
                                    <table cellpadding="7" cellspacing="7" border="1" style="width: 100%;">
                                        <tr>
                                            <td>
                                                <table cellpadding="2" cellspacing="2" border="0" style="width: 100%; padding-top: 5px">
                                                    <tr>
                                                        <td align="left" class="lable">
                                                            Title :
                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("id", "Jobdesc.aspx?id={0}") %>'
                                                                Text='<%#Eval("Jobtitl") %>'>'Text="jobtitl"></asp:HyperLink></td>
                                                        <td align="right" class="lable" width="200">
                                                            Location :
                                                            <%# Eval("Loc")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="lable">
                                                            Description :
                                                            <%# Eval("Des")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="lable">
                                                            Experience :
                                                            <%# Eval("Minexp")%>
                                                            To<%# Eval("MaxExp")%>
                                                            Years</td>
                                                        <td align="right" class="lable">
                                                            PostedDate :
                                                            <%# Eval("Posdt")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="lable" colspan="2">
                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "Jobdesc.aspx?id={0}") %>'>Apply</asp:HyperLink></td>
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
            </td>
        </tr>
    </table>
</asp:Content>

