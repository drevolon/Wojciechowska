<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/SiteAdmin.Master" MaintainScrollPositionOnPostback="true" CodeBehind="add_items.aspx.cs" ValidateRequest="false" Inherits="rost.Admin.add_items" %>

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
                <div class="col-lg-2 col-md-2">
                    <div class="form-group">
                        <label for="TextBoxNpp_text">Номер сортировки</label>
                        <asp:TextBox ID="TextBoxNpp_text" runat="server" CssClass="form-control" placeholder="Введите число"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="form-group">
                        <label for="TextBoxHeader_text">Заголовок</label>
                        <asp:TextBox ID="TextBoxHeader_text" runat="server" CssClass="form-control" placeholder="Введите заголовок"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="form-group">
                        <label for="TextBoxHeader_text">Загрузить фото</label>
                        <asp:FileUpload ID="FileUploadImg" runat="server" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="TextBoxDescription_text">Текст на первой странице (аннотация)</label>
                        <%--<asp:TextBox ID="TextBoxDescription_text" runat="server"  placeholder="Введите текст" TextMode="MultiLine" Height="100px"></asp:TextBox>--%>
                        <FTB:FreeTextBox ID="TextBoxDescription_text" runat="server"></FTB:FreeTextBox>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="TextBoxBase_text">Текст на второй странице (полный)</label>
                        <%--<asp:TextBox ID="TextBoxBase_text" runat="server" CssClass="form-control" placeholder="Введите текст" TextMode="MultiLine" Height="200px"></asp:TextBox>--%>
                        <FTB:FreeTextBox ID="TextBoxBase_text" runat="server"></FTB:FreeTextBox>

                    </div>

                </div>
            </div>
            <div class="row">
                <hr />
                <div class="col-lg-2">
                    <asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-success" OnClick="LinkButtonInsert_Click" Text="Добавить"></asp:LinkButton>
                </div>
                <div class="col-lg-10">
                </div>

                <hr />
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id_text,items" DataSourceID="SqlDataSourceBaseText" CssClass="table table-bordered table-responsive table-condensed table-hover" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating">
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
                                    <asp:TextBox ID="TextBox_npp" runat="server" Text='<%# Bind("npp") %>' CssClass="form-control" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelNpp" runat="server" Text='<%# Bind("npp") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Краткое описание" SortExpression="description_text">
                                <EditItemTemplate>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description_text") %>' TextMode="MultiLine" Height="200" ></asp:TextBox>--%>
                                    <FTB:FreeTextBox ID="FreeTextBoxDescription_text" runat="server" Width="100%" Height="500" Text='<%# Bind("description_text") %>'>
                                    </FTB:FreeTextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemDescription_text" runat="server" Text='<%# Bind("description_text") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="500px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Полный текст" SortExpression="base_text">
                                <EditItemTemplate>
                                    <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("base_text") %>' TextMode="MultiLine" Height="200" CssClass="form-control"></asp:TextBox>--%>
                                    <FTB:FreeTextBox ID="FreeTextBoxBase_text" runat="server" Width="100%" Height="500" Text='<%# Bind("base_text") %>'>
                                    </FTB:FreeTextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>'></asp:Label>
                                </ItemTemplate>
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
                            <asp:TemplateField HeaderText="Фото">
                                <ItemTemplate>
                                    <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="50px" runat="server" />
                                    <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="LabelEditid_text" runat="server" Text='<%# Eval("id_text") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="LabelEditItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                    <%--<asp:Label ID="LabelFileNames" runat="server" Text='<%# Bind("fileNames") %>' Visible="false"></asp:Label>--%>
                                    <asp:Label ID="LabelEditDate_text" runat="server" Text='<%# Bind("date_text") %>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="LabelEditHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                                    <%--<asp:Label ID="LabelEditFilePath" runat="server" Text='<%# Bind("filePath") %>' Visible="false"></asp:Label>--%>


                                    <div class="input-group">

                                        <asp:FileUpload ID="FileUploadImg" runat="server" ToolTip="Смена фото" CssClass="input-group" />
                                    </div>


                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="have_img" HeaderText="have_img" SortExpression="have_img" Visible="False" />
                            <asp:CheckBoxField DataField="visible_blok" HeaderText="Показать блок" SortExpression="visible_blok" ItemStyle-Width="50">
                                <ItemStyle Width="50px"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="id_text" HeaderText="ID" SortExpression="id_text" Visible="true" ReadOnly="True" InsertVisible="False" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>







    <asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
        SelectCommand="SELECT BaseText.id_pages, BaseText.header_text, BaseText.description_text, BaseText.base_text, BaseText.date_text, BaseText.items, BaseText.have_img, BaseText.visible_blok, BaseText.id_text, BaseText.npp, Images.name_images FROM BaseText LEFT OUTER JOIN Images ON BaseText.items = Images.items WHERE (BaseText.id_pages = @id_pages) ORDER BY BaseText.npp, BaseText.id_text DESC"
        InsertCommand="INSERT INTO BaseText(id_pages, description_text, header_text, base_text, date_text, items, have_img, visible_blok, npp) VALUES (@id_pages, @description_text, @header_text, @base_text, @date_text, @items, @have_img, @visible_blok, @npp)" OnInserting="SqlDataSourceBaseText_Inserting" DeleteCommand="BaseTextDelete" DeleteCommandType="StoredProcedure" UpdateCommand="BaseTextUpdate" UpdateCommandType="StoredProcedure">
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
        </UpdateParameters>
    </asp:SqlDataSource>



</asp:Content>
