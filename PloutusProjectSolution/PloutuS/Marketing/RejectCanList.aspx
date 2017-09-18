<%@ Page Title="Rejected profiles" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="RejectCanList.aspx.cs" Inherits="Marketing_RejectCanList" %>
     <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            </td>
        </tr>
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
             <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                  Search Rejected Candidates
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>                
              
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnl" runat="server">
                    <table cellpadding="3" cellspacing="3" width="90%" class="MainSearchDiv1">
                        <tr>
                            <td align="left" class="SearchSubDiv1">
                                <table cellpadding="2" cellspacing="2" style="width:100%">
                                    <tr>
                                        <td style="width: 25%;" align="center">
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
                                       <%-- <td style="width: 10%;">
                                            <b>City</b>
                                        </td>--%>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:TextBox ID="txtcomp" runat="server" Height="16px" CssClass="textbox"></asp:TextBox>
                                            <%--   <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtcomp"
                                                WatermarkText="Candidate name" WatermarkCssClass="Watermark">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                        </td>
                                        <td align="center">
                                            <asp:DropDownList ID="ddlexpfrom" Width="70px" runat="server" Height="22px">
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
                                            <asp:DropDownList ID="ddlexpto" Width="70px" runat="server" Height="22px">
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
                                            <asp:DropDownList ID="ddlstate" runat="server" Width="170px" Height="22px">
                                            </asp:DropDownList>
                                        </td>
                                       <%-- <td align="center">
                                            <asp:DropDownList ID="ddlcity" runat="server" Width="170px"  Height="22px">
                                            </asp:DropDownList>
                                        </td>--%>
                                        <td align="center">
                                            <asp:Button ID="btnsearch" runat="server" Width="100px" Text="Search" CssClass="btn" OnClick="btnsearch_Click" />
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
    <table cellpadding="0" cellspacing="0" width="100%">
     <tr>
                            <td style=" padding-top:10px;" align="center">
                               <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                 Rejected Candidate Details
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>    
                              
                            </td>
                        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" Visible="false">
                    <table width="100%" align="center">
                       
                        <tr>
                            <td style=" padding-top:10px;" align="center">
                                <table cellpadding="0" cellspacing="0" width="90%">
                                    <tr>
                                    <td style="padding-right: 3px;" align="left">
                                            <asp:Label ID="Label2" runat="server" Text="Total Profiles: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                                        </td>
                                        <td style="padding-right: 3px;" align="right">
                                            <asp:Label ID="Label1" runat="server" Text="Sort By " Font-Bold="True"></asp:Label>
                                            <asp:DropDownList ID="ddlsort" runat="server" AutoPostBack="True" Width="150px" OnSelectedIndexChanged="ddlsort_SelectedIndexChanged">
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
                                <table width="100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                            <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 90%"
                                                AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                    <tr>
                                                                        <td colspan="2" align="left" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                            padding-left: 20px;">
                                                                            Name
                                                                        </td>
                                                                        <td colspan="2" align="left" class="lable" width="25%" style="padding: 5px;">
                                                                            Indusrty
                                                                        </td>
                                                                          <td align="left" class="lable" width="15%" style="padding: 5px;">
                                                                           State
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                           City
                                                                        </td>
                                                                        <td align="center" class="lable" width="10%" style="padding: 5px;">
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
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                        <tr>
                                                            <td style="padding-left: 5px; padding-right: 5px;">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: 0px;">
                                                                    <tr>
                                                                        <td colspan="2" align="left" class="sgrid-headiing-black" width="20%" style="padding: 5px;">
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("encryptid", "Listofusers.aspx?id={0}") %>'
                                                                                CssClass="sgrid-headiing-Green"> <%# Eval("Name")%></asp:HyperLink>
                                                                            <%-- <%# Eval("Name")%>--%>
                                                                        </td>
                                                                        <td colspan="2" align="left" class="lable" width="25%" style="padding: 5px;">
                                                                            <%# Eval("industry")%>
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
                                            <table class="gridhead" cellpadding="0" cellspacing="0" width="90%">
                                                <tr>
                                                    <td align="right">
                                                        <table cellpadding="0" border="0">
                                                            <tr class="textnormal">
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnFirst" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                                    &nbsp;
                                                                </td>
                                                                <td align="right">
                                                                    <asp:LinkButton ID="lbtnPrevious" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                                </td>
                                                                <td align="center" valign="middle">
                                                                    <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                                                        OnItemDataBound="dlPaging_ItemDataBound">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton CssClass="grdlnk" Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging" runat="server"
                                                                                CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;&nbsp;<asp:LinkButton CssClass="grdlnk" ID="lbtnNext" runat="server" CausesValidation="false"
                                                                        OnClick="lbtnNext_Click">Next</asp:LinkButton>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="LinkButton3" CssClass="grdlnk" runat="server" CausesValidation="false" OnClick="LinkButton3_Click">Last</asp:LinkButton>
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
    </table>
</asp:Content>
