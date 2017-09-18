<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JSReviewApplication.aspx.cs" MasterPageFile="~/NewMain.master" Inherits="JSReviewApplication" %>


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
                                            <%--Questionnaire--%>
                                            <td style="padding-top:10px;">
                                                <asp:Label ID="Label21" runat="server" Text="Application Info" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                 <table width="700px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">Date available to start
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label22"
                                                                runat="server"
                                                                Text='<%# Eval("AvailabilityDt")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Wage Minimum:Permanent (Salary)
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label23"
                                                                runat="server"
                                                                Text='<%# Eval("PermanentSal")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Temporary(Hourly)
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label24"
                                                                runat="server"
                                                                Text='<%# Eval("TempSal")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Available to Travel? 
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label25"
                                                                runat="server"
                                                                Text='<%# Eval("AvailabilityTravel")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Distance/Timeframe you’ll drive?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label26"
                                                                runat="server"
                                                                Text='<%# Eval("Distance")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Citizenship
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label27"
                                                                runat="server"
                                                                Text='<%# Eval("IsCitizen")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Legal Eligibility
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label28"
                                                                runat="server"
                                                                Text='<%# Eval("LegallyUS")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Over the age of 18 years?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label29"
                                                                runat="server"
                                                                Text='<%# Eval("IsAge")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td class="LvHeader">Applied to Ploutus™LLC before?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label31"
                                                                runat="server"
                                                                Text='<%# Eval("AppliedPloutus")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                      <tr>
                                                        <td class="LvHeader">Worked for Ploutus™LLC before?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label9"
                                                                runat="server"
                                                                Text='<%# Eval("WorkedPloutus")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                     
                                                      <tr>
                                                        <td class="LvHeader">Valid driving license
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label10"
                                                                runat="server"
                                                                Text='<%# Eval("ValidDrivingLicense")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                       <tr>
                                                        <td class="LvHeader">Transportation
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label11"
                                                                runat="server"
                                                                Text='<%# Eval("HaveTransport")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                       <tr>
                                                        <td class="LvHeader">Accept a same day assignment
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label12"
                                                                runat="server"
                                                                Text='<%# Eval("SameDayAssignment")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                        <tr>
                                                        <td class="LvHeader">Accept a long term assignment
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label13"
                                                                runat="server"
                                                                Text='<%# Eval("LongAssignment")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                       <tr>
                                                        <td class="LvHeader">Are you available?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label17"
                                                                runat="server"
                                                                Text='<%# Eval("JobType")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                          <tr>
                                                        <td class="LvHeader">Convicted of Violations
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label18"
                                                                runat="server"
                                                                Text='<%# Eval("violations")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                        <tr>
                                                        <td class="LvHeader">Is anyone related to you?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label20"
                                                                runat="server"
                                                                Text='<%# Eval("Employed")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                             <tr>
                                                        <td class="LvHeader">Additional Information?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label32"
                                                                runat="server"
                                                                Text='<%# Eval("AddInfo")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbApplication" runat="server" CssClass="lnkEditCss" OnClick="lbApplication_Click" >Edit Application</asp:LinkButton>
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
