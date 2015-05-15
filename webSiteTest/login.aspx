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
    <div style="margin-top:200px">
        <h1 style="text-align: center">ISP資訊系統登入畫面</h1>
    </div>
    <div style="text-align:center;padding:75px;background-color:#555;height:250px;margin:300px">

        <label class="hidden-label" for="loginName">帳號</label>
        <input id="loginName" name="qq" placeholder="帳號"spellcheck="false" style="width:250px"/><br/>
        <label class="hidden-label" for="Passwd">密碼</label>
        <input id="Passwd" name="Passwd" type="password"placeholder="密碼" style="width:250px"/><br/><br/>
        <asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認" OnClick="btnSubmit_Click" />
        <a href="guestPage.aspx">我是訪客</a>

        <%--<p style="text-align: center; color: black;font-size:medium;overflow: hidden;visibility: hidden">
            <asp:TextBox ID="aaa" runat="server" ></asp:TextBox>
            <br /><br />

            密碼:
            <asp:TextBox ID="loginPassword" runat="server"></asp:TextBox><br /><br />

        </p>
        <p style="padding:0 0 0 35px">
            <asp:Button class="btn btn-default" ID="btnClear" runat="server" Text="清除重填" OnClick="btnClear_Click" />
            <asp:Button class="btn btn-default" ID="btnSubmit" runat="server" Text="確認送出" OnClick="btnSubmit_Click" /><br />
            <a href="guestPage.aspx">我是訪客</a>
        </p>--%>

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
