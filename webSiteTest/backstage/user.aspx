﻿<%@ Page Language="C#" MasterPageFile="~/backstage/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="backstage_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="container">        
        <form id="form1" runat="server">
            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <HeaderStyle BackColor="#CCFFFF" />
            </asp:GridView>
        </form>
    </div>
</asp:Content>
