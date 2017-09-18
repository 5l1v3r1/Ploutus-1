<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="ViewContractEmployee.aspx.cs" Inherits="Employer_ViewContractEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%;">
        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="min-height: 670px;
            padding-left: 50px; padding-right: 50px;">
            <tr>
                <td align="center" class="headding1" style="padding-top: 50px; padding-bottom: 30px;">
                    <asp:Label ID="Label19" runat="server" Text="Contract Employee"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:DataList ID="dlContractEmp" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 924px;">
                                <tr>
                                    <td>
                                        <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label10" runat="server" Text=" User Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label12" runat="server" CssClass="lbl" Text="Consultant ID"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("ConsultantID")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRFrstName" runat="server" CssClass="lbl" Text="Name"></asp:Label>
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
                                        <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label3" runat="server" Text="Contact Info" CssClass="lbl"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblRA1" runat="server" CssClass="lbl" Text="Address"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("addressline1")%>,&nbsp; &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                </td>
                                                <td>
                                                    <%# Eval("addressline2")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCity" runat="server" CssClass="lbl" Text="City"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("city")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblState" runat="server" CssClass="lbl" Text="State"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("state")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblZip" runat="server" CssClass="lbl" Text="Zipcode"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("zip")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPhone" runat="server" CssClass="lbl" Text="Phone Number"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("phone")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblMobile" runat="server" CssClass="lbl" Text="Mobile Number"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("mobile")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server" CssClass="lbl" Text="E-Mail ID"></asp:Label>
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
                                        <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label4" runat="server" Text="Experience Details" CssClass="lbl"></asp:Label>
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
                                        <table class="tbl" style="width: 924px;">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label5" runat="server" Text="Eligibility Details" CssClass="lbl"></asp:Label>
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
                                                    <%# Eval("FieldOfExpertise")%>
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
                                        <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label2" runat="server" Text=" Job Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="lblApplied" runat="server" CssClass="lbl" Text="Applied for"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("Position")%>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label11" runat="server" CssClass="lbl" Text="Company"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("company")%>&nbsp;&nbsp;
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
                                        <table class="tbl" cellpadding="0" cellspacing="0" style="width: 924px;">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label1" runat="server" Text="Hire Process"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label6" runat="server" CssClass="lbl" Text="Position"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("Position")%>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label7" runat="server" CssClass="lbl" Text="Rate"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("Rate")%>&nbsp;&nbsp;<%# Eval("RateType")%>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label8" runat="server" CssClass="lbl" Text="Job Type"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("JobType")%>--<%# Eval("StartDate")%>&nbsp;to&nbsp;<%# Eval("EndDate")%>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label9" runat="server" CssClass="lbl" Text="Joining Date"></asp:Label>
                                                </td>
                                                <td>
                                                    <%# Eval("JoiningDate")%>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-top: 50px; padding-bottom: 50px">
                                        <asp:LinkButton ID="LinkButton2" CssClass="stylink" runat="server" PostBackUrl="~/Employer/ContractEmployes.aspx">Back</asp:LinkButton>
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
