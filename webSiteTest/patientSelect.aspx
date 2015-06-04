<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patientSelect.aspx.cs" Inherits="patientSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>選擇病患頁面</title>
    <style>
        .blockSearch {
            margin:150px 250px 80px 300px
        }
        #tboxPatient {
            width: 576px;
            height: 38px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: xx-large;
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            color: #FFFFFF;
        }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-2.1.4.min.js"></script>
</head>
<body style="background-color:#DDD">
    <form id="form1" runat="server">
        <div style="background-color:#888; height:100px;vertical-align:middle" class="auto-style2">
            <p>
                <img src="pics/logo.png"/>
                <span class="auto-style3">評估表資訊系統
            </span>
            </p>
        </div>
        <div class="blockSearch">
            <input type="text" id="tboxPatient" name="tboxPatient" placeholder="請輸入住民姓名" runat="server" style="width:50%"/>
            <asp:ImageButton ID="ibtnSearch" runat="server" Height="25px" ImageAlign="Middle" ImageUrl="~/pics/searchIcon.png" OnClick="ibtnSearch_Click" />
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
    </form>
</body>
</html>
