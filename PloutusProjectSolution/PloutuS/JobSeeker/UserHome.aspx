<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="panel1" runat="server">
        <table cellpadding="0" cellspacing="0" width="100%" style="height: 680px; text-align: left;
            text-indent: 0px; vertical-align: middle; font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px; font-style: normal; border: 1px solid #b4b4b4;" border="0">
            <tr>
                <td align="center" class="headding1" style="padding-top: 20px; padding-bottom: 30px;">
                    Welcome
                    <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; padding-left: 50px; padding-right: 50px;">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td style="height: 100px;" valign="top">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td style="padding-left: 10px;">
                                            <table class="org-stbl" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="org-shearder-bgNew">
                                                        Personal Profile
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 450px; padding-top: 10px; padding-bottom: 10px;">
                                                        <p>
                                                            &nbsp; &nbsp;Here's your current account information.</p>
                                                        <p>
                                                            &nbsp; &nbsp;
                                                            <asp:HyperLink ID="hlnkEditProfile" runat="server" Text="View your Profile." NavigateUrl="~/JobSeeker/ViewProfile.aspx"
                                                                CssClass="boxhead"></asp:HyperLink>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 10px;">
                                            <table class="org-stbl" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td align="left" class="org-shearder-bgNew">
                                                        Job Applications
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="width: 450px; padding-top: 10px; padding-bottom: 10px;">
                                                            <p>
                                                                &nbsp;&nbsp;
                                                                <asp:HyperLink ID="HyperLink1" Text="Search" NavigateUrl="~/JobSeeker/JobSeekerCategoriesMain.aspx"
                                                                    runat="server" CssClass="boxhead"></asp:HyperLink>
                                                                &nbsp;our available jobs to get started.</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 20px;">
                                &nbsp;
                            </td>
                            <td valign="top" style="height: 100px;">
                                <table class="org-stbl" cellpadding="0" cellspacing="0" border="0" style="width: 390px;
                                    vertical-align: top;">
                                    <tr>
                                        <td align="left" class="org-shearder-bgNew" colspan="3">
                                            JobSeeker Activity
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0px; height: 100px;">
                                            <table cellpadding="5" cellspacing="5" border="0" style="padding-top: 20px; padding-bottom: 20px;
                                                height: 100px;">
                                                <tr>
                                                    <td style="padding-left: 30px;">
                                                        &nbsp;<asp:Label ID="lblUserId" runat="server"  Text="User Name "></asp:Label>
                                                    </td>
                                                    <td>
                                                        :
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:Label ID="lblUsername" runat="server" CssClass="lbl"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 30px;">
                                                        &nbsp;<asp:Label ID="lblLogin" runat="server"  Text="Login Time"></asp:Label>
                                                    </td>
                                                    <td>
                                                        :
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:Label ID="lblLogintime" runat="server" CssClass="lbl"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 30px;">
                                                        &nbsp;<asp:Label ID="lblLastLogin" runat="server"  Text="Last login"></asp:Label>
                                                    </td>
                                                    <td>
                                                        :
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:Label ID="lblLastLoginTime" runat="server" CssClass="lbl"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 30px;">
                                                        &nbsp;<asp:Label ID="lblcreateAccount" runat="server"  Text="Account Created on"></asp:Label>
                                                    </td>
                                                    <td>
                                                        :
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:Label ID="lblact" runat="server" CssClass="lbl"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 30px;">
                                                        &nbsp;<asp:Label ID="lblStatus" runat="server"  Text="Account Status"></asp:Label>
                                                    </td>
                                                    <td>
                                                        :
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:Label ID="lblActive" runat="server" CssClass="lbl">Active</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3" style="padding-left: 10px; height: 100px;">
                                <table class="org-stbl" cellpadding="0" cellspacing="0" border="0" style="width: 880px;">
                                    <tr>
                                        <td class="org-shearder-bgNew" colspan="2">
                                            Job Alerts
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="padding-left: 5px;">
                                            <asp:DataList ID="dlJobAlerts" runat="server" Font-Bold="False" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lbl">
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                            <td align="left" style="padding: 5px;">
                                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("encryptid", "JobSeekerSearch.aspx?id={0}") %>'> <%# Eval("Alert")%> </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <%-- <FooterTemplate>
                                                <asp:Label Visible='<%#bool.Parse((dlJobAlerts.Items.Count==0).ToString())%>' runat="server"
                                                    ID="lblNoRecord" Text="No Alerts Found!"></asp:Label>
                                            </FooterTemplate>--%>
                                            </asp:DataList>
                                        </td>
                                        <td align="right" valign="top">
                                            <asp:HyperLink ID="hpkjobalert" runat="server" NavigateUrl="~/JobSeeker/JobAlert.aspx">More..</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div style="width: 450px;">
                                                <%# Eval("Alert")%>
                                                <p>
                                                    &nbsp; &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/images/JobAlert.gif" /><a
                                                        href="JobAlert.aspx" target="_parent">Create a Job Alert</a>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3" style="padding-left: 10px;">
                                <table class="org-stbl" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td align="left" class="org-shearder-bgNew">
                                            Resumes
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="width: 880px; padding-top: 10px; padding-bottom: 10px;">
                                                <%--<p>
                                                            &nbsp;&nbsp;Here you can create a job alert.</p>--%>
                                                <p>
                                                    &nbsp;&nbsp; Why update your resume? If you have any new experience, skills, or
                                                    education, let us know. It can broaden your chance for employment.</p>
                                                <p>
                                                    &nbsp;&nbsp; You haven't posted your resume! It's easy, quick, and can greatly increase
                                                    your chances for finding that perfect job.</p>
                                               
                                                <ul type="square">
                                                    <li>
                                                        <asp:UpdatePanel ID="updownload" runat="server">
                                                            <ContentTemplate>
                                                            Already uploaded your resume?
                                                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download Resume." OnClick="lnkDownload_Click"
                                                                    CssClass="boxhead"></asp:LinkButton>&nbsp;&nbsp;
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="lnkDownload" EventName="Click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </li>
                                                </ul>
                                                <ul type="square">
                                                    <li>Want to update your resume?
                                                        <asp:HyperLink ID="hlinkResumeBuilder" Text="Update Resume." NavigateUrl="~/JobSeeker/UploadResume.aspx"
                                                            runat="server" CssClass="boxhead"></asp:HyperLink>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <p>
                                                <asp:Label ID="lblResume" runat="server" CssClass="errmsg" Text="No file to download"></asp:Label></p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-bottom: 100px;">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
             <tr>
            <td>
                <div id="Div2" style="display: none">
                    <asp:Panel ID="Panel2" runat="server" BackColor="#E6E6EF">
                        <table style="height: 450px; width: 600px;">
                            <tr>
                                <td align="center">
                                    Resume
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtViewResume" TextMode="MultiLine" Width="700px" Height="480px"
                                        runat="server"></asp:TextBox>
                                  
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblresumeMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnVRCancel" runat="server" Text="Close" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hfViewResume" runat="server" />
                <cc1:ModalPopupExtender ID="mpViewResume" runat="server" TargetControlID="hfViewResume"
                    PopupControlID="Div2" BackgroundCssClass="Inactive" CancelControlID="btnVRCancel">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        </table>
    </asp:Panel>
    
</asp:Content>
