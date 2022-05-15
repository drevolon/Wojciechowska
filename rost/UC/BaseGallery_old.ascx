<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseGallery_old.ascx.cs" Inherits="shop_health.UC.BaseGallery_old" %>
<asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound">
    <Columns>

        <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
            <ItemTemplate>
                <div class="media well" id="BaseText_blok" runat="server">
                    <asp:Panel ID="PanelInfoBlock" runat="server">
                    <div style="height: <%# WidthNews -50 %>px; overflow: hidden; " class="hidden-xs" >
                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" width='<%# WidthNews %>' runat="server"  />
                            <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                        </asp:HyperLink>

                    </div></asp:Panel>

                    <div class="media-body" style="height: <%# WidthNews -200%>px; overflow: hidden; ">
                        <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#">
                        <h4 class="media-heading">
                            <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h4>
                        <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label></asp:HyperLink>
                    </div>
                </div>
                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="30" />
        <asp:Parameter DefaultValue="16" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>