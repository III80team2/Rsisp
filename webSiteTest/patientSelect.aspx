<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patientSelect.aspx.cs" Inherits="patientSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>選擇病患頁面</title>
    <script type="text/javascript">
        $(function () {
            $("#tboxPatient").keypress(function (event) {
                if (event.keyCode == 13) {
                    $("#Form").submit();
                }
            });
        });
    </script>
    <style>
        .blockSearch {
            margin:150px 250px 80px 300px;
        }
        #tboxPatient {
            width: 576px;
            height: 38px;
        }
        .auto-style1 {
            width: 100%;
            /*margin:-650px 300px 20px 300px;*/
        }
        .auto-style2 {
            font-size: xx-large;
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            color: #FFFFFF;
        }
        .qq {
            background-color:#34495E;
            height:80px;
            padding:25px 0 0 25px;
            margin-bottom:100px
        }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post" action="test.aspx?pid=10001">
        <div class="qq">
            <span style="margin-right:15px"><img src="pics/logo_heart.png" alt="logo"/></span>
            <input type="text" id="tboxPatient" name="tboxPatient" placeholder="請輸入住民姓名" runat="server" style="width:50%"/>
            <asp:ImageButton ID="ibtnSearch" runat="server" Height="25px" ImageAlign="Middle" ImageUrl="~/pics/searchIcon_o.png" OnClick="ibtnSearch_Click" />
        </div>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString %>" SelectCommand="getPatients" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="margin:0 150px">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="16">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary"/>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto">
                                <div class="thumbnail">
                                    <asp:HyperLink runat="server" ImageUrl='<%# Eval("PatientPhotoPath") %>' NavigateUrl='<%#"index.aspx?pid="+Eval("ID_Patient")%>' Width="150px" Height="150px">
                                    </asp:HyperLink>
                                    <div class="caption" style="text-align:center">
                                     <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    </div>
                </td>
            </tr>
        </table>
        <script>
            window.onload = function () {
                document.getElementById("tboxPatient").focus();
            };
        </script>
    </form>
</body>
</html>
