<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patientSelect.aspx.cs" Inherits="patientSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body style="background-image:url('pics/ocean03.jpg')">
    <form id="form1" runat="server">
        
        <div style="text-align:center;color:black;margin-top: 300px 400px 300px 400px;opacity:1.0;font-weight:900">
                <span class="auto-style1">請輸入病患姓名:</span>
                <asp:TextBox ID="patientName" runat="server" CssClass="auto-style1"></asp:TextBox>
                <asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認送出" Style="font-size: large" />
            </div>
        <div style="text-align: center; padding: 75px; opacity: 0.6; background-color: #888; height: 50px; margin:-450px">
        </div>
    </form>
</body>
</html>
