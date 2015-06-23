<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="userAdd.aspx.cs" Inherits="backstage_userAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="form1" runat="server">
            帳號：<asp:TextBox ID="tbUserAccount" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            密碼：<asp:TextBox ID="tbUserPassword" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            姓名：<asp:TextBox ID="tbUserName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            角色：<asp:DropDownList ID="ddlRole1" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Bold="False" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Text="新增" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
