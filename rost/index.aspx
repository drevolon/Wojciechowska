<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="rost.index" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/UC/UniversalTextBlocks.ascx" TagPrefix="uc1" TagName="UniversalText" %>
<%@ Register Src="~/UC/ImageSlider.ascx" TagPrefix="uc2" TagName="Slider" %>
<%@ Register Src="~/UC/ImageBlock.ascx" TagPrefix="uc3" TagName="IBlock" %>
<%@ Register Src="~/UC/ListBlock.ascx" TagPrefix="uc1" TagName="LBlock" %>
<%@ Register Src="~/UC/maps.ascx" TagPrefix="uc1" TagName="maps" %>
<%@ Register Src="~/UC/QueryClients.ascx" TagPrefix="uc1" TagName="QueryClients" %>
<%@ Register Src="~/UC/ImageBlock2.ascx" TagPrefix="uc1" TagName="ImageBlock2" %>
<%@ Register Src="~/UC/AboutCompany.ascx" TagPrefix="uc1" TagName="AboutCompany" %>







<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%--Слайдер--%>
    <div class="row mt-5 text-center">
        <div class="m-auto">

            <uc2:Slider runat="server" ID="ISlider" TypeNews="4" />

        </div>
    </div>

     <%--Аудит--%>
     <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
        <div class="col-12">
            <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl=".././desc?id_text=493">АУТСОРСИНГ</asp:HyperLink></h1>
        </div>
    </div>
    <div class="container-fluid mt-5" id="blokAudit" style="background-color: #fff">
        <div class="row">
            <div>
                <img src="Images/audit2.png" class="img-fluid" />
            </div>
           <%-- <div class="m-auto btnAudit">
                <button ID="ButtonAudit" class="btn btn-primary btn-lg">УЗНАТЬ БОЛЬШЕ..</button>
            </div>--%>
        </div>
    </div>
        <%--СТАТЬИ--%>
    
    <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
        <div class="col-12">
            <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl=".././PagesSmallbyPage?id_pages=1&qty_on_page=18">СТАТЬИ</asp:HyperLink></h1>
        </div>
    </div>
   <%-- <div class="row mt-5">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmallbyPage.aspx?id_pages=1&qty_on_page=18">
        <img src="Images/Temp_img/temp_news_banner2.jpg" class="mt-4 img-fluid"  />
    
        </asp:HyperLink>
    </div>--%>

    <div class="container-fluid mt-5" id="blokNew3" style="background-color: #fff">
        <div class="m-auto" id="NewsXL">
            <uc1:UniversalText runat="server" ID="UniversalText2" CountNews="6" TypeNews="1" ShowBorder="true" PosPhoto="left" HeaderNews="Статьи" />
        </div>
        <%--<div class="m-auto" id="NewsLG">
            <uc1:UniversalText runat="server" ID="UniversalText1" CountNews="5" TypeNews="1" ShowBorder="true" PosPhoto="left" HeaderNews="Статьи" />
        </div>--%>
    </div>


    <%--<div class="row mt-4 text-center d-none d-md-block">
        <div class="m-auto">
            <img src="Images/Temp_img/temp_stadies.jpg" class="img-fluid" />
        </div>
    </div>--%>

    <%--СТАТИСТИКА ТРАВМАТИЗМА--%>
    
    <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5 d-none d-md-block">
        <div class="col-12">
            <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl="#">СТАТИСТИКА ТРАВМАТИЗМА</asp:HyperLink></h1>
        </div>
    </div>

    <div class="container-fluid d-none d-md-block mt-5" style="position: relative;">
        <div class="row">
            <%-- <div class="row d-none d-md-block">
                <asp:HyperLink runat="server" NavigateUrl="#">
                <img src="Images/Temp_img/temp_travma_banner.jpg" class="mt-4 img-fluid" />
                </asp:HyperLink>
            </div>--%>
            <div class="container-fluid d-none d-md-block" style="background-color: #b4c591;">
                <div class="row">
                    <div class="col-12">
                        <div style="position:absolute; top: 21px; left: 0px;" id="travma_img">
                            <img src="Images/Temp_img/travma_img.png" class="img-fluid" />
                        </div>
                        <div class="container pt-5 pb-5 pr-5">

                            <uc3:IBlock runat="server" ID="Iblock6" CountNews="0" TypeNews="13" WidthImage="243" HeighImage="243" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 

    <%--        <div class="container-fluid d-none d-md-block" style="background-color: #b4c591;">
            <div class="row">
                <div style="position:relative; top:-35px; left:0px;" id="travma_img1">
                <img src="Images/Temp_img/travma_img.png" class="img-fluid" /></div>
                <div class="container">
                    <div class="row p-4">
                        <div class="col-3">
                            <img src="Images/Temp_img/travma1.png" class="img-fluid" />
                        </div>
                        <div class="col-3">
                            <img src="Images/Temp_img/travma2.png" class="img-fluid" />
                        </div>
                        <div class="col-3">
                            <img src="Images/Temp_img/travma3.png" class="img-fluid" />
                        </div>
                        <div class="col-3">
                            <img src="Images/Temp_img/travma4.png" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>


    <%--<div class="row mt-5">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmall.aspx?id_pages=2">
        <img src="Images/Temp_img/temp_services_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>--%>

    <%--УСЛУГИ--%>

    <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
        <div class="col-12">
            <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl=".././desc?id_text=383">УСЛУГИ</asp:HyperLink></h1>
        </div>
    </div>

    <div class="row mb-5">
        <uc1:LBlock runat="server" ID="Lblock1" CountNews="0" TypeNews="2" />
    </div>

    <%--ЗАЯВКА ПОЛУЧЕНИЯ УСЛУГИ--%>

    <div class="row mt-5 text-center">
        <uc1:QueryClients runat="server" ID="QueryClients" />
    </div>

    <%--О КОМПАНИИ--%>

    <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
        <div class="col-12">
            <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl=".././desc?id_text=9">О КОМПАНИИ</asp:HyperLink></h1>
        </div>
    </div>

    <div class="row">

        <%--<uc1:LBlock runat="server" ID="Lblock2" CountNews="0" TypeNews="2" />--%>
        <uc1:AboutCompany runat="server" ID="AboutCompany" CountNews="0" TypeNews="2" />

    </div>
   
    <%--ЛИЦЕНЗИИ--%>

    <%--     
    <div class="row d-none d-md-block mt-5">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmall.aspx?id_pages=10">
        <img src="Images/Temp_img/temp_license_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>--%>

     <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
            <div class="col-12">
                <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl="~/PagesSmall.aspx?id_pages=10">ЛИЦЕНЗИИ</asp:HyperLink></h1>
            </div>
        </div>
    <div class="row  text-center  d-none d-md-block">

        <uc3:IBlock runat="server" ID="Iblock2" CountNews="0" TypeNews="10" WidthImage="189" HeighImage="270" />
    </div>

    <%--ФОТО--%>

   <%-- <div class="row d-none d-md-block mt-5">
        <asp:HyperLink runat="server" NavigateUrl="~/Gallery.aspx?id_pages=8"><img src="Images/Temp_img/temp_photo_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>--%>

    <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
            <div class="col-12">
                <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl="~/Gallery.aspx?id_pages=8">ФОТО</asp:HyperLink></h1>
            </div>
        </div>

    <div class="row  text-center p-5 d-none d-md-block" style="background-color: #b4c591;">

        <uc1:ImageBlock2 runat="server" ID="ImageBlock2" CountNews="6" TypeNews="8" WidthImage="300" HeighImage="200" />

    </div>

    <%--КАК НАС НАЙТИ--%>

    <div class="container mt-5 mb-5">
       <%-- <div class="row">
            <div class="col-12">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="float-right"><img src="Images/Icons/how_us_find.png" class="mt-4 img-fluid" />
                </asp:HyperLink>
            </div>
        </div>--%>

        <div class="row mx-auto align-middle align-content-center align-items-center mt-5 mb-5">
            <div class="col-12">
                <h1 class="text-center"><asp:HyperLink runat="server" CssClass="header" NavigateUrl=".././desc?id_text=22">КАК НАС НАЙТИ</asp:HyperLink></h1>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="row mt-2 text-center ">
            <div class="col-12 m-auto ">
                <uc1:maps runat="server" ID="maps" />
            </div>
        </div>
    </div>
</asp:Content>
