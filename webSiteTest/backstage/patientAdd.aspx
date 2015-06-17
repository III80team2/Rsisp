<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientAdd.aspx.cs" Inherits="backstage_patientAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            姓名：<asp:TextBox ID="tbPatientName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            身分證字號：<asp:TextBox ID="tbPatientIDCard" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            出生日期：<asp:Calendar ID="calPatientBirthday" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />
            個人照片：<asp:FileUpload ID="fuPatientPhoto" runat="server" />
            <asp:Button ID="btnAddPatient" runat="server" OnClick="btnAddPatient_Click" Text="新增" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
