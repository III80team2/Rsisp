<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="role.aspx.cs" Inherits="backstage_role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 身分權限總覽
        </div>
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvRoles" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <HeaderStyle BackColor="#CCFFFF" />
            </asp:GridView>
        </form>
    </div>
</asp:Content>

