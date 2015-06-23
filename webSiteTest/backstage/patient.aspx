<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patient.aspx.cs" Inherits="backstage_patient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 住民資料總覽
        </div>
        <form id="fomr1" runat="server">
            <asp:GridView ID="gvPatients" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <HeaderStyle BackColor="#CCFFFF" />
            </asp:GridView>
        </form>
    </div>
</asp:Content>
