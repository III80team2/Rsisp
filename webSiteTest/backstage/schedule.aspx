<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="schedule.aspx.cs" Inherits="backstage_schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 個人計畫總覽
        </div>
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvSchedules" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True">
                <HeaderStyle BackColor="#CCFFFF" />
            </asp:GridView>
        </form>
    </div>
</asp:Content>
