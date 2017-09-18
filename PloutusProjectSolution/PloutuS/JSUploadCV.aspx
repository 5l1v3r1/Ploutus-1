<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.master" AutoEventWireup="true" CodeFile="JSUploadCV.aspx.cs" Inherits="JobSeekerInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=Button1.ClientID %>").click();
            }
        }
    </script>


    <%--   <script type="text/javascript">
        function fileinfo()
        {
            document.getElementById("<%=Label2.ClientID %>").value = document.getElementById("<%=WordFileToRead.ClientID %>").value;
        }
    </script>--%>

    <style id="cssStyle" type="text/css" media="all">
        .CS {
            background-color: #abcdef;
            color: Yellow;
            border: 1px solid #AB00CC;
            font: Verdana 10px;
            padding: 1px 4px;
            font-family: Palatino Linotype, Arial, Helvetica, sans-serif;
        }
    </style>

    <table cellpadding="0" cellspacing="0" class="tbl" width="100%">
        <tr>
            <td colspan="5" align="center" style="padding-top: 20px; padding-bottom: 10px;" class="headding1">
                <%-- <asp:Label ID="Label19" runat="server" Text="Upload Resume"></asp:Label>--%>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 50px; padding-right: 50px;">

                <table cellspacing="5" cellpadding="5">

                    <tr>
                        <td>
                            <table class="tbl" style="width: 900px;" border="0" cellpadding="1px" cellspacing="0">
                                <tr>
                                    <td class="org-shearder-bgNew">Upload your resume</td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; padding-top: 10px;">
                                        <ul>
                                            <li>File Accepted .DOC,.DOCX upto 1.4MB
                                            </li>
                                            </br>
                                            <li>Resumes should not exceed 10,000 charcters or 4 pages
                                            </li>
                                            </br>
                                            <li>Scaned resume images are not accepted at this time                                                              
                                            </li>

                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 10px; padding-left: 10px" align="left">
                                        <div>
                                            <asp:Panel ID="pnlMain" runat="server" Visible="true">
                                                <div>
                                                    <asp:ImageButton ID="imgbtnBrowse" runat="server" ImageUrl="~/images1/brouwse-for-file.png" OnClick="imgbtnBrowse_Click1" />

                                                </div>

                                                <div>
                                                    <asp:ImageButton ID="imgbtnCopy" runat="server" ImageUrl="~/images1/copy-paste-resume.png" OnClick="imgbtnCopy_Click" />
                                                </div>


                                                
                                                <div>
                                                    <asp:ImageButton ID="imgbtnGDrive" runat="server" ImageUrl="~/images1/choose-from-google-drive.png" />
                                                </div>
                                                <div>
                                                    <asp:ImageButton ID="imgbtnDropBox" runat="server" ImageUrl="~/images1/choose-from-dropbox.png" />
                                                </div>

                                            </asp:Panel>
                                        </div>

                                        <div>
                                            <asp:Panel ID="pnlUpload" runat="server" Visible="false" Width="600px" BorderStyle="Solid" BorderColor="#cccccc">
                                                <table style="height:150px" width="100%">
                                                    <tr>
                                                        <td style="padding-left:20px; ">

                                                            <asp:Label ID="Label1" runat="server" class="org-shearder-bgNew" Text="Select file"></asp:Label>
                                                        </td>
                                                        <td align="left" valign="middle">
                                                            <asp:FileUpload ID="uploadFile" runat="server" CssClass="txtbox2" Font-Bold="True" Font-Italic="True" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Choose File" ControlToValidate="uploadFile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="FU">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td  align="left">
                                                            <asp:Button ID="Button1" runat="server" OnClick="btnUpload_Click" Text="Upload" CssClass="button-Mediam" />


                                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button-Mediam" OnClick="btnCancel_Click" />
                                                        </td>
                                                    </tr>

                                                </table>
                                            </asp:Panel>
                                        </div>


                                        <div>

                                            <asp:Panel ID="pnlCopy" runat="server" Width="610px" Visible="false" BorderStyle="None" BorderColor="#cccccc">
                                                <table>
                                                    <tr>
                                                          <td style="padding-left:5px; ">

                                                            <asp:Label ID="Label2" runat="server" class="org-shearder-bgNew" Text="Copy and paste resume"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <asp:TextBox ID="txtResumeBuilder" BackColor="White" runat="server" Height="300px"
                                                                Width="600px" TextMode="MultiLine"></asp:TextBox>
                                                            <cc1:HtmlEditorExtender ID="HtmlEditorExtender1" EnableSanitization="false" TargetControlID="txtResumeBuilder"
                                                                runat="server">
                                                            </cc1:HtmlEditorExtender>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 15px">
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="button-Mediam" OnClick="btnsave_Click" />
                                                            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="button-Mediam" OnClick="btnCancel_Click" />
                                                        </td>
                                                    </tr>
                                                </table>

                                            </asp:Panel>
                                        </div>


                                        <%--<div>

                                            <asp:FileUpload ID="WordFileToRead" runat="server" CssClass="ddl-big" EnableTheming="True" />

                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


                                             
                                            



                                        </div>
                                          <div>




                                            <asp:Button ID="Button1" runat="server" Height="40px" OnClick="btnUpload_Click" Text="Upload"  CssClass="button-big" ValidationGroup="FU"  Style="display: none"   />



                                        </div>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 30px; padding-left: 10px" align="left">
                                        <%--<asp:Button ID="btnContApp" runat="server" Text="Submit" CssClass="button-big2" />--%>
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

