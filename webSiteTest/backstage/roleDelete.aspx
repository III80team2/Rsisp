<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="roleDelete.aspx.cs" Inherits="backstage_roleDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            名稱：<asp:DropDownList ID="ddlRoleName" runat="server" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <asp:Button ID="btndeleteRole" runat="server" OnClick="btndeleteRole_Click" Text="刪除" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
