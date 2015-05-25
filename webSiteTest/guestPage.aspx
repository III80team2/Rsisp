<%@ Page Language="C#" AutoEventWireup="true" CodeFile="guestPage.aspx.cs" Inherits="guestPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>訪客頁面</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/doc.css" rel="stylesheet" />

    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding:100px 100px 50px 100px">
            <input id="patientName" name="patientName" type="text" placeholder="院民姓名" style="width:180px;" runat="server"/><br />
            <br/>
            <asp:Button ID="btnBirth" runat="server" Text="輸入生日" OnClick="btnBirth_Click" BorderStyle="None"/>
            &nbsp;<asp:Button ID="btnID" runat="server" Text="輸入身分證字號" OnClick="btnID_Click" BorderStyle="None"/>
            <br />
            <br />
            <span id="divBirth" runat="server">
                <input id="patientBirth" name="patientBirth" type="text" placeholder="院民生日" style="width:180px;" runat="server"/>
            </span>
            <span id="divID" runat="server" >
                <input id="patientID" name="patientID" type="text" placeholder="院民身分證字號" style="width:180px;" runat="server"/>
            </span>      
            <asp:Button ID="btnSubmit" runat="server" Text="確認" OnClick="btnSubmit_Click" BorderStyle="None" />
            
        </div>
        <div id="divTab" runat="server" style="padding-left:100px">
            <div class="tabbable tabs-left">
                <ul class="nav nav-tabs">
                    <li><a href="#lH" data-toggle="tab">ISP</a></li>
                    <li><a href="#lA" data-toggle="tab">居家活動</a></li>
                    <li><a href="#lB" data-toggle="tab">社區生活活動</a></li>
                    <li><a href="#lC" data-toggle="tab">終身學習活動</a></li>
                    <li><a href="#lD" data-toggle="tab">就業活動</a></li>
                    <li><a href="#lE" data-toggle="tab">健康與安全活動</a></li>
                    <li><a href="#lF" data-toggle="tab">社交活動</a></li>
                    <li><a href="#lG" data-toggle="tab">保護及權益倡導活動</a></li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane" id="lA">
                        <p>居家活動</p>
                    </div>
                    <div class="tab-pane" id="lB">
                        <p>社區生活活動</p>
                    </div>
                    <div class="tab-pane" id="lC">
                        <p>終身學習活動</p>
                    </div>
                    <div class="tab-pane" id="lD">
                        <p>就業活動</p>
                    </div>
                    <div class="tab-pane" id="lE">
                        <p>健康與安全活動</p>
                    </div>
                    <div class="tab-pane" id="lF">
                        <p>社交活動</p>
                    </div>
                    <div class="tab-pane" id="lG">
                        <p>保護及權益倡導活動</p>
                    </div>
                    <div class="tab-pane active" id="lH">
                        <p>ISP</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
