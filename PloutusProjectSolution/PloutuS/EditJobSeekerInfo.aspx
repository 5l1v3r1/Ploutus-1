<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="EditJobSeekerInfo.aspx.cs" Inherits="JobSeekerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <asp:Label ID="Label19" runat="server" Text="Job Seekers Info"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">

                <table cellspacing="5" cellpadding="5">

                    <tr>
                        <td style="width: 100%">
                            <table class="tbl" style="width: 900px; height:700px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Job Seeker Info</td>
                                </tr>

                                                               

                                <tr>
                                    <td>
                                        
                                        </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="Enter First Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtLName" runat="server"  CssClass="txtbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="Enter Lastname" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                 <tr>
                                    <td>
                                         <asp:Label ID="Label6" runat="server" Text="Home Phone"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtHomePhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHomePhone" ErrorMessage="Invalid Phone Format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label5" runat="server" Text="Mobile Phone"></asp:Label>
                                    </td>
                                </tr>

                                 <tr>
                                    <td>
                                         <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMobilePhone" ErrorMessage="Enter Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobilePhone" ErrorMessage="Invalid Phone Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>

                                 <tr>
                                    <td>
                                         <asp:Label ID="Label7" runat="server" Text="Work Phone"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtWorkPhone" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtWorkPhone" ErrorMessage="Invalid Phone Format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label3" runat="server" Text="Address Line 1"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAdd1" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAdd1" ErrorMessage="Enter Address Line 1" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label9" runat="server" Text="Address Line 2"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtAdd2" runat="server" CssClass="txtbox2"></asp:TextBox>
                                    </td>
                                </tr>

                                 <tr>
                                    <td>
                                         <asp:Label ID="Label11" runat="server" Text="City"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="Enter City" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label10" runat="server" Text="State"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlState" CssClass="ddl-big" runat="server">
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlState" ErrorMessage="Select State" ForeColor="Red" InitialValue="Select" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                         <asp:Label ID="Label4" runat="server" Text="Zip Code"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtZipCode" runat="server"  CssClass="txtbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Enter ZipCode" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Invalid Zip Code" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="Info">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                         <asp:Button ID="btnUpdate" runat="server" Text="Update Information"  CssClass="button-big" ValidationGroup="Info" OnClick="btnUpdate_Click" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please find the below errors:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Info" />

                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
            <td height="10">
                <img src="images/bootom-shape.jpg" width="1024" height="33" />
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle" bgcolor="#777777" style="border-color: #777777" class="copyrights">2014 © ploutuS LLC. All rights reserved.   </td>
        </tr>
    </table>
</asp:Content>

