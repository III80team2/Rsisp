<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="userDelete.aspx.cs" Inherits="backstage_userDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            姓名：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <asp:Button ID="btndeleteUser" runat="server" OnClick="btndeleteUser_Click" Text="刪除" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
