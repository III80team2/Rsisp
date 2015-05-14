<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LoginTest</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
</head>

<body>
    

    <form id="form1" runat="server">
    <div style="margin-top:200px">
        <h1 style="text-align: center">ISP資訊系統登入畫面</h1>
    </div>
    <div style="text-align:center;padding:75px;background-color:#555;height:250px;margin:inherit">

        <p style="text-align: center; color: black;font-size:medium">
            帳號:
            <asp:TextBox ID="loginName" runat="server"></asp:TextBox>
            <br /><br />

            密碼:
            <input type="text" name="loginName"/><br /><br />

        </p>
        <p style="padding:0 0 0 35px">
            <asp:Button class="btn btn-default" ID="btn_clear" runat="server" Text="清除重填" OnClick="btn_clear_Click" />
            <asp:Button class="btn btn-default" ID="btn_submit" runat="server" Text="確認送出" OnClick="btn_submit_Click" />
        </p>


    </div>
        
    <br /><br />

    <footer style="background-color:#FFF;height:80px;font-size:large;color:black;text-align:center">
        <div>
            <p>Trafalgar Law &nbsp;&copy;&nbsp;tel:123456789&nbsp;address:Dressrosa</p>
        </div>
    </footer>
    </form>
</body>

</html>




<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
