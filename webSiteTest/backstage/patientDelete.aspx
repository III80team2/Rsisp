<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientDelete.aspx.cs" Inherits="backstage_patientDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> 刪除住民資料
        </div>
        <form id="fomr1" runat="server">
            姓名：<asp:DropDownList ID="ddlPatientName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
            </asp:DropDownList>
            <br />
            <asp:Button ID="btndeletePatient" runat="server" OnClick="btndeletePatient_Click" Text="刪除" CssClass="btn btn-danger" />
        </form>
        <br />
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            警告：刪除住民資料會連帶刪除其評估紀錄！
        </div>
    </div>
</asp:Content>
