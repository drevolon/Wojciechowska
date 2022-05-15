﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="desc.aspx.cs" Inherits="rost.desc" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
        <div class="container d-sm-block pt-3 pb-5" id="blok2.1">
            <div class="row">
                <div class="card w-100">
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSourceBaseText">
                            <Columns>
                                <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
                                    <ItemTemplate>
                                        <div class="media well" id="BaseText_blok" runat="server">
                                            <div class="w-100">
                                                <div class="col-12">
                                                    <asp:Panel runat="server" ID="PanelImageRight" Style="padding: 2px; border: solid 0px #E88424; float: left; margin-right: 10px; height: 250px; overflow: hidden">
                                                        <cc1:HighslideImage ID="ImageItem" runat="server" CssClass="img-responsive img-thumbnail"
                                                            BorderWidth="0px" Width="250px" />
                                                        <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                                                        </cc1:HighslideManager>
                                                        <%--<asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server"  Width="300px" />--%>
                                                        <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-12">
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
            <div id="comments">
                <div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

var disqus_config = function () {
    this.page.url = '<%= HttpContext.Current.Request.Url %>';  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://https-rostot-ru.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                            
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
