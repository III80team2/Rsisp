<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dataBaseTest.aspx.cs" Inherits="dataBaseTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <table class="table">
            <tr>
                <td>dataBaseTest</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    使用者資料表<asp:GridView ID="gvUsers" runat="server" CssClass="table">
                    </asp:GridView>
                </td>
                <td>
                    身分角色資料表<asp:GridView ID="gvRoles" runat="server" CssClass="table">
                    </asp:GridView>
                </td>
                <td>
                    住民資料表<asp:GridView ID="gvPatients" runat="server" CssClass="table">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>新增使用者<br />
                    帳號：<asp:TextBox ID="tbUserAccount" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    密碼：<asp:TextBox ID="tbUserPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    姓名：<asp:TextBox ID="tbUserName" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    角色：<asp:DropDownList ID="ddlRole1" runat="server" AutoPostBack="True" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Text="新增" CssClass="btn btn-default" />
                </td>
                <td>新增身分角色<br />
                    ID：<asp:TextBox ID="tbRoleID" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    名稱：<asp:TextBox ID="tbRoleName" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnAddRole" runat="server" OnClick="btnAddRole_Click" Text="新增" CssClass="btn btn-default" />
                </td>
                <td>
                    新增住民<br />
                    姓名：<asp:TextBox ID="tbPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    身分證字號：<asp:TextBox ID="tbPatientIDCard" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    出生日期：<asp:Calendar ID="calPatientBirthday" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <br />
                    個人照片：<asp:FileUpload ID="fuPatientPhoto" runat="server" />
                    <asp:Button ID="btnAddPatient" runat="server" OnClick="btnAddPatient_Click" Text="新增" CssClass="btn btn-default" />
                </td>
            </tr>
            <tr>
                <td>刪除使用者<br />
                    姓名：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="dropdown">
                    </asp:DropDownList>
                    <asp:Button ID="btndeleteUser" runat="server" OnClick="btndeleteUser_Click" Text="刪除" CssClass="btn btn-default" />
                </td>
                <td class="auto-style18">刪除身分角色<br />
                    名稱：<asp:DropDownList ID="ddlRoleName" runat="server" AutoPostBack="True" CssClass="dropdown">
                    </asp:DropDownList>
                    <asp:Button ID="btndeleteRole" runat="server" OnClick="btndeleteRole_Click" Text="刪除" CssClass="btn btn-default" />
                </td>
                <td>刪除住民<br />
                    姓名：<asp:DropDownList ID="ddlPatientName" runat="server" AutoPostBack="True" CssClass="dropdown">
                    </asp:DropDownList>
                    <asp:Button ID="btndeletePatient" runat="server" OnClick="btndeletePatient_Click" Text="刪除" CssClass="btn btn-default" />
                </td>
            </tr>
            <tr>
                <td>更新使用者資料<br />
                    ID：<asp:DropDownList ID="ddlUserID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserID_SelectedIndexChanged" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    帳號：<asp:TextBox ID="tbUserAccount2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    密碼：<asp:TextBox ID="tbUserPassword2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    姓名：<asp:TextBox ID="tbUserName2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    角色：<asp:DropDownList ID="ddlRole2" runat="server" AutoPostBack="True" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnUpdateUser" runat="server" OnClick="btnUpdateUser_Click" Text="更新" CssClass="btn btn-default" />
                </td>
                <td>更新身分角色資料<br />
                    ID：<asp:DropDownList ID="ddlRoleID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserID_SelectedIndexChanged" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    名稱：<asp:TextBox ID="tbRoleName2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnUpdateRole" runat="server" OnClick="btnUpdateRole_Click" Text="更新" CssClass="btn btn-default" />
                </td>
                <td>更新住民資料<br />
                    ID：<asp:DropDownList ID="ddlPatientID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPatientID_SelectedIndexChanged" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    姓名：<asp:TextBox ID="tbPatientName2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    身分證字號：<asp:TextBox ID="tbPatientIDCard2" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    出生日期：<asp:Calendar ID="calPatientBirthday2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <br />
                    個人照片：<asp:FileUpload ID="fuPatientPhoto2" runat="server" />
                    <asp:Button ID="btnUpdatePatient" runat="server" OnClick="btnUpdatePatient_Click" Text="更新" CssClass="btn btn-default" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="tbBirthday" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btnGetByBirthday" runat="server" OnClick="btnGetByBirthday_Click" Text="以生日查詢" CssClass="btn btn-default" />
                    <br />
                    ID：<asp:Label ID="lblPID" runat="server" CssClass="form-control"></asp:Label>
                    <br />
                    姓名：<asp:Label ID="lblPName" runat="server" CssClass="form-control"></asp:Label>
                    <br />
                    身分證字號：<asp:Label ID="lblPIDCard" runat="server" CssClass="form-control"></asp:Label>
                    <br />
                    生日：<asp:Label ID="lblPBirthday" runat="server" CssClass="form-control"></asp:Label>
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
