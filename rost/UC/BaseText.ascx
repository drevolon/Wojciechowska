<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseText.ascx.cs" Inherits="shop_health.UC.BaseText" %>


<div class="row">
    <div class="col-lg-12">
        <div>

            <div class="center-block" style="width: 700px; margin-top: 0px; margin-left: 0px;">

                <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>

                        <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
                            <ItemTemplate>
                                <div class="media well" id="BaseText_blok" runat="server">
                                    <asp:Panel ID="PanelInfoBlock" runat="server">
                                        <div style="height: <%# WidthNews-50 %>px; overflow: hidden;" class="hidden-xs">
                                            <%--<asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">--%>
                                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" Width='<%# WidthNews %>' runat="server" />
                                            <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                                            <%-- </asp:HyperLink>--%>
                                        </div>
                                    </asp:Panel>

                                    <div class="media-body" style="height: <%# WidthNews-200%>px; overflow: hidden;">
                                        <%--<asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#">--%>
                                        <h4 class="media-heading">
                                            <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></h4>
                                        <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label><%--</asp:HyperLink>--%>
                                    </div>
                                </div>
                                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                                <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--  <asp:BoundField DataField="header_text" HeaderText="header_text" SortExpression="header_text" />
                    <asp:BoundField DataField="description_text" HeaderText="description_text" SortExpression="description_text" />
                    <asp:BoundField DataField="base_text" HeaderText="base_text" SortExpression="base_text" />
                    <asp:BoundField DataField="date_text" HeaderText="date_text" SortExpression="date_text" />
                    <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" />
                    <asp:CheckBoxField DataField="have_img" HeaderText="have_img" SortExpression="have_img" />
                    <asp:CheckBoxField DataField="visible_blok" HeaderText="visible_blok" SortExpression="visible_blok" />
                    <asp:BoundField DataField="id_text" HeaderText="id_text" InsertVisible="False" ReadOnly="True" SortExpression="id_text" />
                    <asp:BoundField DataField="name_images" HeaderText="name_images" SortExpression="name_images" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>

<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="7" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>