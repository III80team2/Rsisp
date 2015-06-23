<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="scheduleAdd.aspx.cs" Inherits="backstage_scheduleAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增事項
        </div>
        <form id="form1" runat="server">
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
            期限：<asp:TextBox ID="tbPatientBirthday" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddSchedule" runat="server" OnClick="btnAddSchedule_Click" Text="新增" CssClass="btn btn-success" />
        </form>
    </div>
</asp:Content>
