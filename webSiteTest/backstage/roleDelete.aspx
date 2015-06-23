<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="roleDelete.aspx.cs" Inherits="backstage_roleDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> 刪除身分權限
        </div>
        <form id="fomr1" runat="server">
            名稱：<asp:DropDownList ID="ddlRoleName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
            </asp:DropDownList>
            <br />
            <asp:Button ID="btndeleteRole" runat="server" OnClick="btndeleteRole_Click" Text="刪除" CssClass="btn btn-danger" />
        </form>
        <br />
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            警告：刪除身分權限可能會影響其所屬之使用者帳號！
        </div>
    </div>
</asp:Content>
