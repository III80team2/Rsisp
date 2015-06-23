<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loadingTest</title>
    <script src="Scripts/jquery-2.1.4.js"></script>
    <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server" action="test2.aspx" method="post">
         <input type="text" name="Text"/> 
         <input type="button"  value="送出" onClick="Submit()"/>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    </form>
    <div id="loadingIMG" style="display:none">
        <img src="pics/loading.gif" height="14"/>資料處理中，請稍後。</div>
    <script>
        var AJAX_Work = function () {
            $.ajax({
                url: "test2.aspx",
                data: $('#form1').serialize(),
                type: "POST",
                dataType: 'text',
                async: false,
                success: function () {
                    $("#form1").submit();
                },
                complete: function () {
                    $('#loadingIMG').hide();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        }


        //var Submit = function () {
        $("#form1").submit(function () {
            $('#loadingIMG').show();
            setTimeout(function () {
                AJAX_Work();
            }, 3000);
            

        })


        </script>
</body>
</html>
