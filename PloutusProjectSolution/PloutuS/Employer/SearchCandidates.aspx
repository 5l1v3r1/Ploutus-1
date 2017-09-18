<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/MerchantMaster.master"
    AutoEventWireup="true" CodeFile="SearchCandidates.aspx.cs" Inherits="Employer_SearchCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
.MainSearchDiv
{
    width: 83%;
    height: 60px;
    margin: 30px;
    border: 1px solid silver;
    padding-top: 5px;
}

.SubDiv
{
    float: left; 
    height: 60px; 
    padding-left: 10px;
}
</style>
    <div align="center" style="width: 100%">
    <div style="width:100%; height:40px; padding-top:20px;"> <asp:Label ID="lblHead" runat="server" CssClass="headding">Search Job Applicants</asp:Label>  </div>
        <div align="left" style="width: 83%; height: 60px; margin:0px 30px 30px 30px;  border: 1px solid #c3c3c3; background-color:#e4e4e4;
            padding-top: 5px;">
            <div style="float: left; width: 290px; height: 60px; padding-left: 10px;">
                Skills:<br />
                <asp:TextBox ID="txtSkills" runat="server" Width="250px"></asp:TextBox>
            </div>
            <div style="float: left; width: 240px; height: 60px; padding-left: 10px;">
                Location:<br />
                <asp:DropDownList ID="ddlLocation" runat="server" Width="200px">
                </asp:DropDownList>
            </div>
            <div style="float: left; width: 200px; height: 60px; padding-left: 10px;">
                Experience:<br />
                <asp:DropDownList ID="ddlFrom" runat="server" Width="70px">
                    <asp:ListItem Value="-1">From</asp:ListItem>
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
                <asp:DropDownList ID="ddlTo" runat="server" Width="70px">
                    <asp:ListItem Value="-1">To</asp:ListItem>
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
            </div>
            <div style="float: left; width: auto; height: 60px;">
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClientClick="validate()"
                    OnClick="btnSearch_Click" /></div>
        </div>
        <div style="width: 85%; height: auto; margin: 30px; border: 0px solid silver; padding-top: 5px;">
            <asp:UpdatePanel ID="uPanel" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlMain" runat="server">
                        <table cellpadding="0" cellspacing="0" width="850px" style="border: 1px solid silver;">
                            <tr>
                                <td class="Gridhedding" style="padding-right: 3px;" align="left">
                                    <table style="width:100%; height:40px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPageInfo" ForeColor="Black" runat="server" Font-Names="Verdana"></asp:Label>
                                            </td>
                                            <td align="right"><asp:Label ID="lblInf" ForeColor="Black" runat="server" Font-Names="Verdana">Sort By:&nbsp;</asp:Label> 
                                                <asp:DropDownList ID="ddlSort" runat="server" Width="200px" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                    <asp:ListItem Value="Skills">Skills</asp:ListItem>
                                                    <asp:ListItem Value="Exp">Experience</asp:ListItem>
                                                    <asp:ListItem Value="candidate">Name</asp:ListItem>
                                                    <%--<asp:ListItem Value="jsid">JobSeeker ID</asp:ListItem>--%>
                                                    <asp:ListItem Value="city">City</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="dljobseekerdet" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Style="width: 850px"
                                        CssClass="lable" AlternatingItemStyle-CssClass="saltertext" ItemStyle-CssClass="saltertext1">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" style="width: 850px;">
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" class="gridtbl" cellspacing="0" border="0" style="width: 850px;">
                                                            <tr>
                                                                <td colspan="2" align="left" class="sgrid-headiing-black" width="500" style="padding: 5px;">
                                                                    Name :
                                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "ViewCandidates.aspx?id={0}") %>'
                                                                        CssClass="sgrid-headiing-red"> <%# Eval("candidate")%></asp:HyperLink>
                                                                </td>
                                                                <td align="right" class="lable" style="padding: 5px;">
                                                                    JobSeekerId : PSJS000
                                                                    <%#Eval("jsid") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="left" class="lable" style="padding: 5px;">
                                                                    Job Title :
                                                                    <%# Eval("Position")%>
                                                                </td>
                                                                <td align="right" class="lable" style="padding: 5px;">
                                                                    Skills :
                                                                    <%# Eval("Skills")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="left" class="lable" style="padding: 5px;">
                                                                    Experience :
                                                                    <%# Eval("Exp")%>
                                                                </td>
                                                                <td align="right" class="lable" style="padding: 5px;">
                                                                    City :
                                                                    <%# Eval("city")%>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                            </table>
                                            </td> </tr> </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td class="Gridhedding" align="center">
                                    <table width="850px">
                                        <tr>
                                            <td align="right">
                                                <table cellpadding="0" border="0">
                                                    <tr>
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
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlSub" Visible="false">
                        <table cellpadding="0" cellspacing="0" width="900px" style="border: 1px solid silver">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblSubMsg" ForeColor="Red" runat="server" Text="No data to display"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script type="text/javascript">
        function validate() {
            var skills = document.getElementById('<%= txtSkills.ClientID %>');
            var location = document.getElementById('<%= ddlLocation.ClientID %>');
            var from = document.getElementById('<%= ddlFrom.ClientID %>');
            var to = document.getElementById('<%= ddlTo.ClientID %>');
            if ((skills.value == null || skills.value == undefined || skills.value == '') & location.value == '0' & from.value == '-1' & to.value == '-1') {
                alert('Please select any search criteria for desired results.');
            }
            else if (from.value != '-1' & to.value != '-1') {
                if (parseInt(from.value) > parseInt(to.value)) {
                    alert('Experience "From" should not be greater than experience "To"');
                    from.value = '-1';
                    to.value = '-1';
                    skills.value = '';
                    location.value = '0';
                }
            }

        };
    </script>
</asp:Content>
