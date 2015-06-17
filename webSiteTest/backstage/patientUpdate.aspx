<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="patientUpdate.aspx.cs" Inherits="backstage_patientUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="fomr1" runat="server">
            ID：<asp:DropDownList ID="ddlPatientID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPatientID_SelectedIndexChanged" CssClass="dropdown">
            </asp:DropDownList>
            <br />
            姓名：<asp:TextBox ID="tbPatientName2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            身分證字號：<asp:TextBox ID="tbPatientIDCard2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            出生日期：<asp:Calendar ID="calPatientBirthday2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />
            個人照片：<asp:FileUpload ID="fuPatientPhoto2" runat="server" />
            <asp:Button ID="btnUpdatePatient" runat="server" OnClick="btnUpdatePatient_Click" Text="更新" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
