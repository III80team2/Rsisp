<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientUpdate.aspx.cs" Inherits="backstage_patientUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <div class="page-header">
            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> 修改住民資料
        </div>
        <form id="fomr1" runat="server">
            ID：<asp:DropDownList ID="ddlPatientID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPatientID_SelectedIndexChanged" CssClass="dropdown-header" Font-Size="Small" ForeColor="Black">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <br />
            姓名：<asp:TextBox ID="tbPatientName2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            身分證字號：<asp:TextBox ID="tbPatientIDCard2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            出生日期：<asp:TextBox ID="tbPatientBirthday" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            個人照片：<asp:FileUpload ID="fuPatientPhoto2" runat="server" />
            <br />
            <asp:Button ID="btnUpdatePatient" runat="server" OnClick="btnUpdatePatient_Click" Text="更新" CssClass="btn btn-warning" />
        </form>
    </div>
</asp:Content>
