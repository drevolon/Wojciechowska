<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UniversalTextBlocks.ascx.cs" Inherits="shop_health.UC.UniversalTextBlocks" %>

<div class="row mx-auto align-middle align-content-center align-items-center ">
    <div class="col-12">
        <asp:HyperLink ID="HyperLinkHead" runat="server" NavigateUrl="#" Style="overflow: hidden; height: 180px;">

            <h1 class="text-center">
                <asp:Label ID="LHeader" runat="server"></asp:Label></h1>
        </asp:HyperLink>

    </div>
</div>
<div class="row ">
    <div class="col d-none d-sm-block"></div>
    <div class="col-sm-12 col-md-10  col-lg-10 col-xl-10">
        <div class="row">

            <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 mt-3">
                        <div class="card pb-3">

                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" Style="overflow: hidden; height: 180px;">
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" />
                            </asp:HyperLink>

                            <div class="card-body" style="overflow: hidden; height: 134px;">
                                <h4 class="card-title">
                                    <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h4>
                                <p class="card-text">
                                    <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>

                    <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                    <asp:Literal ID="NewRow" runat="server"></asp:Literal>
                </ItemTemplate>

            </asp:Repeater>

        </div>
    </div>
    <div class="col d-none d-sm-block"></div>
</div>



<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


