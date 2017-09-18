<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSReviewEmergency.aspx.cs" Inherits="JSReviewEmergency" %>

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
                                                <asp:Label ID="Label2" runat="server" Text="Emergency Contact Information" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%--Emergency--%>
                                                <table width="600px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label1"
                                                                runat="server"
                                                                Text='<%# Eval("EmergencyName")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Relation
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label3"
                                                                runat="server"
                                                                Text='<%# Eval("EmergencyRelation")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Phone Number
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label14"
                                                                runat="server"
                                                                Text='<%# Eval("EmergencyPhone")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                  
                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbEditEmergency" runat="server" CssClass="lnkEditCss" OnClick="lbEditEmergency_Click">Edit Emergency Details</asp:LinkButton>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--Applicant Education--%>
                                            <td style="padding-top:10px;">
                                                <asp:Label ID="Label21" runat="server" Text="Applicant Education" CssClass="org-shearder-bgNew"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                 <table width="600px" border="1" cellpadding="0" cellspacing="0" style="border-color: grey;">
                                                    <tr>
                                                        <td class="LvHeader">Highest Level of Education
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label22"
                                                                runat="server"
                                                                Text='<%# Eval("HEduType")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">College Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label23"
                                                                runat="server"
                                                                Text='<%# Eval("HCollege")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Course of Study
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label24"
                                                                runat="server"
                                                                Text='<%# Eval("HCourse")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Graduated?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label25"
                                                                runat="server"
                                                                Text='<%# Eval("HIsGraduated")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Year of Graduated
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label26"
                                                                runat="server"
                                                                Text='<%# Eval("HYear")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Diploma/Degree
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label27"
                                                                runat="server"
                                                                Text='<%# Eval("HDiploma")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                        <td class="LvHeader">Level of Education
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label4"
                                                                runat="server"
                                                                Text='<%# Eval("LEduType")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">College Name
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label5"
                                                                runat="server"
                                                                Text='<%# Eval("LCollege")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Course of Study
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label6"
                                                                runat="server"
                                                                Text='<%# Eval("LCourse")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Graduated?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label7"
                                                                runat="server"
                                                                Text='<%# Eval("LIsGraduated")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Year of Graduated
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label8"
                                                                runat="server"
                                                                Text='<%# Eval("LYear")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="LvHeader">Diploma/Degree
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label9"
                                                                runat="server"
                                                                Text='<%# Eval("LDiploma")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>

                                                   <%-- <tr>
                                                        <td class="LvHeader">Have you received any job-related training in the United States Military?
                                                        </td>
                                                        <td class="LvData">
                                                            <asp:Label
                                                                ID="Label10"
                                                                runat="server"
                                                                Text='<%# Eval("IsMilitary")%>'> 
                                                            </asp:Label>
                                                        </td>
                                                    </tr>--%>
                                                   

                                                    <tr>

                                                        <td colspan="2" align="right" class="LvData">
                                                            <asp:LinkButton ID="lbEditEducation" runat="server" CssClass="lnkEditCss" OnClick="lbEditEducation_Click">Edit Education Details</asp:LinkButton>
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

