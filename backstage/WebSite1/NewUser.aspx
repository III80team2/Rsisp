<%@ Page Language="C#" MasterPageFile="MasterPage.master" %>

<asp:Content ContentPlaceHolderId="CPH1" runat="server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 114px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 114px;
            height: 23px;
        }
        .auto-style5 {
            width: 300px;
            height: 23px;
        }
        .auto-style6 {
            width: 114px;
            height: 39px;
        }
        .auto-style7 {
            width: 300px;
            height: 39px;
        }
    </style>
</head>
<body style="width: 994px">
    <form id="form1" runat="server">
    <div >
    
        <table class="table table-bordered">
            <tr>
                <td colspan="2">新增使用者</td>
            </tr>
            <tr>
                <td class="auto-style2">姓氏：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">名字：</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">出生年月日：</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                    年<asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Jan</asp:ListItem>
                        <asp:ListItem>Feb</asp:ListItem>
                        <asp:ListItem>Mar</asp:ListItem>
                        <asp:ListItem>Apr</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>Jun</asp:ListItem>
                        <asp:ListItem>Jul</asp:ListItem>
                        <asp:ListItem>Aug</asp:ListItem>
                        <asp:ListItem>Sep</asp:ListItem>
                        <asp:ListItem>Oct</asp:ListItem>
                        <asp:ListItem>Nov</asp:ListItem>
                        <asp:ListItem>Dec</asp:ListItem>
                    </asp:DropDownList>
                    月<asp:DropDownList ID="DropDownList4" runat="server">
                    </asp:DropDownList>
                    日</td>
            </tr>
            <tr>
                <td class="auto-style2">身分證字號：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">帳號：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">密碼：</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">角色</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <button type="button" class="btn btn-primary">送出</button>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
    </asp:Content>