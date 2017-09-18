<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true"
    CodeFile="JobSeekerRegPro.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtPhone").focusout(function () {
                $("#txtPhone").empty;

            });
        });
    </script>
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" >
        <tr >
            <td colspan="4" align="center" style="padding-top:20px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job Seekers Login"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%">

                    <tr>
                        <td style="padding-left: 50px; padding-right: 50px;">
                            <table cellspacing="5" cellpadding="5">
                                <tr>
                                    <td style="width: 100%">
                                        <table class="tbl" style="width: 900px;" border="0" cellpadding="1px" cellspacing="0">
                                            <tr>
                                                <td colspan="4" class="org-shearder-bgNew">Login</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="padding-top: 10px;">
                                                    <asp:Label ID="Label1" runat="server" Text="Email "></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="border: 10px;">
                                                    <asp:TextBox ID="txtEmail" runat="server" TabIndex="1" CssClass="txtbox2"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="#CC3300" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Login">*</asp:RegularExpressionValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtPwd" CssClass="txtbox2" runat="server" TextMode="Password" TabIndex="2"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" ErrorMessage="Enter Password" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td ></td>

                                            </tr>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="button-big" OnClick="btnLogin_Click" TabIndex="3" ValidationGroup="Login" />
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbForPwd" runat="server" Font-Bold="True" ForeColor="Gray">Forgot Password?</asp:LinkButton>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLogMsg" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsLogin" runat="server" ForeColor="#CC3300" HeaderText="Please find the below errors:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Login" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td  >
                           
                        </td>
                    </tr>
                    <tr>
                        <td cellspacing="0" cellspadding="0" style="color:red; font-weight:bold;" >
                           New User? Register Here
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Registration</td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        <table>
                                           
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px;">
                                                    <asp:Label ID="Label2" runat="server" Text="Email "></asp:Label>
                                                </td>


                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtRegEmail" runat="server" CssClass="txtbox2" TabIndex="5"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvRegEmail" runat="server" ControlToValidate="txtRegEmail" ErrorMessage="Enter Email" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                                                    <%-- <asp:RegularExpressionValidator ID="revRegPwd" runat="server" ControlToValidate="txtRegPwd" ErrorMessage="Invalid Email Format" ForeColor="#CC3300" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Registration">*</asp:RegularExpressionValidator>--%>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>&nbsp;<asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtRegPwd" CssClass="txtbox2" runat="server" TabIndex="6" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvRegPwd" runat="server" ControlToValidate="txtRegPwd" ErrorMessage="Enter Password" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>&nbsp;<asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtConPwd" CssClass="txtbox2" runat="server" TextMode="Password" TabIndex="7" ></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvConPwd" runat="server" ControlToValidate="txtConPwd" ErrorMessage="Enter Confirm Password" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="cvConPwd" runat="server" ControlToCompare="txtRegPwd" ControlToValidate="txtConPwd" ErrorMessage="Password doesn't match" ForeColor="#CC3300" SetFocusOnError="True" ValidationGroup="Registration">*</asp:CompareValidator>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="button-big" OnClick="btnReg_Click" TabIndex="8"  ValidationGroup="Registration" />
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>

                                                    <asp:ValidationSummary ID="vsRegistration" runat="server" ForeColor="#CC3300" HeaderText="Please find the below errors" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Registration" />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: large;color:black">
                                                    Your Password:
                                                   </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <ul>
                                                        <li>Must be atleast 8 characters
                                                        </li>
                                                        <li>Must include an upper case character
                                                        </li>
                                                         <li>Must include a special character
                                                        </li>
                                                        <li>Must include a number
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>

                                        </table>

                                    </td>
                                    <td style="width: 50%;  vertical-align:top;" >
                                                                               
                                        <table >
                                            <tr>
                                                <td style="font-size: large;color:black">
                                                    Creating an account will allow you to:
                                                   </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <ul>
                                                        <li>Save and update resume 
                                                        </li>
                                                         <li>Quickly apply to future jobs
                                                        </li>
                                                        <li>Recommended job alerts
                                                        </li>
                                                        <li>Email alerts 
                                                        </li>
                                                         <li>Message Alerts
                                                        </li>
                                                    </ul>
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
