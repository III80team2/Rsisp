<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>loginTest2</title>
    <script src="Scripts/jquery-2.1.4.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            setTimeout(function () {
                $("#div1").hide();
                $("#div2").show();
            }, 3000);
            
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1"><img src="pics/loading.gif" height="14"/>資料處理中，請稍後。</div>
        <div id="div2" style="display:none">123</div>
    </form>
</body>
</html>
