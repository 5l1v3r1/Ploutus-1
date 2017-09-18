<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="UploadResume.aspx.cs" Inherits="UploadResume" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" style="height: 630px; width: 100%;">
        <%-- <tr>
            <td align="center" style="padding-top: 20px; padding-bottom: 30px;" class="headding1">
              <asp:Label ID="Label19" runat="server" Text="Job Seekers Edit Profile"></asp:Label>
            </td>
        </tr>--%>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px; padding-top: 100px; vertical-align: top;"
                align="center">
                <table cellpadding="0" cellspacing="0" class="tbl" style=" border-color:#FFC498">
                    <tr>
                        <td align="center" class="org-shearder-bgNew">
                            <asp:Label ID="Label1" runat="server" Text="Update Resume"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="3" cellspacing="3" border="0" style="padding-left: 20px; padding-right: 20px;">
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblMsg" runat="server" CssClass="errmsg" Text="Resume successfully uploaded."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div style="padding-top: 20px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblUpload" runat="server" Text="Upload File" CssClass="lbl"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:FileUpload ID="uploadFile" runat="server" CssClass="button" Width="350px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnUpload" runat="server" CssClass="btn" Text="Upload" OnClick="btnUpload_Click" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button ID="btnback" runat="server" Text="Back" CssClass="btn" OnClick="btnback_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btnUpload" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div style="padding-left: 20px; text-align: left; padding-top: 20px;">
                                            <ul>
                                                <li>File should be in <b>.doc</b> or <b>.docx</b> format only.</li>
                                                <li>File size should be less than <b>1Mb</b>.</li>
                                                <li>Please upload your latest resume.</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
