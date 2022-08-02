<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicSlider.ascx.cs" Inherits="rost.UC.DynamicSlider" %>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row">

                        <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
                            <ItemTemplate>

                                <div class="col-12 col-md-4 overflow-auto">

<%--                                    <img src="Images/Slider/client1.png"  alt="..." />--%>
                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="d-block w-100 overflow-auto" height="289"/>
                            </asp:HyperLink>

                                </div>



                                <%--                <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 mb-4">
                    <div id="item_block">
                        <div class="card text-dark bg-info">
                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" />
                            </asp:HyperLink>

                            <div class="card-body">
                                <h5 class="card-title" style="overflow: hidden; height: 70px">
                                    <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h5>

                            </div>
                            <div class="card-footer">
                                <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#" CssClass="link-light item_block_links">
                                    <p class="card-text" style="overflow: hidden; height: 20px;">
                                        <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                                </asp:HyperLink>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>--%>

                                <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>

                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:HiddenField runat="server" ID="FirstId" />
                        <asp:HiddenField runat="server" ID="IDS" />

                    </div>
                </div>
            </div>
        </div>

        <%--</div>--%>
        <div class="our_projects_btn">
            <asp:Button runat="server" ID="ButtonPrev" OnClick="ButtonPrev_Click" CssClass="btn btn-secondary" Text="<" Enabled="false" />
            <asp:Button runat="server" ID="ButtonNext" OnClick="ButtonNext_Click" CssClass="btn btn-secondary" Text=">" />
        </div>

    </ContentTemplate>
</asp:UpdatePanel>

<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="ProjectsSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="count_row" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
        <asp:Parameter DefaultValue="0" Name="first_id" />
    </SelectParameters>
</asp:SqlDataSource>


