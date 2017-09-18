<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title>Read Word File</title>  
</head>  
<body>  
    <form id="form1" runat="server">  
    <div style="height: 700px;">  
        <table cellpadding="10" cellspacing="10" width="85%" align="center" style="background: SkyBlue;">  
            <tr>  
                <td>  
                    Select Word File To Read #  
                    <asp:FileUpload ID="WordFileToRead" runat="server" Width="500px" />  
                    <asp:Button ID="btnUpload" runat="server" Text="Read File" OnClick="btnUpload_Click" />  
                </td>  
            </tr>  
       
        </table>  
        
        <table>
                
            <tr>
                <td>
                    FName
                </td>
                <td>
                        <asp:TextBox ID="txtFname" runat="server" ></asp:TextBox>  
                </td>
            </tr>
             <tr>
                <td>
                    LName
                </td>
                <td>
                        <asp:TextBox ID="txtLname" runat="server" ></asp:TextBox>  
                </td>
            </tr>
             <tr>
                <td>
                    EmailID
                </td>
                <td>
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>  
                </td>
            </tr>
             <tr>
                <td>
                    phoneNO
                </td>
                <td>
                        <asp:TextBox ID="txtphoneNo" runat="server" ></asp:TextBox>  
                </td>
            </tr>
             <tr>
                <td>
                    Address
                </td>
                <td>
                        <asp:TextBox ID="txtAddress" runat="server" ></asp:TextBox>  
                </td>
            </tr>
             <tr>
                <td>
                    City
                </td>
                <td>
                        <asp:TextBox ID="txtCity" runat="server" ></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td>
                    State
                </td>
                <td>
                        <asp:TextBox ID="txtState" runat="server" ></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td>
                    Zip
                </td>
                <td>
                        <asp:TextBox ID="txtZip" runat="server" ></asp:TextBox>  
                </td>
            </tr>
            
        </table>
    </div>  
    </form>  
</body>  
</html> 
