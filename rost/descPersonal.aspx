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
                                <div class="col-12 col-sm-3 col-lg-3 col-xl-2  offset-lg-2 g-0">
                                    <%--                                    <img src="Images/Employees/Director.jpg" class="img-thumbnail" />--%>
                                    <cc1:HighslideImage ID="ImageItem" runat="server" CssClass="img-thumbnail"
                                        BorderWidth="0px" Width="340px" Height="420" />
                                    <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                                    </cc1:HighslideManager>
                                </div>
                                <div class="col-12 col-sm-7 col-lg-7 col-xl-8 d-flex justify-content-center">
                                    <table class="table-secondary">

                                        <tbody>

                                            <%--                                            <tr>
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
                                            </tr>--%>
                                            <asp:Repeater ID="RepeatProps" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="td_name"><%# Eval("name") %></td>
                                                        <td class="td_value"><%# Eval("value") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row experience">
                                <div class="col-lg-10 offset-2 base_text">
                                    <asp:Literal ID="MainText" runat="server"></asp:Literal>
                                    <%--                                   С 2010 г начала трудовую деятельность инженером по охране труда на ООО "Тюменский хлебокомбинат".<br />
                                    <br />

                                    2015г специалист по охране труда ООО"Тюменгипроводхоз".<br />
                                    <br />

                                    с 2017 года начала индивидуальную работу в области охраны труда, пожарной безопасности, электробезопасности, БДД, ГО и ЧС, экологии.<br />
                                    <br />

                                    с 2019 возглавила ООО "Центр охраны труда "РОСТ"--%>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="col-lg-3 right_col">
                    <h4>Документы</h4>
                    <%--                    <img src="Images/Doc/doc1.png" />--%>
                    <asp:Repeater ID="RepeatDocs" runat="server">
                        <ItemTemplate>
                            <cc1:HighslideImage ID="ImageItemDoc" runat="server" CssClass="img-thumbnail" ImageUrl = '<%#"~/photoDB.ashx?type_img=image_lowCA&items=" + Eval("items").ToString() + "&w=365&h=236" %>'
                                FullImageURL = '<%#"~/photoDB.ashx?type_img=image_bigCA&items=" + Eval("items").ToString() %>'
                                BorderWidth="0px" Width="365px" Height="236" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>

        </div>
    </section>


</asp:Content>
