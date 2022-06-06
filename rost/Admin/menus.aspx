<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menus.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="rost.Admin.menus" MasterPageFile="~/Admin/SiteAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Настройка меню</h3>
            (ВСЕГДА: ID меню=1 - верхнее горизонтальное меню; ID меню=2 - нижнее горизонтальное меню)
        </div>
        <div class="panel-body">
            <div class="form-group">
                <%--<form role="form">--%>
                <div class="form-group">
                    <asp:Label runat="server" ID="Label3" for="TextBoxNumber_menu">Номер меню</asp:Label>
                    <asp:TextBox ID="TextBoxNumber_menu" runat="server" CssClass="form-control" placeholder="Номер меню" AutoPostBack="True"></asp:TextBox>
                    <asp:DropDownList runat="server" ID="DDL_items" DataSourceID="SqlDataSourceItems" DataTextField="name" DataValueField="id_parent">
                    </asp:DropDownList>
                    <asp:Label runat="server" ID="LabelBoxName_pages" for="TextBoxName_pages">Наименование пункта меню</asp:Label>
                    <asp:TextBox ID="TextBoxName_pages" runat="server" CssClass="form-control" placeholder="Наименование пункта меню"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TextBoxShortText">Порядковый номер</label>
                    <asp:TextBox ID="TextBoxNpp" runat="server" CssClass="form-control" placeholder="номер"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TextBoxShortText">ССылка</label>
                    <asp:TextBox ID="TextBoxLink" runat="server" CssClass="form-control" placeholder="Ссылка" ></asp:TextBox>
                </div>

                <div>
                    <asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-primary" OnClick="LinkButtonInsert_Click">
                <i class="glyphicon glyphicon-plus"> Добавить</i>
                    </asp:LinkButton>
                </div>
                <%--</form>--%>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id" DataSourceID="SqlDataSourcePages" CssClass="table table-responsive table-condensed table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                <Columns>

                    <%--                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="ImageButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка" Visible="true"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                            <asp:LinkButton ID="ImageButtonDelete" runat="server" CausesValidation="False" Visible="false" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись? ВНИМАНИЕ! БУДУТ УДАЛЕНЫ ВСЕ СТАТЬИ И ФОТОМАТЕРИАЛЫ ДЛЯ ДАННОЙ СТРАНИЦЫ!');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>


                        </ItemTemplate>
                        <ItemStyle Width="50px" />

                    </asp:TemplateField>--%>


                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="btn-group">
<%--                                <asp:LinkButton ID="LinkButtonSelect" runat="server" ToolTip="Выбор" CommandName="Select" CausesValidation="false" CssClass="btn btn-primary">
                                <i class="fas fa-play-circle"></i> 
                                </asp:LinkButton>--%>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" ToolTip="Редактировать" CommandName="Edit" CausesValidation="false" CssClass="btn btn-success">
                                <i class="fas fa-pencil-alt"></i> 
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClientClick="return confirm('Удалить запись?');" ToolTip="Удалить" CommandName="Delete" CausesValidation="false" CssClass="btn  btn-danger">
                                 <i class="fas fa-trash"></i> 
                                </asp:LinkButton>
                            </div>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="btn-group">
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" ToolTip="Обновить" CommandName="Update" CausesValidation="false" CssClass="btn btn-success">
                                 <i class="fas fa-thumbs-up"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonCancel" runat="server" ToolTip="Отменить" CommandName="Cancel" CausesValidation="false" CssClass="btn btn-success">
                                <i class="fas fa-ban"></i>
                                </asp:LinkButton>
                            </div>
                        </EditItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="Уникальный порядковый номер" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="true" />

                    <asp:TemplateField HeaderText="Уникальный ID" SortExpression="id">
                        <ItemTemplate>
                            <asp:Label ID="LabelID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Номер меню" SortExpression="id_menu">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxIDMenu" runat="server" Text='<%# Bind("id_menu") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelIDMenu" runat="server" Text='<%# Bind("id_menu") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Родительское меню" SortExpression="id_parent">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_parent_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Наименование пункта меню" SortExpression="name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="npp" HeaderText="Номер позиции в меню" SortExpression="npp" Visible="true" />
                    <asp:TemplateField HeaderText="Ссылка пункта меню" SortExpression="name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxIL" runat="server" Text='<%# Bind("item_link") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelIL" runat="server" Text='<%# Bind("item_link") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div>


        <asp:SqlDataSource ID="SqlDataSourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
            InsertCommand="INSERT INTO Menus (id_menu, id_parent, name, npp, item_link) VALUES (@id_menu, @id_parent,@name,@npp,@item_link )" OnInserted="SqlDataSourcePages_Inserted" OnInserting="SqlDataSourcePages_Inserting" InsertCommandType="Text"
            SelectCommand="select  
  IIF(isnull(s.id_parent,-1)=-1,s.id*1000+isnull(s.npp,0)*1000000,isnull((select m.npp from menus m where m.id=s.id_parent),0)*1000000+s.id_parent*1000+isnull(s.npp,0)*1000+s.id),
  id, 
  id_menu, 
  id_parent,
  (select m.name from menus m where m.id=s.id_parent) id_parent_name, 
  npp, 
  descr, 
  [name], 
  item_link 
from menus s 
order by 3,1"
            SelectCommandType="Text"
            DeleteCommand="Delete from Menus where id=@id " DeleteCommandType="Text"
            UpdateCommand="UPDATE [Menus] SET [id_menu] = @id_menu, [npp] = @npp, [name]=@name, [item_link]=@item_link WHERE id=@id" UpdateCommandType="Text">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" />
                <asp:Parameter Name="id_menu" Type="Int32" DefaultValue="-1" />
                <asp:Parameter Name="id_parent" Type="Int32" DefaultValue="-1" />
                <asp:Parameter Name="npp" />
                <asp:Parameter Name="item_link" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" />
                <asp:Parameter Name="id_menu" />
                <asp:Parameter Name="npp" />
                <asp:Parameter Name="name" />
                <asp:Parameter Name="item_link" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
            SelectCommand="select 'Пусто' name, -1 id_parent union all select name, id id_parent from Menus where id_menu=@id_menu and isnull(id_parent,-1)=-1">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxNumber_menu" DefaultValue="-1" Name="id_menu" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
