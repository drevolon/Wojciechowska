<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="index_old.aspx.cs" Inherits="shop_health.index" %>

<%@ Register Src="~/UC/ProductsByIndex.ascx" TagPrefix="uc1" TagName="ProdOnIndex" %>
<%@ Register Src="~/UC/ProductBlocks.ascx" TagPrefix="uc1" TagName="ProdBlock" %>
<%@ Register Src="~/UC/UniversalTextBlocks.ascx" TagPrefix="uc1" TagName="UniversalText" %>
<%@ Register Src="~/UC/FAQ.ascx" TagPrefix="uc1" TagName="FAQ" %>
<%@ Register Src="~/UC/ProductBlocks2.ascx" TagPrefix="uc1" TagName="ProductBlocks2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Магазин здоровых продуктов</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid  pt-3 pt-sm-5 pb-1 pb-sm-5 d-none d-sm-block">
        <div class="row mx-auto align-middle align-content-center" id="block1">
            <div class="col d-none d-sm-block"></div>
            <div class="col-12 col-sm-10">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">

<%--                        <div class="carousel-item active">
                            <img src="Images/Slider/1.jpg" class="" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="Images/Slider/2.jpg" class="" alt="...">
                        </div>--%>

                        <asp:Repeater runat="server" ID="RepSlider" DataSourceID="SelImages">
                            <ItemTemplate>
                        <div runat="server" class='<%# Eval("rownum").ToString()=="1"?"carousel-item active":"carousel-item" %>' >
                            <asp:Image runat="server" ID="imgSlider" ImageUrl='<%#  Eval("filepath") %>' CssClass="img-fluid" />
                        </div>
                            </ItemTemplate>
                        </asp:Repeater>


                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col d-none d-sm-block"></div>
        </div>
    </div>
            
             
          
    <%--<div class="container-fluid d-none d-sm-block" id="blok3" style="background-color: #d9fbfd">
        <div class="row">
            <uc1:ProdBlock runat="server" ID="ProdBlock1"  SsqlWhere=" and onFirstPage=1" CountNews="12" PagingNews="4" HeaderNews="Полезные продукты"/>
        </div>
    </div>--%>
    <div class="col-12 pb-4 pt-4 m-auto text-center">

                    <a class="btn btn-info"  href="shop.aspx"><div class="text-center button_shop" id="button_shop2"><i class="glyphicon glyphicon-shopping-cart"></i>  Перейти в магазин</div></a>
                </div>
    <div class="container-fluid  pt-3 pb-5" id="blok2.1" style="background-color: #d9fbfd; padding-top:0px;">
        
        <uc1:UniversalText runat="server" ID="UniversalText2" PagingNews="4" TypeNews="9" ShowBorder="true" PosPhoto="left" HeaderNews="Новости" />
 
            <%--<uc1:UniversalText runat="server" ID="UniversalText2" PagingNews="4" TypeNews="9" ShowBorder="true" PosPhoto="left" HeaderNews="Полезные новости" />--%>

    </div>
<div class="col-12 pb-4 pt-4 m-auto text-center">

                    <a class="btn btn-info"  href="shop.aspx"><div class="text-center button_shop" id="button_shop1"><i class="glyphicon glyphicon-shopping-cart"></i>  Перейти в магазин</div></a>
                </div>
   <%-- <div class="container-fluid" id="blok3" >
        <div class="row">
             <div class="col-sm-12 col-md-12  col-lg-12 col-xl-12 pb-4 ">
                    <a class="nav-link" href="shop.aspx"><h1 class="text-center">Перейти в магазин</h1></a>
                </div>
            <uc1:ProductBlocks2 runat="server" id="ProductBlocks2" SsqlWhere=" and onFirstPage=1" CountNews="12" PagingNews="4" HeaderNews="Полезные продукты" />
        </div>
    </div>--%>



    <%--<div class="container-fluid d-none d-sm-block pt-3 pb-5" id="blok2.1">
        <div class="row">
            <uc1:UniversalText runat="server" ID="BaseTextBlocks" PagingNews="4" TypeNews="2" ShowBorder="true" PosPhoto="left" HeaderNews="Полезные новости" />
        </div>
    </div>--%>
    

   <%-- <div class="container-fluid d-none d-sm-block pt-3 pb-5" id="blok2.2" style="background-color: #d9fbfd; padding-top:0px;">
            <uc1:UniversalText runat="server" ID="UniversalText1" PagingNews="4" TypeNews="3" ShowBorder="true" PosPhoto="left" HeaderNews="Полезные статьи" />
    </div>--%>


<%--    <div class="container-fluid d-none d-sm-block pt-3 pb-5" id="blok4">

        <div class="container-fluid " style="background-color: #ffffff">
            <div class="row mx-auto align-middle align-content-center align-items-center">
                <div class="col-sm-12 col-md-12  col-lg-12 col-xl-12 pb-4">
                    <h1 class="text-center">Просто полезно</h1>
                </div>


                <div class="row mx-auto align-middle align-content-center" style="margin-top: 26px">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-3 offset-2" id="money_for_car_list1">
                        <ul class="list-unstyled">
                            <li>
                                <div class="row align-items-center">
                                    <div class="col-1">
                                        <i class="glyphicon glyphicon-certificate" style="font-size: 24px;"></i>
                                    </div>
                                    <div class="col-11">
                                        <h4>Заниматься спортом.</h4>
                                        Спорт позволяет поддерживать организм
                                        в тонусе, 
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row align-items-center">
                                    <div class="col-1">
                                        <i class="glyphicon glyphicon-certificate" style="font-size: 24px;"></i>
                                    </div>
                                    <div class="col-11">
                                        <h4>Путешествовать.</h4>
                                        Путешествия позволяют расширить 
                                        кругозор, сменить обстановку, что 
                                        в свою очередь благоприятно влиет на
                                        здоровье
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row align-items-center">
                                    <div class="col-1">
                                        <i class="glyphicon glyphicon-certificate" style="font-size: 24px;"></i>
                                    </div>
                                    <div class="col-11">
                                        <h4>Отдых</h4>
                                        Релакс способствуют снятию 
                                        стрессового состояния.
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row align-items-center">
                                    <div class="col-1">
                                        <i class="glyphicon glyphicon-certificate" style="font-size: 24px;"></i>
                                    </div>
                                    <div class="col-11">
                                        <h4>Дарить подарки</h4>
                                        Это приятно и тем кто дарит и 
                                        тем кому дарят, что повышает ваше
                                        настроение
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div

                    <div class="col-lg-5 col-xl-5 d-none d-sm-block">
                        <img src="Images/temp2_just_useful_img.png" class="img-fluid" />

                    </div>


                </div>
            </div>
        </div>

    </div>>--%>

    <div class="container-fluid d-none d-xl-block" id="blok5.1">
        <div class="row">
                      <%--<uc1:FAQ runat="server" ID="FAQ1" />--%>
        </div>
    </div>

   

    <asp:SqlDataSource ID="SelImages" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>" SelectCommand="select f.filepath, row_number() over (order by (select 1)) rownum from DB_files df, FilesItem fit, Files f where df.items = fit.items and fit.id_files = f.id_files">

    </asp:SqlDataSource>
    <%--<div class="container-fluid d-none d-sm-block" id="blok5">
        <div class="row">
            <img src="Images/temp2_useful_ask_question.png" />
        </div>
    </div>--%>
</asp:Content>
