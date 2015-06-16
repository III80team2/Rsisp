<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>

    <!-- Bootstrap theme -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/main.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />

    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $('.carousel').carousel({
            interval: 2000
        })
    </script>
</head>
<body role="document" style="background-color: #EEE">
    <div>
        <header>
            <nav class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.aspx">
                            <img src="pics/logo_heart.png" alt="logo" /></a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index.aspx">Home</a></li>
                            <li><a href="patientSelect.aspx">選擇目標院民</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">評估表 <i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">觀看病患評估表</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">待辦事項</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">相關連結 <i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="http://thmh.khja.org.tw/">仁愛之家</a></li>
                                    <li><a href="http://rose.khja.org.tw/?">玫瑰園養護中心</a></li>
                                    <li><a href="http://www.tanh.org.tw/index.aspx">老人養護中心</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">登入帳號：<asp:Label ID="lblLoginName" runat="server" Text="Label"></asp:Label><i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu" style="font-size: medium;">
                                    <li><a href="login.aspx">登出</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

    </div>
</body>
</html>
