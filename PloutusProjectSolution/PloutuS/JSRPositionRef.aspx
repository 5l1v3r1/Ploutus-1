<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSRPositionRef.aspx.cs" Inherits="JSEducation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="tbl" border="0" cellpadding="0" cellspacing="0" width="90%" align="left">
        <tr>
            <td align="left" valign="top" style="padding-top: 50px; padding-left: 50px;">
                <table>
                    <tr>
                        <td colspan="4" class="org-shearder-bgNew">
                            <asp:Label ID="Label15" Text="Applicant References" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left">
                            <asp:Label ID="Label16" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" height="40px">
                            <asp:Label ID="Label13" runat="server" Text="Are you currently bound to a non-compete, non-solicitation, employment agreement or any other obligation with another </br>employer that could affect your ability or eligibility to perform the job for which you are applying? If so, Please submit </br>documentation along with your complete application"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td height="40px" align="left">                           
                            
                               <asp:RadioButton ID="rbobligationYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="obligation" OnCheckedChanged="rbobligationYes_CheckedChanged"  />
                            <asp:RadioButton ID="rbobligationNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="obligation" OnCheckedChanged="rbobligationNo_CheckedChanged"/>


                        </td>


                        <td>
                            <asp:FileUpload ID="fuobligation" runat="server" CssClass="txtBoxApp" Visible="false" />
                        </td>

                    </tr>
                    <tr>
                        <td height="115px">
                            <asp:Label ID="Label14" runat="server" Text="Please explain in detail any gaps in your employment history"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGaps" CssClass="txtMultiBox" runat="server" TextMode="MultiLine" MaxLength="500"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td height="115px">
                            <asp:Label ID="lbl1" Text="Please provide any other information that you feel will help us </br>in considering your application for employment:" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddInfo" CssClass="txtMultiBox" TextMode="MultiLine" runat="server" MaxLength="500"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="May we contact your current employer?"></asp:Label>

                        </td>
                        <td align="left">
                            

                             <asp:RadioButton ID="rbCEmployerYes" runat="server" CssClass="rdbtn" Text="Yes" AutoPostBack="true" GroupName="CEmployer" OnCheckedChanged="rbCEmployerYes_CheckedChanged" />
                            <asp:RadioButton ID="rbCEmployerNo" runat="server" CssClass="rdbtn" Text="No" AutoPostBack="true" GroupName="CEmployer" OnCheckedChanged="rbCEmployerNo_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="pnlRef" runat="server" Visible="false">
                                <table class="tbl" style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2" class="org-shearder-bgNew">
                                            <asp:Label ID="Label2" Text="References" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" Text="Full Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRefFullName" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label18" runat="server" Text="Relation"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRefRelation" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" Text="Company"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRefCompany" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label21" runat="server" Text="Phone"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRefPhone" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label22" runat="server" Text="Address"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRefAddress" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 30px; padding-bottom: 30px">
                <table align="left" valign="top" style="padding-left: 50px" width="100%">
                    <tr>

                        <td colspan="2" align="left">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnSaveContinue_Click" />
                            <span></span>
                            <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam" OnClick="btnSaveLater_Click" />
                        </td>

                        <td align="right" style="padding-right: 100px">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
            <td height="10">
                <img src="images/bootom-shape.jpg" width="1024" height="33" />
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color: #777777" class="copyrights">2014 © ploutuS LLC. All rights reserved.<br />
            </td>
        </tr>
    </table>
</asp:Content>

