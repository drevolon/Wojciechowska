<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="descImage.aspx.cs" Inherits="rost.descImage" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="row  text-center p-5" style="background-color:#b4c591; ">
                        <asp:Repeater ID="RepView" runat="server" OnItemDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSourceBaseText">
                                    <ItemTemplate>
                                                        <cc1:HighslideImage ID="ImageItem" runat="server" CssClass="img-responsive img-thumbnail"
                                                            BorderWidth="0px" />
                                                        <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                                                        </cc1:HighslideManager>
                                                        <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>


                        </asp:Repeater>
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
