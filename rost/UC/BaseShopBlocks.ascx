<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseShopBlocks.ascx.cs" Inherits="shop_health.UC.BaseShopBlocks" %>


    <div class="row">
        <div class="col-lg-12">
            <div>

                <div class="center-block" style="width: 700px; margin-top:20px; margin-left:10px;">
                  
                 


                    <asp:DataList ID="Datalist1" runat="server" GridLines="None" DataKeyField="id" OnItemDataBound="Datalist1_ItemDataBound" RepeatColumns="2" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="panel panel-default" style="margin-right:15px;">
                                    <div class="panel-heading" style="font-size: 16px; color: #662583; font-weight: bold;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label></h3></div>
                                    <div class="panel-body">
                                        <ul class="list-unstyled list-inline ">
                                            <li style="width: 97px;  height: 140px; overflow: hidden">
                                                <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" Target="_blank">
                                                    <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="img-responsive" Width="80px" />
                                                </asp:HyperLink>
                                            </li>
                                            <li style="width: 205px; vertical-align: top; height:105px; overflow:hidden;">
                                                <h5 class="media-heading"><b>Состав:</b></h5>
                                                <asp:Label ID="caption" runat="server" Text='<%# Bind("PROD_CONSIST") %>'></asp:Label>
                                                <div class="pull-right " style="color: #3f9e14; margin-top: 15px;">
                                                    <b>Цена:
                                                        <asp:Label ID="LabelPrice" runat="server" Text='<%# Bind("price") %>'></asp:Label></b>
                                                </div>
                                               



                                            </li>
                                        </ul>
                                        <div style="margin-top: 0px" class="pull-left">
                                                    <asp:Literal ID="ImgFilters" runat="server"></asp:Literal>
                                          </div>
                                        <div style="margin-top: 0px" class="pull-right">
                                            <asp:Literal ID="ABtn" runat="server" Visible="true"></asp:Literal>
                                        </div>
                                    </div>
                                   

                                </div>
                    

                             <%--   <div id="block" style="margin: 14px 7px 14px 7px; border: 1px solid #919191; width: 339px;">
                                    <div style="height: 191px; overflow: hidden;">
                                        
                                    </div>
                                    <h3 class="item_title">
                                        <asp:Label ID="caption" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label></h3>
                                    <p>
                                        Цена: <span class="item_price">
                                            <asp:Label ID="LabelPrice" runat="server" Text='<%# Bind("price") %>'></asp:Label></span> руб.
                                    </p>
                                    
                                    <div class="form-group">
                                        
                                    </div>
                                </div>--%>
                                <asp:Label ID="ID_item" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                                <asp:Label ID="LabelItemHave_img" runat="server" Visible="false" Text='<%# Bind("have_img") %>'></asp:Label>
                                <asp:Label ID="LabelImageItems" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                                <asp:Label ID="LabelFilters" runat="server" Visible="false" Text='<%# Bind("AllowFilters") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
            </div>
        </div>
</div>
<%--</div>--%>


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    >
</asp:SqlDataSource>


