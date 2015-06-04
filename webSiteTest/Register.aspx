<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .registerTitle {
            font-size: xx-large;
            font-family: 微軟正黑體;
            padding:100px 0 20px 450px
        }
        .registerForm {
            font-size: 22pt;
            font-family: 微軟正黑體;
            padding-left:450px;
        
        }
        .inputText {
            font-weight: normal; 
            font-size: medium; 
            color: #000000;
            height:30px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registerTitle">
            註冊
        </div>
        <div class="registerForm">
            <input id="firstName" name="firstName" type="text" placeholder="姓" class="inputText"style="width:100px"/>
            <input id="lastName" name="lastName" type="text" placeholder="名" class="inputText"style="width:190px"/><br />
            <input id="userName" name="userName" type="text" placeholder="帳號" class="inputText"style="width:300px"/><br />
            <input id="password" name="password" type="password" placeholder="密碼" class="inputText"style="width:300px"/><br />
            <asp:DropDownList ID="roleList" runat="server" Height="47px" Width="306px"></asp:DropDownList><br />
            <asp:Button ID="btnInsert" runat="server" Text="新增使用者" BackColor="Black" ForeColor="White" Height="37px" Width="76px" />
        </div>
    </form>
</body>
</html>
