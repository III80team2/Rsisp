<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assess.aspx.cs" Inherits="testAssess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap-switch.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="Scripts/bootstrap-switch.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>
                <asp:Label ID="lblAssessName" runat="server" Text="AssessName" CssClass="label label-default"></asp:Label>
            </h1>
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <script type="text/javascript">
                    $(function radio() {
                        for (var i = 0 ; i <= 29 ; i++) {
                            $("#rdbtn" + i).bootstrapSwitch({
                                onText: '<span class="glyphicon glyphicon-ok"></span>',
                                offText: '<span class="glyphicon glyphicon-remove"></span>'
                            });
                        }
                    })
        </script>
            </asp:PlaceHolder>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
             
        </div>
    </form>
</body>
</html>
