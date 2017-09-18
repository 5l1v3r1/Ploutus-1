<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true" CodeFile="Employment_Jobseeker.aspx.cs" Inherits="Employment_Jobseeker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 552px;
        }
        .auto-style4 {
            float: left;
            width: 467px;
        }
        .auto-style5 {
            width: 467px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">

        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td class="errmsg" style="padding-left: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">
                                        <asp:Label ID="Label29" Text="TEMPORARY/CONTRACT POSITIONS" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label1" runat="server" Text="Company Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmergencyName" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label2" runat="server" Text="Employment Start Date"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt1" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label3" runat="server" Text="Employment End Date"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt2" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label12" runat="server" Text="Name & Title of Supervisor"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>




                                <tr>
                                    <td colspan="4">&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="2" class="org-shearder-bgNew">
                                        <asp:Label ID="Label20" runat="server" Text="PERMANENT POSITIONS"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label4" runat="server" Text="Company Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label5" runat="server" Text="Employment Start Date"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label6" runat="server" Text="Employment End Date"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label7" runat="server" Text="Name & Title of Supervisor"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label8" runat="server" Text="Position"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label9" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label10" runat="server" Text="Describe your Duties"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="TextBox8" CssClass="txtboxMultiNotes" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label11" runat="server" Text="Reason for Leaving"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>


                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="TextBox9" CssClass="txtboxMultiNotes" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label13" runat="server" Text="Are you currently bound to a non-compete, non-solicitation, employment agreement or any other obligation with another employer that could affect your ability or eligibility to perform the job for which you are applying? If so, Please submit documentation along with your complete application"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style4">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
                                                        CssClass="rdbtn">
                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                        <asp:ListItem Value="No">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label14" runat="server" Text="Please explain in detail any gaps in your employment history"></asp:Label>
                                    </td>
                                    <td>
                                        </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="TextBox16" CssClass="txtboxMultiNotes" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                    
                                </tr>

                                <tr>
                                    <td class="auto-style5" >
                                        &nbsp;</td>
                                    <td style="float: left;" >
                                        <table>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>



                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lbl1" Text="Please provide any other information that you feel will help us in considering your application for employment:" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt111" CssClass="txtboxMultiNotes" runat="server"></asp:TextBox>
                                    </td>
                                </tr>


                                
                                 <tr>
                                    <td class="auto-style5" >
                                        <asp:Label ID="Label15" runat="server" Text="May we contact your current employer?"></asp:Label>
                                                    
                                    </td>
                                     <td align="left">
                                         <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                                        CssClass="rdbtn">
                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                        <asp:ListItem Value="No">No</asp:ListItem>
                                                    </asp:RadioButtonList>
                                     </td>
                                </tr>


                                
                            </table>

                        </td>
                    </tr>
                      <tr>
                        <td>
                            <table class="tbl" style="width: 900px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">
                                        <asp:Label ID="Label16" Text="References" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label17" runat="server" Text="Full Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox11" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label18" runat="server" Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox12" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label19" runat="server" Text="Company"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox13" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label21" runat="server" Text="Phone"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox14" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label22" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox15" CssClass="txtbox-lrg1" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>




                                <tr>
                                    <td colspan="4">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="right">
                                        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn" OnClick="btnNext_Click" />
                                        &nbsp;&nbsp;
                            <asp:Button ID="btnSkip" runat="server" CssClass="btn" Text="Skip"
                                CausesValidation="false" OnClick="btnSkip_Click" OnClientClick="return confirm('Are you sure you want to skip the form filling?');" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
                
</asp:Content>

