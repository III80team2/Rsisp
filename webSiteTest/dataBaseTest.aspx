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
        .auto-style4 {
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">dataBaseTest<asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="重新整理" />
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    使用者資料表<asp:GridView ID="gvUsers" runat="server">
                    </asp:GridView>
                </td>
                <td class="auto-style4">
                    角色資料表<asp:GridView ID="gvRoles" runat="server">
                    </asp:GridView>
                </td>
                <td>
                    病患資料表<asp:GridView ID="gvPatients" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">新增使用者</td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbBirthday" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGetByBirthday" runat="server" OnClick="btnGetByBirthday_Click" Text="以生日查詢" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">帳號：<asp:TextBox ID="tbUserAccount" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>ID：<asp:Label ID="lblPID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">密碼：<asp:TextBox ID="tbUserPassword" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>姓名：<asp:Label ID="lblPName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">姓名：<asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>身分證字號：<asp:Label ID="lblPIDCard" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">角色：<asp:DropDownList ID="ddlRole" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>生日：<asp:Label ID="lblPBirthday" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="新增" />
                    <asp:Label ID="lblMessage" runat="server" Text="message"></asp:Label>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
