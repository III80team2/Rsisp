<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LoginTest</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
<style>

  .hidden-label {
  position: absolute !important;
  clip: rect(1px 1px 1px 1px);
  clip: rect(1px, 1px, 1px, 1px);
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  }
</style>
</head>

<body>
    <form id="form1" runat="server">
    <div style="margin-top:180px">
        <h1 style="text-align: center">ISP資訊系統登入畫面</h1>
    </div>
        <div style="text-align: center; padding-top: 50px; background-color: #ede9e9; height: 350px; margin: 10px 500px 0 500px">
            <div>
                <asp:ImageButton ID="iButtonStuff" runat="server" OnClick="iButtonStuff_Click" ImageUrl="~/pics/hospital.png" />
                <asp:ImageButton ID="iButtonGuset" runat="server" ImageUrl="~/pics/guest.png" OnClick="iButtonGuset_Click" />
            </div>
            <div style="color: #800080; font-weight: 700; font-size: medium">
                <label class="hidden-label" for="loginName">帳號</label>
                <input id="loginName" name="qq" placeholder="帳號" spellcheck="false" style="width: 250px; font-weight: normal; font-size: medium; color: #000000;" /><br />
                <label class="hidden-label" for="Passwd">密碼</label>
                <input id="Passwd" name="Passwd" type="password" placeholder="密碼" style="width: 250px; font-weight: normal; font-size: medium; color: #000000;" /><br />
                <br />
                &nbsp;<asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認" OnClick="btnSubmit_Click" BackColor="#0099FF" BorderStyle="None" Width="266px" />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Medium" ForeColor="#990099">忘記密碼</asp:HyperLink>
            </div>
        </div>
    
        
    <br /><br />

    <footer style="background-color:#FFF;height:80px;font-size:large;color:black;text-align:center">
        <div>
            <p>Trafalgar Law &nbsp;&copy;&nbsp;tel:123456789&nbsp;address:Dressrosa</p>
        </div>
    </footer>
    </form>
</body>

</html>




<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
