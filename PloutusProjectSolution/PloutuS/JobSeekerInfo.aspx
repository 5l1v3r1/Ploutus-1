<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JobSeekerInfo.aspx.cs" Inherits="JobSeekerInfo" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtMobilePhone").focusout(function () {
                $("#txtMobilePhone").empty;

            });
        });
    </script>
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
                            <table class="tbl" style="width: 900px; height: 700px;" border="0" cellpadding="1px" cellspacing="0">
                                <%-- <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Upload Resume</td>
                                </tr>

                                  
                                <tr>
                                  
                                    <td style="padding-top:10px">
                                          <div style="width:800px; height:80px;border:1px solid; border-color:grey; padding:10px">
<asp:FileUpload ID="WordFileToRead" runat="server" CssClass="ddl-big" /><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Choose File" ControlToValidate="WordFileToRead" ForeColor="Red" SetFocusOnError="True" ValidationGroup="FU">*</asp:RequiredFieldValidator>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpload" runat="server" Height="40px" OnClick="btnUpload_Click" Text="Upload" CssClass="button-big" ValidationGroup="FU" />
                                    </div>
                                         
                                         
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="errmsg" style="padding-left: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="(*) fields are mandatory"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 10px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="org-shearder-bgNew">Job seeker info</td>
                                </tr>


                                <tr>
                                    <td style="padding-top: 10px;">
                                        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFName" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFName" ErrorMessage="Enter First Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcFName" runat="server" TargetControlID="rfvFname">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtLName" runat="server" CssClass="txtbox2"></asp:TextBox>
                                        <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLName" ErrorMessage="Enter Lastname" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcLname" runat="server" TargetControlID="rfvLname">
                                        </cc1:ValidatorCalloutExtender>
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
                                        <asp:RegularExpressionValidator ID="revHomePhone" runat="server" ControlToValidate="txtHomePhone" ErrorMessage="Invalid Phone Format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcHomePhone" runat="server" TargetControlID="revHomePhone">
                                        </cc1:ValidatorCalloutExtender>
                                        <%--   <cc1:MaskedEditExtender ID="maskHomePhone" runat="server" TargetControlID="txtHomePhone" Mask="999-999-9999"></cc1:MaskedEditExtender>--%>
                                       
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
                                         <span class="errmsg">&nbsp;*</span>
                                        <asp:Label ID="lblMobileVal" runat="server" Text="&nbsp;&nbsp;xxx-xxx-xxxx" CssClass="lblNote"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobilePhone" ErrorMessage="Enter Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobilePhone" ErrorMessage="Invalid Phone Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcMobile" runat="server" TargetControlID="rfvMobile">
                                        </cc1:ValidatorCalloutExtender>
                                        <cc1:ValidatorCalloutExtender ID="vceMobileFormat" runat="server" TargetControlID="revMobile">
                                        </cc1:ValidatorCalloutExtender>
                                        <%-- <cc1:MaskedEditExtender ID="maskMobileNumber" runat="server" TargetControlID="txtMobilePhone" Mask="999-999-9999"></cc1:MaskedEditExtender>--%>
                                        
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
                                        <asp:RegularExpressionValidator ID="revWorkPhone" runat="server" ControlToValidate="txtWorkPhone" ErrorMessage="Invalid Phone Format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcWorkPhone" runat="server" TargetControlID="revWorkPhone">
                                        </cc1:ValidatorCalloutExtender>
                                        <%--  <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtWorkPhone" Mask="999-999-9999"></cc1:MaskedEditExtender>--%>
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
                                         <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvAdress1" runat="server" ControlToValidate="txtAdd1" ErrorMessage="Enter Address Line 1" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcAdress1" runat="server" TargetControlID="rfvAdress1">
                                        </cc1:ValidatorCalloutExtender>
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
                                         <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Enter City" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcCity" runat="server" TargetControlID="rfvCity">
                                        </cc1:ValidatorCalloutExtender>
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
                                         <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" ErrorMessage="RequiredFieldValidator" ForeColor="Red" InitialValue="Select" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcState" runat="server" TargetControlID="rfvState">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Zip Code"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="txtbox2"></asp:TextBox>
                                         <span class="errmsg">&nbsp;*</span>
                                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Enter ZipCode" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Invalid Zip Code" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcZip" runat="server" TargetControlID="rfvZip">
                                        </cc1:ValidatorCalloutExtender>
                                        <cc1:ValidatorCalloutExtender ID="vceZip" runat="server" TargetControlID="revZip">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                </tr>


                                <tr>
                                    <td style="padding-top: 10px;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnContApp" runat="server" Text="Save & Continue" CssClass="button-Mediam" OnClick="btnContApp_Click" ValidationGroup="Info" />
                                                    <span></span>
                                                    <asp:Button ID="btnSaveLater" runat="server" Text="Save for Later" CssClass="button-Mediam"   OnClick="btnSaveLater_Click" />
                                                </td>

                                                <td align="right" style="padding-right: 0px">
                                                    <%--<asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button-Mediam" />--%>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                        <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please find the below errors:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Info" />--%>

                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 50px;"></td>
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

