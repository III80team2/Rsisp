<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="userUpdate.aspx.cs" Inherits="backstage_userUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
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
        </form>
    </div>
</asp:Content>
