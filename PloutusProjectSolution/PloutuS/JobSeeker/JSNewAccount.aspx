<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/NewMain.master" CodeFile="JSNewAccount.aspx.cs" Inherits="JobSeeker_JSNewAccount" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" style=" border:1px solid silver; ">
                <tr>
            <td style="padding-top: 20px; border: 0px solid white;" align="left">
                <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                            Create New Account</td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" alt=""/>
                        </td>
                        <td width="60%" class="mLinks" bgcolor="#FEF7E5">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
        <tr>
            <td align="center" style="width: 100%; padding-top:30px; padding-bottom:30px;">
                <table border="0" cellpadding="3" cellspacing="3" style="width: 80%; text-align: left; border:1px solid silver;">
               
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtbox2" TabIndex="1"></asp:TextBox>
                        </td>
                    </tr>

                        <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtPwd" runat="server" CssClass="txtbox2" TabIndex="2"></asp:TextBox>
                        </td>
                    </tr>

                        <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:TextBox ID="txtConPwd" runat="server" CssClass="txtbox2" TabIndex="3"></asp:TextBox>
                        </td>
                    </tr>




                       



                      <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                          <asp:Button ID="btnNewAc" runat="server" Text="Create Account Now"  CssClass="button-big" TabIndex="4" OnClick="btnNewAc_Click" />
                        </td>
                    </tr>

                     <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                            <asp:Label ID="Label2" runat="server" Text="Your Password:" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td style="padding-left: 10px;  width: 134px;">
                            &nbsp;</td>
                        <td style="padding-left: 14px; width: 600px;">
                                                <ul>
                        <li>Must be atleast 8 characters</li>
                        <li>Must include an upper case character</li>
                        <li>Must include a lower case character</li>
                        <li>Must include a lower case character</li>
                    </ul>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="2" style="padding-left: 12px; width: 734px;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="padding-bottom:30px;">
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
                    <tr>
                        <td height="10">
                            <img src="images/bootom-shape.jpg" width="1024" height="33" />
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color:#777777" class="copyrights">
                            2014 © ploutuS LLC. All rights reserved.<br />
                        </td>
                    </tr>
                </table>


    <%-- <table width="100%" style="height:150px" >
        <tr>
      
          <td align="center">
                <asp:Label ID="Label15" runat="server" Text="Create a new account" ForeColor="#993300" style="font-size: xx-large; color: #CC3300; font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>

    <table width="100%" style="height:600px">
        <tr>

            <td valign="top" class="auto-style1">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 450px; "
                                >
                                 <tr>
                                 <td>
                                 <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">
                            New Registration</td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                        </td>
                       
                    </tr>
                </table></td>
                                    
                                </tr>
                                <tr>
                                    <td class="org-stbl" valign="top">
                                        <table style="height: 250px; padding-top:0px; width: 100%; border-color:#FFC498" border="1" cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td valign="top">
                                                   <table style="height: 250px; padding-top:0px; width: 100%; ";  >

                  
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td >
                           
                            <asp:Label ID="lblPwd" runat="server" Text="Password :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:TextBox ID="txtPwd" runat="server"  Width="300px" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td >
                           
                            <asp:Label ID="Label1" runat="server" Text="Confirn Password :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >
                            <asp:TextBox ID="txtConPwd" runat="server"  Width="300px" CssClass="txtbox2"></asp:TextBox>
                        </td>
                    </tr>
                  

                                                      
                                                       

                                                        <tr>
                        <td>
                            <asp:Button ID="btnNewAc" runat="server" Text="Create New Account"  CssClass="button-big" />
                        </td>
                    </tr>
                                                        <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Your Password:"  style="font-size: large; font-weight: 700; color: #666666"></asp:Label>
                </td>
            </tr>

                                                       <tr>
                                                           <td>
                                                                <ul>
                        <li>Must be atleast 8 characters</li>
                        <li>Must include an upper case character</li>
                        <li>Must include a lower case character</li>
                        <li>Must include a lower case character</li>
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
            <%--<td valign="top"  class="auto-style1">
                <table width="100%" style="height:300px;  " >
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" style="width: 600px; "
                                >
                                 <tr>
                                 <td>
                                 <table width="100%" border="0" class="tbl" align="left" style="border: 1px solid #FEF7E5;
                    border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%" valign="middle" bgcolor="#FFC498" class="headding">
                            Registration</td>
                        <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                            <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                        </td>
                       
                    </tr>
                </table></td>
                                    
                                </tr>
                                <tr>
                                    <td class="org-stbl" valign="top">
                                        <table style="height: 250px; padding-top:0px; width: 100%; border-color:#FFC498" border="1" cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td valign="top">
                                                   <table style="height: 250px; padding-top:0px; width: 100%; ";  >

                  
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                            
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="txtEmail"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                           
                            <asp:Label ID="lblPwd" runat="server" Text="Password :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                            <asp:TextBox ID="txtPwd" runat="server"  Width="300px" CssClass="txtPwd"></asp:TextBox>
                        </td>
                    </tr>
                                                         <tr>
                        <td align="center" >
                           
                            <asp:Label ID="Label1" runat="server" Text="Confirm Password :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                            <asp:TextBox ID="TextBox1" runat="server"  Width="300px" CssClass="txtConPwd"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnNewAc" runat="server" Text="Create New Account" Width="300px" />
                        </td>
                    </tr>
                                                        <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Your Password:"  style="font-size: large; font-weight: 700; color: #666666"></asp:Label>
                </td>
            </tr>

                                                       <tr>
                                                           <td>
                                                                <ul>
                        <li>Must be atleast 8 characters</li>
                        <li>Must include an upper case character</li>
                        <li>Must include a lower case character</li>
                        <li>Must include a lower case character</li>
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
            </td>--%>
        </tr>
    </table>--%>


    


                                        

  
</asp:Content>














