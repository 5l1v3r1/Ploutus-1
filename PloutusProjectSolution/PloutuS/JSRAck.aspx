<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSRAck.aspx.cs" Inherits="JSRAcknowledgment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
         function ValidateCheckBox(sender, args) {
             if (document.getElementById("<%=chk1.ClientID %>").checked == true) {

                args.IsValid = true;
            } else {
                alert("Please accept the conditions");
                args.IsValid = false;
            }
        }
    </script>
    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding2">
                <asp:Label ID="Label19" runat="server" Text="APPLICANT ACKNOWLEDGMENT AND AUTHORIZATION (Please read carefully before signing)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td colspan="2">I hereby certify that all of the information provided by me in this application (or any accompanying or required documents) is correct, accurate and complete to the best of my knowledge. I understand that falsification, misrepresentation or omission of any facts in said documents will be cause for denial of employment or immediate termination of employment regardless of the timing or circumstances of discovery.
I understand that submission of an application does not guarantee my employment. I further understand that, should an offer of employment be extended by Ploutus™LLC (hereinafter referred to as “Ploutus”) that such employment with Ploutus is at will, for no specified duration and may be terminated by either Ploutus or myself at any time, with or without cause or notice. I understand that none of the documents, polices, procedures, actions, statements of Ploutus or its representatives used during the employment process is deemed a contract of employment real or implied. I understand that no representative of Ploutus except the Director & Founding members have the authority to enter into any agreement guaranteeing any conditions of employment or any agreement contrary to the foregoing statements and that any such agreements must be made in writing and signed by the Director & Founding members of Ploutus.
In consideration for employment with Ploutus, if employed, I agree to conform to the rules, regulations, policies and procedures of Ploutus at all times and understand that such obedience is a condition of employment. I understand that due to the nature of Ploutus’ business, attendance and punctuality are considered essential requirements of every job at Ploutus and poor attendance or tardiness will result in disciplinary action.
I understand that if offered a position with Ploutus, I may be required to submit to a pre-employment medical examination, drug screening and background check as a condition of employment. I understand that unsatisfactory results from refusal to cooperate with, or any attempt to affect the results of these pre-employment tests and checks will result in withdrawal of any employment offer or termination of employment if already employed.
I hereby authorize any and all schools, former employers, references, courts and any others who have information about me to provide such information to Ploutus and/or any of its representatives, agents or vendors and I release all parties involved from any and all liability for any and all damage that may result from providing such information.
BY SIGNING BELOW I ACKNOWLEDGE THAT I HAVE READ, UNDERSTOOD AND AGREE TO THE ABOVE STATEMENTS

                        </td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <asp:CheckBox ID="chk1" Text=" " runat="server" OnCheckedChanged="chk1_CheckedChanged" AutoPostBack="true"/>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Required" ClientValidationFunction="ValidateCheckBox" CssClass="errmsg"></asp:CustomValidator>

                            I Have acknowledge the information given is true 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnl" runat="server" Visible="false">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Signature Here"></asp:Label>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="txtsign" CssClass="txtbox" runat="server" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsign" ErrorMessage="Signature required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        </td>
                                   
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="txtDate" CssClass="txtbox" runat="server" MaxLength="100"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate">
                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate" ErrorMessage="Date required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        </td>

                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                     <tr>
            <td colspan="4" align="right" style="padding-right: 25px; margin-left: 40px;">
                <asp:Button ID="btnFinish" runat="server" Text="Finish" CssClass="button-Mediam" OnClick="btnFinish_Click" />


            </td>
        </tr>
                </table>

            </td>
        </tr>

        <tr>
            <td colspan="4">&nbsp;
            </td>
        </tr>
       
    </table>

</asp:Content>

