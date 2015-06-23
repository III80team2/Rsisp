<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="userDelete.aspx.cs" Inherits="backstage_userDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            警告：刪除使用者帳號會連帶刪除其個人事項及評估紀錄！
        </div>
        <form id="fomr1" runat="server">
            姓名：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btndeleteUser" runat="server" OnClick="btndeleteUser_Click" Text="刪除" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
