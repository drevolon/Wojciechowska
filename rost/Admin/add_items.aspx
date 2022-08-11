<%@ Page Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" MaintainScrollPositionOnPostback="true" EnableViewState="true" CodeBehind="add_items.aspx.cs" ValidateRequest="false" Inherits="rost.Admin.add_items" %>

<%@ MasterType VirtualPath="~/Admin/SiteAdmin.Master" %>


<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        (function ($) {
            $(function () {
                $('.btn-file').each(function () {
                    var self = this;
                    $('input[type=file]', this).change(function () {
                        // remove existing file info
                        $(self).next().remove();
                        // get value
                        var value = $(this).val();
                        // get file name
                        var fileName = value.substring(value.lastIndexOf('/') + 1);
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
    <div class="card">
        <div class="card-header">
            <h3>
                <asp:Label ID="LabelHeaderPage" runat="server"></asp:Label></h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12 col-xl-4">
                    <div class="form-group">
                        <label for="TextBoxNpp_text">Номер сортировки</label>
                        <asp:TextBox ID="TextBoxNpp_text" runat="server" CssClass="form-control" placeholder="Введите число"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-12 col-xl-4">
                    <div class="form-group">
                        <label for="TextBoxHeader_text">Заголовок</label>
                        <asp:TextBox ID="TextBoxHeader_text" runat="server" CssClass="form-control" placeholder="Введите заголовок"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-12 col-xl-4">
                    <div class="form-group">
                        <label for="TextBoxHeader_text">Загрузить фото</label>
                        <asp:FileUpload ID="FileUploadImg" runat="server" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-xl-4">
                    <div class="form-group">
                        <label for="TextBoxDescription_text">Текст на первой странице (аннотация)</label>
                        <%--<asp:TextBox ID="TextBoxDescription_text" runat="server"  placeholder="Введите текст" TextMode="MultiLine" Height="100px"></asp:TextBox>--%>
                        <FTB:FreeTextBox ID="TextBoxDescription_text" runat="server" DesignModeBodyTagCssClass="form-control"></FTB:FreeTextBox>
                    </div>
                </div>
                <div class="col-lg-12 col-xl-4">
                    <div class="form-group">
                        <label for="TextBoxBase_text">Текст на второй странице (полный)</label>
                        <%--<asp:TextBox ID="TextBoxBase_text" runat="server" CssClass="form-control" placeholder="Введите текст" TextMode="MultiLine" Height="200px"></asp:TextBox>--%>
                        <FTB:FreeTextBox ID="TextBoxBase_text" runat="server" DesignModeBodyTagCssClass="form-control"></FTB:FreeTextBox>
                    </div>
                </div>
                <div class="col-lg-12 col-xl-4">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="GridProps" AutoGenerateColumns="False" ShowHeader="false" runat="server" CssClass="table table-bordered table-hover table-primary table-striped"> 
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LabelName" Text='<%# Bind("name") %>' CssClass="form-text"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextValue" Text='<%# Bind("value") %>' placeholder="Введите значение" CssClass="form-control"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="TextBoxQtyFiles" class="form-text">Количество образов документов:</label>
                                    
                            </div>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="TextBoxQtyFiles" runat="server" CssClass="form-control" placeholder="Введите количество" Width="50px"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="LinkButtonQtyFiles" runat="server" CssClass="btn btn-success" OnClick="LinkButtonQtyFiles_Click" Text="Применить"></asp:LinkButton>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="TextBoxHeader_text" class="form-text">Список загружаемых образов документов</label>
                            <asp:GridView ID="GridViewFiles" AutoGenerateColumns="False" ShowHeader="false" runat="server" CssClass="table table-bordered table-hover table-primary table-striped">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextFileName" Text='<%# Bind("FileName") %>' placeholder="Введите наименование файла" CssClass="form-control"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:FileUpload ID="FInsertUpload" runat="server" CssClass="form-control-file" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
          
        </div>
        <div class="card-footer">
            <asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-success" OnClick="LinkButtonInsert_Click" Text="Добавить"></asp:LinkButton>
        </div>
    </div>

    <div class="card text-bg-secondary ">
        <div class="card-header">

        </div>
        <div class="card-body">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id_text,items" DataSourceID="SqlDataSourceBaseText" CssClass="table table-secondary table-bordered table-striped" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="btn-group">
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" ToolTip="Редактировать" CommandName="Edit" CausesValidation="false" CssClass="btn btn-success">
                                <i class="glyphicon glyphicon-pencil"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClientClick="return confirm('Удалить запись?');" ToolTip="Удалить" CommandName="Delete" CausesValidation="false" CssClass="btn  btn-danger">
                                <i class="glyphicon glyphicon-trash"></i>
                                </asp:LinkButton>
                            </div>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="btn-group">
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" ToolTip="Обновить" CommandName="Update" CausesValidation="false" CssClass="btn btn-success">
                                <i class="glyphicon glyphicon-ok"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonCancel" runat="server" ToolTip="Отменить" CommandName="Cancel" CausesValidation="false" CssClass="btn btn-success">
                                <i class="glyphicon glyphicon-remove"></i>
                                </asp:LinkButton>
                            </div>
                        </EditItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="id_pages" SortExpression="id_pages" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="LabelEditId_pages" runat="server" Text='<%# Eval("id_pages") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemId_pages" runat="server" Text='<%# Bind("id_pages") %>'></asp:Label>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Сорт." SortExpression="npp">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox_npp" runat="server" Text='<%# Bind("npp") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelNpp" runat="server" Text='<%# Bind("npp") %>'></asp:Label>
                            <label class="form-text"><h5><b>ID:</b></h5></label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_text") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Заголовок" SortExpression="header_text">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("header_text") %>' CssClass="form-control" TextMode="MultiLine" Height="100"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("header_text") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Текст" SortExpression="description_text">
                        <EditItemTemplate>
                            <label class="form-text">Краткое описание</label>
                            <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description_text") %>' TextMode="MultiLine" Height="200"  Width="500px" CssClass="form-control" ></asp:TextBox>--%>
                            <FTB:FreeTextBox ID="FreeTextBoxDescription_text" runat="server" Width="500px" Height="200" Text='<%# Bind("description_text") %>' AllowHtmlMode="true" EnableToolbars="false">
                            </FTB:FreeTextBox>
                            <label class="form-text">Полное описание</label>
                            <%--<asp:TextBox ID="TextBoxBase_text" runat="server" Text='<%# Bind("base_text") %>' TextMode="MultiLine" Height="200" CssClass="form-control"></asp:TextBox>--%>
                               <FTB:FreeTextBox ID="FreeTextBoxBase_text" runat="server"  Text='<%# Bind("base_text") %>' ScriptMode="InPage" AllowHtmlMode="true"  >
                            </FTB:FreeTextBox>
                           
                            <asp:Label ID="LabelEditid_text" runat="server" Text='<%# Eval("id_text") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelEditItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                            <%--<asp:Label ID="LabelFileNames" runat="server" Text='<%# Bind("fileNames") %>' Visible="false"></asp:Label>--%>
                            <asp:Label ID="LabelEditDate_text" runat="server" Text='<%# Bind("date_text") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="LabelEditHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                            <%--<asp:Label ID="LabelEditFilePath" runat="server" Text='<%# Bind("filePath") %>' Visible="false"></asp:Label>--%>


                            <div class="input-group mt-3">

                                <asp:FileUpload ID="FileUploadImg" runat="server" ToolTip="Смена фото" CssClass=" form-control-file"  />
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <label class="form-text"><h5><b>Краткое описание:</b></h5></label>
                            <asp:Label ID="LabelItemDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                            <label class="form-text"><h5><b>Полное описание:</b></h5></label>
                            <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>'></asp:Label>
                            <label class="form-text"><h5><b>Фото:</b></h5></label>
                            <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="200px" runat="server" CssClass="img-thumbnail" />
                            <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="500px" />
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Дата " SortExpression="date_text">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date_text","{0:dd.MM.yyyy}") %>' CssClass="form-control datepick" Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("date_text") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                   
                    <asp:CheckBoxField DataField="have_img" HeaderText="have_img" SortExpression="have_img" Visible="False" />
                    <asp:CheckBoxField DataField="visible_blok" HeaderText="Показать блок" SortExpression="visible_blok" ItemStyle-Width="50">
                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:CheckBoxField>
                    <%--<asp:BoundField DataField="id_text" HeaderText="ID" SortExpression="id_text" Visible="true" ReadOnly="True" InsertVisible="False" />--%>
                    <asp:TemplateField HeaderText="Доп. параметры">
                        <EditItemTemplate>
                            <asp:Label ID="LabelPropsEdit" runat="server" Text='<%# Bind("property") %>' Visible="false"></asp:Label>
                            <asp:GridView ID="GridPropsEdit" AutoGenerateColumns="False" ShowHeader="false" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="LabelNameEdit" Text='<%# Bind("name") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextValueEdit" Text='<%# Bind("value") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelProps" runat="server" Text='<%# Bind("property") %>' Visible="false"></asp:Label>
                            <asp:GridView ID="GridPropsList" AutoGenerateColumns="False" ShowHeader="false" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LabelNameList" Text='<%# Bind("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TextValueList" Text='<%# Bind("value") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Доп. документы">
                        <ItemTemplate>
                            <asp:Label ID="LabelDocs" runat="server" Text='<%# Bind("images_add") %>' Visible="false"></asp:Label>
                            <asp:GridView ID="GridDocsList" AutoGenerateColumns="False" ShowHeader="false" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="LabelNameDoc" Text='<%# Bind("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="ImageDoc" ImageUrl='<%# "./../photoDB.ashx?type_img=image_low&items="+Eval("items") +"&w=70&h=70" %>' Height="50px" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabelDocsEdit" runat="server" Text='<%# Bind("images_add") %>' Visible="false"></asp:Label>
                            <asp:GridView ID="GridDocsEdit" AutoGenerateColumns="False" ShowHeader="false" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextNameDoc" Text='<%# Bind("name") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TextItems" Text='<%# Eval("items") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="ImageDoc" ImageUrl='<%# "./../photoDB.ashx?type_img=image_low&items="+Eval("items") +"&w=70&h=70" %>' Height="50px" runat="server" Visible='<%# Eval("items").ToString()!="" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="DelDoc" runat="server" Text="Удалить скан" Visible='<%# Eval("items").ToString()!="" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:FileUpload ID="FUpdateUpload" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>







    <asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
        SelectCommand="SELECT BaseText.id_pages, BaseText.header_text, BaseText.description_text, BaseText.base_text, BaseText.date_text, BaseText.items, BaseText.have_img, BaseText.visible_blok, BaseText.id_text, BaseText.npp, BaseText.property, BaseText.images_add, Images.name_images FROM BaseText LEFT OUTER JOIN Images ON BaseText.items = Images.items WHERE (BaseText.id_pages = @id_pages) ORDER BY BaseText.npp, BaseText.id_text DESC"
        InsertCommand="INSERT INTO BaseText(id_pages, description_text, header_text, base_text, date_text, items, have_img, visible_blok, npp, property, images_add) VALUES (@id_pages, @description_text, @header_text, @base_text, @date_text, @items, @have_img, @visible_blok, @npp, @property, @images_add)"
        OnInserting="SqlDataSourceBaseText_Inserting"
        DeleteCommand="BaseTextDelete" DeleteCommandType="StoredProcedure"
        UpdateCommand="Update BaseText set header_text=@header_text, description_text=@description_text, base_text=@base_text, have_img=@have_img,visible_blok=@visible_blok, npp=@npp, property=@property, images_add=@images_add where id_text=@id_text ">
        <DeleteParameters>
            <asp:Parameter Name="id_text" Type="Int32" />
            <asp:Parameter Name="items" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_pages" />
            <asp:Parameter Name="description_text" />
            <asp:Parameter Name="header_text" />
            <asp:Parameter Name="base_text" />
            <asp:Parameter Name="date_text" />
            <asp:Parameter Name="items" />
            <asp:Parameter Name="have_img" />
            <asp:Parameter Name="visible_blok" />
            <asp:Parameter Name="npp" />
            <asp:Parameter Name="property" />
            <asp:Parameter Name="images_add" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_pages" QueryStringField="id_pages" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_text" Type="Int32" />
            <asp:Parameter Name="header_text" Type="String" />
            <asp:Parameter Name="description_text" Type="String" />
            <asp:Parameter Name="base_text" Type="String" />
            <asp:Parameter Name="date_text" Type="DateTime" />
            <asp:Parameter Name="have_img" Type="Boolean" />
            <asp:Parameter Name="visible_blok" Type="Boolean" />
            <asp:Parameter Name="npp" Type="Int32" />
            <asp:Parameter Name="property" Type="String" />
            <asp:Parameter Name="images_add" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>



</asp:Content>
