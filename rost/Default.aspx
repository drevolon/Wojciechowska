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
                <div class="col-12 text-center header">
                    <h3>О компании</h3>
                </div>
            </div>


            <div class="row items">

                <div class="col-12">
                    <div class="present_block">


                        <div class="present_text">
                            Специалисты нашей организации являются экспертами в области
                            <br />
                            охраны труда и пожарной безопасности.<br />
                            <br />


                            Мы работаем в данной сфере с 2009 года,
                            <br />
                            и за этот период эффективно сотрудничали<br />
                            <br />

                            <b>с более 150 организациями.</b>
                        </div>
                    </div>
                </div>
            </div>
            <div class="present_img d-none d-md-block">
                <img src="Images/present_img.png" class="img-fluid img-responsive" />
            </div>
        </div>
    </section>

    <section class="garant">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center header">
                    <h3>Гарантируем</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="item1">
                        <div class="d-inline-block">
                            <img src="Images/present_hand.png" />
                        </div>
                        <div class="d-inline-block align-top">
                            ВЫСОКОЕ<br />
                            качество<br />
                            работы<br />
                        </div>
                    </div>
                    <div class="item2">
                        <div class="d-inline-block">
                            <img src="Images/present_hand.png" />
                        </div>
                        <div class="d-inline-block align-top">
                            МАКСИМАЛЬНО<br />
                            БЫСТРО<br />
                            предварительный
                            <br />
                            результат<br />
                        </div>
                    </div>
                    <div class="item3">
                        <div class="d-inline-block">
                            <img src="Images/present_hand.png" />
                        </div>
                        <div class="d-inline-block align-top">
                            соблюдение<br />
                            всех сроков<br />
                        </div>
                    </div>
                    <div class="item4">
                        <div class="d-inline-block">
                            <img src="Images/present_hand.png" />
                        </div>
                        <div class="d-inline-block align-top">
                            всегда<br />
                            ОСТАВАТЬСЯ<br />
                            на связи<br />
                        </div>
                    </div>
                </div>
            </div>
            <div class="garant_arrow">
                <img src="Images/garant_back_img1.png" />
            </div>
            <div class="garant_graph">
                <img src="Images/garant_back_img2.png" />
            </div>
        </div>
    </section>

    <section class="callback">
        <asp:UpdatePanel ID="upd1" runat="server">
            <ContentTemplate>

                <div class="container-fluid">
                    <div class="row header">
                        <div class="col-12 text-center">
                            <h3>Обратная связь</h3>
                        </div>
                    </div>
                    <div class="container items">
                        <div class="row">
                            <div class="col col-lg-3 left">
                                <label>Имя</label><br />
                                <asp:TextBox runat="server" ID="Sender" CssClass="form-control form-control-lg txtb" />
                            </div>
                            <div class="col col-lg-4">
                                <label>Email/Phone</label><br />
                                <asp:TextBox ID="Contact" runat="server" CssClass="form-control form-control-lg txtb" />
                            </div>
                            <div class="col col-lg-5 d-flex justify-content-end align-items-end btnmc">


                                <div class="">
                                    <asp:LinkButton Text="text" runat="server" CssClass="btn btn-secondary btnm " ID="MailSend" OnClick="MailSend_Click">
                            <i class="fa fa-paper-plane"></i> ОТПРАВИТЬ
                                    </asp:LinkButton>
                                </div>


                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-12">
                                <label>Обращение</label><br />
                                <asp:TextBox runat="server" ID="TextMessage" CssClass="form-control form-control-lg" TextMode="MultiLine" />
                            </div>
                        </div>

                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

    <section class="discount">
        <div class="container-fluid">
            <div class="row header">
                <div class="col-12 text-center">
                    <h3>Акции и специальные предложения</h3>
                </div>
            </div>
            <div class="row items">
                <div class="col-lg-3">
                    <div class="discount_img">
                        <img src="Images/Award.png" class="img-fluid img-responsive" />
                    </div>
                </div>
                <div class="col-lg-9 text-center d-flex align-content-between flex-wrap justify-content-center">
                    <div class="discount_text">
                        Только сегодня и только сейчас подготовим для вас пакет<br />
                        документов<br />
                        по охране труда  и  промышленной безопасности по цене
                        <br />
                        <font size="65">в два раза ниже рыночной !</font>
                    </div>
                    <div class="m-auto">
                        <asp:LinkButton Text="text" runat="server" CssClass="  btn btn-secondary btnm">
                            <i class="fa fa-check-circle"></i> ПРИНЯТЬ УЧАСТИЕ
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <section class="our_clients">
        <div class="container-fluid">
            <div class="row header">
                <div class="col-12 text-center">
                    <h3>Наши клиенты</h3>
                </div>
            </div>
            <div class="row items">
                <div class="col-12">

                    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-12 col-md-4 overflow-auto">

                                        <img src="Images/Slider/client1.png" class="d-block w-100 overflow-auto" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client2.png" class="d-block w-100 overflow-auto" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100 overflow-auto" height="289" alt="..." />

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client2.png" class="d-block w-100" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client1.png" class="d-block w-100" height="289" alt="..." />

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client3.png" class="d-block w-100" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
                                        <img src="Images/Slider/client1.png" class="d-block w-100" height="289" alt="..." />

                                    </div>
                                    <div class="col-12 col-md-4  overflow-auto">
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



    <section class="reviews_suggestions">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="container-fluid">
                    <div class="row header">
                        <div class="col-12 text-center">
                            <h3>Отзывы и предложения</h3>
                        </div>
                    </div>
                    <div class="container items">
                        <div class="row justify-content-md-center ">
                            <div class="col col-lg-2">
                                <label>Имя</label><br />
                                <asp:TextBox runat="server" ID="Sender1" CssClass="form-control form-control-lg txtb" />
                            </div>
                            <div class="col col-lg-3">
                                <label>Email/Phone</label><br />
                                <asp:TextBox runat="server" ID="Contact1" CssClass="form-control form-control-lg txtb" />
                            </div>
                            <div class="col col-lg-7 d-flex justify-content-end align-items-end btnmc">

                                <asp:LinkButton ID="Otzyv" Text="text" runat="server" CssClass="btn btn-secondary btnm" OnClick="Otzyv_Click">
                            <i class="fa fa-paper-plane"></i> ОТПРАВИТЬ
                                </asp:LinkButton>

                            </div>
                        </div>
                        <div class="row mt-2 justify-content-md-center ">
                            <div class="col-lg-12">
                                <label>Обращение</label><br />
                                <asp:TextBox runat="server" ID="TextMessage1" CssClass="form-control form-control-lg" TextMode="MultiLine" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>


    <section class="block6">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center mt-5 mb-5">
                    <h3>Как нас найти</h3>
                </div>
            </div>
            <div class="row gx-5">
                <div class="col-12 m-auto align-self-center mb-4">
                    <%-- <img src="Images/temp/temp_maps.png" />--%>

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2165.164187401769!2d65.49135931629426!3d57.13425498094529!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x43bbe19177060e7d%3A0x4f69b3743d45119d!2z0YPQuy4g0JzQvtGB0LrQvtCy0YHQutC40Lkg0YLRgNCw0LrRgiwgMTIwLzEsINCi0Y7QvNC10L3RjCwg0KLRjtC80LXQvdGB0LrQsNGPINC-0LHQuy4sIDYyNTA0OQ!5e0!3m2!1sru!2sru!4v1656966622817!5m2!1sru!2sru" width="100%" height="650" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>
            </div>
        </div>
    </section>


</asp:Content>
