<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/InnerMaster.master" AutoEventWireup="true"
    CodeFile="JobAlert.aspx.cs" Inherits="JobAlert" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="text-align: left; height: 630px; padding-top: 20px; width: 100%; padding-bottom: 30px;"
        class="tbl" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td align="center" style="padding-top: 20px; padding-bottom: 30px; width: 1021px;"
                class="headding1">
                <asp:Label ID="lblHeading" Text="Create Ploutos Job Alert" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px; width: 1021px;" align="center">
                <table class="tbl" cellpadding="0" cellspacing="0" border="0" align="center" style="width: 924px;border-color:#FFC498">
                    <tr>
                        <td colspan="2" class="org-shearder-bgNew" align="center">
                            <asp:Label ID="lblJobAlert" runat="server">Job Alert</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblmsg" runat="server" CssClass="errmsg"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px">
                        <td style="width: 200px; padding-left: 20px;">
                            Keyword(s)
                        </td>
                        <td style="padding-right: 20px;">
                            <asp:TextBox ID="txtKeywords" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Keyword"
                                ControlToValidate="txtKeywords" CssClass="errmsg"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            Location
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddlboxlrg">
                                <asp:ListItem Value="Select" Selected="False"></asp:ListItem>
                                <asp:ListItem Value="Alabama"></asp:ListItem>
                                <asp:ListItem Value="Alaska"></asp:ListItem>
                                <asp:ListItem Value="Arizona"></asp:ListItem>
                                <asp:ListItem Value="Arkansas"></asp:ListItem>
                                <asp:ListItem Value="California"></asp:ListItem>
                                <asp:ListItem Value="Colorado"></asp:ListItem>
                                <asp:ListItem Value="Connecticut"></asp:ListItem>
                                <asp:ListItem Value="Delaware"></asp:ListItem>
                                <asp:ListItem Value="Florida"></asp:ListItem>
                                <asp:ListItem Value="Georgia"></asp:ListItem>
                                <asp:ListItem Value="Hawaii"></asp:ListItem>
                                <asp:ListItem Value="Idaho"></asp:ListItem>
                                <asp:ListItem Value="Illinois"></asp:ListItem>
                                <asp:ListItem Value="Indiana"></asp:ListItem>
                                <asp:ListItem Value="Iowa"></asp:ListItem>
                                <asp:ListItem Value="Kansas"></asp:ListItem>
                                <asp:ListItem Value="Kentucky"></asp:ListItem>
                                <asp:ListItem Value="Louisiana"></asp:ListItem>
                                <asp:ListItem Value="Maine"></asp:ListItem>
                                <asp:ListItem Value="Maryland"></asp:ListItem>
                                <asp:ListItem Value="Massachusetts"></asp:ListItem>
                                <asp:ListItem Value="Michigan"></asp:ListItem>
                                <asp:ListItem Value="Minnesota"></asp:ListItem>
                                <asp:ListItem Value="Mississippi"></asp:ListItem>
                                <asp:ListItem Value="Missouri"></asp:ListItem>
                                <asp:ListItem Value="Montana"></asp:ListItem>
                                <asp:ListItem Value="Nebraska"></asp:ListItem>
                                <asp:ListItem Value="Nevada"></asp:ListItem>
                                <asp:ListItem Value="New Hampshire"></asp:ListItem>
                                <asp:ListItem Value="New Jersey"></asp:ListItem>
                                <asp:ListItem Value="New Mexico"></asp:ListItem>
                                <asp:ListItem Value="New York"></asp:ListItem>
                                <asp:ListItem Value="North Carolina"></asp:ListItem>
                                <asp:ListItem Value="North Dakota"></asp:ListItem>
                                <asp:ListItem Value="Ohio"></asp:ListItem>
                                <asp:ListItem Value="Oklahoma"></asp:ListItem>
                                <asp:ListItem Value="Oregon"></asp:ListItem>
                                <asp:ListItem Value="Pennsylvania"></asp:ListItem>
                                <asp:ListItem Value="Rhode Island"></asp:ListItem>
                                <asp:ListItem Value="South Carolina"></asp:ListItem>
                                <asp:ListItem Value="South Dakota"></asp:ListItem>
                                <asp:ListItem Value="Tennessee"></asp:ListItem>
                                <asp:ListItem Value="Texas"></asp:ListItem>
                                <asp:ListItem Value="Utah"></asp:ListItem>
                                <asp:ListItem Value="Vermont"></asp:ListItem>
                                <asp:ListItem Value="Virginia"></asp:ListItem>
                                <asp:ListItem Value="Washington"></asp:ListItem>
                                <asp:ListItem Value="West Virginia"></asp:ListItem>
                                <asp:ListItem Value="Wisconsin"></asp:ListItem>
                                <asp:ListItem Value="Wyoming"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            Category
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlboxlrg" DataTextField="CategoryName"
                                DataValueField="CategoryID" AutoPostBack="True" OnSelectedIndexChanged="ddlFunctionalArea_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px; padding-left: 20px;">
                            Functional area
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFunctionalArea" runat="server" CssClass="ddlboxlrg">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            Experience
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlYears" runat="server" CssClass="ddlboxsm">
                                <asp:ListItem Value="-1">--</asp:ListItem>
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
                            &nbsp;&nbsp;To&nbsp;
                            <asp:DropDownList ID="ddlMonths" runat="server" CssClass="ddlboxsm">
                                <asp:ListItem Value="-1">--</asp:ListItem>
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
                            Years
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                                CssClass="btn" />
                            &nbsp;
                            <asp:Button ID="btnback" runat="server" CausesValidation="false" CssClass="btn" OnClick="btnback_Click"
                                Text="Back" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 1021px">
                <table class="tbl" cellpadding="0" cellspacing="0" border="0" align="center">
                    <tr>
                        <td class="org-shearder-bgNew" align="center">
                            <asp:Label ID="lblJob" runat="server">List of Job Alerts</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="dlJobAlerts" runat="server" AllowPaging="true" GridLines="None"
                                BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" CellPadding="0" CellSpacing="0"
                                Width="910px" AutoGenerateColumns="False" PageSize="10" OnRowCommand="dlJobAlerts_RowCommand"
                                OnRowEditing="dlJobAlerts_RowEditing" 
                                OnPageIndexChanging="dlJobAlerts_PageIndexChanging" 
                                onrowdeleting="dlJobAlerts_RowDeleting">
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNubmer" runat="server"><%# Eval("rownum") %></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Alert" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                        <asp:HyperLink ID="hypSearch" runat="server" NavigateUrl='<%# Eval("encryptid","JobSeekerSearch.aspx?id={0}") %>'><%# Eval("Keywords") %>,<%# Eval("location") %></asp:HyperLink>
                                            <%--<asp:Label ID="lblKeyword" runat="server"><%# Eval("Keywords") %>,<%# Eval("location") %></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkView" runat="server" CommandName="View" CommandArgument='<%#Eval("id") %>' CausesValidation="False">View</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%--<asp:HyperLink ID="hypEdit" runat="server" CssClass="boxhead">Edit</asp:HyperLink>--%>
                                            <asp:LinkButton ID="hypEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("id") %>'
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("id") %>'
                                                CausesValidation="False" OnClientClick="return confirm('Are you certain you want to delete this Alert?');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Left" CssClass="saltertext" />
                                <HeaderStyle HorizontalAlign="Left" CssClass="saltertext1" />
                                <AlternatingRowStyle CssClass="saltertext1" />
                                <PagerStyle CssClass="shearder-bg" ForeColor="Black" HorizontalAlign="Right" />
                            </asp:GridView>
                            <asp:Panel ID="pnlEdit" runat="server" BackColor="White">
                                <div style="padding: 2px">
                                    <table class="tbl" cellpadding="0" cellspacing="0" style="width: 600px;">
                                        <tr class="org-shearder-bgNew" align="center">
                                            <td colspan="2">
                                                Edit JobAlert
                                            </td>
                                        </tr>
                                        <tr style="height: 30px;">
                                            <td style="width: 200px; padding-top: 15px; padding-left: 20px;">
                                                Keyword(s)
                                            </td>
                                            <td style="padding-right: 20px; padding-top: 15px;">
                                                <asp:TextBox ID="txtKeyword" CssClass="txtbox-lrg1" runat="server" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rqvKeyword" runat="server" ErrorMessage="Enter Keyword"
                                                    ValidationGroup="edit" ControlToValidate="txtKeyword" CssClass="errmsg"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Location
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlStateEdit" runat="server" CssClass="ddlboxlrg">
                                                    <asp:ListItem Value="Select" Selected="False"></asp:ListItem>
                                                    <asp:ListItem Value="Alabama"></asp:ListItem>
                                                    <asp:ListItem Value="Alaska"></asp:ListItem>
                                                    <asp:ListItem Value="Arizona"></asp:ListItem>
                                                    <asp:ListItem Value="Arkansas"></asp:ListItem>
                                                    <asp:ListItem Value="California"></asp:ListItem>
                                                    <asp:ListItem Value="Colorado"></asp:ListItem>
                                                    <asp:ListItem Value="Connecticut"></asp:ListItem>
                                                    <asp:ListItem Value="Delaware"></asp:ListItem>
                                                    <asp:ListItem Value="Florida"></asp:ListItem>
                                                    <asp:ListItem Value="Georgia"></asp:ListItem>
                                                    <asp:ListItem Value="Hawaii"></asp:ListItem>
                                                    <asp:ListItem Value="Idaho"></asp:ListItem>
                                                    <asp:ListItem Value="Illinois"></asp:ListItem>
                                                    <asp:ListItem Value="Indiana"></asp:ListItem>
                                                    <asp:ListItem Value="Iowa"></asp:ListItem>
                                                    <asp:ListItem Value="Kansas"></asp:ListItem>
                                                    <asp:ListItem Value="Kentucky"></asp:ListItem>
                                                    <asp:ListItem Value="Louisiana"></asp:ListItem>
                                                    <asp:ListItem Value="Maine"></asp:ListItem>
                                                    <asp:ListItem Value="Maryland"></asp:ListItem>
                                                    <asp:ListItem Value="Massachusetts"></asp:ListItem>
                                                    <asp:ListItem Value="Michigan"></asp:ListItem>
                                                    <asp:ListItem Value="Minnesota"></asp:ListItem>
                                                    <asp:ListItem Value="Mississippi"></asp:ListItem>
                                                    <asp:ListItem Value="Missouri"></asp:ListItem>
                                                    <asp:ListItem Value="Montana"></asp:ListItem>
                                                    <asp:ListItem Value="Nebraska"></asp:ListItem>
                                                    <asp:ListItem Value="Nevada"></asp:ListItem>
                                                    <asp:ListItem Value="New Hampshire"></asp:ListItem>
                                                    <asp:ListItem Value="New Jersey"></asp:ListItem>
                                                    <asp:ListItem Value="New Mexico"></asp:ListItem>
                                                    <asp:ListItem Value="New York"></asp:ListItem>
                                                    <asp:ListItem Value="North Carolina"></asp:ListItem>
                                                    <asp:ListItem Value="North Dakota"></asp:ListItem>
                                                    <asp:ListItem Value="Ohio"></asp:ListItem>
                                                    <asp:ListItem Value="Oklahoma"></asp:ListItem>
                                                    <asp:ListItem Value="Oregon"></asp:ListItem>
                                                    <asp:ListItem Value="Pennsylvania"></asp:ListItem>
                                                    <asp:ListItem Value="Rhode Island"></asp:ListItem>
                                                    <asp:ListItem Value="South Carolina"></asp:ListItem>
                                                    <asp:ListItem Value="South Dakota"></asp:ListItem>
                                                    <asp:ListItem Value="Tennessee"></asp:ListItem>
                                                    <asp:ListItem Value="Texas"></asp:ListItem>
                                                    <asp:ListItem Value="Utah"></asp:ListItem>
                                                    <asp:ListItem Value="Vermont"></asp:ListItem>
                                                    <asp:ListItem Value="Virginia"></asp:ListItem>
                                                    <asp:ListItem Value="Washington"></asp:ListItem>
                                                    <asp:ListItem Value="West Virginia"></asp:ListItem>
                                                    <asp:ListItem Value="Wisconsin"></asp:ListItem>
                                                    <asp:ListItem Value="Wyoming"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Category
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCategoryEdit" runat="server" CssClass="ddlboxlrg" DataTextField="CategoryName"
                                                    DataValueField="CategoryID" AutoPostBack="True" OnSelectedIndexChanged="ddlFuncAreaEdit_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px; padding-left: 20px;">
                                                Functional area
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlFuncAreaEdit" runat="server" CssClass="ddlboxlrg">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Experience
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlExpFrom" runat="server" CssClass="ddlboxsm">
                                                    <asp:ListItem Value="-1">--</asp:ListItem>
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
                                                &nbsp;&nbsp;To&nbsp;&nbsp;
                                                <asp:DropDownList ID="ddlExpTo" runat="server" CssClass="ddlboxsm">
                                                    <asp:ListItem Value="-1">--</asp:ListItem>
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
                                                Years
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="">
                                            </td>
                                            <td>
                                                <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn" OnClick="btnupdate_Click"
                                                    ValidationGroup="edit" />&nbsp;
                                                <asp:Button ID="btnClear" runat="server" CausesValidation="false" CssClass="btn"
                                                    OnClick="btnClear_Click" Text="Cancel" />
                                            </td>
                                        </tr>
                                        <tr style="height: 10px">
                                            <td colspan="2">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:HiddenField ID="hdnEdit" runat="server" />
                            <cc1:ModalPopupExtender ID="modalEdit" runat="server" TargetControlID="hdnEdit" PopupControlID="pnlEdit">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="pnlView" runat="server" BackColor="White">
                                <div>
                                <asp:DataList ID="dlistJobAlertView" runat="server">
                                <ItemTemplate>
                                    <table class="tbl" cellpadding="0" cellspacing="0" style="width: 600px;border-color:#FFC498">
                                        <tr class="org-shearder-bgNew" align="center">
                                            <td colspan="2"> 
                                            JobAlert Details
                                            </td>
                                        </tr>
                                        <tr style="height: 30px;">
                                            <td style="width: 200px; padding-top: 15px; padding-left: 20px;">
                                                Keyword(s)
                                            </td>
                                            <td style="padding-right: 20px; padding-top: 15px;">
                                               <%# Eval("Keywords")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Location
                                            </td>
                                            <td>
                                                <%# Eval("Location")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Category
                                            </td>
                                            <td>
                                                <%# Eval("Category")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px; padding-left: 20px;">
                                                Functional area
                                            </td>
                                            <td>
                                                <%# Eval("FunctionalArea")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                Experience
                                            </td>
                                            <td>
                                                <%#Eval("YearsExp")%>
                                                &nbsp;&nbsp;To&nbsp;&nbsp;
                                                <%# Eval("MonthsExp")%>&nbsp;
                                                Years
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="">
                                            </td>
                                            <td>
                                                
                                                <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn"
                                                    ValidationGroup="view" />
                                                
                                            </td>
                                        </tr>
                                        <tr style="height: 10px">
                                            <td colspan="2">

                                            </td>
                                        </tr>
                                    </table>
                                    </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </asp:Panel>
                            <asp:HiddenField ID="hdnView" runat="server" />
                            <cc1:ModalPopupExtender ID="modalViewAlert" runat="server" TargetControlID="hdnView" PopupControlID="pnlView"></cc1:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align="center">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 924px;border-color:#FFC498" class="tbl">
                    <tr>
                        <td class="org-shearder-bgNew" align="center">
                            <asp:Label ID="Label1" runat="server">Note</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <li>
                                    <p>
                                        If you'd like Ploutos.com to automatically notify you of new job postings you can
                                        create a Job Alert. Once a new job posting that matches your search criteria is
                                        entered in the system you'll be notified by e-mail.</p>
                                </li>
                                <li>
                                    <p>
                                        To create a job alert please enter terms that match your job interests. These search
                                        terms will be used to locate new job postings that may interest you. You may create
                                        up to 20 unique Job Alerts.
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        For your job alert, please identify your Keyword(s) and one of the following: Location
                                        or Category.
                                    </p>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
