<%@ Page Title="" Language="C#" MasterPageFile="~/SiteV.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="rost.Default" %>

<%@ Register Src="~/UC/my_clients_temp.ascx" TagPrefix="uc1" TagName="my_clients_temp" %>
<%@ Register Src="~/UC/QueryClients.ascx" TagPrefix="uc1" TagName="QueryClients" %>
<%@ Register Src="~/UC/slider2.ascx" TagPrefix="uc1" TagName="slider2" %>
<%@ Register Src="~/UC/slider3.ascx" TagPrefix="uc1" TagName="slider3" %>
<%@ Register Src="~/UC/slider4.ascx" TagPrefix="uc1" TagName="slider4" %>
<%@ Register Src="~/UC/ImageSlider.ascx" TagPrefix="uc1" TagName="ImageSlider" %>
<%@ Register Src="~/UC/OurProjects.ascx" TagPrefix="uc1" TagName="OurProjects" %>
<%@ Register Src="~/UC/UniversalTextBlocksNew.ascx" TagPrefix="uc1" TagName="UniversalTextBlocksNew" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<link href="Content/SiteV.css" rel="stylesheet" />--%>


    <section class="present">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                   <img src="Images/temp/temp_present_block.png" class="img-responsive" />
                </div>
                <%--<div class="col-12">
                    <div class="present_block">
                        
                        <div class="present_header" id="present">
                            
                        </div>
                        <div class="present_text">
                           
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </section>

    <section class="block2">
        <div class="container-fluid">
            <div class="row gx-5">
                <div class="col-12">
                    <img src="Images/temp/temp_garant.jpg" />
                </div>
            </div>
        </div>
    </section>

     <section class="block3">
        <div class="container-fluid">
            <div class="row gx-5">
                <div class="col-12">
                    <img src="Images/temp/temp_get_callback.png" />
                </div>
            </div>
        </div>
    </section>

   <section class="block4">
        <div class="container-fluid">
            <div class="row gx-5">
                <div class="col-12">
                    <img src="Images/temp/temp_discount.png" />
                </div>
            </div>
        </div>
    </section>

     <section class="block5">
        <div class="container-fluid">
              <div class="row">
                <div class="col-12 text-center mt-5 mb-5">
                    <h1>Наши клиенты</h1>
                </div>
            </div>
            <div class="row gx-5 mt-5">
                <div class="col-12">
                   <%-- <img src="Images/temp/temp_our_clients.png" />--%>

                    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-4 overflow-auto">
                                        
                                        <img src="Images/Slider/client1.png" class="d-block w-100 overflow-auto" height="289" alt="..." />
                                       
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client2.png" class="d-block w-100 overflow-auto" height="289" alt="..." />
                                       
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100 overflow-auto" height="289" alt="..." />
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                 <div class="row">
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client2.png" class="d-block w-100" height="289" alt="..." />
                                        
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100" height="289" alt="..." />
                                       
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client1.png" class="d-block w-100" height="289" alt="..." />
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                  <div class="row">
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100" height="289" alt="..." />
                                       
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client1.png" class="d-block w-100" height="289" alt="..." />
                                       
                                    </div>
                                    <div class="col-4 overflow-auto">
                                        <img src="Images/Slider/client2.png" class="d-block w-100" height="289" alt="..." />
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </section>

   <section class="block6">
        <div class="container-fluid">
            <div class="row gx-5">
                <div class="col-12">
                    <img src="Images/temp/temp_reviews.png" />
                </div>
            </div>
        </div>
    </section>

     <section class="block6">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center mt-5 mb-5">
                    <h1>Как нас найти</h1>
                </div>
            </div>
            <div class="row gx-5">
                <div class="col-12 m-auto align-self-center mb-4">
                   <%-- <img src="Images/temp/temp_maps.png" />--%>

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2165.164187401769!2d65.49135931629426!3d57.13425498094529!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x43bbe19177060e7d%3A0x4f69b3743d45119d!2z0YPQuy4g0JzQvtGB0LrQvtCy0YHQutC40Lkg0YLRgNCw0LrRgiwgMTIwLzEsINCi0Y7QvNC10L3RjCwg0KLRjtC80LXQvdGB0LrQsNGPINC-0LHQuy4sIDYyNTA0OQ!5e0!3m2!1sru!2sru!4v1656966622817!5m2!1sru!2sru" width="100%" height="650" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>
            </div>
        </div>
    </section>
   

</asp:Content>
