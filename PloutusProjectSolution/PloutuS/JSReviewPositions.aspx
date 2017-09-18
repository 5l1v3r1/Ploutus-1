<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSReviewPositions.aspx.cs" Inherits="JSReviewPositions" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table cellpadding="0" cellspacing="0" class="tbl" width="100%" align="left">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-left: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Review your application"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" style="padding-left: 50px; padding-top: 20px;">
                <table border="0" cellpadding="3" cellspacing="3" style="width: 90%; text-align: left;">

                    <%--YourInfo Heading--%>

                   <%-- <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Your Info" CssClass="org-shearder-bgNew"></asp:Label>
                        </td>
                    </tr>--%>

                    <%--YourInfo ListView--%>

                    <tr>
                        <td style="height: 100px">

                            <asp:ListView ID="lvYourInfo" runat="server">

                                <ItemTemplate>
                                    <table>
                                        
                                        <tr>
                                            <%--Positions--%>
                                            <td style="padding-top:10px;">
                                                <asp:Label ID="Label21" runat="server" Text="Postion" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                 <table width="700px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">Company Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label22"
                                                                runat="server"
                                                                Text='<%# Eval("Company")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Employment Start Date
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label23"
                                                                runat="server"
                                                                Text='<%# Eval("EmploymentStrtDt")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Employment End Date
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label24"
                                                                runat="server"
                                                                Text='<%# Eval("EmploymentEndDt")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Name & Title of Supervisor
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label25"
                                                                runat="server"
                                                                Text='<%# Eval("Supervisor")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Position
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label26"
                                                                runat="server"
                                                                Text='<%# Eval("Position")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Address
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label27"
                                                                runat="server"
                                                                Text='<%# Eval("Address")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                    
                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbPositions" runat="server" CssClass="lnkEditCss" OnClick="lbPositions_Click" >Edit Position Details</asp:LinkButton>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>

                                        
                                    </table>

                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                    </tr>

        

                    <%--Submit Buttons--%>

                    <tr>
                        <td colspan="2" align="left" style="padding-top: 20px; padding-bottom: 50px">
                            <asp:Button ID="btnSaveContinue" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnSaveContinue_Click" />
                            <span></span>
                            <%--<asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam"  />--%>
                        </td>

                        <td align="right" style="padding-right: 0px; padding-top: 20px; padding-bottom: 50px">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" OnClick="btnBack_Click" />
                        </td>
                    </tr>


                </table>
            </td>
        </tr>

    </table>
    <%--Footer--%>
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

