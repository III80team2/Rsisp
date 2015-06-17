<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/reset.css" rel="stylesheet" />
    <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
    <script src="Scripts/turnBox.js"></script>
    
    <style>
        body {
            background-color: #fff;
            color: #000;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        input {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            vertical-align: baseline;
            background: transparent;
            background-color: #fff;
        }

        .example {
            color: #fff;
            margin: 0px auto;
            text-align: center;
        }

        p {
            line-height: 4.2;
        }

        .example.turnBoxCurrentFace1 > .turnBoxFaceNum1, .example.turnBoxCurrentFace3 > .turnBoxFaceNum3 {
            background-color: #0099FF;
            font-size: 20px;
        }

        .example.turnBoxCurrentFace1 > .turnBoxFaceNum1:hover, .example.turnBoxCurrentFace3 > .turnBoxFaceNum3:hover {
            background-color: #009900;
            font-size: 20px;
        }

        .example > .turnBoxFaceNum1, .example > .turnBoxFaceNum3 {
            background-color: #0099FF;
            font-size: 20px;
        }

        .example.turnBoxCurrentFace2 > .turnBoxFaceNum2 {
            background-color: #0099FF;
            font-size: 20px;
        }

        .example > .turnBoxFaceNum1 p, .example > .turnBoxFaceNum3 p {
            width: 100%;
            height: 100%;
            font-size: 20px;
        }

        .example > .turnBoxFaceNum2 {
            background-color: #0099FF;
            font-size: 20px;
        }

        .user-information {
            padding-top: 35px;
        }

        .user-information > li > * {
            display: inline-block;
        }

        .user-information > li > span {
            width: 13%;
            text-align: right;
            font-size: 14px;
            margin-right: 17px;
        }

        .user-information > li > input {
            width: 62%;
            padding: 7px 10px;
        }

        .user-information > li:first-child {
            margin-bottom: 10px;
        }
        .login-contents {
            float: right;
            margin: 15px 0px;
            margin-right: 20px;
            text-align: right;
        }
        .login-contentsL {
            float: left;
            margin: 15px 0px;
            margin-left: 20px;
            text-align: left;
        }

        .check {
            -webkit-transition: all 100ms ease-in-out 0ms;
            -moz-transition: all 100ms ease-in-out 0ms;
            -ms-transition: all 100ms ease-in-out 0ms;
            -o-transition: all 100ms ease-in-out 0ms;
            transition: all 100ms ease-in-out 0ms;
            width: 136px;
            height: 50px;
            display: block;
            text-align: center;
            line-height: 2.5;
            background-color: #009900;
            cursor: pointer;
        }

        .check:hover {
            background-color: #009900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="htmleaf-container">
            <div class="htmleaf-content" style="margin-top:150px;">
                <div class="example" />
                <div>
                    <p class="turnBoxButton">LOGIN</p>
                </div>
                <div style="padding-top:30px;">
                    <ul class="user-information">
                        <li>
                            <input id="loginName" runat="server" name="loginName" placeholder="帳號" spellcheck="false" />
                        </li>
                        <li>
                            <input id="Passwd" name="Passwd" type="password" placeholder="密碼"/>
                        </li>
                    </ul>
                    <div class="login-contents">
                        <span class="check"><asp:Button ID="btnSubmit" runat="server" Text="Login" BackColor="#009900" BorderStyle="None" Width="40%" OnClick="btnSubmit_Click"/>
                        </span>
                        
                        <asp:Label ID="lblMessage" runat="server" ForeColor="DarkRed" Text="您輸入的帳號密碼有誤!!!"></asp:Label>
                        <div style="text-align:center"><asp:HyperLink ID="hLinkRegister" runat="server" Font-Size="X-Large" ForeColor="#220088" NavigateUrl="~/Register.aspx">建立帳戶</asp:HyperLink></div>
                    </div>
                    <span class="login-contentsL"><asp:Button ID="btnEnter" runat="server" Text="進入後台" BackColor="#EE7700" Width="136px" Height="50px" BorderStyle="None" OnClick="btnEnter_Click"/></span>
                    
                </div>
            </div>
        </div>
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