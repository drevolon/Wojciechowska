<%@ Page Title="" Language="C#" MasterPageFile="~/SiteV_page.Master" AutoEventWireup="true" CodeBehind="PagesPersonal.aspx.cs" Inherits="rost.PagesPersonal" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>
<%@ Register Src="~/UC/OneTextBlocks.ascx" TagPrefix="uc1" TagName="OneTextBlocks" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <section class="pages">
        <div class="container-fluid">
            <div class="row header">
                <div class="col-lg-12 text-center ">
                    <h3>
                        <asp:Literal ID="TextPages" runat="server"></asp:Literal></h3>
                </div>
            </div>
            <div class="row content">
                <div class="col-lg-12">
                    <div class="row items d-flex justify-content-around">

                        <asp:Repeater ID="RptPages" runat="server" OnItemDataBound="RptPages_ItemDataBound">
                            <ItemTemplate>
                                <div class="card g-0">
                                    <div class="row g-0">
                                        <div class="col-md-4 item_img">
                                            <div class="card-img">
                                                <cc1:HighslideImage ID="ImageItem" runat="server" CssClass="img-fluid" BorderWidth="0px" />
                                                <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                                                </cc1:HighslideManager>
                                            </div>

                                        </div>
                                        <div class="col-md-8 item_body">
                                            <div class="card-body">
                                        <h5 class="card-title"><b><asp:Literal ID="TitleProps" runat="server"></asp:Literal></b></h5>
                                                <p class="card-text">
                                                    <asp:GridView ID="GridPropsList" AutoGenerateColumns="False" ShowHeader="false" runat="server" BorderWidth="0px">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="LabelNameList" Text='<%# Bind("name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="TextValueList" Text='<%# Bind("value") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </p>
                                                <p class="card-text"><small><a href='<%# "descPersonal?id_text="+Eval("id_text").ToString() %>' class="card_url">Подробнее...</a></small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="LabelProps" runat="server" Visible="false" Text='<%#Eval("property") %>'></asp:Label>
                                <asp:Label ID="LabelItems" runat="server" Visible="false" Text='<%#Eval("items") %>'></asp:Label>

                            </ItemTemplate>

                        </asp:Repeater>

                        <div class="card g-0">
                            <div class="row g-0">
                                <div class="col-md-4 item_img">
                                    <div class="card-img">
                                        <img src="Images/DirectorNoPhone.png" class="img-fluid" />
                                    </div>

                                </div>
                                <div class="col-md-8 item_body">
                                    <div class="card-body">
                                        <h5 class="card-title"><b>Войцеховская Ольга Сергеевна</b></h5>
                                        <p class="card-text">
                                            Аудит<br />
                                            35 лет<br />
                                            28 лет<br />
                                            высшее<br />
                                            personal@mail.ru<br />
                                            8-912-453-54-23
                                        </p>
                                        <p class="card-text"><small><a href="descPersonal?id_text=517" class="card_url">Подробнее...</a></small></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card g-0">
                            <div class="row g-0">
                                <div class="col-md-4 item_img">
                                    <div class="card-img">
                                        <img src="Images/DirectorNoPhone.png" class="img-fluid" />
                                    </div>

                                </div>
                                <div class="col-md-8 item_body">
                                    <div class="card-body">
                                        <h5 class="card-title"><b>Войцеховская Ольга Сергеевна</b></h5>
                                        <p class="card-text">
                                            Аудит<br />
                                            35 лет<br />
                                            28 лет<br />
                                            высшее<br />
                                            personal@mail.ru<br />
                                            8-912-453-54-23
                                        </p>
                                        <p class="card-text"><small><a href="descPersonal?id_text=517" class="card_url">Подробнее...</a></small></p>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>

    <asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
        SelectCommand="select * from BaseText where id_pages=@id_pages  ORDER BY BaseText.npp, BaseText.id_text DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="id_pages" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
