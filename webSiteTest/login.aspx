<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="Content/style.css" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/reset.css" rel="stylesheet" />
    <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
    <script src="Scripts/turnBox.js"></script>

    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <canvas class="canvas" style=""></canvas>
        <div class="ui">
            <input class="ui-input" type="text" style="visibility: hidden;" />
            <div class="htmleaf-container">
            <div class="htmleaf-content" style="margin-top:150px;">
                <div class="example" />
                <div>
                    <p class="turnBoxButton">LOGIN</p>
                </div>
                <div style="padding-top:30px;">
                    <ul class="user-information">
                        <li>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="DarkRed" Text="您輸入的帳號密碼有誤!!!" Width="62%"></asp:Label>
                        </li>
                        <li>
                            <input id="loginName" runat="server" name="loginName" placeholder="帳號" style="background-color:#FFF;"/>
                        </li>
                        <li>
                            <input id="Passwd" name="Passwd" type="password" placeholder="密碼" style="background-color:#FFF;"/>
                        </li>
                    </ul>
                    <div class="login-contents">
                        <span class="check"><asp:Button ID="btnSubmit" runat="server" Text="Login" BackColor="#009900" BorderStyle="None" Width="40%" OnClick="btnSubmit_Click"/>
                        </span>
                        <div style="text-align:center"><asp:HyperLink ID="hLinkRegister" runat="server" Font-Size="X-Large" ForeColor="#220088" NavigateUrl="~/Register.aspx">建立帳戶</asp:HyperLink></div>
                    </div>
                    <span class="login-contentsL"><asp:Button ID="btnEnter" runat="server" Text="進入後台" BackColor="#EE7700" Width="136px" Height="50px" BorderStyle="None" OnClick="btnEnter_Click"/></span>
                    
                </div>
            </div>
        </div>
        </div>

        <div class="overlay">
            <div class="tabs">
                <div class="tabs-labels"><span class="tabs-label">Commands</span><span class="tabs-label">Info</span><span class="tabs-label">Share</span></div>
                <div class="tabs-panels">
                    <ul class="tabs-panel commands">
                    </ul>
                </div>
            </div>
        </div>

        <script src="Scripts/index.js"></script>
        <script type="text/javascript">
            var width = 340;
            var duration = 450;
            var general_box = $(".example");

            general_box.turnBox({
                width: width,
                height: 87,
                even: 320,
                perspective: 3000,
                duration: duration,
                easing: "ease-in-out",
                type: "repeat"
            });

            general_box.find(".check").turnBoxLink({
                box: ".example",
                events: "click touchend"
            });

            general_box.find(".check").on("click touchend", function () {
                setTimeout(function () {
                    general_box.find("input").val("").attr("checked", false);
                }, duration);
            });
        </script>
    </form>
</body>
</html>








<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LoginTest</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $("#Passwd").keypress(function (event) {
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
                <input id="loginName" runat="server" name="loginName" placeholder="帳號" spellcheck="false" style="width:40%; font-weight: normal; font-size: x-large; color: #000000;"/><br />                
                <input id="Passwd" name="Passwd" type="password" placeholder="密碼" style="width:40%; font-weight: normal; font-size: x-large; color: #000000;"/><br />
                <br />
                <asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認" OnClick="btnSubmit_Click" BackColor="#0099FF" BorderStyle="None" Width="40%"/>
                <br />
                <br />
                <asp:Button class="btn btn-default" ID="btnBackstage" runat="server" Text="進入後台管理系統" OnClick="btnBackstage_Click" BackColor="#0099FF" BorderStyle="None" Width="40%"/>
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

</html>--%>