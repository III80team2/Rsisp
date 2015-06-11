<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>


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
<body role="document" style="background-color: #FFF">
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
                        <a class="navbar-brand" href="index.html">玫瑰園 </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">首頁</a>   </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">人員資料管理<i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">修改人員資料</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">新增人員</a></li>
                                    <li><a href="#">刪除人員資料</a></li>
                                </ul>

                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">角色功能管理<i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">修改角色權限</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">新增角色</a></li>
                                    <li><a href="#">刪除角色</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">評估表管理 <i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">修改評估表樣式</a></li>

                                    <li class="divider"></li>
                                    <li><a href="#">新增評估表樣式</a></li>
                                    <li><a href="#">刪除評估表樣式</a></li>

                                </ul>
                            </li>
                            <li>
                                <a href="#">登出</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>

</body>

</html>
