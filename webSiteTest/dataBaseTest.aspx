<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dataBaseTest.aspx.cs" Inherits="dataBaseTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>dataBaseTest<asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="重新整理" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>新增使用者</td>
            </tr>
            <tr>
                <td>帳號：<asp:TextBox ID="tbUserAccount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>密碼：<asp:TextBox ID="tbUserPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>姓名：<asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>角色：<asp:TextBox ID="tbID_Role" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="新增" />
                    <asp:Label ID="lblMessage" runat="server" Text="message"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
