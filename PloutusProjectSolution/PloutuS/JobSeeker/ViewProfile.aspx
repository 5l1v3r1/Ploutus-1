<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="left" runat="server" style="width: 100%;">
        <table cellpadding="0" cellspacing="0" border="0" style="min-height: 670px; padding-left: 50px;
            padding-right: 50px;">
            <tr style="height: 70px; padding-top: 20px; padding-bottom: 30px;">
                <td align="center" class="headding1">
                    <asp:Label ID="Label19" runat="server" Text="Job Seekers Profile"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:DataList ID="dlUserProfile" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 924px;border-color:#FFC498">
                                <tr>
                                    <td>
                                        <table class="tbl" cellpadding="0" cellspacing="0" border="0" style="width: 924px;border-color:#FFC498">
                                            <tr>
                                                <td class="org-shearder-bgNew" colspan="2">
                                                    <asp:Label ID="Label2" runat="server" Text=" User Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRFrstName" runat="server"  Text="Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("firstname")%>&nbsp;&nbsp;
                                                    <%# Eval("middlename")%>&nbsp;&nbsp;
                                                    <%# Eval("lastname")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="tbl" cellpadding="0" cellspacing="0" border="0" style="width: 924px;border-color:#FFC498">
                                            <tr>
                                                <td class="org-shearder-bgNew" colspan="2">
                                                    <asp:Label ID="Label3" runat="server" Text="Contact Info" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRA1" runat="server"  Text="Address"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("addressline1")%>,&nbsp; &nbsp;
                                                    <%# Eval("addressline2")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCity" runat="server"  Text="City"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("city")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblState" runat="server"  Text="State"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("state")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblZip" runat="server"  Text="Zipcode"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("zip")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPhone" runat="server"  Text="Phone Number"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("phone")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblMobile" runat="server"  Text="Mobile Number"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("mobile")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server"  Text="E-Mail ID"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("email")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="tbl" style="width: 924px;border-color:#FFC498" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td class="org-shearder-bgNew" colspan="2">
                                                    <asp:Label ID="Label4" runat="server" Text="Experience Details" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRecentEmp" runat="server" Text="Most Recent Employer"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("RecentEmployer")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblJobTitle" runat="server" Text="Job Title"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("JobTitle")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("Exp")%>&nbsp; Years
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="tbl" style="width: 924px;border-color:#FFC498" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td class="org-shearder-bgNew" colspan="2">
                                                    <asp:Label ID="Label5" runat="server" Text="Eligibility Details" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRate" runat="server" Text="Can legally work for US?"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("LegallyUs")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEducation" runat="server" Text="Education"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("education")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblFieldExpert" runat="server" Text="Field of Expertise"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("Category")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 924px; padding-bottom: 100px;" cellpadding="0" cellspacing="0"
                                            border="0">
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn" OnClick="btnEdit_Click" />
                                                    &nbsp; &nbsp;
                                                    <asp:Button ID="btnback" runat="server" CssClass="btn" OnClick="btnback_Click" Text="Back" />
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
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
