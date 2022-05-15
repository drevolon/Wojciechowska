<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OneTextBlocks.ascx.cs" Inherits="rost.UC.OneTextBlocks" %>
<div class="row m-auto ">
    <div class="col d-none d-sm-block"></div>
    <div class="col-sm-12 col-md-10">
        <div class="row">

            <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-12 col-md-12  col-lg-12 col-xl-12 mt-1">
                        <div class="card pb-3">

                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" />
                            </asp:HyperLink>

                            <div class="card-body">
                                <h4 class="card-title">
                                    <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h4>
                                <p class="card-text">
                                    <%--<asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>--%>
                                    <asp:Label ID="LabelBase_text" runat="server" Text='<%# Bind("base_text") %>'></asp:Label>
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



<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>