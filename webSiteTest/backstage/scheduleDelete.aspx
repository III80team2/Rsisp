<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="scheduleDelete.aspx.cs" Inherits="backstage_scheduleDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> 刪除計畫
        </div>
        <form id="form1" runat="server">
            計畫編號：<asp:DropDownList ID="ddlScheduleID" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />            
            <asp:Button ID="btnDeleteSchedule" runat="server" OnClick="btnDeleteSchedule_Click" Text="刪除" CssClass="btn btn-danger" />
        </form>
        <br />
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            注意：只提供尚未完成的計畫可以刪除！
        </div>
    </div>
</asp:Content>
