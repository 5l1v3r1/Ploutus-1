<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="MainDiv" runat="server">
        <div class="left">
            <asp:Panel ID="Panel1" runat="server" Width="300px" BackColor="#fcedbd">
                <%-- <div class="rndcorner">--%>
                <div class="hd">
                    Job Search
                </div>
                <div class="row5">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <div class="row5">
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="row5">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" />
                </div>
                <%--</div>--%>
            </asp:Panel>
            <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" BehaviorID="RoundedCornersBehavior1"
                TargetControlID="Panel1" Radius="10" Corners="All" BorderColor="#f9c620" />
        </div>
        <div class="left">
            <div class="hd">
                News
            </div>
        </div>
    </div>
</asp:Content>
