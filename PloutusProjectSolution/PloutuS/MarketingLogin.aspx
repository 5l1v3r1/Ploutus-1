<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MarketingLogin.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <title>ploutus:::iris:Login</title>
    <link href="CSS/recom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="styles/default.css" />
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/WaterMark.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=txtUserId],[id*=txtPassword]").WaterMark();
        });
    </script>
</head>
<body style="background-image: none;background-color:white;">
    <form id="form1" runat="server">
  
    <table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 100%;
        padding-top: 50px">
        <tr>
            <td align="center" valign="top" style="height:200px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images1/ploutus-logo.jpg" OnClick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" style="height: 620px" border="0" align="center">
                    <tr>
                        <td align="center" valign="top" style="background-repeat: no-repeat; height: 400px;
                            width: 529px; padding-top: 130px; background-image: url('images1/loginbg.jpg');">
                            <table style="width: 529px" border="0" align="center">
                                <tr>
                                    <td width="287px" style="padding-right: 8px;" align="right">
                                        <asp:TextBox ID="txtUserId" runat="server" Width="150px" Height="20px" class="Login validate[required]"
                                            Style="float: right; padding-right: 8px;" ToolTip="Enter UserName"></asp:TextBox>
                                    </td>
                                    <td width="148px" align="right">
                                        <asp:TextBox ID="txtPassword" runat="server" Width="148px" ToolTip="Enter Password"
                                            CssClass="Password validate[required]" TextMode="Password" Height="20px"></asp:TextBox>
                                    </td>
                                    <td width="94px" align="right">
                                        <asp:ImageButton src="images1/login.jpg" ID="imgbtnLogin" runat="server" Width="71px"
                                            Height="38px" OnClick="imgbtnLogin_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px;" align="center" colspan="3">
                                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <table border="0" cellpadding="0" cellspacing="0" width="50%">
                                            <tr>
                                                <td align="right">
                                                    <input type="checkbox" name="checkbox" id="checkbox" />
                                                </td>
                                                <td class="remember" align="left">
                                                    <a href="#">Remember Me&nbsp;</a>
                                                </td>
                                                <td class="remember" align="left">
                                                    <a href="#">Forgot Password? </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <div class="copyrighrs-shoadowline">
                                            <img src="images1/copyrights-line.jpg" alt=""/></div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
