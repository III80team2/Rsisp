<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-2.1.4.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString3 %>" SelectCommand="SELECT * FROM [Patients] WHERE ([ID_Patient] = @ID_Patient)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ID_Patient" QueryStringField="pid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="col-sm-6 col-md-3" style="width:auto">
                                <div class="thumbnail">
                                    <img src="<%# Eval("PatientPhotoPath") %>"/>
                                </div>
                                <div class="caption" style="text-align: center">
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label>
                                </div>

                            </div>
                        </ItemTemplate>
                        
                    </asp:ListView>
                    
                </td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
