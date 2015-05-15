<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patientSelect.aspx.cs" Inherits="patientSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: 微軟正黑體;
            font-weight: bold;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-weight: bold;
        }
    </style>
</head>
<body style="background-image:url('pics/moon.png');">
    <form id="form1" runat="server">
        <div style="text-align: center;  opacity: 0.7; background-color: #000; height:250px; margin:300px 400px 0 400px">
            <div style="text-align:center;color:#FFF;opacity:1.0;font-weight:900;padding:80px">
                <span class="auto-style1">請輸入病患姓名:</span>
                <asp:TextBox ID="patientName" runat="server" CssClass="auto-style1"></asp:TextBox>
                <asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認送出" Style="font-size: large" CssClass="auto-style2" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
