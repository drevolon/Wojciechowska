<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageSlider.ascx.cs" Inherits="rost.UC.ImageSlider" %>

<div id="carouselSliderControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">

        <asp:Repeater runat="server" ID="RepSlider" OnItemDataBound="RepSlider_ItemDataBound" >
            <ItemTemplate>
                <div runat="server" class='<%# Eval("rownum").ToString()=="1"?"carousel-item active":"carousel-item" %>'>
                    <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                        <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="img-fluid" />
                    </asp:HyperLink>
                </div>
                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <a class="carousel-control-prev" href="#carouselSliderControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselSliderControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>



<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="SliderSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="0" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


