<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="scheduleAdd.aspx.cs" Inherits="backstage_scheduleAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">
        <form id="form1" runat="server">
            評估人：<asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <br />
            住民：<asp:DropDownList ID="ddlPatientName" runat="server" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <br />
            評估表：<asp:DropDownList ID="ddlAssessName" runat="server" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <br />
            期限：<asp:Calendar ID="calPatientBirthday" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />
            <asp:Button ID="btnAddSchedule" runat="server" OnClick="btnAddSchedule_Click" Text="新增" CssClass="btn btn-default" />
        </form>
    </div>
</asp:Content>
