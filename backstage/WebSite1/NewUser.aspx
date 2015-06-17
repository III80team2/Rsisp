<%@ Page Language="C#" MasterPageFile="MasterPage.master" %>

<asp:Content ContentPlaceHolderId="CPH1" runat="server">

    <!DOCTYPE html>
    <script runat="server">

        protected void DropDownListYear_Load(object sender, EventArgs e)
        {
            for(int i=1900;i<=DateTime.Today.Year;i++)
            {
                DropDownListYear.Items.Add(i.ToString());
            }
        }

        protected void DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListDate.Items.Clear();
            int i=31;
            switch (DropDownListMonth.SelectedValue)
            {
                case "1":
                case "3":
                case "5":
                case "7":
                case "8":
                case "10":
                case "12":  
                    i = 31;
                    break;
                case "4":
                case "6":
                case "9":
                case "11":
                    i = 30;
                    break;
                case"2":
                    if (DateTime.IsLeapYear(Convert.ToInt16(DropDownListYear.SelectedValue)))
                    {
                        i = 29;
                    }
                    else
                    { i = 28; }
                    break;   
            }
            
            for(int days=1;days<=i;days++)
            { DropDownListDate.Items.Add(days.ToString()); }
        }
</script>


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
                    <asp:DropDownList ID="DropDownListYear" runat="server" OnLoad="DropDownListYear_Load">
                    </asp:DropDownList>
                    年<asp:DropDownList ID="DropDownListMonth" runat="server" OnSelectedIndexChanged="DropDownListMonth_SelectedIndexChanged">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    月<asp:DropDownList ID="DropDownListDate" runat="server">
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