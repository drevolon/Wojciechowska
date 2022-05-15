<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="descText.aspx.cs" Inherits="rost.descText" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
        <div class="container d-sm-block pt-3 pb-5" id="blok2.1" style="background-color: #d9fbfd">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSourceBaseText">
                            <Columns>
                                <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
                                    <ItemTemplate>
                                        <div class="media well" id="BaseText_blok" runat="server">
                                            <div>
                                                <div class="col-sm-12 col-lg-12">
                                                    <h4>
                                                        <b>
                                                            <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></b></h4>
                                                    <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("base_text") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>


                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
                SelectCommand="SELECT BaseText.id_pages, BaseText.header_text, BaseText.description_text, BaseText.base_text, BaseText.date_text, BaseText.items, BaseText.have_img, BaseText.visible_blok, BaseText.id_text, Images.name_images FROM BaseText LEFT OUTER JOIN Images ON BaseText.items = Images.items WHERE (BaseText.id_text = @id_text) ORDER BY BaseText.id_text DESC" ProviderName="<%$ ConnectionStrings:rostConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id_text" QueryStringField="id_text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceImageBase_text" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" SelectCommand="SELECT Images.id_images, Images.id_pages, Images.images, Images.name_images, Images.type_images, Images.size_images, Images.alt_images, ImagesBase_text.items FROM Images INNER JOIN ImagesBase_text ON Images.id_images = ImagesBase_text.id_images WHERE (ImagesBase_text.items = @items)" DeleteCommand="ImagesDelete" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:rostConnectionString.ProviderName %>">
                <DeleteParameters>
                    <asp:Parameter Name="id_images" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="items" QueryStringField="items" />
                </SelectParameters>
            </asp:SqlDataSource>

</asp:Content>
