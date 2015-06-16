<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>


<html lang="zh-TW">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Website </title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Custom.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>

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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">人員資料管理<i class="dropdown-toggle"></i></a>
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
                        <li > 
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" >評估表管理 <i class="icon-angle-down"></i></a> 
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

        <div><table class="auto-style1">
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">姓氏：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">名字：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">出生年月日：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">身分證字號：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">帳號：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">密碼：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table></div>

    </header>

  

   
</body>

</html>
