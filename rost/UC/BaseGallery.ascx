<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseGallery.ascx.cs" Inherits="shop_health.UC.BaseGallery" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<%--<div class="container">--%>
<div>
    <div class="row">
        <div class="col-lg-12">
            <div >
                <div class="center-block" style="width:1398px">
                <asp:DataList ID="Datalist1" runat="server" GridLines="None" DataKeyField="id_text" OnItemDataBound="Datalist1_ItemDataBound" RepeatColumns="2" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div id="block" style="margin: 14px 7px 14px 7px; border: 1px solid #919191; width: 310px;">
                            <div style="height: 200px; overflow: hidden;">
                                
                        <cc1:HighslideImage ID="ImageCatalog" runat="server" Width="308px" BorderWidth=0px />
                        <cc1:HighslideManager ID="HighslideManager1" runat="server">
                        </cc1:HighslideManager>


                            </div>
                            <div class="news_block" id="BaseText_blok" runat="server">

                                <div style="background-color: white; padding: 5px 10px 5px 10px">
                                    <div>
                                      
                                            <div>
                                                <h4>
                                                    <span style="color: #004576;">
                                                        <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("header_text") %>'></asp:Label></span></h4>
                                                
                                                    <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Bind("description_text") %>' Visible="false"></asp:Label>
                                                
                                            </div>
                                     

                                    </div>


                                </div>
                                <div style="background-color:#004576; color: white; padding: 12px 15px 12px 15px;">
                                    <asp:Label ID="LabelItemDate_text" runat="server" Text='<%# Bind("date_text","{0:dd.MM.yyyy}") %>'></asp:Label>
                                </div>

                            </div>
                        </div>
                        <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                        <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                        <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                        <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                        <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
                    </ItemTemplate>

                </asp:DataList>
                <%-- <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_text" OnRowDataBound="GridView1_RowDataBound">
                <Columns>

                    <asp:TemplateField SortExpression="id_pages" ShowHeader="false">
                        <ItemTemplate>
                            
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="header_text" HeaderText="header_text" SortExpression="header_text" />
                    <asp:BoundField DataField="description_text" HeaderText="description_text" SortExpression="description_text" />
                    <asp:BoundField DataField="base_text" HeaderText="base_text" SortExpression="base_text" />
                    <asp:BoundField DataField="date_text" HeaderText="date_text" SortExpression="date_text" />
                    <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" />
                    <asp:CheckBoxField DataField="have_img" HeaderText="have_img" SortExpression="have_img" />
                    <asp:CheckBoxField DataField="visible_blok" HeaderText="visible_blok" SortExpression="visible_blok" />
                    <asp:BoundField DataField="id_text" HeaderText="id_text" InsertVisible="False" ReadOnly="True" SortExpression="id_text" />
                    <asp:BoundField DataField="name_images" HeaderText="name_images" SortExpression="name_images" />
                </Columns>
            </asp:GridView>--%></div>
            </div>
        </div>
    </div>
</div>
<%--</div>--%>


<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="BaseTextSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="7" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>


