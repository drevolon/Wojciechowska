<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseGallery2.ascx.cs" Inherits="shop_health.UC.BaseGallery2" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>




<div>
    <br />
    <div class="row well well-sm">
        <div class="col-lg-12">
            <%--<asp:DropDownList ID="DropDownListGallery_name" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceGallery_name" DataTextField="gallery_name" DataValueField="id_gallery_name" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Text="Выбор фотогалереи" Value=""></asp:ListItem>
            </asp:DropDownList>--%>
            <asp:DataList ID="DataListGallery_name" CssClass="table table-responsive table-hover" runat="server" Width="100%" DataKeyField="id_gallery_name" DataSourceID="SqlDataSourceGallery_name" RepeatColumns="2" RepeatDirection="Horizontal" OnSelectedIndexChanged="DataListGallery_name_SelectedIndexChanged">
                <ItemTemplate>
                    <div>
                        <asp:Label ID="id_gallery_nameLabel" runat="server" Text='<%# Eval("id_gallery_name") %>' Visible="false" />
                        
                        <i class="glyphicon glyphicon-eye-open my_link"></i>
                        <asp:LinkButton ID="LinkButtonGallery_name" runat="server" ToolTip="Посмотреть" CommandName="Select" Text='<%# Eval("gallery_name") %>' CommandArgument='<%# Eval("gallery_name") %>'>
                            
                        </asp:LinkButton>
                        <br />
                        <b>Дата: </b>
                        <asp:Label ID="date_galleryLabel" runat="server" Text='<%# Eval("date_gallery","{0:dd.MM.yyyy}") %>' CssClass="text-success" />
                        <br />
                        <b>Описание:</b><br />
                        <asp:Label ID="gallery_name_descLabel" runat="server" Text='<%# Eval("gallery_name_desc") %>' /><br />
                    </div>

                </ItemTemplate>
                <ItemStyle Width="50%" />
            </asp:DataList>


        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div>
                <div class="center-block">
                    <asp:DataList ID="Datalist1" runat="server" DataKeyField="id_gallery" OnItemDataBound="Datalist1_ItemDataBound" RepeatColumns="2" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div id="block" style="margin: 14px 7px 14px 7px; border: 1px solid #919191; width: 310px;">
                                <div style="height: 200px; overflow: hidden;">
                                 
                                    <cc1:HighslideImage ID="ImageCatalog" runat="server" Width="308px" BorderWidth="0px" />
                                    <cc1:HighslideManager ID="HighslideManager1" runat="server">
                                    </cc1:HighslideManager>


                                </div>
                                <div class="news_block" id="BaseText_blok" runat="server">

                                    <div style="background-color: white; padding: 5px 10px 5px 10px">
                                        <div>
                                          
                                            <div>
                                                <h4>
                                                    <span style="color: #004576;">
                                                        <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Bind("photo_desc") %>'></asp:Label></span></h4>
                                            </div>
                                           
                                        </div>


                                    </div>
                                    <div style="background-color: #004576; color: white; padding: 12px 15px 12px 15px;">
                                        <asp:Label ID="LabelItemDate_text" runat="server" Text='<%# Bind("date_img","{0:dd.MM.yyyy}") %>'></asp:Label>
                                    </div>

                                </div>
                            </div>
                          
                            <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_gallery") %>' Visible="false"></asp:Label>
                           
                        </ItemTemplate>

                    </asp:DataList>
                  
                </div>
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


            <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>" DeleteCommand="GalleryDelete" DeleteCommandType="StoredProcedure" InsertCommand="GalleryInsert" InsertCommandType="StoredProcedure" SelectCommand="GallerySelect" SelectCommandType="StoredProcedure" UpdateCommand="GalleryUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="id_gallery" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_gallery_name" Type="Int32" />
                    <asp:Parameter Name="photo_desc" Type="String" />
                    <asp:Parameter Name="date_img" Type="DateTime" />
                    <asp:Parameter Name="items" Type="String" />
                    <asp:Parameter Name="visible_blok" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DataListGallery_name" Name="id_gallery_name" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_gallery" Type="Int32" />
                    <asp:Parameter Name="photo_desc" Type="String" />
                    <asp:Parameter Name="date_img" Type="DateTime" />
                    <asp:Parameter Name="items" Type="String" />
                    <asp:Parameter Name="visible_blok" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
   
    <asp:SqlDataSource ID="SqlDataSourceGallery_name" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>" DeleteCommand="Gallery_nameDelete" DeleteCommandType="StoredProcedure" InsertCommand="Gallery_nameInsert" InsertCommandType="StoredProcedure" SelectCommand="Gallery_nameSelect" SelectCommandType="StoredProcedure" UpdateCommand="Gallery_nameUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_gallery_name" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="gallery_name" Type="String" />
            <asp:Parameter Name="date_gallery" Type="DateTime" />
            <asp:Parameter Name="gallery_name_desc" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_gallery_name" Type="Int32" />
            <asp:Parameter Name="gallery_name" Type="String" />
            <asp:Parameter Name="date_gallery" Type="DateTime" />
            <asp:Parameter Name="gallery_name_desc" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
   



