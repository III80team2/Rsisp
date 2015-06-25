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
                    <p class="turnBoxButton">Individual Assessment Plan System</p>
                </div>
                <div style="padding-top:30px;">
                    <ul class="user-information">
                        <li>
                            <asp:Label ID="lblMessage" runat="server" ForeColor="DarkRed" Text="您輸入的帳號密碼有誤!!!" Width="62%"></asp:Label>
                        </li>
                        <li>
                            <input id="loginName" runat="server" name="loginName" placeholder="帳號" style="background-color:#FFF;"/>
                        </li>
                        <br />
                        <li>
                            <input id="Passwd" name="Passwd" type="password" placeholder="密碼" style="background-color:#FFF;"/>
                        </li>
                    </ul>
                    <div class="login-contents">
                        <span><asp:Button ID="btnSubmit" runat="server" Text="Login" BackColor="#009900" BorderStyle="None" Width="136px" Height="50px" OnClick="btnSubmit_Click"/>
                        </span>
                        <%--<div style="text-align:center"><asp:HyperLink ID="hLinkRegister" runat="server" Font-Size="X-Large" ForeColor="#220088" NavigateUrl="~/Register.aspx">建立帳戶</asp:HyperLink></div>--%>
                    </div>
                    <span class="login-contentsL"><asp:Button ID="btnEnter" runat="server" Text="Backstage" BackColor="#EE7700" Width="136px" Height="50px" BorderStyle="None" OnClick="btnEnter_Click"/></span>
                    
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

            
        </script>
    </form>
</body>
</html>