<%@ Page Title="" Language="C#" MasterPageFile="~/SiteV.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="rost.Default" %>

<%@ Register Src="~/UC/my_clients_temp.ascx" TagPrefix="uc1" TagName="my_clients_temp" %>
<%@ Register Src="~/UC/QueryClients.ascx" TagPrefix="uc1" TagName="QueryClients" %>
<%@ Register Src="~/UC/slider2.ascx" TagPrefix="uc1" TagName="slider2" %>
<%@ Register Src="~/UC/slider3.ascx" TagPrefix="uc1" TagName="slider3" %>
<%@ Register Src="~/UC/slider4.ascx" TagPrefix="uc1" TagName="slider4" %>
<%@ Register Src="~/UC/ImageSlider.ascx" TagPrefix="uc1" TagName="ImageSlider" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/SiteV.css" rel="stylesheet" />


    <section class="present">
        <div class="container">
            <div class="row">
                <div class="col-12 col-xs-12 col-md-4 col-lg-4">
                    <img src="Images/DirectorNoPhone.png" class="img-responsive" />
                </div>
                <div class="col-12 col-xs-12 col-md-8 col-lg-8">
                    <div class="present_block">
                        <div class="present_header" id="present">
                            <h1>Я Войцеховская Ольга Сергеевна</h1>
                        </div>
                        <div class="present_text">
                            Являюсь специалистом в области 
                            охраны труда и пожарной безопасности.<br />
                            <br />

                            Работаю в данной сфере с 2009 года, 
                            за это время со мной сотрудничали<br />
                            <br />

                            <b>более 150 организаций.</b>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <section>
        <div class="slider_big_img">
            <uc1:ImageSlider runat="server" ID="ImageSlider1" idPages="1" />
        </div>
    </section>



    <section class="what_commit">
        <div class="container">
            <div class="row">
                <div class="what_commit_header text-center" id="what_commit">
                    Что я обязуюсь делать:
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-3 align-items-center justify-content-center d-flex">
                        <div class="row g-0">
                            <div class="col-md-3 align-items-center justify-content-center d-flex">
                                <i class="far fa-file-alt d-md-none d-lg-block icon"></i>
                            </div>
                            <div class="col-md-9">
                                <div class="card-body">

                                    <p class="card-text align-items-center justify-content-center d-flex">ГАРАНТИЯ КАЧЕСТВА РАБОТЫ</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card mb-3 align-items-center justify-content-center d-flex">
                        <div class="row g-0">
                            <div class="col-md-3 align-items-center justify-content-center d-flex" style="text-align: center; align-items: center;">
                                <i class="far fa-file-alt d-md-none d-lg-block icon"></i>
                            </div>
                            <div class="col-md-9">
                                <div class="card-body align-items-center justify-content-center d-flex">

                                    <p class="card-text">ПРЕДВАРИТЕЛЬНЫЙ РЕЗУЛЬТАТ</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card mb-3 align-items-center justify-content-center d-flex">
                        <div class="row g-0">
                            <div class="col-md-3 align-items-center justify-content-center d-flex" style="text-align: center; align-items: center;">
                                <i class="far fa-file-alt d-md-none d-lg-block icon"></i>
                            </div>
                            <div class="col-md-9">
                                <div class="card-body align-items-center justify-content-center d-flex">

                                    <p class="card-text">СОБЛЮДЕНИЕ ВСЕХ СРОКОВ</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4">
                    <div class="card mb-3 align-items-center justify-content-center d-flex">
                        <div class="row g-0">
                            <div class="col-md-3 align-items-center justify-content-center d-flex" style="text-align: center; align-items: center;">
                                <i class="far fa-file-alt d-md-none d-lg-block icon"></i>
                            </div>
                            <div class="col-md-9">
                                <div class="card-body align-items-center justify-content-center d-flex">

                                    <p class="card-text">ВСЕГДА НА СВЯЗИ</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                </div>

            </div>
        </div>
    </section>


    <section class="take_services1">
        <div class="container-fluid">
            <div class="row">

                <div class="take_services1_block">
                    <div class="take_services1_header">
                        Получить услугу
                    </div>
                    <div class="take_services1_text">
                        <div><i class="fa fa-mobile" aria-hidden="true"></i>+79923058923</div>
                        <div><i class="fa fa-envelope-open text-primary" aria-hidden="true"></i><a href="mailto:olgad0@yandex.ru" class="link-primary" target="_blank">olgad0@yandex.ru</a></div>

                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="portfolio">
        <div class="container">
            <div class="row">
                <div class="portfolio_header text-center" id="portfolio">
                    Портфолио
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-file-alt" style="font-size: 60px; padding-bottom: 20px;"></i></div>
                            1.	На предприятии работник получил травму ожег глаз щелочью. 
                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 59px;">
                            Компания должна была получить  большой штраф. 
                            Результат моей работы несчастный случай вывела
                            как форсможер не относящийся к производству.
                       
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-file-alt" style="font-size: 60px; padding-bottom: 20px;"></i></div>
                            2.	 На производстве была получена травма тяжёлая на работника упал фонарный столб. 
                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 20px;">
                            Сложность была еще в том что участвовало 
                            3 организации одновременно и по 
                            результатам 
                            проверки грозила уголовная ответственность. 
                            Результат моей работы вывела как форсможер не относящийся к производству. 
                            Ни одного предписания и штрафа.
                       
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-file-alt" style="font-size: 60px; padding-bottom: 20px;"></i></div>
                            3.	Полностью организовала работу
                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 97px;">
                            Производства по охране труда и пожарной безопасности , 
                            с помощью моей работы организация достигла целей 
                            в виде полного соблюдения
                            охраны труда и пожарной безопасности.
                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="my_job">
        <div class="container">
            <div class="row">
                <div class="my_job_header text-center" id="my_job">
                    Что входит в мою работу
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-lightbulb" style="font-size: 60px; padding-bottom: 20px;"></i></div>

                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 10px;">
                            <ul class="list">
                                <li class="list_item"><i class="fas fa-check-circle"></i>Аутсорсинг</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Проведение аудита</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Разрабатывание  нормативной документации </li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Обучение работников</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Разрабатывание профессиональных рисков </li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>СОУТ</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Коучинг</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-lightbulb" style="font-size: 60px; padding-bottom: 20px;"></i></div>

                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 10px;">

                            <ul class="list">
                                <li class="list_item"><i class="fas fa-check-circle"></i>Провожу и курирую проверки с надзорными органами</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Разрабатываю программы обучения для учебных организаций</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Курирование при оформлении образовательных лицензий</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Консультации</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Закрытие несчастных случаев (легкие, тяжелые, смертельные)</li>
                            </ul>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header" style="font-size: 26px; font-weight: bold;">
                            <div style="text-align: center;"><i class="far fa-lightbulb" style="font-size: 60px; padding-bottom: 20px;"></i></div>

                        </div>
                        <div class="card-body" style="font-size: 18px; margin-top: 10px;">

                            <ul class="list">


                                <li class="list_item"><i class="fas fa-check-circle"></i>Отрабатывание предписаний выданных надзорными органами</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Внутренняя проверка предприятия и предоставление предписание</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Индивидуальный подход к каждому клиенту</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Мои гарантии качество и все в срок</li>
                                <li class="list_item"><i class="fas fa-check-circle"></i>Обучение специалистов по охране труда которые находятся в штате у работодателя (обучение с выдачей диплома и  практика)</li>
                            </ul>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <uc1:QueryClients runat="server" ID="QueryClients" />

    <%--<section class="take_services2 d-flex">
        <div class="container-fluid">

            <div class="row">
                <div class="take_services2_header text-center">
                    Получить услугу
                </div>
            </div>

            <div class="row  take_services2_block">

                <div class="col take_services2_text offset-xs-1 offset-lg-1 d-flex justify-content-center">
                    <asp:TextBox ID="TextBox_take_services2_1" runat="server" CssClass="form-control-lg" placeholder="Введите ваши имя"></asp:TextBox>
                </div>


                <div class="col take_services2_text offset-xs-2 offset-lg-0 d-flex justify-content-center">
                    <asp:TextBox ID="TextBox_take_services2_2" runat="server" CssClass="form-control-lg" placeholder="Введите email"></asp:TextBox>
                </div>


                <div class="col take_services2_text offset-xs-2 offset-lg-0 d-flex justify-content-end m-auto ">
                    <asp:Button ID="ButtonSend" runat="server" Text="ОТПРАВИТЬ" CssClass="btn btn-outline-light btn-lg me-auto" />
                </div>

            </div>
        </div>
    </section>--%>


    <uc1:slider4 runat="server" ID="slider4" />


</asp:Content>
