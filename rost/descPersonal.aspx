<%@ Page Title="" Language="C#" MasterPageFile="~/SiteV_page.Master" AutoEventWireup="true" CodeBehind="descPersonal.aspx.cs" Inherits="rost.descPersonal" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>
<%@ Register Src="~/UC/OneTextBlocks.ascx" TagPrefix="uc1" TagName="OneTextBlocks" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <section class="audit">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9 left_col">
                    <div class="row header">
                        <div class="col-lg-12 text-center ">
                            <h3>Аудит</h3>
                        </div>
                    </div>
                    <div class="row items">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-sm-3 col-lg-3 col-xl-2 offset-2 g-0">
                                    <!--<img src="Images/DirectorNoPhone.png" />-->
                                    <img src="Images/Employees/Director.jpg" class="img-thumbnail" />
                                </div>
                                <div class="col-sm-7 col-lg-7 col-xl-8 d-flex justify-content-center">
                                    <table class="table-secondary">

                                        <tbody>
                                            <tr>
                                                <td class="td_name">ФИО:</td>
                                                <td class="td_value">Войцеховская Ольга Сергеевна</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Специализация:</td>
                                                <td class="td_value">Аудит</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Общий трудовой стаж:</td>
                                                <td class="td_value">??</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Стаж по направлению:</td>
                                                <td class="td_value">??</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Образование:</td>
                                                <td class="td_value">высшее</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Email:</td>
                                                <td class="td_value">mail@mail.ru</td>
                                            </tr>
                                            <tr>
                                                <td class="td_name">Телефон:</td>
                                                <td class="td_value">8-978-353-3453</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row experience">
                                <div class="col-lg-10 offset-2 base_text">
                                    С 2010 г начала трудовую деятельность инженером по охране труда на ООО "Тюменский хлебокомбинат".<br />
                                    <br />

                                    2015г специалист по охране труда ООО"Тюменгипроводхоз".<br />
                                    <br />

                                    с 2017 года начала индивидуальную работу в области охраны труда, пожарной безопасности, электробезопасности, БДД, ГО и ЧС, экологии.<br />
                                    <br />

                                    с 2019 возглавила ООО "Центр охраны труда "РОСТ"
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="col-lg-3 right_col">
                    <h4>Документы</h4> 
                    <img src="Images/Doc/doc1.png"  />
                </div>

            </div>
            
        </div>
    </section>
    

</asp:Content>
