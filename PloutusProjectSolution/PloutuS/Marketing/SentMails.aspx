<%@ Page Title="Sent Mails" Language="C#" MasterPageFile="~/Marketing/InnerMasterEmp.master" AutoEventWireup="true" CodeFile="SentMails.aspx.cs" Inherits="Marketing_SentMails" %>
 <%@ MasterType VirtualPath="~/Marketing/InnerMasterEmp.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
<%---Hovering Tooltip on GridView----%>
<script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.tooltip.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function InitializeToolTip() {
            $(".gridViewToolTip").tooltip({
                track: true,
                delay: 0,
                showURL: false,
                fade: 100,
                bodyHandler: function () {
                    return $($(this).next().html());
                },
                showURL: false
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            InitializeToolTip();
        })
    </script>
    <script type="text/javascript">

        function pageLoad(sender, args) {
            if (args.get_isPartialLoad()) {
                InitializeToolTip();
            }
        }
    </script>
    <style type="text/css">
        #tooltip    {
            position: absolute;
             top: 0;
             left: 0;
            z-index: 3000;
            border: 1px solid #111;
            background-color: #fbecc2;
           padding: 5px;
           font-size: 10pt;
          font-family: Arial;
          color: #000000;
          padding: 10px 10px 10px 38px;
          width:300px;
          height:200px;
            }
        #tooltip h3, #tooltip div
        {  margin: 0;  }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            </td>
        </tr>
        <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            <table width="100%" border="0" align="left" class="tbl" style="border:1px solid #FEF7E5;border-bottom: 1px solid #FFC498;
                                                                            padding: 0px;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="25%" valign="middle" bgcolor="#FFC498" class="headding">
                                                                                   Sent Mails
                                                                                </td>
                                                                                <td width="31%" align="left" valign="top" style="padding: 0px;" bgcolor="#FEF7E5">
                                                                                    <img src="../images1/sub-head-corer.jpg" width="29" height="32" />
                                                                                </td>
                                                                                <td width="60%" style=" float:right;" class="mLinks" bgcolor="#FEF7E5">
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>
                
            </td>
        </tr>
          <tr align="center" style="height: 20px;">
            <td style="width: 100%;" colspan="3">
            </td>
        </tr>
       
<tr>
<td align="center">
    <asp:Label ID="lblMessage" runat="server" Text=" " Visible="false"></asp:Label></td>
</tr>
 <tr>
            <td align="left" style=" padding-left:60px; width: 80%;">
            <asp:Label ID="lblCounttext" Visible="false" Font-Bold="true" runat="server"> Total Mails :</asp:Label>
              
                <asp:Label ID="lblCount" ForeColor="#CC0000" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
        <td align="center">
         <asp:Panel ID="pnl" runat="server">
          <table  width="90%">
          <tr> <td>
        <%-- <div align="left" style="padding-left:10px; width:990px; height:400px; overflow:auto;"> --%>
                <asp:GridView ID="gvSentMails" runat="server" DataKeyNames="jsid" Width="100%" Height="60%" AutoGenerateColumns="false" 
                    CssClass="grid-box-bor" GridLines="None" HeaderStyle-Font-Bold="true"  ShowFooter="false" OnPageIndexChanging="gvdetails_PageIndexChanging" 
                    EmptyDataText="No Mails are Available" AllowPaging="true" PageSize="50">
                    <EmptyDataRowStyle HorizontalAlign="Center" CssClass="errmsg"></EmptyDataRowStyle>
                    <FooterStyle BackColor="#fce196" Font-Bold="True" ForeColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#fce196" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle CssClass="grig-text" />
                    <HeaderStyle CssClass="gridhead" />
                    <AlternatingRowStyle CssClass="alternate-color" />
                    <Columns>
                   
                        <asp:TemplateField HeaderText="Sno">
                            <ItemTemplate>
                            
                                <%#Container.DataItemIndex+1%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="center" Width="80px" />
                        </asp:TemplateField>
                        
                       
                        <asp:BoundField DataField="SendTo" HeaderText="To" ItemStyle-Width="150px">
                        <HeaderStyle HorizontalAlign="center" Width="100px" />
                        <ItemStyle HorizontalAlign="left" Width="100px" />
                             
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150px">
                        <HeaderStyle HorizontalAlign="center" Width="100px" />
                            <ItemStyle HorizontalAlign="left" Width="150px" />
                             
                        </asp:BoundField>
                        <asp:BoundField DataField="SendFrom" HeaderText="From" ItemStyle-Width="150px">
                        <HeaderStyle HorizontalAlign="center" Width="100px" />
                            <ItemStyle HorizontalAlign="left" Width="100px" /> 
                            
                        </asp:BoundField>
                        <asp:BoundField DataField="SendDt" HeaderText="Date" ItemStyle-Width="150px">
                         <HeaderStyle HorizontalAlign="center" Width="100px" />
                            <ItemStyle HorizontalAlign="left" Width="100px" /> 
                           
                        </asp:BoundField>
                       <%-- <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-Width="150px">
                            <ItemStyle HorizontalAlign="left" Width="300px" />
                            <HeaderStyle HorizontalAlign="left" Width="150px" />
                        </asp:BoundField>--%>
                         <asp:TemplateField HeaderText="Subject">
                            <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="../images/searchIcon.png" Width="20px" Height="20px" class="gridViewToolTip" style="text-decoration: none"/>
                           <%-- <a href="#" class="gridViewToolTip" style="text-decoration: none">Body</a>--%>
                         
                        <div id="tooltip" style="display: none;">
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("Subject")%>' tooltip='<%# Eval("Subject") %>' ></asp:Label> 
                            
                        </div>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="center" Width="80px" />
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Body">
                            <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="../images/searchIcon.png" Width="20px" Height="20px" class="gridViewToolTip" style="text-decoration: none"/>
                           <%-- <a href="#" class="gridViewToolTip" style="text-decoration: none">Body</a>--%>
                         
                        <div id="tooltip" style="display: none;">
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("Body")%>' tooltip='<%# Eval("Body") %>' ></asp:Label> 
                            
                        </div>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="center" Width="80px" />
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
                </td></tr>
                 </table>
                </asp:Panel>
               <%-- <i>You are viewing page
                <%=gvSentMails.PageIndex + 1%>
                   of
                 <%=gvSentMails.PageCount%>
               </i>
              </div>--%>
        
        </td>
        </tr>
        
</table>
 
  
</asp:Content>