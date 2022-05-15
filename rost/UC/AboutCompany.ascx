<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AboutCompany.ascx.cs" Inherits="rost.UC.AboutCompany" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<div class="container-fluid" id="block3" style="background-color: #fff; padding: 0px 0px 0px 0px;">
    

    <div class="row">
        <div class="col-12">
            <div class="alert alert-success h4 p-5" role="alert">
                <div class="mb-4">
                    <i class="glyphicon glyphicon-check"></i> Центр охраны труда «РОСТ» более 10 лет работает на рынке г. Тюмени и Тюменской области, предоставляет качественные услуги по охране труда, пожарной безопасности, ГО и ЧС (охрана труда, техника безопасности, пожарная безопасность, гражданская оборона, чрезвычайный ситуации).
                </div>
                <div class="mb-4"><i class="glyphicon glyphicon-check"></i> Наш профессиональный опыт, использование передовых методик ведения охраны труда, пожарной безопасности, ГО и ЧС, а также индивидуальный подход к каждому клиенту, позволяет нам быстро и качественно предлагать варианты решения проблем в рамках действующего законодательства с учетом требований клиента.</div>
                <div><i class="glyphicon glyphicon-check"></i> Это помогает в значительной степени сократить финансовые и временные затраты Ваших сотрудников, а также снижает риск получения штрафов и прочих санкций.</div>
            </div>
        </div>
    </div>
</div>
<%--<asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
    <ItemTemplate>

        <div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-3">
            <div class="card border-secondary" id="services_block">
                <div class="card-body">
                    <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" ForeColor="Black">

                        <i class="glyphicon glyphicon-thumbs-up float-left" style="font-size: 160%"></i>
                        <h5>&nbsp;&nbsp;<asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("header_text") %>' Visible="true"></asp:Label></h5>
                    </asp:HyperLink>

                   

                </div>
            </div>
        </div>
        <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>

    </ItemTemplate>
</asp:Repeater>

<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="SliderSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="0" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>--%>

