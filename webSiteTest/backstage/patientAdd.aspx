<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientAdd.aspx.cs" Inherits="backstage_patientAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增住民資料
        </div>
        <form id="fomr1" runat="server">
            姓名：<asp:TextBox ID="tbPatientName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            身分證字號：<asp:TextBox ID="tbPatientIDCard" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            出生日期：<asp:TextBox ID="tbPatientBirthday" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            個人照片：<asp:FileUpload ID="fuPatientPhoto" runat="server" />
            <br />
            <asp:Button ID="btnAddPatient" runat="server" OnClick="btnAddPatient_Click" Text="新增" CssClass="btn btn-success" />
        </form>
    </div>
</asp:Content>
