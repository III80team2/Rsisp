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
        .auto-style6 {
            height: 20px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style13 {
            height: 23px;
        }
        .auto-style15 {
            width: 205px;
            height: 20px;
        }
        .auto-style16 {
            width: 205px;
            height: 23px;
        }
        .auto-style17 {
            width: 205px;
            height: 26px;
        }
        .auto-style18 {
            width: 300px;
        }
        .auto-style19 {
            width: 300px;
            height: 20px;
        }
        .auto-style20 {
            width: 300px;
            height: 23px;
        }
        .auto-style21 {
            width: 300px;
            height: 26px;
        }
        .auto-style22 {
            width: 205px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style18">dataBaseTest<asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="重新整理" />
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="lblMessage1" runat="server" Text="message"></asp:Label>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    使用者資料表<asp:GridView ID="gvUsers" runat="server">
                    </asp:GridView>
                </td>
                <td class="auto-style22">
                    角色資料表<asp:GridView ID="gvRoles" runat="server">
                    </asp:GridView>
                </td>
                <td>
                    病患資料表<asp:GridView ID="gvPatients" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">新增使用者</td>
                <td class="auto-style22">&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbBirthday" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGetByBirthday" runat="server" OnClick="btnGetByBirthday_Click" Text="以生日查詢" />
                </td>
            </tr>
            <tr>
                <td class="auto-style18">帳號：<asp:TextBox ID="tbUserAccount" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>ID：<asp:Label ID="lblPID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">密碼：<asp:TextBox ID="tbUserPassword" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>姓名：<asp:Label ID="lblPName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">姓名：<asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>身分證字號：<asp:Label ID="lblPIDCard" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">角色：<asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>生日：<asp:Label ID="lblPBirthday" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Button ID="btnAdd1" runat="server" OnClick="btnAdd1_Click" Text="新增" />
                </td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">刪除使用者</td>
                <td class="auto-style15"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style18">姓名：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Button ID="btndelete1" runat="server" OnClick="btndelete1_Click" Text="刪除" />
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                </td>
                <td class="auto-style16"></td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style18">更新使用者資料</td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">ID：<asp:DropDownList ID="ddlUserID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserID_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style17"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style18">帳號：<asp:TextBox ID="tbUserAccountNew" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">密碼：<asp:TextBox ID="tbUserPasswordNew" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">姓名：<asp:TextBox ID="tbUserNameNew" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">角色：<asp:DropDownList ID="ddlRoleNew" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Button ID="btnUpdate1" runat="server" OnClick="btnUpdate1_Click" Text="更新" />
                </td>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
