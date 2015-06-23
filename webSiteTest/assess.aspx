<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assess.aspx.cs" Inherits="assess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Assess</title>
    <link href="Content/bootstrap-switch.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.4.min.js"></script>
    <script src="Scripts/bootstrap-switch.js"></script>

</head>
<body style="background: -webkit-linear-gradient(top, rgb(203, 235, 219) 0%, rgb(55, 148, 192) 120%);">
    <div class="container" id="assessForm">
        <form id="form1" runat="server">
            <h1>
                <asp:Label ID="lblAssessName" runat="server" Text="AssessName" CssClass="label label-warning"></asp:Label>
                <asp:Label ID="lbltotalScore" runat="server" Text="TotalScore" CssClass="label label-success pull-right" Visible="False"></asp:Label>
            </h1>
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <script type="text/javascript">
                    $(function radio() {
                        var count = $('#form1').children().children().length;
                        for (var i = 0 ; i < count * count ; i++) {
                            $("#rdbtn" + i).bootstrapSwitch({
                                onText: '<span class="glyphicon glyphicon-ok"></span>',
                                offText: '<span class="glyphicon glyphicon-remove"></span>'
                            });
                        }
                    })
                </script>
            </asp:PlaceHolder>
            <br />
        </form>
    </div>
</body>
</html>
