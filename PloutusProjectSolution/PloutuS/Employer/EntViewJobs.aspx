<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="EntViewJobs.aspx.cs" Inherits="Ploutos_ViewDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--    <div style="height: 30px; border: 0px; padding-top: 5px;"
        align="center">
        <span class="headding">Job Post</span></div>--%>
    <table cellpadding="0" cellspacing="0" border="0" style="min-height: 500px; width: 100%;
        ">
        <tr>
            <td align="center" style="padding-top: 50px; padding-bottom: 30px;" class="headding1">
                <asp:Label ID="lblhead" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <br />
                <%--<asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="pnl1" Corners="All"
                    BorderColor="#fecb51" Radius="20" runat="server">
                </asp:RoundedCornersExtender>--%>
                <asp:Panel ID="pnl1" Width="80%" runat="server">
                    <table cellpadding="0" cellspacing="0" border="0" style="min-height: 630px; width: 95%;
                       ">
                  
                        <tr>
                            <td valign="top" align="center" style="border: 0px;">
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="padding-right: 20px; padding-bottom:10px;">
                                        <asp:Button ID="btEdit" Text="Edit " runat="server" CssClass="btn" OnClick="btEdit_Click" />
                                           
                                        </td>
                                    </tr>
                                    <tr >
                                        <td valign="top" >
                                            <asp:DataList ID="dlJobPosting" runat="server"  Style="text-align: left; width: 100%;border:1px solid black">
                                                <HeaderTemplate>
                                                    <table cellpadding="2" cellspacing="0" border="0" style="width: 100%">
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="3" cellspacing="3" border="0" style="width: 100%">
                                                       <%-- <tr>
                                                            <td colspan="3" style="font-size: 18px; font-weight: 700;">
                                                                <%# Eval("JobTitle")%>
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td width="100px" class="lable">
                                                                                    Company  
                                                                                </td>
                                                                                <td class="lable">
                                                                                    :
                                                                                </td>
                                                                                <td class="lbl-RB">
                                                                                    <%# Eval("CompanyName")%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lable">
                                                                                    Location
                                                                                </td>
                                                                                <td class="lable">
                                                                                    :
                                                                                </td>
                                                                                <td class="lable">
                                                                                    <%# Eval("Location")%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="vertical-align: top;">
                                                                                <td class="lable">
                                                                                    Posted Date
                                                                                </td>
                                                                                <td class="lable">
                                                                                    :
                                                                                </td>
                                                                                <td class="lable">
                                                                                    <%# Eval("PostedDate")%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lable">
                                                                                    Rate ($)
                                                                                    <td class="lable">
                                                                                        :
                                                                                    </td>
                                                                                    <td class="lable">
                                                                                        <%# Eval("Rate")%>
                                                                                    </td>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <%--<tr>
                                                                    <td colspan="3" style="font-size: 13px; font-weight: 700;" colspan="2">
                                                                        Are you looking for a challenging job opportunity in the
                                                                        <%# Eval("Industry")%>
                                                                        industry? Do you have years of experience in
                                                                        <%# Eval("Industry")%>
                                                                        and want to GROW your career….then we have the job for you!
                                                                    </td>
                                                                </tr>--%>
                                                                <tr>
                                                                   <%-- <td colspan="3">
                                                                        <%# Eval("JobDescription")%>
                                                                    </td>--%>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        Experience :
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <div id="divRequirements">
                                                                            <%# Eval("ExpFrom")%>
                                                                            -
                                                                            <%# Eval("ExpTo")%>
                                                                            Years
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        Knowledge :
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <div id="divKnwExp" runat="server">
                                                                            <%# Eval("Skills")%>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        Industry :
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <div id="div1" runat="server">
                                                                            <%# Eval("Industry")%>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%--<tr>
                                                                    <td colspan="3">
                                                                        Company description
                                                                    </td>
                                                                </tr>--%>
                                                                <%--<tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        **If you feel you’re a good match for this position please submit your resume and
                                                                        fill out our application online. We will have a Recruiter reach out to you if the
                                                                        qualifications fit your background.**
                                                                    </td>
                                                                </tr>--%>
                                                                <%--<tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        If you have any questions, contact us anytime at:
                                                                    </td>
                                                                </tr>--%>
                                                                <%--<tr>
                                                                    <td colspan="3" style="font-weight: 600;">
                                                                        Main: 847-829-7640
                                                                    </td>
                                                                </tr>--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding-right: 20px; padding-top: 10px;">
                                        <asp:LinkButton ID="lnkBack11" runat="server" Text="Back" 
                                                onclick="lnkBack11_Click"  ></asp:LinkButton>
                                             <asp:Button ID="btnBackSearch" Text="Back " Visible="false" runat="server" OnClick="btnBackSearch_Click"
                                                CssClass="btn" />
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
    <table>
    <tr>
                                        <td style="height: 100px;">
                                        </td>
                                    </tr></table>
</asp:Content>
