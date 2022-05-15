<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/SiteAdmin.Master" CodeBehind="add_items_gallery_set.aspx.cs" ValidateRequest="false" Inherits="rost.Admin.add_items_gallery_set" %>

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
            <div class="col-lg-6 col-md-6">
                <div class="form-group">
                    <label for="LabelGallery_name">Наименование фотогалереи</label>
                    <asp:TextBox ID="TextBoxGallery_name" runat="server" CssClass="form-control" placeholder="Наименование фотогалереи" TextMode="MultiLine" Height="100px"></asp:TextBox>
                     <label for="LabelGallery_name_desc">Описание фотогалереи</label>
                    <asp:TextBox ID="TextBoxGallery_name_desc" runat="server" CssClass="form-control" placeholder="Описание фотогалереи" TextMode="MultiLine" Height="100px"></asp:TextBox>
                </div>
            </div>
            
        </div>
         

        <div>
            <hr />
            <div class="col-lg-2">
                <asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-success" OnClick="LinkButtonInsert_Click" Text="Добавить фотогалерею"></asp:LinkButton>
            </div>
            <div class="col-lg-10">
                <%--<span class="input-group">
                    <i class="icon-plus"></i> <span>Choose picture...</span>
                     <input type="file" name="image" id="image" />
                    
                </span>--%>
            </div>
            <div class="clear"></div>
            <hr />
        </div>

        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id_gallery_name" DataSourceID="SqlDataSourceGallery_name" CssClass="table table-bordered table-responsive table-condensed table-hover" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating">
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
                        <asp:BoundField DataField="id_gallery_name" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="id_gallery_name" ItemStyle-Width="50" ControlStyle-CssClass="form-control" >
<ControlStyle CssClass="form-control"></ControlStyle>

<ItemStyle Width="50px"></ItemStyle>
                          </asp:BoundField>
                        <asp:BoundField DataField="gallery_name" HeaderText="Наименование" SortExpression="gallery_name" ControlStyle-CssClass="form-control" >
<ControlStyle CssClass="form-control"></ControlStyle>
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="Дата" SortExpression="date_gallery">
                              <EditItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("date_gallery","{0:dd.MM.yyyy}") %>' CssClass="form-control"></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("date_gallery","{0:dd.MM.yyyy}") %>'></asp:Label>
                              </ItemTemplate>
                              <ControlStyle  />
                              <ItemStyle Width="100px" />
                          </asp:TemplateField>
                        <asp:BoundField DataField="gallery_name_desc" HeaderText="Описание" SortExpression="gallery_name_desc" ControlStyle-CssClass="form-control" >
<ControlStyle CssClass="form-control"></ControlStyle>
                          </asp:BoundField>
                    </Columns>
                    <EditRowStyle CssClass="table success" />

<HeaderStyle CssClass="table info"></HeaderStyle>

<PagerStyle BackColor="Info" BorderColor="Blue" BorderWidth="1px" BorderStyle="Dashed" Font-Size="Large"></PagerStyle>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceGallery_name" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" DeleteCommand="Gallery_nameDelete" DeleteCommandType="StoredProcedure" InsertCommand="Gallery_nameInsert" InsertCommandType="StoredProcedure" OnInserting="SqlDataSourceBaseText_Inserting" SelectCommand="Gallery_nameSelect" SelectCommandType="StoredProcedure" UpdateCommand="Gallery_nameUpdate" UpdateCommandType="StoredProcedure">
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
