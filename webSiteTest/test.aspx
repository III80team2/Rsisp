<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />

    <link href="Content/bootstrap-switch.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="Scripts/bootstrap-switch.js"></script>
    <script src="Scripts/bootstrap.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">

        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <input id="a" type="checkbox" name="my-checkbox"  data-on-label="SI" data-off-label="NO"/>
         <script>
             $(function radio(id) {
                 $("#rdbtn").bootstrapSwitch({
                     onText: '<span class="glyphicon glyphicon-ok"></span>',
                     offText: '<span class="glyphicon glyphicon-remove"></span>'
                 });
             })
        </script>

        <script type="text/javascript">
            $(function radio() {
                for (var i = 0 ; i <= 28 ;i++)
                {
                    $("#rdbtn"+i).bootstrapSwitch({
                        onText: '<span class="glyphicon glyphicon-ok"></span>',
                        offText: '<span class="glyphicon glyphicon-remove"></span>'
                    });
                }
                })
        </script>
    </form>
</body>
</html>
