<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="role.aspx.cs" Inherits="backstage_role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvRoles" runat="server" CssClass="table"></asp:GridView>
        </form>
    </div>
</asp:Content>

