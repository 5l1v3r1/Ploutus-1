<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="CompanyEmployesDetails.aspx.cs" Inherits="Marketing_CompanyEmployesDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table style="padding: 0px;" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="pnlMain" runat="server" >
                    <table width="100%" align="center">
                        <tr>
                            <td style="padding: 0px; padding-top: 20px;" align="left">
                                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                            View Company  Profiles
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
                            <td style=" padding-top:20px;" align="center">
                                <table cellpadding="0" cellspacing="0" width="90%">
                                    <tr>
                                        <td style="padding-right: 55px;" align="right">
                                            <asp:Label ID="Label2" runat="server" Text="Total Number Of Employees: " Font-Bold="True"></asp:Label>
                                            <asp:Label ID="lblCount" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                       
                                    </tr>
                                   
                                <tr>
                                    <td style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px;" align="left">
                                        <table width="100%">
                                            <tr>
                                                <td align="center" colspan="1">
                                                    <table width="90%" style="border: 1px solid silver;" cellpadding="0" cellspacing="0" border="0">
                                                    
                                                                                                                                     <tr>
                                        <td align="center">
                                            <asp:DataList ID="dlEmpCompanys" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 100%"
                                                AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text" >
                                                <HeaderTemplate>                       
                    
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" class="gridhead" border="0" style="width: 100%;">
                                                                    <tr>
                                                                     <td align="center" class="lable" width="3%" style="padding: 5px;">
                                                                            S.no
                                                                        </td>
                                                                        <td colspan="2" align="center" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                            padding-left: 20px;">
                                                                            EmployeName
                                                                        </td>
                                                                        <td colspan="2" align="center" class="lable" width="25%" style="padding: 5px;">
                                                                            Position
                                                                        </td>
                                                                          <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                       Salary
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                       HiredBy
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" style="padding: 5px;">
                                                                       HiredDate
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
                                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                        <tr>
                                                            <td style="padding-left: 5px; padding-right: 5px;">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: s0px;">
                                                                    <tr>
                                                                     <td align="center" class="lable" width="3%" style="padding: 5px;">
                                                                            <asp:Label ID="sl" runat="server" Text="<%#Container.ItemIndex+1 %>"></asp:Label>
                                                                        </td>
                                                                        <td colspan="2" align="center" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                            padding-left: 20px;">
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="sgrid-headiing-Green" NavigateUrl='<%# Eval("jsid", "SelectedHiredCandidateProfile.aspx?id={0}") %>'> <%# Eval("name")%></asp:HyperLink>
                                                                            
                                                                        </td>
                                                                        <td colspan="2" align="center" class="lable" width="25%">
                                                                            <%# Eval("Position")%>
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" >
                                                                            <%# Eval("Salary")%>
                                                                        </td>
                                                                         <td align="center" class="lable" width="15%" >
                                                                            <%# Eval("HiredBy")%>
                                                                        </td>
                                                                        <td align="center" class="lable" width="15%" >
                                                                            <%# Eval("HiredDate")%>
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
                                                         </table>         
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        </asp:Panel>
                        </td>
                        </tr>
                        </table>
</asp:Content>

