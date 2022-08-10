<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageSlider.ascx.cs" Inherits="rost.UC.ImageSlider" %>



<div id="carouselImageSlider" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">

        <asp:Repeater runat="server" ID="RepSlider" OnItemDataBound="RepSlider_ItemDataBound" DataSourceID="SqlDataSourceBaseText">
            <ItemTemplate>
                <div runat="server" class='<%# Eval("rownum").ToString()=="1"?"carousel-item active":"carousel-item" %>'>
                        <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="d-block w-100" />
                </div>
                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselImageSlider" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselImageSlider" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>



<%-- <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <asp:Repeater runat="server" ID="RepSlider" OnItemDataBound="RepSlider_ItemDataBound">
                <ItemTemplate>
                    <div runat="server" class='<%# Eval("rownum").ToString()=="1"?"carousel-item active":"carousel-item" %>'>
                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="img-fluid d-block w-100"  />
                        </asp:HyperLink>
                    </div>

                    <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:Repeater>--%>

<%--                            <div class="carousel-item active">
                                <img src="Images/Temp_img/temp_slider_img.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="Images/Temp_img/temp_slider_img2.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="Images/Temp_img/temp_slider_img3.jpg" class="d-block w-100" alt="...">
                            </div>--%>





<%--</div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>--%>

<%--<img src="Images/Temp_img/temp_slider_img.jpg" class="img-fluid" />--%>


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="SliderSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="0" />
        <asp:Parameter DefaultValue="19" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


