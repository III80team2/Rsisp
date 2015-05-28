<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <table>
            <tr>
                <td class="patientDiv">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto;vertical-align:top;">
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
                <td  rowspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString3 %>" SelectCommand="SELECT * FROM [Patients] WHERE ([ID_Patient] = @ID_Patient)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ID_Patient" QueryStringField="pid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="background-color:#ff6a00;width:500px">&nbsp;</td>
            </tr>
        </table>
        <div >
        </div>
    </form>
</asp:Content>

