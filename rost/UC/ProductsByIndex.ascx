<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductsByIndex.ascx.cs" Inherits="shop_health.UC.ProductsByIndex" %>

<div class="row mx-auto align-middle align-content-center align-items-center mt-5 ">
    <div class="col-12">
        <h1 class="text-center">Полезные продукты</h1>
    </div>
</div>
<div class="row mx-auto align-middle align-content-center align-items-center mb-5 ml-5 mr-5">
    <div class="col"></div>
    <div class="col-10">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 text-center mt-5">
                        <div class="card">
                            <div class="card-header text-left" style="color: #662583; font-weight: bold;">
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>
                            </div>
                            <div class="row" style="overflow: auto">
                                <div class="col-5 p-3">
                                    <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" Target="_blank">
                                        <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="rounded" Width="160px" />
                                    </asp:HyperLink>

                                </div>
                                <div class="col-7 text-left no-gutters">

                                    <p class="card-text ">
                                        <h5 class="card-title">Состав:</h5>
                                        <asp:Label ID="caption" runat="server" Text='<%# Bind("PROD_CONSIST") %>' Height="250px"></asp:Label>
                                    </p>
                                    <div class="btn-group">
                                        <div class="btn btn-warning btn-sm text-right mb-2">
                                            <asp:Literal ID="ABtn" runat="server" Visible="true"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-right text-success">
                                <div class="float-left">
                                    <asp:Literal ID="ImgFilters" runat="server"></asp:Literal>
                                </div>
                                <div class="float-right">
                                    <b>Цена:</b>
                                    <asp:Label ID="LabelPrice" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                    <asp:Label ID="ID_item" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                    <asp:Label ID="LabelItemHave_img" runat="server" Visible="false" Text='<%# Bind("have_img") %>'></asp:Label>
                    <asp:Label ID="LabelImageItems" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                    <asp:Label ID="LabelFilters" runat="server" Visible="false" Text='<%# Bind("AllowFilters") %>'></asp:Label>
                    <asp:Label ID="RowNum" runat="server" Visible="false" Text='<%# Bind("rownum") %>'></asp:Label>
                    <asp:Literal ID="NextRow" runat="server"></asp:Literal>
                </ItemTemplate>
            </asp:Repeater>
            
        </div>
    </div>
    <div class="col">
    </div>
</div>




<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"></asp:SqlDataSource>


