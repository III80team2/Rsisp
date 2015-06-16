<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

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
            <header class="htmleaf-header">
            </header>
            <div class="htmleaf-content">
                <div class="example" />
                <div>
                    <p class="turnBoxButton">LOGIN</p>
                </div>
                <div>
                    <ul class="user-information">
                        <li>
                            <input id="loginName" runat="server" name="loginName" placeholder="帳號" spellcheck="false" />
                        </li>
                        <li>
                            <input id="Passwd" name="Passwd" type="password" placeholder="密碼"/>
                        </li>
                    </ul>
                    <div class="login-contents">
                        <span class="check"><asp:Button ID="btnSubmit" runat="server" Text="OK" BackColor="#009900" BorderStyle="None" Width="40%"/>
                        </span>
                    </div>
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
