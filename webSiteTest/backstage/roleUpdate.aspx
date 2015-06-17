<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="roleUpdate.aspx.cs" Inherits="backstage_roleUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            ID：<asp:DropDownList ID="ddlRoleID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRoleID_SelectedIndexChanged" CssClass="dropdown">
            </asp:DropDownList>
            <br />
            名稱：<asp:TextBox ID="tbRoleName2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Button ID="btnUpdateRole" runat="server" OnClick="btnUpdateRole_Click" Text="更新" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
