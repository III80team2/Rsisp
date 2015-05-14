﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="padding-top: 80px">

        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="first-slide" src="pics/star.jpg" />
            </div>
            <div class="item">
                <img class="second-slide" src="pics/forest.jpg" />
                <div class="container">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="pics/ironMan.jpg" />
                <div class="container">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="pics/ocean03.jpg" />
                <div class="container">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="pics/onePiece.jpg" />
                <div class="container">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>

