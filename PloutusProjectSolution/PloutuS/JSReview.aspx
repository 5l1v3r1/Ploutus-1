<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JSReview.aspx.cs" Inherits="JobSeeker_JSReview" MasterPageFile="~/NewMain.master" %>

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
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="Your Info" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%--JobseekerInfo--%>
                                                <table width="600px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">First Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label1"
                                                                runat="server"
                                                                Text='<%# Eval("firstname")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Last Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label3"
                                                                runat="server"
                                                                Text='<%# Eval("lastname")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Address Line 1
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label14"
                                                                runat="server"
                                                                Text='<%# Eval("addressline1")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Address Line 2
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label15"
                                                                runat="server"
                                                                Text='<%# Eval("addressline2")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">City
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label16"
                                                                runat="server"
                                                                Text='<%# Eval("city")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">State
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label4"
                                                                runat="server"
                                                                Text='<%# Eval("state")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Zip
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label5"
                                                                runat="server"
                                                                Text='<%# Eval("zip")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Home Phone
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label6"
                                                                runat="server"
                                                                Text='<%# Eval("phone")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Mobile Phone
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label7"
                                                                runat="server"
                                                                Text='<%# Eval("mobile")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Work Phone
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label8"
                                                                runat="server"
                                                                Text='<%# Eval("work")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbEditApp" runat="server" CssClass="lnkEditCss" OnClick="lbEditApp_Click1">Edit Application</asp:LinkButton>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--Questionnaire--%>
                                            <td style="padding-top:10px;">
                                                <asp:Label ID="Label21" runat="server" Text="Questionnaire" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                 <table width="600px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">Desired Job Title
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label22"
                                                                runat="server"
                                                                Text='<%# Eval("JobTitle")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Desired Pay Rate
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label23"
                                                                runat="server"
                                                                Text='<%# Eval("rate")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Pay Type
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label24"
                                                                runat="server"
                                                                Text='<%# Eval("paytype")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Highest Level of Education
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label25"
                                                                runat="server"
                                                                Text='<%# Eval("ed1")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">DSecurity clearence
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label26"
                                                                runat="server"
                                                                Text='<%# Eval("SecurityClear")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Work Status
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label27"
                                                                runat="server"
                                                                Text='<%# Eval("workstatus")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">linkedin profile
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label28"
                                                                runat="server"
                                                                Text='<%# Eval("LinkedIn")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                   

                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbEditQuestionair" runat="server" CssClass="lnkEditCss" OnClick="lbEditQues_Click1">Edit Application</asp:LinkButton>
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

