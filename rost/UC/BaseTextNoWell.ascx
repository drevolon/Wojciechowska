<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseTextNoWell.ascx.cs" Inherits="shop_health.UC.BaseTextNoWell" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>


<asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound">
    <Columns>

        <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
            <ItemTemplate>



                <div class="media">
                    <asp:Panel runat="server" ID="PanelImageRight" Style="padding: 2px; border: solid 0px #E88424; float: left; margin-right: 10px; height: 55px; overflow: hidden">
                        <cc1:HighslideImage ID="ImageItem" runat="server" BorderColor="#8A8A8A" BorderStyle="Solid"
                            BorderWidth="0px" Width="60px" />
                        <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                        </cc1:HighslideManager>
                    </asp:Panel>
                    <asp:HyperLink ID="HyperLinkText" runat="server" NavigateUrl="#">
                        <h5 class="media-heading"><strong>
                            <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></strong></h5>
                        <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                    </asp:HyperLink>
                    <div class="media-body">
                    </div>
                </div>
                <div style="clear: both"></div>

                <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                <div style="margin-bottom: 5%"></div>
                <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="" />
        <asp:Parameter DefaultValue="7" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>
