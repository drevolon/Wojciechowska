<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OneBlock.ascx.cs" Inherits="shop_health.UC.OneBlock" %>
<asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound">
    <Columns>

        <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
            <ItemTemplate>
               <div class="media well" id="BaseText_blok" runat="server">

                   
                       <div class="col-lg-5">
                           <asp:Panel ID="PanelInfoBlock" runat="server">
                               <%--<asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                                   <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="img-responsive img-thumbnail" />
                               </asp:HyperLink>--%>
                               <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                               <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                               <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                               <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                           </asp:Panel>
                       </div>

                       <div>
                           <h4>
                               <b>
                                   <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></b></h4>
                           <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                           <%--<asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#">
                           </asp:HyperLink>--%>
                       </div>
                  

                </div>
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


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="7" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


