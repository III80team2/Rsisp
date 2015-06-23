<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="roleAdd.aspx.cs" Inherits="backstage_roleAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增身分權限
        </div>
        <form id="fomr1" runat="server">
            ID：<asp:TextBox ID="tbRoleID" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            名稱：<asp:TextBox ID="tbRoleName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddRole" runat="server" OnClick="btnAddRole_Click" Text="新增" CssClass="btn btn-success" />
        </form>
    </div>
</asp:Content>
