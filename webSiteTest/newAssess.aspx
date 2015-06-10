﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newAssess.aspx.cs" Inherits="newAssess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        function addGroup() {
            var group_id = $('#newAssessStyle').children('div').length + 1;
            $('#newAssessStyle').append('<div id="group' + group_id + '" class="panel panel-primary"></div>');
            $('#group' + group_id).append('<div class="panel-heading">' + group_id + '. 群組名稱：</div>');
            $('#group' + group_id).append('<div id="groupFooter' + group_id + '" class="panel-footer"></div>');
            $('#group' + group_id + ' .panel-heading').append('<input type="text" id="groupName' + group_id + '"/>');
            $('#group' + group_id + ' .panel-footer').append('<button class="btn btn-default" onclick="addItemInGroup(' + group_id + ')">新增評估項目</button>');
            $('#group' + group_id + ' .panel-footer').append('<button class="btn btn-default" onclick="addTextInGroup(' + group_id + ')">新增文字項目</button>');
            $('#group' + group_id + ' .panel-footer').append('<button class="btn btn-danger btn-sm pull-right" onclick="clearAllInGroup(' + group_id + ')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>清除所有項目</button>');
        }
        function addItemInGroup(group_id) {
            var id = $('#group' + group_id).children('div').length - 1;
            var item_id = group_id + '-' + id;
            $('#groupFooter' + group_id).before('<div id="item' + item_id + '" class="panel-body panel-success"></div>');
            $('#item' + item_id).append('<div class="panel-heading">' + item_id + '. 評估項目名稱：</div>');
            $('#item' + item_id).append('<div id="itemFooter' + item_id + '" class="panel-footer"></div>');
            $('#item' + item_id + ' .panel-heading').append('<input type="text" id="itemName' + item_id + '"/>');
            $('#item' + item_id + ' .panel-footer').append('<button class="btn btn-default" onclick="addContentInItemGroup(' + group_id + ',' + id + ')">新增選項</button>');
            $('#item' + item_id + ' .panel-footer').append('<button class="btn btn-warning btn-sm pull-right" onclick="clearAllInGroupItem(' + group_id + ',' + id + ')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>清除所有選項</button>');
        }
        function addTextInGroup(group_id) {
            var id = $('#group' + group_id).children('div').length - 1;
            var text_id = group_id + '-' + id;
            $('#groupFooter' + group_id).before('<div id="text' + text_id + '" class="panel-body">' + text_id + '. 文字項目名稱：</div>');
            $('#text' + text_id).append('<input type="text" id="textName' + text_id + '"/>');
        }
        function addContentInItemGroup(group_id, id) {
            var item_id = group_id + '-' + id;
            var id = $('#item' + item_id).children('div').length - 1;
            var content_id = item_id + '-' + id;
            $('#itemFooter' + item_id).before('<div id="content' + content_id + '" class="panel-body"></div>');
            $('#content' + content_id).append(content_id + '. 選項內容：<input type="text" id="contentName' + content_id + '"/>');
            $('#content' + content_id).append(' 選項分數：<input type="text" id="contentScore' + content_id + '"/>');
        }
        function clearAllInGroup(group_id) {
            $('#group' + group_id + ' .panel-body').remove();
        }
        function clearAllInGroupItem(group_id, id) {
            var item_id = group_id + '-' + id;
            $('#item' + item_id + ' .panel-body').remove();
        }
        function addItem() {
            var item_id = $('#newAssessStyle').children('div').length + 1;
            $('#newAssessStyle').append('<div id="item' + item_id + '" class="panel panel-success"></div>');
            $('#item' + item_id).append('<div class="panel-heading">' + item_id + '. 評估項目名稱：</div>');
            $('#item' + item_id).append('<div id="itemFooter' + item_id + '" class="panel-footer"></div>');
            $('#item' + item_id + ' .panel-heading').append('<input type="text" id="itemName' + item_id + '"/>');
            $('#item' + item_id + ' .panel-footer').append('<button class="btn btn-default" onclick="addContentInItem(' + item_id + ')">新增選項</button>');
            $('#item' + item_id + ' .panel-footer').append('<button class="btn btn-warning btn-sm pull-right" onclick="clearAllInItem(' + item_id + ')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>清除所有選項</button>');
        }
        function addContentInItem(item_id) {
            var id = $('#item' + item_id).children('div').length - 1;
            var content_id = item_id + '-' + id;
            $('#itemFooter' + item_id).before('<div id="content' + content_id + '" class="panel-body"></div>');
            $('#content' + content_id).append(content_id + '. 選項內容：<input type="text" id="contentName' + content_id + '"/>');
            $('#content' + content_id).append(' 選項分數：<input type="text" id="contentScore' + content_id + '"/>');
        }
        function clearAllInItem(item_id) {
            $('#item' + item_id + ' .panel-body').remove();
        }
        function addText() {
            var text_id = $('#newAssessStyle').children('div').length + 1;
            $('#newAssessStyle').append('<div id="text' + text_id + '" class="panel">' + text_id + '. 文字項目名稱：</div>');
            $('#text' + text_id).append('<input type="text" id="textName' + text_id + '"/>');
        }
        function clearAll() {
            $('#newAssessStyle').empty();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="panel-heading">
            <h3>新增評估表樣式</h3>
        </div>
        <div id="newAssessStyle" class="panel-body">
        </div>
        <div class="panel-footer">
            <button class="btn btn-default" onclick="addGroup()">新增項目群組</button>
            <button class="btn btn-default" onclick="addItem()">新增評估項目</button>
            <button class="btn btn-default" onclick="addText()">新增文字項目</button>
            <button class="btn btn-danger btn-sm pull-right" onclick="clearAll()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>清除所有</button>
        </div>
    </div>
</body>
</html>
