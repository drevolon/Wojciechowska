<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/SiteAdmin.Master" CodeBehind="add_items_gallery.aspx.cs" ValidateRequest="false" Inherits="rost.Admin.add_items_gallery" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
    (function ($){
        $(function (){
            $('.btn-file').each(function (){
                var self = this;
                $('input[type=file]', this).change(function (){
                    // remove existing file info
                    $(self).next().remove();
                    // get value
                    var value = $(this).val();
                    // get file name
                    var fileName = value.substring(value.lastIndexOf('/')+1);
                    // get file extension
                    var fileExt = fileName.split('.').pop().toLowerCase();
                    // append file info
                    $('<span><i class="icon-file icon-' + fileExt + '"></i> ' + fileName + '</span>').insertAfter(self);
                });
            });
        });
    })(jQuery);
</script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
     <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
   


    <script type="text/javascript">
        $(function () {
            $(".datepick").datetimepicker({ language: 'ru' });
        });
     $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
            
        
    </script>
    <div class="container-fluid">
        <div class="row">
            <div class="page-header">
                <h3>
                    <asp:Label ID="LabelHeaderPage" runat="server"></asp:Label></h3>
            </div>
        </div>
        <div class="row">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="LabelGallery_name" class="col-lg-2">Выбрать фотогалерею для добавления фотографий</label>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="DropDownListGallery_name" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceGallery_name" DataTextField="gallery_name" DataValueField="id_gallery_name" AppendDataBoundItems="true" AutoPostBack="true">
                            <asp:ListItem Text="Выбор фотогалереи" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorGallery_name" runat="server" ControlToValidate="DropDownListGallery_name" ErrorMessage="Необходимо выбрать галерею" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:LinkButton ID="LinkButtonAddGallery_name" runat="server" CssClass="btn btn-primary" OnClick="LinkButtonAddGallery_name_Click" Text="Создать новую фотогалерею" ToolTip-="Если нет в выпадающем списке. Переход на страницу добавления фотогалерей." CausesValidation="false"></asp:LinkButton></div>
                </div>
            </div>
            
           
           
        </div>
        <div class="row well well-sm">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="TextBoxHeader_text" class="col-lg-1">Загрузить фото</label>
                    <div class="col-lg-2"><asp:FileUpload ID="FileUploadImg" runat="server" CssClass="form-control" /></div>
                    <label for="TextBoxDesc" class="col-lg-1">Описание</label>
                    <div class="col-lg-3"><asp:TextBox ID="TextBoxHeader_text" runat="server" CssClass="form-control" placeholder="Введите описание фотографии при необходимости"></asp:TextBox></div>
                    <div class="col-lg-2"><asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-success" OnClick="LinkButtonInsert_Click" Text="Добавить фотографию"></asp:LinkButton></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive table-condensed table-hover"
                            DataKeyNames="id_gallery" DataSourceID="SqlDataSourceGallery" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" PageSize="50">
                            <Columns>
                                 <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="ImageButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка" Visible="true"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                            <asp:LinkButton ID="ImageButtonDelete" runat="server" CausesValidation="False"  CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись?');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>
                        
                           
                        </ItemTemplate>
                        <ItemStyle Width="50px" />

                    </asp:TemplateField>
                                <asp:BoundField DataField="id_gallery" HeaderText="№" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id_gallery" ItemStyle-Width="50" />
                                 <asp:BoundField DataField="id_gallery_name" HeaderText="Номер галереи" SortExpression="id_gallery_name" ReadOnly="true">
<ItemStyle Width="50px"></ItemStyle>
                                 </asp:BoundField>
                                 <asp:TemplateField HeaderText="Описание" SortExpression="photo_desc">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("photo_desc") %>' CssClass="form-control"></asp:TextBox>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="LabelItemDescription_text" runat="server" Text='<%# Bind("photo_desc") %>'></asp:Label>
                                     </ItemTemplate>
                                     
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Дата" SortExpression="date_img">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date_img") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("date_img") %>'></asp:Label>
                                     </ItemTemplate>
                                     <ItemStyle Width="100px" />
                                 </asp:TemplateField>
                                <asp:TemplateField HeaderText="items" SortExpression="items" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("items") %>'></asp:TextBox>
                                        
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Показать блок" SortExpression="visible_blok">
                                     <EditItemTemplate>
                                         <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("visible_blok") %>' />
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("visible_blok") %>' Enabled="false" />
                                     </ItemTemplate>
                                     <ItemStyle Width="50px" />
                                 </asp:TemplateField>
                                <asp:BoundField DataField="id_gallery_name" HeaderText="id_gallery_name" SortExpression="id_gallery_name"
                                    Visible="False" />
                                <asp:TemplateField HeaderText="Фото">
                                    <ItemTemplate>
                                        <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="50px" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="LabelEditItemsFile" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                        <div class="input-group">

                                            <asp:FileUpload ID="FileUploadImg" runat="server" ToolTip="Смена фото" CssClass="input-group" />
                                        </div>
                                    </EditItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                     <EditRowStyle CssClass="table success" />

<HeaderStyle CssClass="table info"></HeaderStyle>

<PagerStyle BackColor="Info" BorderColor="Blue" BorderWidth="1px" BorderStyle="Dashed" Font-Size="Large"></PagerStyle>
                        </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" DeleteCommand="GalleryDelete" DeleteCommandType="StoredProcedure" InsertCommand="GalleryInsert" InsertCommandType="StoredProcedure" OnInserting="SqlDataSourceGallery_Inserting" SelectCommand="GallerySelect" SelectCommandType="StoredProcedure" UpdateCommand="GalleryUpdate" UpdateCommandType="StoredProcedure">
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
                    <asp:ControlParameter ControlID="DropDownListGallery_name" Name="id_gallery_name" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_gallery" Type="Int32" />
                    <asp:Parameter Name="photo_desc" Type="String" />
                    <asp:Parameter Name="date_img" Type="DateTime" />
                    <asp:Parameter Name="items" Type="String" />
                    <asp:Parameter Name="visible_blok" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
   
    <asp:SqlDataSource ID="SqlDataSourceGallery_name" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" DeleteCommand="Gallery_nameDelete" DeleteCommandType="StoredProcedure" InsertCommand="Gallery_nameInsert" InsertCommandType="StoredProcedure" SelectCommand="Gallery_nameSelect" SelectCommandType="StoredProcedure" UpdateCommand="Gallery_nameUpdate" UpdateCommandType="StoredProcedure">
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
   
</asp:Content>
