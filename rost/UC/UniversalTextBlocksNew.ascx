<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UniversalTextBlocksNew.ascx.cs" Inherits="rost.UC.UniversalTextBlocksNew" %>





<div class="row mx-auto align-middle align-content-center align-items-center mt-4">
    
        <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
            <ItemTemplate>

                <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 mb-4">
                <div id="item_block">
                    <div class="card text-dark bg-info">
                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" />
                        </asp:HyperLink>
                        <%--<div class="card-body" style="height:280px">--%>
                        <div class="card-body"  >
                            <h5 class="card-title" style="overflow: hidden; height: 70px">
                                <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h5>
                          
                        </div>
                        <div class="card-footer">
                              <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#" CssClass="link-light item_block_links">
                            <p class="card-text" style="overflow: hidden; height: 20px;">
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
            
            </ItemTemplate>
        </asp:Repeater>
  
</div>







<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


