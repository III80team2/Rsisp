<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LoginTest</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#loginName").keypress(function (event) {
                if (event.keyCode == 13)
                {
                    <% Session.Add("loginName", loginName.Value);%>;
                    $("#Form").submit();
                }
            });});
    </script>
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <div style="margin-top:180px">
        <h1 style="text-align: center" class="auto-style1">帳戶登入</h1>
    </div>
        <div class="login">
            <div style="width:auto;height:auto">
                <asp:Image ID="Image1" runat="server" Height="151px" ImageUrl="~/pics/guest.png" Width="162px" />
            </div>
            <span id="divLog" class="divlogin" runat="server">
                <input id="loginName" runat="server" name="loginName" placeholder="帳號" spellcheck="false" style="width:40%; font-weight: normal; font-size: x-large; color: #000000;" value="iii"/><br />                
                <input id="Passwd" name="Passwd" type="password" placeholder="密碼" style="width:40%; font-weight: normal; font-size: x-large; color: #000000;" value="password4"/><br />
                <br />
                &nbsp;<asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認" OnClick="btnSubmit_Click" BackColor="#0099FF" BorderStyle="None" Width="40%"/>
                <br />
            </span>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="您輸入的帳號密碼有誤"></asp:Label>
        </div><br />
        <div style="text-align:center"><asp:HyperLink ID="hLinkRegister" runat="server" Font-Size="X-Large" ForeColor="ForestGreen" NavigateUrl="~/Register.aspx">建立帳戶</asp:HyperLink></div>
    <script>
        window.onload = function () {
            document.getElementById("Passwd").focus();
        };
    </script>
        
    <br /><br />

    <footer class="loginfooter">
        <div>
            <p>Trafalgar Law &nbsp;&copy;&nbsp;tel:123456789&nbsp;address:Dressrosa</p>
        </div>
    </footer>
    </form>
</body>

</html>