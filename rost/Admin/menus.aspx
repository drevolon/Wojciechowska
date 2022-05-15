<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menus.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="rost.Admin.menus" MasterPageFile="~/Admin/SiteAdmin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Настройка страниц</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <%--<form role="form">--%>
                <div class="form-group">
                    <label for="TextBoxName_pages">Наименование пункта меню</label>
                    <asp:TextBox ID="TextBoxName_pages" runat="server" CssClass="form-control" placeholder="Наименование пункта меню"></asp:TextBox>
                </div>
                <%--<div class="form-group">
                        <label for="TextBoxShortText">Уникальный (порядковый) номер</label>
                        <asp:TextBox ID="TextBoxShortText" runat="server" CssClass="form-control" placeholder="номер" Width="100px"></asp:TextBox>
                    </div>--%>

                <div>
                    <asp:LinkButton ID="LinkButtonInsert" runat="server" CssClass="btn btn-primary" OnClick="LinkButtonInsert_Click">
                <i class="glyphicon glyphicon-plus"> Добавить</i>
                    </asp:LinkButton>
                </div>
                <%--</form>--%>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id" DataSourceID="SqlDataSourcePages" CssClass="table table-responsive table-condensed table-hover">
                <Columns>

                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="ImageButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка" Visible="true"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                            <asp:LinkButton ID="ImageButtonDelete" runat="server" CausesValidation="False" Visible="false" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись? ВНИМАНИЕ! БУДУТ УДАЛЕНЫ ВСЕ СТАТЬИ И ФОТОМАТЕРИАЛЫ ДЛЯ ДАННОЙ СТРАНИЦЫ!');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>


                        </ItemTemplate>
                        <ItemStyle Width="50px" />

                    </asp:TemplateField>


                    <%-- <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="btn-group">
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" ToolTip="Редактировать" CommandName="Edit" CausesValidation="false" CssClass="btn btn-success">
                                <i class="glyphicon glyphicon-pencil"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClientClick="return confirm('Удалить запись? ВНИМАНИЕ! БУДУТ УДАЛЕНЫ ВСЕ СТАТЬИ И ФОТОМАТЕРИАЛЫ ДЛЯ ДАННОЙ СТРАНИЦЫ!');" ToolTip="Удалить" CommandName="Delete" CausesValidation="false" CssClass="btn  btn-danger">
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
                    </asp:TemplateField>--%>
                    <asp:BoundField DataField="id" HeaderText="Уникальный порядковый номер" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="true" />
                    <asp:TemplateField HeaderText="Номер меню" SortExpression="id_menu">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxIDMenu" runat="server" Text='<%# Bind("id_menu") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelIDMenu" runat="server" Text='<%# Bind("id_menu") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID Номер родительского меню" SortExpression="id_parent">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_parent") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_parent") %>'></asp:Label>
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
                    <asp:BoundField DataField="id_pages" HeaderText="ID страницы" SortExpression="id_pages" Visible="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div>


        <asp:SqlDataSource ID="SqlDataSourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" 
            InsertCommand="INSERT INTO Menus (id_menu, name) VALUES (1,@name)" OnInserted="SqlDataSourcePages_Inserted" OnInserting="SqlDataSourcePages_Inserting" InsertCommandType="Text" 
            SelectCommand="SELECT id, id_menu, id_parent, npp, name, id_pages FROM Menus ORDER BY id" SelectCommandType="Text"
            DeleteCommand="Delete from Menus where id=@id " DeleteCommandType="Text"
            UpdateCommand="UPDATE [dbo].[Menus] SET [id_menu] = @id_menu, [id_parent] = @id_parent,[npp] = @npp, [name]=@name, [id_pages]=@id_pages WHERE id=@id" UpdateCommandType="Text"
            >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" />
                <asp:Parameter Name="id_menu" />
                <asp:Parameter Name="id_parent" />
                <asp:Parameter Name="npp" />
                <asp:Parameter Name="name" />
                <asp:Parameter Name="id_pages" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
