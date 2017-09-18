<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/NewMain.master"  CodeFile="JSLogin.aspx.cs" Inherits="JobSeeker_JSLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" style="height: 150px">
        <tr>

            <td align="center">
                <asp:Label ID="Label15" runat="server" Text="My Profile" ForeColor="#993300" Style="font-size: xx-large; color: #CC3300; font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>




    <table width="100%" style="height: 600px;">
        <tr>
            <td valign="top" class="auto-style1">
                <table cellspacing="0" cellpadding="0" border="0" style="width: 450px; padding-left:20px;">
                    <tr>
                        <td>
                            <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5; border-bottom: 1px solid #FFC498; padding: 0px;"
                                cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">Login</td>
                                    <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                        <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                    </td>

                                </tr>
                            </table>
                        </td>

                    </tr>
                    <tr>
                        <td class="org-stbl" valign="top">
                            <table style="height: 250px; padding-top: 0px; width: 100%; border-color: #FFC498" border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <table style="height: 250px; padding-top: 0px; width: 100%;">


                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="txtbox2"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <asp:Label ID="lblPwd" runat="server" Text="Password :"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtPwd" runat="server" Width="300px" CssClass="txtbox2"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbForPwd" runat="server" Font-Bold="True" ForeColor="Gray">Forgot Password?</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="button-big" />
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



            <td valign="top" class="auto-style1">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 450px;  padding-left:20px;">
                    <tr>
                        <td>
                            <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;  border-bottom: 1px solid #FFC498; padding: 0px;"
                                cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">Create Profile</td>
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
                        <td class="org-stbl" valign="top">
                            <table style="height: 250px; padding-top: 0px; width: 100%; border-color: #FFC498" border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <table style="height: 250px; padding-top: 0px; width: 100%;">


                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="bottom">
                                                    <asp:Label ID="Label1" runat="server" Text="Creating an account will allow you to :"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td valign="top">
                                                    <ul>
                                                        <li>Save resumes and quickly apply to future jobs
                                                        </li>
                                                        <li>Receive email alerts with recommended jobs
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center">
                                                    <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="button-big" OnClick="btnReg_Click1" />
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
</asp:Content>






