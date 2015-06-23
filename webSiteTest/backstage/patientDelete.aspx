<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientDelete.aspx.cs" Inherits="backstage_patientDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            姓名：<asp:DropDownList ID="ddlPatientName" runat="server" AutoPostBack="True" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
            </asp:DropDownList>
            <asp:Button ID="btndeletePatient" runat="server" OnClick="btndeletePatient_Click" Text="刪除" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
