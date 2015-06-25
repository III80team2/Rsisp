<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="scheduleUpdate.aspx.cs" Inherits="backstage_scheduleUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> 更新計畫
        </div>
        <form id="form1" runat="server">
            計畫編號：<asp:DropDownList ID="ddlScheduleID" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black" OnSelectedIndexChanged="ddlScheduleID_SelectedIndexChanged">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            評估人：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            住民：<asp:DropDownList ID="ddlPatientName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            評估表：<asp:DropDownList ID="ddlAssessName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            期限：<asp:TextBox ID="tbDeadLine" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnUpdateSchedule" runat="server" OnClick="btnUpdateSchedule_Click" Text="更新" CssClass="btn btn-warning" />
        </form>
        <br />
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            注意：只提供尚未完成的計畫可以更新！
        </div>
    </div>
</asp:Content>
