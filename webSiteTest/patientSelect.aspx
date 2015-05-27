<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patientSelect.aspx.cs" Inherits="patientSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>選擇病患頁面</title>
    <style>
        .blockSearch {
            margin:150px 250px 50px 300px
        }
        #tboxPatient {
            width: 576px;
            height: 38px;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-2.1.4.min.js"></script>
</head>
<body style="background-color:white">
    <form id="form1" runat="server">
        <div class="blockSearch">
            <input type="text" id="tboxPatient" name="tboxPatient" placeholder="請輸入住民姓名" runat="server"/>
            <asp:ImageButton ID="ibtnSearch" runat="server" Height="25px" ImageAlign="Middle" ImageUrl="~/pics/searchIcon.jpg" OnClick="ibtnSearch_Click" />
        </div>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString %>" SelectCommand="SELECT * FROM [patientList]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="margin:150px">
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
                                    <td runat="server" style="">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="16">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn-primary"/>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto">
                                <div class="thumbnail">
                                    <asp:HyperLink runat="server" ImageUrl='<%# Eval("picPath") %>' NavigateUrl='<%#"test.aspx?pid="+Eval("pid")%>' Width="150px" Height="150px">
                                    </asp:HyperLink>
                                    <div class="caption" style="text-align:center">
                                     <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("picTitle") %>'></asp:Label>
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
