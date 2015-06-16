<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:content 
    runat="server"
    contentplaceholderid="ContentPlaceHolder1" >Hello, Master Pages!

<html lang="zh-TW">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Website </title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Custom.css" rel="stylesheet" />
   

</head>



<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-header">


                    <a class="navbar-brand" href="index.html">玫瑰園</a>
                </div>


                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">首頁</a>
                        </li>
                        <li>
                            <a href="Users.aspx">人員資料管理</a>
                        </li>
                        <li>
                            <a href="Role.aspx">角色功能管理</a>
                        </li>
                        <li > 
                            <a href="Assessment.aspx" >評估表管理 </a>                                                   </li>
                        <li>
                            <a href="#">登出</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <header class="jumbotron subhead" id="overview">
        <div class="container">
            <h2>後台管理系統</h2>

            <div id="carbonads-container">
                <div class="carbonad">
                    <div id="azcarbon">
                        <span>
                            <span class="carbonad-image carbonad-image carbonad-img"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>


    </header>

  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
</body>

</html></asp:content>
