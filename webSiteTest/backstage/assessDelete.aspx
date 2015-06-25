<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="assessDelete.aspx.cs" Inherits="backstage_assessDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> 評估表樣式總覽
        </div>
        <form id="fomr1" runat="server">
            評估表樣式名稱：<asp:DropDownList ID="ddlAssessName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnDeleteAssess" runat="server" OnClick="btnDeleteAssess_Click" Text="刪除" CssClass="btn btn-danger" />
        </form>
        <br />
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            警告：刪除評估表樣式會連帶刪除評估表的所有紀錄！
        </div>
    </div>
</asp:Content>
