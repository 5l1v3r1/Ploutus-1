<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true" CodeFile="EmergencyInfo_Education.aspx.cs" Inherits="EmergencyInfo_Education" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                                        <asp:Label ID="Label29" Text="Emergency Contact Information" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <asp:Label ID="lblMsg" runat="server" CssClass="errmsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr> <td style="width:500px">  <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="txtEmergencyName" CssClass="txtbox-lrg1"  runat="server" MaxLength="100" ></asp:TextBox>
                                    </td>
                              
                                </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRelation" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="PhoneNum"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmergencyPhoneNum" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                               
                               <%--<tr> <td>  <asp:Label ID="Label12" runat="server" Text="Alternate Name"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="txtAltName" CssClass="txtbox" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                              
                                </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAltRel" CssClass="txtbox" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="PhoneNum"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAltPh" CssClass="txtbox" runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>--%>
                         
                                    
                                <tr>
                                    <td colspan="4">&nbsp;
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
                                        <asp:Label ID="Label15" Text="Education Details" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <asp:Label ID="Label16" runat="server" CssClass="errmsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr> <td style="width:500px;">  <asp:Label ID="Label17" runat="server" Text="Highest Level of  Education"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="210px" >
                                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">None</asp:ListItem>
                                            <asp:ListItem Value="2">GED</asp:ListItem>
                                            <asp:ListItem Value="3">High School</asp:ListItem>
                                            <asp:ListItem Value="4">Vocational School</asp:ListItem>
                                            <asp:ListItem Value="5">Associate Degree</asp:ListItem>
                                            <asp:ListItem Value="6">Bachelors Degree</asp:ListItem>
                                            <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                                            <asp:ListItem Value="8">Doctorate</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                              
                                </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="College name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="Course of Study"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                               
                               <tr> <td>  <asp:Label ID="Label21" runat="server" Text="Graduated?"></asp:Label>
                                    </td>
                                    <td align="left" >
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                           <%-- CssClass="rdbtn">--%>
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                              
                                </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label22" runat="server" Text="Year Graduated"></asp:Label>
                                    </td>
                                    <td>
                                         <asp:DropDownList ID="DropDownList4" runat="server"  Width="210px">                                          
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" Text="Diploma/Degree:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox10" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>

                                   <tr>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="Describe any specialized training, apprenticeships, licenses or skills:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>

                                   <tr>
                                    <td>
                                        <asp:Label ID="Label26" runat="server" Text="Have you received any job-related training in the United States Military?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox8" CssClass="txtbox-lrg1"  runat="server" MaxLength="100"></asp:TextBox>
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
                            
                         <%--   <table class="tbl" style="width: 900px;" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">
                                        <asp:Label ID="Label20" runat="server" Text="Education Details"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                           <asp:Label ID="Label4" runat="server" Text="Highest Level of  Education"></asp:Label>
                                    </td>
                                    <td>
                                         <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddlboxlrg">
                                            <asp:ListItem Value="-1">Select Highest Education Level</asp:ListItem>
                                            <asp:ListItem Value="1">None</asp:ListItem>
                                            <asp:ListItem Value="2">GED</asp:ListItem>
                                            <asp:ListItem Value="3">High School</asp:ListItem>
                                            <asp:ListItem Value="4">Vocational School</asp:ListItem>
                                            <asp:ListItem Value="5">Associate Degree</asp:ListItem>
                                            <asp:ListItem Value="6">Bachelors Degree</asp:ListItem>
                                            <asp:ListItem Value="7">Masters Degree</asp:ListItem>
                                            <asp:ListItem Value="8">Doctorate</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="College name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="text1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Course of Study"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                        <td >&nbsp;<asp:Label ID="Label7" runat="server" Text="Graduated?"></asp:Label>
                        </td>
                        <td style="float: left;">
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
                                    <td>
                                           <asp:Label ID="Label8" runat="server" Text="Year Graduated"></asp:Label>
                                    </td>
                                    <td>
                                         <asp:DropDownList ID="DropDownList2" runat="server" CssClass="ddlboxlrg">                                          
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Diploma/Degree:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        
                                        <asp:Label ID="Label10" runat="server" Text="Describe any specialized training, apprenticeships, licenses or skills: "></asp:Label>
                                       
                                    </td>
                                    <td>
                                          <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        
                                        <asp:Label ID="Label11" runat="server" Text="Have you received any job-related training in the United States Military?"></asp:Label>
                                       
                                    </td>
                                    <td>
                                          <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                             
                                 
                                <tr>
                                    <td colspan="2">&nbsp;
                                    </td>
                                </tr>
                            </table>--%>
                        </td>
                    </tr>
                   
                   
                 
                     <tr>
                        <td colspan="4" align="right">
                            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn" OnClick="btnNext_Click"  />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnSkip" runat="server" CssClass="btn"  Text="Skip"
                                CausesValidation="false" OnClick="btnSkip_Click" OnClientClick="return confirm('Are you sure you want to skip the form filling?');" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>    
</asp:Content>

