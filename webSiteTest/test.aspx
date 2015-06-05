<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-2.1.4.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 460px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <table>
            <tr>
                <td class="auto-style1" style="background-color:orange;width:20%"></td>
                <td rowspan="2"  class="auto-style1" style="background-color:blue;width:80%">&nbsp;</td>
            </tr>
            <tr>
                <td style="background-color:black;width:20%">&nbsp;</td>
            </tr>
        </table>
    
    </form>
</body>
</html>
