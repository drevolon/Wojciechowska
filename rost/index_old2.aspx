<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="index_old2.aspx.cs" Inherits="rost.index_old2" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/UC/UniversalTextBlocks.ascx" TagPrefix="uc1" TagName="UniversalText" %>
<%@ Register Src="~/UC/ImageSlider.ascx" TagPrefix="uc2" TagName="Slider" %>
<%@ Register Src="~/UC/ImageBlock.ascx" TagPrefix="uc3" TagName="IBlock" %>
<%@ Register Src="~/UC/ListBlock.ascx" TagPrefix="uc1" TagName="LBlock" %>
<%@ Register Src="~/UC/maps.ascx" TagPrefix="uc1" TagName="maps" %>
<%@ Register Src="~/UC/QueryClients.ascx" TagPrefix="uc1" TagName="QueryClients" %>
<%@ Register Src="~/UC/ImageBlock2.ascx" TagPrefix="uc1" TagName="ImageBlock2" %>






<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-4 text-center">
        <div class="m-auto">

            <uc2:Slider runat="server" ID="ISlider" TypeNews="4" />

        </div>
    </div>
    <div class="row">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmallbyPage.aspx?id_pages=1&qty_on_page=18">
        <img src="Images/Temp_img/temp_news_banner2.jpg" class="mt-4 img-fluid"  />
        <%--<img src="Images/Icons/articles.png" />--%>
        </asp:HyperLink>
    </div>
    <div class="container-fluid" id="blokNew3" style="background-color: #fff">
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
    <div class="row">
        <div class="container-fluid d-none d-md-block">
            <div class="row">
                <div class="row d-none d-md-block">
                    <asp:HyperLink runat="server" NavigateUrl="#">
                <img src="Images/Temp_img/temp_travma_banner.jpg" class="mt-4 img-fluid" />
                    </asp:HyperLink>
                </div>
                <div class="container-fluid d-none d-md-block" style="background-color: #b4c591;">
                    <div class="row">
                        <div style="position: relative; top: -35px; left: 0px;" id="travma_img">
                            <img src="Images/Temp_img/travma_img.png" class="img-fluid" />
                        </div>
                        <div class="container p-5">

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




    <div class="row">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmall.aspx?id_pages=2">
 
        <img src="Images/Temp_img/temp_services_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>



    <%--     УСЛУГИ--%>
    <div class="row p-5" style="background-color: #cfcfcf;">

        <uc1:LBlock runat="server" ID="Lblock1" CountNews="0" TypeNews="2" />

    </div>
    <div class="row mt-4 text-center">
        <uc1:QueryClients runat="server" ID="QueryClients" />
    </div>

    <%--     --%>
    <div class="row d-none d-md-block">
        <asp:HyperLink runat="server" NavigateUrl="~/PagesSmall.aspx?id_pages=10">
        <img src="Images/Temp_img/temp_license_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>

    <div class="row  text-center p-5 d-none d-md-block" style="background-color: #b7daeb;">

        <uc3:IBlock runat="server" ID="Iblock2" CountNews="0" TypeNews="10" WidthImage="189" HeighImage="270" />
    </div>
    <%--     ФОТО--%>
    <div class="row d-none d-md-block">
        <asp:HyperLink runat="server" NavigateUrl="~/Gallery.aspx?id_pages=8">
    <img src="Images/Temp_img/temp_photo_banner.jpg" class="mt-4 img-fluid" /></asp:HyperLink>
    </div>

    <div class="row  text-center p-5 d-none d-md-block" style="background-color: #b4c591;">

        
        <uc1:ImageBlock2 runat="server" ID="ImageBlock2" CountNews="6" TypeNews="8" WidthImage="300" HeighImage="200" />

    </div>


    <div class="container">
        <div class="row">
            <div class="col-12">
                <asp:HyperLink runat="server" NavigateUrl="#" CssClass="float-right"><img src="Images/Icons/how_us_find.png" class="mt-4 img-fluid" />
                </asp:HyperLink>
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
