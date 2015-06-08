<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <table>
            <tr>
                <td style="width: 200px;height:750px;margin:45px 0 0 80px;padding:0;vertical-align:top;">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto;">
                                <div class="thumbnail">
                                    <img src="<%# Eval("PatientPhotoPath") %>"/>
                                </div>
                                <div class="caption" style="text-align:inherit;padding-left:20px">
                                    姓名:<asp:Label ID="lblTitle" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label><br/>
                                    身分證字號:<asp:Label ID="Label1" runat="server" Text='<%# Eval("PatientIDCard") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </td>
                <td  rowspan="2"  style="background-color:#EEE;width:1000px;vertical-align:top;">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString %>" SelectCommand="SELECT * FROM [Patients] WHERE ([ID_Patient] = @ID_Patient)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ID_Patient" QueryStringField="pid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString %>" SelectCommand="SELECT * FROM [AssessStyle] WHERE [ID_Assess] in (SELECT [ID_Assess] FROM [Schedules] WHERE ([ID_Patient] = @ID_Patient) and [isFinished] = 0)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ID_Patient" QueryStringField="pid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">

                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto;vertical-align:top;" runat="server">
                                <div class="caption" style="text-align:inherit;padding-left:20px" runat="server">
                                    <asp:Button ID="Button1" runat="server" BorderStyle="None" BackColor="" Text='<%# Eval("AssessName") %>' OnClick="Button1_Click" /><br />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
        <div >
        </div>
    </form>
</asp:Content>

