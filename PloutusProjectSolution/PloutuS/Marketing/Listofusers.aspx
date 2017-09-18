<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master"
    AutoEventWireup="true" CodeFile="Listofusers.aspx.cs" ValidateRequest="false"
    Inherits="Marketing_Listofusers" %>
    <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" EnableViewState="false"
    runat="Server">

      


      <script type="text/javascript">
          function MPViewResumeClose() {

              // close the modal popup
              $('<%= mpViewResume.ClientID %>').hide();

              // return true so that submit will happen
              return true;
          }

          function MPeditClose() {
              
              // close the modal popup
              $('<%=mpedit.ClientID %>').hide();
              
              // return true so that submit will happen
              return true;
          }
          function MPActivityClose() {

              // close the modal popup
              $('<%=AddActiveModalPopup.ClientID %>').hide();

              // return true so that submit will happen
              return true;
          }

    </script>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">      
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="center">
                            <div class="subdiv">
                                <div style="float: left; text-align: center; font-weight: 700;" class="subdiv">
                                    <asp:Label ID="lblMemInfo" runat="server" ForeColor="Red" Font-Size="14px" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <div class="subdiv">
                                <div style="float: left; text-align: center; font-weight: 700;" class="subdiv">
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" valign="top" style="padding-top: 0px; padding-bottom: 0px;" align="center">
                            <table cellpadding="0" cellspacing="0" width="100%">
                             <tr>
                                                                    <td width="100%" style=" padding:0px;"  colspan="3" align="left">
                                                                        <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                    Schedule Activities
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="38" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    <asp:Button ID="btnedit" runat="server"  CssClass="btn" 
                                                                                        CausesValidation="false" Text="Edit" onclick="btnedit_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                <tr>
                                    <td align="left" style=" padding:0px;" width="100%">
                                        <asp:DataList ID="dlMemInfo" runat="server" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="lable"
                                            AlternatingItemStyle-CssClass="gridbgwhite" Width="100%" ItemStyle-CssClass="gridbg" OnDataBinding="dlMemInfo_DataBinding"
                                            OnItemDataBound="dlMemInfo_ItemDataBound">
                                            <ItemTemplate>
                                                <table cellpadding="0" width="100%" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style=" padding:0px;" width="100%">
                                                            <table width="100%"  style="padding-bottom: 0px;" cellpadding="4" cellspacing="4">
                                                               
                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div>
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                Name
                                                                                   
                                                                                    
                                                                                  </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                    :</div>
                                                                            </div>
                                                                            <div class="subdiv2">
                                                                                <asp:Label ID="lblFname" Text=' <%# Eval("fname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                            <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                                <asp:Label ID="lblLName" Text='<%# Eval("lname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                            <div style="float: left; padding-right: 3px; padding-left: 4px;">
                                                                                <asp:Label ID="lblMName" Text='<%# Eval("mname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>  
                                                                    </tr>

                                                                    <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="EmailDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Email  <%-- <asp:Label ID="lblEmail1" runat="server" Text="Email"></asp:Label> --%>    
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                  : <%--<asp:Label ID="lblc1" runat="server" Text=":"></asp:Label>  --%>    </div>
                                                                            </div>
                                                                            <div style="float: left;">
                                                                                <asp:DataList ID="dlInnerEmail" runat="server">
                                                                                    <ItemTemplate>                                                                                 
                                                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("emailid1")%>'></asp:Label>
                                                                                    </ItemTemplate>                                                                                    
                                                                                    </asp:DataList>
                                                                               
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%-- <tr>  <td>
                                                                        <div>
                                                                            <div style="float: left; width: 100px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 90px;">
                                                                                 Mobile   </div>
                                                                                <div style="float: left; width: 10px;">
                                                                                    :
                                                                                </div>
                                                                            </div>
                                                                            <div style="float: left; text-align: left; padding-left: 5px;">
                                                                                <asp:Label ID="Label2" Text='<%# Eval("mobile")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>  </tr>--%>
                                                                  <tr>  <td>
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
                                                                                        <asp:Label ID="lblCell" runat="server" Text='<%# Eval("emailid1")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:DataList>
                                                                            </div>
                                                                        </div>                                                                      
                                                                    </td>
                                                                </tr>
                                                                <tr>
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
                                                                </tr>

                                                                <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="AddrDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width:150px;">
                                                                                 Address  
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                   :</div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                                                                                                
                                                                               <asp:Label ID="lblAddress" Text='<%# Eval("Address")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 250px;">
                                                                        <div id="StateDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                                State 
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                :</div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="lblState" Text='<%# Eval("State")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                     <tr>
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
                                                                                <asp:Label ID="lblCity" Text='<%# Eval("City")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                     <tr>
                                                                    <td style="width: 250px;">
                                                                       <div id="ClientDiv" runat="server">
                                                                            <div style="float: left; width: 200px; text-align: left; padding-left: 5px; font-weight: 700;">
                                                                                <div style="float: left; width: 150px;">
                                                                               Client         
                                                                                </div>
                                                                                <div style="float: left; width: 50px;">
                                                                                 : </div>
                                                                            </div>
                                                                            <div style="float: left;">                                                                        
                                                                                <asp:Label ID="Label1" Text='<%# Eval("ClientName")%>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    </tr>
                                                                    
                                                               
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
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table cellpadding="0" cellspacing="0" border="0px" width="100%">
                                <tr>
                                    <td style=" padding:0px;"  align="left">
                                        <table width="100%" 
                                       cellpadding="0" cellspacing="0"  border="0">
                                            <tr>
                                                <td colspan="3">
                                                    <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                View Resume
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
                                                <%--<td valign="top" style="width: 220px;">
                                                                Copy Resume
                                                            </td>--%>
                                                <td style="  width:80%;">
                                                <%--    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>--%>
                                                            <div id="DisplayResume" runat="server" style="height: 400px; padding:20px; width:80%; background-color: White;
                                                                overflow: scroll; padding: 30px; padding-top: 5px;">
                                                            </div>
                                                       <%-- </ContentTemplate>
                                                    </asp:UpdatePanel>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <table width="85%">
                                                        <tr>
                                                            <td style="padding-left: 10px; padding-top:20px; padding-bottom:20px;" align="left">
                                                                <asp:LinkButton ID="lnkbtnDResume" runat="server" CausesValidation="false" 
                                                                    OnClick="lnkbtnDResume_Click" Visible="False">Download Resume</asp:LinkButton>
                                                            </td>
                                                            <td style="padding-right: 40px" align="center">

                                                            </td>
                                                            <td align="right">
                           <asp:LinkButton ID="lnkbtnUpdateResume" runat="server" CausesValidation="false" 
                                                                    OnClick="lnkbtnUpdateResume_Click" Visible="False">Edit Resume</asp:LinkButton>
                                                                    
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                                        <td>CSS(Certified):<asp:CheckBox ID="chkCSS" runat="server" Checked="false"/> 
                                                           
                                                       &nbsp;&nbsp; CPS Certified:<asp:CheckBox ID="chkCPS" runat="server" Checked="false" /></td>
                                                        </tr>--%>
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
                          <td >
                               <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             Activities
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
                        <td style="padding-top: 20px;" align="center">
                            <table width="100%">
                                <tr>
                                    <td align="center" colspan="2">
                                        <table width="100%"  cellpadding="0" cellspacing="0" border="0">
                                           
                                            <tr>
                                                <td style="padding-top: 10px; padding-bottom: 10px; padding-left:10px;" align="left">
                                                    <asp:GridView ID="grdActivities" GridLines="None" Width="100%" runat="server" AutoGenerateColumns="False"
                                                        EmptyDataText="No activities yet">
                                                        <AlternatingRowStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    Sno.
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="typeofact" HeaderText="Activity">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="notes" HeaderText="status">
                                                                <HeaderStyle HorizontalAlign="left" />
                                                                <ItemStyle HorizontalAlign="left" Width="68%" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="insertdt" HeaderText="CreatedDate">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Edit">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" Text="Edit"
                                                                        OnClick="edit"></asp:LinkButton></ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkView" runat="server" CausesValidation="false" Text="View"
                                                                        OnClick="view"></asp:LinkButton></ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                         <EmptyDataRowStyle HorizontalAlign="Center" CssClass="errmsg"></EmptyDataRowStyle>
                        <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="White" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" CssClass="grig-text" />
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridhead" />
                        <AlternatingRowStyle CssClass="alternate-color" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 10px;" align="right">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblstatus" runat="server"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnAddActive" runat="server" CausesValidation="false" Text="Add New Activity" OnClick="btnAddActivity_Click" />
                                            
                                    </td>
                                   <%-- <td align="right">
                                        <asp:Button ID="btnAccept" Visible="false" runat="server" CausesValidation="false"
                                            Text="Accept Profile" OnClick="btnAccept_Click" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnReject" Visible="false" runat="server" CausesValidation="false"
                                            Text="Reject Profile" OnClick="btnReject_Click" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnHold" Visible="false" runat="server" CausesValidation="false"
                                            Text="Hold Profile" OnClick="btnHold_Click" />
                                    </td>--%>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <table width="100%">
                                <tr>
                                    <td class="boxhead" align="right">
                                  <asp:LinkButton ID="lnkbtnBack" OnClientClick="history.go(-1);" runat="server">Back</asp:LinkButton>
                                     <%--<asp:LinkButton ID="lnkbtnBack"  runat="server" Onclick="lnkbtnBack_Click" >Back</asp:LinkButton>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 100px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                         
                <div id="AddActivityDiv1" style="display: none">
                    <asp:Panel ID="Panel2" runat="server" BackColor="#FEF7E5">
                    <asp:UpdatePanel ID="UpdatePanel_AddActivity" runat="server" UpdateMode="Always">
                          <ContentTemplate>
                        <table cellpadding="5" cellspacing="5" border="0">
                       <tr>
                      <td colspan="3">
                          <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             <asp:Label ID="lblActivityTitle" Text=" " runat="server"></asp:Label>
                                                              
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
                        <td align="center">
                            <table cellpadding="0" cellspacing="0"  width="100%">
                                <tr>
                                    <td align="left">
                                        <table width="100%" cellpadding="4" cellspacing="4" border="0">
                                          
                                            <tr>
                                                <td style="padding-top: 10px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    Type of Activity
                                                </td>
                                                <td align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="ddlActivities" runat="server" Width="152px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>                                         
                                            <tr>
                                                <td style="padding-left: 10px;" valign="top" align="left">
                                                    Notes
                                                </td>
                                                <td valign="top" align="center">
                                                    :
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtNotes" TextMode="MultiLine" MaxLength="999" runat="server" Height="170px"
                                                        Width="400px"></asp:TextBox>
                                                    <asp:Label ID="lblmaxlength" runat="server" Text="(Max Length 1000)" Font-Size="XX-Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Save Activity" CausesValidation="false" OnClick="btnSubmit_Click" />
                                                        
                                                         &nbsp;&nbsp;&nbsp;&nbsp;
                                              <asp:Button ID="btnCancel1" runat="server" Text="Cancel" OnClientClick="return MPActivityClose();"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lblActMsg" ForeColor="Green" runat="server"></asp:Label>
                                                </td>
                                            </tr>                                         
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    </table>
                   </ContentTemplate>
                               <%--<Triggers>
                         <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
                                 <asp:PostBackTrigger ControlID="btnSubmit" />
                                </Triggers>--%>
                  </asp:UpdatePanel>
                    </asp:Panel>
                </div>    
                                                                            
                <asp:HiddenField ID="ActiveHidf1" runat="server" />            
                <asp:ModalPopupExtender ID="AddActiveModalPopup" runat="server" TargetControlID="ActiveHidf1" PopupControlID="AddActivityDiv1"
                    BackgroundCssClass="Inactive" CancelControlID="btnCancel1">
                </asp:ModalPopupExtender>
           
            </td>
        </tr>

    <%--    <tr>
            <td>
                <div id="x" style="display: none">
                    <asp:Panel ID="pnl" runat="server" BackColor="#E6E6EF">
                        <table cellpadding="5" cellspacing="5" border="0">
                            <tr>
                                <td colspan="3" align="center">
                                    <b>Activity Info</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Type of Activity
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlactvities1" runat="server" Width="150px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Notes
                                </td>
                                <td align="center">
                                    :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtNotes1"  TextMode="MultiLine" runat="server" Height="210px" Width="435px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="3">
                                    <asp:Button ID="btnupdate" CausesValidation="false" runat="server" Text="Update"
                                        OnClick="Update" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                </td>
                            </tr>
                              <tr>
                                <td align="right" colspan="3">
                                    <asp:Label ID="lbldone" runat="server" ForeColor="Green" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <asp:HiddenField ID="hdn" runat="server" />
            
                <asp:ModalPopupExtender ID="mpeshow" runat="server" TargetControlID="hdn" PopupControlID="x"
                    BackgroundCssClass="Inactive" CancelControlID="btncancel">
                </asp:ModalPopupExtender>
            </td>
        </tr>--%>
        <tr>
            <td> 
          
                <div id="x1">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#FEF7E5">
                       <asp:UpdatePanel ID="UpdatePanelEditDetails" runat="server" UpdateMode="Conditional" 
                 ChildrenAsTriggers="True">
                        <ContentTemplate>                                                   
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             Edit Details
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
                                <td style="padding-left: 50px; padding-right: 50px;">
                                    <table cellspacing="5" cellpadding="5" style="width: 700px;" border="0">
                                        <tr>
                                            <td align="left" style="width: 220px;">
                                                Name
                                            </td>
                                            <td align="left" style="width: 260px; padding: 0px;">
                                                <asp:TextBox ID="txtFName" CssClass="txtbox-lrg1" Width="250px" MaxLength="100" runat="server"
                                                    TabIndex="1"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <span class="errmsg">&nbsp;*&nbsp;</span>
                                                <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ControlToValidate="txtFName"
                                                    Display="None" ErrorMessage="Please enter the First name" SetFocusOnError="true"
                                                    CssClass="errmsg"></asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="RequiredFName">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 220px;" align="left" valign="top">
                                                Mobile Number
                                            </td>
                                            <td  colspan="3" align="left" style="padding: 0px;">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                <asp:Repeater ID="repContactNum" runat="server" OnItemCommand="repContactNum_ItemCommand">
                                                    <ItemTemplate>
                                                        <table  cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                 <asp:TextBox ID="txtCellNumber" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("cell") %>'
                                                                        CssClass="txtbox-lrg1" TabIndex="2"></asp:TextBox>
                                                                </td>
                                                                <td style=" padding:10px;">
                                                                    <asp:ImageButton ID="ImageContactNum" runat="server" ImageUrl="~/images/close.jpg"
                                                                        CausesValidation="false" CommandName="DeleteRows" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                                        CssClass="txtbox-s1" CommandName="AddRows" TabIndex="7" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                              </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 220px;" align="left" valign="top">
                                                Email
                                            </td>
                                            <td align="left" colspan="3" cellpadding="0" cellspacing="0" style="padding: 0px;">
                                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Repeater ID="repeater1" runat="server" OnItemCommand="repeater1_ItemCommand">
                                                            <ItemTemplate>
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="txtEmail" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("email") %>'
                                                                                CssClass="txtbox-lrg1" TabIndex="3"></asp:TextBox>
                                                                        </td>
                                                                        <td style=" padding:10px;">
                                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/close.jpg" CausesValidation="false"
                                                                                CommandName="DeleteRows" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="btnAddRows" CausesValidation="false" runat="server" Text=" Add "
                                                                                CssClass="txtbox-s1" CommandName="AddRows" TabIndex="7" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                              </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Experience
                                            </td>
                                            <td align="left" valign="middle" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlYearsExp"  Width="70px" runat="server" TabIndex="4">
                                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                    <asp:ListItem Value="13">13</asp:ListItem>
                                                    <asp:ListItem Value="14">14</asp:ListItem>
                                                    <asp:ListItem Value="15">15</asp:ListItem>
                                                    <asp:ListItem Value="16">16</asp:ListItem>
                                                    <asp:ListItem Value="17">17</asp:ListItem>
                                                    <asp:ListItem Value="18">18</asp:ListItem>
                                                    <asp:ListItem Value="19">19</asp:ListItem>
                                                    <asp:ListItem Value="20">20</asp:ListItem>
                                                    <asp:ListItem Value="21">21</asp:ListItem>
                                                    <asp:ListItem Value="22">22</asp:ListItem>
                                                    <asp:ListItem Value="23">23</asp:ListItem>
                                                    <asp:ListItem Value="24">24</asp:ListItem>
                                                    <asp:ListItem Value="25">25</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;
                                                <asp:Label ID="Label27" runat="server" Text="(Years) " CssClass="lbl"></asp:Label>
                                                <asp:DropDownList ID="ddlMonthsExp" Width="70px"  runat="server" TabIndex="5">
                                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;<asp:Label ID="Label28" runat="server" Text="(Months) " CssClass="lbl"></asp:Label>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                1<sup>st</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustries1" runat="server" Height="22px" TabIndex="6" CssClass="ddlboxlrg">
                                                </asp:DropDownList>
                                                
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                2<sup>nd</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustries2" runat="server" Height="22px" CssClass="ddlboxlrg" TabIndex="7">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                3<sup>rd</sup> Priority Industry
                                            </td>
                                            <td align="left" colspan="3" style="padding: 0px;">
                                                <asp:DropDownList ID="ddlIndustry3" runat="server" Height="22px" CssClass="ddlboxlrg" TabIndex="8">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                        <td align="left">
                                                Certified In
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">CSS:&nbsp;<asp:CheckBox ID="chkCSS" runat="server" Checked="false" TabIndex="9"/> 
                                                           
                                                       &nbsp;&nbsp; CPS:&nbsp; <asp:CheckBox ID="chkCPS" runat="server" Checked="false" TabIndex="10"/></td>
                                         </tr>--%>
                                         <tr>
                                        <td align="left" valign="top">
                                              Address
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                         <asp:TextBox ID="txtAddress" TextMode="MultiLine" Height="60px"  MaxLength="80" runat="server" Text='<%# Eval("Address") %>'
                                                                                    CssClass="txtbox-lrg" TabIndex="11"></asp:TextBox>
                                                       
                                                       
                                         </td>
                                          </tr>

                                          
                                         <tr>
                                        <td align="left">
                                              State
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                        
                                         <asp:DropDownList ID="ddlstate" runat="server" Height="22px"
                                                CssClass="ddlboxlrg" data-live-search="true" >
                                         </asp:DropDownList>  
                                            
                                          <%-- <asp:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState"
                                                LoadingText="Loading States..." PromptText="Select State"
                                                ServiceMethod="BindState" ServicePath="~/LoadDDLWebService.asmx">
                                           </asp:CascadingDropDown>--%>
                                       
                                               
                                         </td>
                                          </tr>
                                         <tr>
                                        <td align="left">
                                              City
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">
                                        <%-- <asp:TextBox ID="txtCity" Width="250px" MaxLength="80" runat="server" Text='<%# Eval("City") %>'
                                                                                CssClass="txtbox-lrg1" TabIndex="7"></asp:TextBox>      --%>                                               
                                             <asp:DropDownList ID="ddlCities" runat="server" Height="22px"  CssClass="ddlboxlrg" data-live-search="true">
                                            </asp:DropDownList> 
                                            <%--<asp:CascadingDropDown ID="CityCascading" runat="server" Category="Region"
                                            TargetControlID="ddlCities" ParentControlID="ddlState" LoadingText="Loading Cities..."
                                            PromptText="select" ServiceMethod="BindCity" ServicePath="~/LoadDDLWebService.asmx">
                                          </asp:CascadingDropDown>--%>
        
                                         </td>
                                          </tr>
                                           <tr>
                                        <td align="left">
                                             Client
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">                                                                               
                                             <asp:DropDownList ID="ddlClient" runat="server" Height="22px"  
                                                 CssClass="ddlboxlrg" data-live-search="true" AutoPostBack="True" 
                                                 onselectedindexchanged="ddlClient_SelectedIndexChanged">
                                            </asp:DropDownList>                                                  
                                         </td>
                                         
                                          </tr>
                                          <tr>
                                           <td align="left">
                                             <asp:Label ID="lblJob" runat="server" Text="Job Position"></asp:Label>
                                         </td >
                                        <td align="left" colspan="3" style="padding: 0px;">                                                                               
                                             <asp:DropDownList ID="ddlJobPosition" runat="server" Height="22px"  CssClass="ddlboxlrg" data-live-search="true">
                                            </asp:DropDownList>                                                  
                                         </td>
                                          </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="left" colspan="3" style=" padding:0px; padding-top:20px;">
            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn" Width="99px" CausesValidation="true" OnClick="btnSave_Click" />
                                                    
                                                &nbsp;
          <asp:Button ID="Button2" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn" Width="99px" OnClientClick="return MPeditClose();" />
                                                    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="lblsucess" runat="server" ForeColor="Green"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2" style="padding-right: 30px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td style=" height:10px;"></td></tr>
                        </table>
                        </ContentTemplate>
                          <%--  <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" /> 
                        <asp:AsyncPostBackTrigger ControlID="ddlstate" EventName="ddlstate_SelectedIndexChanged" />
                         <asp:PostBackTrigger ControlID="btnSave" />
                          </Triggers>--%>
                 </asp:UpdatePanel>
                    </asp:Panel>
                </div>
               
                <asp:HiddenField ID="hdn1" runat="server" />
                <asp:ModalPopupExtender ID="mpedit" runat="server" TargetControlID="hdn1" PopupControlID="x1" 
                    BackgroundCssClass="Inactive" CancelControlID="Button2">
                </asp:ModalPopupExtender>
                
            </td>
        </tr>
        <tr>
            <td align="center">
             
                <div id="Div2">
               
                    <asp:Panel ID="Panel1" runat="server" BackColor="White"> 
                     <asp:UpdatePanel ID="UpdatePanel_ResumeView" runat="server">
                    <ContentTemplate>          
                        <table style="height: 450px; width: 100%;">
                         <tr>
                                <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                                <table width="100%" border="0" align="left" class="tbl" style=" border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                        padding: 0px;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                             Resume
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
                                <td style="padding: 5px; text-align:left;" align="center">
                                    <asp:TextBox ID="txtViewResume" runat="server" TextMode="MultiLine" Width="700px" Height="480px" ></asp:TextBox>
                                                                 
                                    <asp:HtmlEditorExtender ID="htmlViewResume" runat="server" TargetControlID="txtViewResume" EnableSanitization="false">                                       
                                    </asp:HtmlEditorExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblresumeMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; padding-right: 150px;" colspan="3" align="right">
                                    <asp:Button ID="btnUpdateResume" runat="server" CausesValidation="false" OnClick="UpdateResume" Text="Update"/>&nbsp;&nbsp;                                      
                                    <asp:Button ID="btnVRCancel" runat="server" CausesValidation="false"  Text="Close" OnClientClick="return MPViewResumeClose();"/>
                                </td>
                                <td align="right">
                                </td>
                            </tr>
                        </table>
                         </ContentTemplate>
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnUpdateResume" EventName="Click" /> 
                          <%--  <asp:PostBackTrigger ControlID="btnUpdateResume" />--%>
                       </Triggers>
                 </asp:UpdatePanel>
                     
                 </asp:Panel>                    
                </div>
               
                <asp:HiddenField ID="hfViewResume" runat="server" />
                <asp:ModalPopupExtender ID="mpViewResume" runat="server" TargetControlID="hfViewResume"
                    PopupControlID="Div2" BackgroundCssClass="Inactive" CancelControlID="btnVRCancel" DropShadow="true">
                </asp:ModalPopupExtender>
                
            </td>
        </tr>
    </table>

    
</asp:Content>
