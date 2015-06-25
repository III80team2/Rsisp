<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="backstage_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 人員資料總覽
        </div>
        <form id="form1" runat="server">
            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True">
                <HeaderStyle BackColor="#CCFFFF" />
            </asp:GridView>
        </form>
    </div>
</asp:Content>
