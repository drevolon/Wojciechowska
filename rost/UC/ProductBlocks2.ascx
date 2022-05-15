<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductBlocks2.ascx.cs" Inherits="shop_health.UC.ProductBlocks2" %>
<%--<link href="../dist/css/bootstrap.min.css" rel="stylesheet" />--%>


<div class="container" id="blok3">
    <div class="row">
        <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
            <ItemTemplate>
                <div class="p-1 pb-0 pl-1 p-sm-3 pb-sm-3 pl-sm-3 col-6 col-xs-6 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card" id="productblock" >

                        <div style="overflow: hidden;">
                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl='<%# "~/shop_desc.aspx?id="+Eval("id") %>'>
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top img-fluid"  />
                            </asp:HyperLink>
                        </div>
                        <div class="card-body" style="padding-bottom:27px;">
                            <div style="overflow: hidden; height: 70px;">
                                <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Eval("prod_name") %>'></asp:Label><br />
                                <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Eval("Produce") %>'></asp:Label>,
                              
                                                <b>
                                                    <asp:Label ID="TextBox3" runat="server" Text='<%# String.Format("{0:0.##}",Eval("WEIGHT"))+" "+Eval("WEIGHT_EI") %>'></asp:Label></b>
                            </div>
                            <div class="row pt-1 pt-sm-3">
                                <div class="col-12 col-sm-4  col-md-4 col-xl-5 pr-sm-1 pl-sm-2 pr-md-1 pl-md-1 pl-xl-3">
                                    <h4>
                                        <asp:Label ID="TextBox2" runat="server" Text='<%# String.Format("{0:0.##}",Eval("price"))+"  р." %>' CssClass="price"></asp:Label></h4>
                                </div>
                                <div class="col-12 col-sm-8 col-md-8  col-xl-7 pr-sm-1 pl-sm-1 pr-md-1 pl-md-1">
                                    <asp:Literal ID="Abtn" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Literal ID="NewRow" runat="server"></asp:Literal>

                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelFilters" runat="server" Text='<%# Bind("AllowFilters") %>' Visible="false"></asp:Label>
                <asp:Label ID="ID_item" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                <asp:Label ID="LabelImageItems" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                <asp:Label ID="RowNum" runat="server" Visible="false" Text='<%# Bind("rownum") %>'></asp:Label>
                <asp:Label ID="LabelPrice" runat="server" Visible="false" Text='<%# Bind("price") %>'></asp:Label>
                <asp:Label ID="LabelMaxCount" runat="server" Visible="false" Text='<%# Bind("balance") %>'></asp:Label>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"></asp:SqlDataSource>


