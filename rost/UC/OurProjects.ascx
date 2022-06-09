<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OurProjects.ascx.cs" Inherits="rost.UC.OurProjects" %>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>


        <%--    <div class="our_projects_header">
            <div class="our_projects_line"></div>
            <div class="our_projects_header_img">
                <img src="Images/our_project_header_img.png" />
            </div>
            <div class="our_projects_header_text">
                <asp:HyperLink ID="HyperLinkHead" runat="server" NavigateUrl='#' CssClass="our_projects_header_url">
                    <asp:Label ID="LHeader" runat="server" Text="Наши проекты" />
                </asp:HyperLink>

            </div>
            <div class="our_projects_header_line"></div>
        </div>
        <div class="our_projects_items">--%>

        <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
            <ItemTemplate>
                <%--                    <div class="our_projects_item">
                        <div class="our_projects_item_header">
                            <asp:Literal runat="server" ID="Literal1" Text='<%# Eval("header_text") %>'></asp:Literal>
                        </div>
                        <div class="our_projects_item_img">
                            <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                                <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top img-fluid" />
                            </asp:HyperLink>
                        </div>
                        <div class="our_projects_item_text">
                            <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#" CssClass="our_projects_item_text_url">
                                <asp:Literal runat="server" ID="Literal2" Text='<%# Eval("description_text") %>'></asp:Literal>
                            </asp:HyperLink>
                        </div>
                    </div>--%>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 mb-4">
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
                </div>

                <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>

            </ItemTemplate>
        </asp:Repeater>
        <asp:HiddenField runat="server" ID="FirstId" />
        <asp:HiddenField runat="server" ID="IDS" />

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


