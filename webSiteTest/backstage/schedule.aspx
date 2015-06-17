<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="schedule.aspx.cs" Inherits="backstage_schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvSchedules" runat="server" CssClass="table"></asp:GridView>
        </form>
    </div>
</asp:Content>
