<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="assess.aspx.cs" Inherits="backstage_assess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvAssesses" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False"></asp:GridView>
        </form>
    </div>
</asp:Content>
