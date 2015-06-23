<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="userUpdate.aspx.cs" Inherits="backstage_userUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> 修改人員資料
        </div>
        <form id="fomr1" runat="server">
            ID：<asp:DropDownList ID="ddlUserID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserID_SelectedIndexChanged" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            帳號：<asp:TextBox ID="tbUserAccount2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            密碼：<asp:TextBox ID="tbUserPassword2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            姓名：<asp:TextBox ID="tbUserName2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            角色：<asp:DropDownList ID="ddlRole2" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnUpdateUser" runat="server" OnClick="btnUpdateUser_Click" Text="更新" CssClass="btn btn-warning" />
        </form>
    </div>
</asp:Content>
