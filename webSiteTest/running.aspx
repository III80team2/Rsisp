<%@ Page Language="C#" AutoEventWireup="true" CodeFile="running.aspx.cs" Inherits="running" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
        
    </div>
        <div>
            <img src="pics/Golden_runner.gif" />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
<%--<script type="text/javascript">

    var t = 20;

    function showTime() {
        t -= 1;
        document.getElementById('div1').innerHTML = t;

        if (t == 1) {
            location.href = 'testAssess.aspx';
        }

        setTimeout("showTime()", 1000);
    }

    showTime();
</script>--%>
