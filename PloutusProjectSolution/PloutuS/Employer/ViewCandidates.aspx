<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCandidates.aspx.cs" MasterPageFile="~/Employer/MerchantMaster.master"
    Inherits="Employer_ViewCandidates" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%;">
        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="min-height: 670px;
            padding-left: 50px; padding-right: 50px;">
            <tr style="height: 70px; padding-top: 50px; padding-bottom: 30px;">
                <td align="center" class="headding1">
                    <asp:Label ID="Label19" runat="server" Text="Job Seekers List"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Employer/HireCandidates.aspx" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:DataList ID="dlUserProfile" runat="server" 
                     >
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 924px;">
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
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0">
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
                                    <td style="height: 10px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0">
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
                                        <table class="tbl" style="width: 924px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="shearder-bg" colspan="2">
                                                    <asp:Label ID="Label1" runat="server" Text="Resume" CssClass="lbl"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label7" runat="server" Text="Download Resume"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Click Here" OnClick="lnkDownload_Click"
                                                        CssClass="boxhead"></asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;">
                                                    <asp:Label ID="Label6" runat="server" Text="View Resume"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lnkView" runat="server" Text="Click Here" CssClass="boxhead"
                                                        OnClick="lnkView_Click"></asp:LinkButton>
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
                                        <table style="width: 924px;">
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="btnAccept" runat="server" Text="Accept" OnClick="lbAccept_Click" />
                                                    <asp:Button ID="btnReject" runat="server" Text="Reject" OnClick="lbReject_Click" />
                                                </td>
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
                    <asp:Label ID="lblResume" runat="server" CssClass="errmsg" Text="No file to download"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            
        </table>
         <asp:Panel ID="panel2" runat="server" Width="1024px" BackColor="#E8E8E8">
        <table width="100%">
            <tr>
                <td align="center">
                    <asp:TextBox ID="txtResume" TextMode="MultiLine" Width="924px" Height="680px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btCancel" runat="server" OnClientClick="return confirm('Are you sure you want to Cancel the function ?');"
                        Text="Cancel" CssClass="btn" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
         <asp:HiddenField ID="hdnDesc" runat="server" />
  
  
        <asp:ModalPopupExtender ID="popsystem" runat="server" TargetControlID="hdnDesc" BackgroundCssClass="modalBackground" PopupControlID="panel2">
        </asp:ModalPopupExtender>
        <%# Eval("Position")%>
    </div>
    <%# Eval("RecentEmployer")%>
</asp:Content>
