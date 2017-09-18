<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="MerchantCompleteInfo.aspx.cs" Inherits="Marketing_MerchantCompleteInfo" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="100%" valign="top" style="padding-top: 0px; padding-bottom: 0px;" align="center">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="100%" style="padding: 0px; padding-top: 13px;" colspan="3" align="left">
                                        <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                            border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                    Client Details
                                                </td>
                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="38" />
                                                </td>
                                               <td width="60%" style=" float:right;" class="mLinks" align="right" bgcolor="#FEF7E5">
                                                                                    <asp:Button ID="btnedit" runat="server" OnClick="editdetails" CssClass="btn" CausesValidation="false"
                                                                                        Text="Edit" />
                                                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding: 0px;" width="100%">
                                        <asp:DataList ID="dlMemInfo" runat="server" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lable"
                                            AlternatingItemStyle-CssClass="gridbgwhite" Width="100%" ItemStyle-CssClass="gridbg">
                                            <ItemTemplate>
                                                <table cellpadding="0" width="100%" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style="padding: 0px;" width="100%">
                                                            <table width="100%" style="padding-bottom: 0px;" cellpadding="4" cellspacing="4">
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div>
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Company Name
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div class="subdiv2">
                                                                                <asp:Label ID="lblFname" Text=' <%# Eval("companyname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                            <%-- <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                                <asp:Label ID="lblLName" Text='<%# Eval("lname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                            <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                                <asp:Label ID="lblMName" Text='<%# Eval("mname") %>' runat="server"></asp:Label>
                                                                            </div>--%>
                                                                        </div>
                                                                    </td>
                                                                  <td style="width: 250px;">
                                                                        <div id="Div6" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Website
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label6" Text='<%# Eval("Website")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%--        <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="EmailDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Email   
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  :     </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:DataList ID="dlInnerEmail" runat="server">
                                                                                    <ItemTemplate>                                                                                 
                                                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email")%>'></asp:Label>
                                                                                    </ItemTemplate>                                                                                    
                                                                                    </asp:DataList>
                                                                               
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>--%>
                                                                <%--  <tr>  <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                 Email   </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label1" Text='<%# Eval("email")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>  </tr>
                                                                 <tr>  <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                 Mobile   </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left; text-align: left; padding-left: 5px;">
                                                                                <asp:Label ID="Label2" Text='<%# Eval("Mobile")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>  </tr>--%>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="Div1" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Email
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label3" Text='<%# Eval("email")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 250px;">
                                                                        <div id="Div3" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Contact Number
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label1" Text='<%# Eval("ContactNo")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="Div2" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Mobile
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label4" Text='<%# Eval("Mobile")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 250px;">
                                                                        <div id="Div4" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Category
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label2" Text='<%# Eval("Category")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%-- <tr>  <td>
                                                                        <div id="CellDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                 Mobile</div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  :</div>
                                                                                  </div>
                                                                            <div style="float: left;">
                                                                                <asp:DataList ID="dlInnerCell" runat="server">
                                                                                   <ItemTemplate>                                                                                
                                                                                        <asp:Label ID="lblCell" runat="server" Text='<%# Eval("Mobile")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </div>
                                                                        </div>                                                                      
                                                                    </td>
                                                                </tr>--%>
                                                                <%--  <tr>
                                                                    <td>
                                                                        <div id="TotalexpDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                Experience 
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                :</div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="lblExperience" Text='<%# Eval("Totalexp")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                 <tr>  <td>
                                                                        <div id="IndryDiv1" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                 1<sup>st</sup> Priority Industry</div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  :</div>
                                                                                 </div>
                                                                            <div style="float: left;">                                                                                                                                                               
                                                                               <asp:Label ID="lblIndstry1" runat="server" Text='<%# Eval("Industry")%>'></asp:Label>
                                                                                   
                                                                            </div>
                                                                        </div>                                                                      
                                                                    </td>
                                                                </tr>
                                                                 <tr>  <td>
                                                                        <div id="IndryDiv2" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                2<sup>nd</sup> Priority Industry</div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  :</div>
                                                                                  </div>
                                                                            <div style="float: left;">                                                                                                                                                               
                                                                               <asp:Label ID="lblIndstry2" runat="server" Text='<%# Eval("Industry2")%>'></asp:Label>
                                                                                   
                                                                            </div>
                                                                        </div>                                                                      
                                                                    </td>
                                                                </tr>
                                                                 <tr>  <td>
                                                                        <div id="IndryDiv3" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                              3<sup>rd</sup> Priority Industry</div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  :</div>
                                                                                  </div>
                                                                            <div style="float: left;">                                                                                                                                                              
                                                                               <asp:Label ID="lblIndstry3" runat="server" Text='<%# Eval("Industry3")%>'></asp:Label>
                                                                                   
                                                                            </div>
                                                                        </div>                                                                      
                                                                    </td>
                                                                </tr>--%>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="AddrDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Address
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="lblAddress" Text='<%# Eval("Address1")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td style="width: 250px;">
                                                                        <div id="Div5" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                    Contact Person
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="Label5" Text='<%# Eval("ContactPerson")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="StateDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                   Location
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:Label ID="lblState" Text='<%# Eval("state")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                   
                                                                </tr>
                                                                <%--  <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="CityDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               City         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="lblCity" Text='<%# Eval("city")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>--%>
                                                                <%-- <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="Div3" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Contact Number         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="Label1" Text='<%# Eval("ContactNo")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>--%>
                                                                <%--   <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="Div4" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Category         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="Label2" Text='<%# Eval("Category")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>--%>
                                                                <%-- <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="Div5" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Contact Person         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="Label5" Text='<%# Eval("ContactPerson")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>--%>
                                                                <%--                                                                    <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="Div6" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Website         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="Label6" Text='<%# Eval("Website")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>--%>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 10px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 10px;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%" style="padding: 0px;" colspan="3" align="left">
                                        <table width="100%" border="0" align="left" class="tbl" style="border: 1px solid #FEF7E5;
                                            border-bottom: 1px solid #FFC498; padding: 0px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                    Posted Jobs
                                                </td>
                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="38" />
                                                </td>
                                                <td align="right" style="float: right;" width="60%" class="mLinks" bgcolor="#FEF7E5">
                                                    &nbsp;
                                                </td>
                                                <td align="right">
                                                    <asp:Button ID="btnPostaJob" runat="server" Text="Post a Job" CssClass="btn" OnClick="btnPostaJob_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                          
                                                <td style="padding-top: 20px;" align="center">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                <td  style="padding-right:6%" align="right">
                                                    <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td align="center">
                                                <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 90%"
                                                        AlternatingItemStyle-CssClass="alternate-color" ItemStyle-CssClass="grig-text">
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" cellspacing="0" class="gridhead"  style="width: 100%; padding:0px;">
                                                                            <tr>
                                                                                <td colspan="2" align="left" class="sgrid-headiing-black" width="20%" style="padding: 5px;
                                                                                    padding-left: 20px;">
                                                                                    Job Position
                                                                                </td>
                                                                                <td colspan="2" align="left" class="lable" width="25%" style="padding: 5px;">
                                                                                    Location
                                                                                </td>
                                                                                <td align="left" class="lable" width="13%" style="padding: 5px;">
                                                                                    Experience
                                                                                </td>
                                                                                <td align="left" class="lable" width="14%" style="padding: 5px;">
                                                                                    Rate
                                                                         
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="padding-left: 5px; padding-right: 5px;">
                                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; padding: 0px;">
                                                                            <tr>
                                                                                <td colspan="2" align="left" class="lable" style="padding: 5px; padding-left: 20px;"
                                                                                    width="20%">
                                                                                    <%-- <asp:HyperLink ID="HyperLink1" runat="server" CssClass="sgrid-headiing-Green" NavigateUrl='<%# Eval("encryptid", "../Employer/ViewJobs.aspx?id={0}") %>'><%# Eval("JobTitle")%> </asp:HyperLink>--%>
                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="sgrid-headiing-Green" NavigateUrl='<%# String.Format("../Employer/EntViewJobs.aspx?id={0}&title={1}", Eval("encryptid"), Eval("jobid")) %>'><%# Eval("JobTitle")%> </asp:HyperLink>
                                                                                </td>
                                                                                <td colspan="2" align="left" class="lable" width="27%">
                                                                                    <%# Eval("Location")%>
                                                                                </td>
                                                                                <td align="left" class="lable" width="12%">
                                                                                    <%# Eval("exp")%>
                                                                                </td>
                                                                                <td align="left" class="lable" width="14%">
                                                                                    <%# Eval("Rate")%>
                                                                                </td>
                                                                                <%--  <td align="center" class="lable" width="10%" >
                                                                            <%# Eval("Totalexp")%>
                                                                         
                                                                            <asp:Label ID="lblJsID" Visible="false" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                                        </td>
                                                                        <td align="right" class="lable" width="15%" >
                                                                            <%# Eval("uploaddate")%>
                                                                        </td>--%>
                                                                            </tr>
                                                                            <tr>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                                </tr>
                                                </table>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table cellpadding="0" cellspacing="0" style="width: 90%">
                                                        <tr>
                                                            <td class="gridhead" align="right" style="padding-right:5px">
                                                                <table class="gridhead" cellpadding="0" cellspacing="0" border="0">
                                                                    <tr class="textnormal">
                                                                        <td align="right">
                                                                            <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;
                                                                        </td>
                                                                        <td align="center" valign="middle">
                                                                            <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                                                                OnItemDataBound="dlPaging_ItemDataBound">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton Font-Bold="true" Font-Names="Verdana" ID="lnkbtnPaging" runat="server"
                                                                                        CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                                                                </ItemTemplate>
                                                                            </asp:DataList>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false"
                                                                                OnClick="lbtnNext_Click">Next</asp:LinkButton>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
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
                                <tr>
                                    <td align="center">
                                        <asp:Panel ID="sub" runat="server" Visible="false">
                                            <asp:Label ID="lblJsID" ForeColor="Red" runat="server" Text='No Data To Display'></asp:Label>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                 <tr>
            <td> 
          
                <div id="x1">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#FEF7E5">
                       <asp:UpdatePanel ID="UpdatePanelEditDetails" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>                                                   
                    
                        <table cellpadding="0" cellspacing="0" class="tbl" width="80%">
       
        <tr> 
         <td class="errmsg" style="padding-left: 5px;">
                            &nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="* fields are mandatory"></asp:Label>
                        </td>
                        </tr>
               
                                 <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                 Edit Client  Details
                                                            </td>
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
                        <td>
                           <table class="tbl" width="900px" style="border-color:#FEF7E5;padding-left:100px;">
   
                      
                    <tr>
                        <td style=" width:210px;" >
                            Client Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompanyName" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                             <span class="errmsg">&nbsp;*</span>
                            <asp:RequiredFieldValidator ID="RequiredCompanyName" runat="server" ControlToValidate="txtCompanyName"
                                Display="None" ErrorMessage="Please enter the Enterprise name" 
                                SetFocusOnError="true" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            <asp:validatorcalloutextender ID="vcCompanyNamess" runat="server" 
                                TargetControlID="RequiredCompanyName">
                            </asp:validatorcalloutextender>
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Client Category
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlboxs">
                            </asp:DropDownList>
                           
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Website
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebSite" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                            
                            
                            

                        </td>
                    </tr>
                    
                    
                    
                    
                    
                    
                </table>
                        </td>
                    </tr>
                    <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                  Mailling Address
                                                            </td>
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
                        <td>
                          <table class="tbl" width="900px"" style="border-color:#FEF7E5;padding-left:100px;">


                       
                    <tr>
                        <td style=" width:210px;" valign="top" >
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdd1" CssClass="lstboxlrg" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
                         
                        </td>
                    </tr>
                  
                    <tr>
                        <td style=" width:210px;" >
                           Location
                        </td>
                        <td>
                          <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddlboxs" AutoPostBack="true" onselectedindexchanged="ddlLocation_SelectedIndexChanged" 
                                 > </asp:DropDownList>

                        <span class="errmsg">&nbsp;*</span>
                                   <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Please select Location"
                                                    ControlToValidate="ddlLocation" Display="None" SetFocusOnError="true" InitialValue="--Select--"
                                                    ValidationGroup="Job"></asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="vceLocation" runat="server" TargetControlID="rfvLocation"></asp:ValidatorCalloutExtender>
                                                                     
                      
                        </td>
                    </tr>
                    <tr>
                    <td style=" width:210px;" >
                          
                        </td>
                    <td>
                        <asp:TextBox ID="txtNewLoaction" runat="server" CssClass="txtbox-lrg1" Visible="false"></asp:TextBox>
                     </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Zip Code
                        </td>
                        <td>
                            <asp:TextBox ID="txtZip" CssClass="txtbox-lrg1" runat="server" MaxLength="5"></asp:TextBox>
                      
                            


                        </td>
                    </tr>
                </table> 
                        </td>
                    </tr>
      
         
               
                      <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                 Contact Info
                                                            </td>
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
                        <td >
                           <table class="tbl" width="900px" style="border-color:#FEF7E5;padding-left:100px;">
                
                       
                    
                    <tr>
                        <td style=" width:210px;" >
                            Contact Person
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtContact" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="50"></asp:TextBox>
                         
                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Contact Number
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtContactNumber" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                         

                        </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                           Mobile
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtMobile" CssClass="txtbox-lrg1" runat="server" 
                                MaxLength="13"></asp:TextBox>
                  

                            </td>
                    </tr>
                    <tr>
                        <td style=" width:210px;" >
                            Email Address
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtEmail" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                         
                        </td>
                    </tr>
                       <tr><td></td>
                        <td align="left">
                           <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn"  
                                ValidationGroup="Reg" onclick="btnUpdate_Click" 
                               
                             /> &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn" OnClientClick="return MPeditClose();"  CausesValidation="False"  /> 
                               
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label ID="lblsuccess" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                </table>
                        </td>
                    </tr>

                 
               
               </table>
                        </ContentTemplate>
                         
                 </asp:UpdatePanel>
                    </asp:Panel>
                </div>
               
                <asp:HiddenField ID="hdn1" runat="server" />
                <asp:ModalPopupExtender ID="mpedit" runat="server" TargetControlID="hdn1" PopupControlID="x1"
                    BackgroundCssClass="Inactive" CancelControlID="btnCancel">
                </asp:ModalPopupExtender>
                
            </td>
        </tr>
                                <tr>
                                    <td align="right">
                                        <%--  <asp:Button ID="btnPosted" runat="server" Width="100px" Text="Post a Job" CssClass="btn"  />--%>
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
