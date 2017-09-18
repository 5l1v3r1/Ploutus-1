<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="ViewUploadedResumesAlready.aspx.cs" Inherits="Marketing_Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            </td>
        </tr>
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
                <asp:Label ID="Label8" runat="server" CssClass="headding" Text="Search JobSeeker"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnl" runat="server">
                    <table cellpadding="3" cellspacing="3" width="100%" class="MainSearchDiv1">
                        <tr>
                            <td align="left" class="SearchSubDiv1">
                                <table cellpadding="2" cellspacing="2" style="width: 100%">
                                    <tr>
                                        <td style="width: 30%;" align="center">
                                            <b>Name</b>
                                        </td>
                                        <td align="center" style="width: 10%;" colspan="2">
                                            <b>Experience</b>
                                        </td>
                                        <td style="width: 30%;" align="center">
                                            <b>Industry</b>
                                        </td>
                                        <td style="width: 20%;" align="center">
                                            <b>State</b>
                                        </td>
                                        <td style="width: 10%;">
                                           <b>City</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="txtcomp" runat="server" Height="16px"></asp:TextBox>
                                         <%--   <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtcomp"
                                                WatermarkText="HomeNumber name" WatermarkCssClass="Watermark">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                        </td>
                                        <td align="center">
                                            <asp:DropDownList ID="ddlexpfrom" runat="server" Height="22px">
                                                <asp:ListItem Value="From"></asp:ListItem>
                                                <asp:ListItem Value="0"></asp:ListItem>
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                                <asp:ListItem Value="6"></asp:ListItem>
                                                <asp:ListItem Value="7"></asp:ListItem>
                                                <asp:ListItem Value="8"></asp:ListItem>
                                                <asp:ListItem Value="9"></asp:ListItem>
                                                <asp:ListItem Value="10"></asp:ListItem>
                                                <asp:ListItem Value="11"></asp:ListItem>
                                                <asp:ListItem Value="12"></asp:ListItem>
                                                <asp:ListItem Value="13"></asp:ListItem>
                                                <asp:ListItem Value="14"></asp:ListItem>
                                                <asp:ListItem Value="15"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center">
                                            <asp:DropDownList ID="ddlexpto" runat="server" Height="22px">
                                                <asp:ListItem Value="To"></asp:ListItem>
                                                <asp:ListItem Value="0"></asp:ListItem>
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                                <asp:ListItem Value="6"></asp:ListItem>
                                                <asp:ListItem Value="7"></asp:ListItem>
                                                <asp:ListItem Value="8"></asp:ListItem>
                                                <asp:ListItem Value="9"></asp:ListItem>
                                                <asp:ListItem Value="10"></asp:ListItem>
                                                <asp:ListItem Value="11"></asp:ListItem>
                                                <asp:ListItem Value="12"></asp:ListItem>
                                                <asp:ListItem Value="13"></asp:ListItem>
                                                <asp:ListItem Value="14"></asp:ListItem>
                                                <asp:ListItem Value="15"></asp:ListItem>
                                                <asp:ListItem Value="16"></asp:ListItem>
                                                <asp:ListItem Value="17"></asp:ListItem>
                                                <asp:ListItem Value="18"></asp:ListItem>
                                                <asp:ListItem Value="19"></asp:ListItem>
                                                <asp:ListItem Value="20"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center">
                                            <asp:DropDownList ID="ddlindustry" Width="170px" runat="server" Height="22px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center">
                                            <asp:DropDownList ID="ddlstate" runat="server" Height="22px"  AutoPostBack="true"
                                                onselectedindexchanged="ddlstate_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                         <td align="center">
                                            <asp:DropDownList ID="ddlcity" runat="server" Width="100px" Height="22px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center">
                                            <asp:Button ID="btnsearch" runat="server" Width="100px" Text="Search" OnClick="btnsearch_Click" />
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
    <table cellpadding="0" cellspacing="0" width="1024">
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" Visible="false">
                    <table width="1024px" align="center">
                        <tr>
                            <td align="center" class="headding" style="color: Red">
                                <b>View JobSeeker Profiles</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table cellpadding="0" cellspacing="0" width="924px">
                                    <tr>
                                    <td style="padding-right: 3px;" align="left">
                                     <asp:Label ID="Label2" runat="server" Text="Total Profiles: " Font-Bold="True"></asp:Label>
                                     <asp:Label ID="lblCount" runat="server"  Font-Bold="True"></asp:Label>
                                    </td>

                                        <td style="padding-right: 3px;" align="right">
                                        <asp:Label ID="Label1" runat="server" Text="Sort By " Font-Bold="True"></asp:Label>
                                            <asp:DropDownList ID="ddlsort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsort_SelectedIndexChanged">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Upload Date" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Name" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table width="924px;" style="border: 1px solid silver;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 924px"
                                                AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 924px;">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" class="Gridhedding" border="0" style="width: 100%;">
                                                                    <tr>
                                                                        <td colspan="2" align="left" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                            padding-left: 20px;">
                                                                            Name
                                                                        </td>
                                                                        <td colspan="2" align="left" class="lable" width="25%" style="padding: 5px;">
                                                                            Industry
                                                                        </td>
                                                                          <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                           State
                                                                        </td>
                                                                         <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                           City
                                                                        </td>
                                                                        <td align="left" class="lable" width="10%" style="padding: 5px;">
                                                                            Experience
                                                                        </td>
                                                                        <td align="right" class="lable" width="15%" style="padding: 5px;">
                                                                            Upload Date
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
                                                    <table cellpadding="0" cellspacing="0" style="width: 924px;">
                                                        <tr>
                                                            <td style="padding-left: 5px; padding-right: 5px;">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: 10px;">
                                                                    <tr>
                                                                        <td colspan="2" align="left" class="sgrid-headiing-black" width="20%" style="padding: 5px;">
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encryptid", "ListofusersAlready.aspx?id={0}") %>'
                                                                                CssClass="sgrid-headiing-Green"> <%# Eval("Name")%></asp:HyperLink>
                                                                            <%-- <%# Eval("Name")%>--%>
                                                                        </td>
                                                                        <td colspan="2" align="left" class="lable" width="25%" style="padding: 5px;">
                                                                            <%# Eval("Category")%>
                                                                        </td>
                                                                         <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                            <%# Eval("state")%>
                                                                        </td>
                                                                         <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                            <%# Eval("city")%>
                                                                        </td>
                                                                        <td align="center" class="lable" width="10%" style="padding: 5px;">
                                                                            <%# Eval("Totalexp")%>
                                                                            
                                                                            <asp:Label ID="lblJsID" Visible="false" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="right" class="lable" width="15%" style="padding: 5px;">
                                                                            <%# Eval("uploaddate")%>
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
                                    <tr>
                                        <td align="center">
                                            <table class="Gridhedding" cellpadding="0" cellspacing="0" width="924px">
                                                <tr>
                                                    <td align="right">
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
                                                                        OnItemDataBound="dlPaging_ItemDataBound" 
                                                                        >
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
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="LinkButton3_Click">Last</asp:LinkButton>
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
                    </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlSub" Visible="false">
                    <table cellpadding="0" cellspacing="0" style="padding-top: 30px;" width="1024px">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 40px;">
            </td>
        </tr>
    </table>
</asp:Content>
