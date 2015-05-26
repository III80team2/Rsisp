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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RsispConnectionString %>" SelectCommand="SELECT * FROM [patientList] WHERE ([pid] = @pid)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="pid" QueryStringField="pid" Type="Int32" />
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
                                    <img src="<%# Eval("picPath") %>"/>
                                </div>
                                <div class="caption" style="text-align: center">
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("picTitle") %>'></asp:Label>
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
