<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="menu" %>
<html>
<head>
    <title></title>
    <link href="../Styles/ddsmoothmenu-v.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ddsmoothmenu.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function setSes() {
            document.getElementById("Defib").src = "Dfill.aspx";

            maitainSes();
        }
        function maitainSes() {
            setTimeout("setSes()", 56000);
        }
    </script>
</head>
<body>
    <iframe id="Defib" src="../Dfill.aspx" frameborder="0" width="0" height="0"></iframe>
    <div id="smoothmenu1" class="ddsmoothmenu">
        <ul>
            <%DrawMenu(); %>
        </ul>
        <br style="clear: left" />
    </div>
</body>
</html>
