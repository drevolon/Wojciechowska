<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UniversalTextBlocksPages.ascx.cs" Inherits="rost.UC.UniversalTextBlocksPages" %>

<div class="row mx-auto align-middle align-content-center align-items-center mt-3">
    <div class="btn btn-group">
    <asp:Repeater runat="server" ID="ListNumPages">
        <ItemTemplate>
            <asp:LinkButton ID="NPG" runat="server" CommandName="NumPage" CssClass="btn btn-outline-info" CommandArgument='<%#Eval("NP") %>' Text='<%#Eval("NP") %>' OnCommand="Unnamed_Click"></asp:LinkButton>

        </ItemTemplate>
    </asp:Repeater></div>
</div>



<div class="row mx-auto align-middle align-content-center align-items-center mt-4">
    <%--<div class="card-columns">--%>
        <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
            <ItemTemplate>

                <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 mb-4">
                <div id="item_block">
                    <div class="card border-secondary p-0">
                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" />
                        </asp:HyperLink>
                        <%--<div class="card-body" style="height:280px">--%>
                        <div class="card-body" >
                            <h5 class="card-title" style="overflow: hidden; height: 70px">
                                <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h5>
                            <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#">
                            <p class="card-text" style="overflow: hidden; height: 125px">
                                <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label> </asp:HyperLink>
                            </p>
                        </div>
                    </div>
                </div>
                </div>
                <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                <%--                    <asp:Literal ID="NewRow" runat="server"></asp:Literal>--%>
            </ItemTemplate>
        </asp:Repeater>
    <%--</div>--%>
</div>





<%--<div class="row ">
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
--%>


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="BaseTextSelectPage" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
        <asp:Parameter DefaultValue="2" Name="n" />
        <asp:Parameter DefaultValue="2" Name="m" />
    </SelectParameters>
</asp:SqlDataSource>


