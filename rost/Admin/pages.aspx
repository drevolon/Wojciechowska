<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="shop_health.Admin.pages" MasterPageFile="~/Admin/SiteAdmin.Master" %>

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
                        <label for="TextBoxName_pages">Наименование страницы</label>
                        <asp:TextBox ID="TextBoxName_pages" runat="server" CssClass="form-control" placeholder="Наименование страницы"></asp:TextBox>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="id" DataSourceID="SqlDataSourcePages" CssClass="table table-responsive table-condensed table-hover" OnRowDataBound="GridView1_RowDataBound">
                <Columns>

                       <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="ImageButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка" Visible="true"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                            <asp:LinkButton ID="ImageButtonDelete" runat="server" CausesValidation="False" Visible="true"  CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись? ВНИМАНИЕ! БУДУТ УДАЛЕНЫ ВСЕ СТАТЬИ И ФОТОМАТЕРИАЛЫ ДЛЯ ДАННОЙ СТРАНИЦЫ!');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>
                        
                           
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
                    <asp:TemplateField HeaderText="Уникальный порядковый номер" SortExpression="id_pages">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_pages") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_pages") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                    <asp:BoundField DataField="id_pages_type" HeaderText="id_pages_type" SortExpression="id_pages_type" Visible="False" />
                    <asp:TemplateField HeaderText="Наименование страницы" SortExpression="name_pages">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEdiName_pages" runat="server" Text='<%# Bind("name_pages") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemName_pages" runat="server" Text='<%# Bind("name_pages") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="text_pages" HeaderText="text_pages" SortExpression="text_pages" Visible="False" />
                    <asp:BoundField DataField="pos_pages" HeaderText="pos_pages" SortExpression="pos_pages" Visible="False" />
                    <asp:BoundField DataField="pos_pages_under" HeaderText="pos_pages_under" SortExpression="pos_pages_under" Visible="False" />
                       <asp:TemplateField HeaderText="Номер пункта меню" SortExpression="menu_number">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("menu_number") %>' CssClass="form-control"></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="LabelItemMenu_number" runat="server" Text='<%# Bind("menu_number") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Номер позиции в подменю" SortExpression="menu_npp">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("menu_npp") %>' CssClass="form-control"></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="LabelItemMenu_npp" runat="server" Text='<%# Bind("menu_npp") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
        <div>

            
            <asp:SqlDataSource ID="SqlDataSourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" InsertCommand="PagesInsert" OnInserted="SqlDataSourcePages_Inserted" OnInserting="SqlDataSourcePages_Inserting" 
                SelectCommand="SELECT id_pages, id, id_pages_type, name_pages, text_pages, pos_pages, pos_pages_under, menu_number, menu_npp FROM Pages ORDER BY id_pages" 
                DeleteCommand="PagesDelete" 
                UpdateCommand="UPDATE [dbo].[Pages] SET [id_pages] = @id_pages,[name_pages] = @name_pages,[text_pages] = @text_pages,[menu_number] = @menu_number,[menu_npp] = @menu_npp WHERE id=@id" 
                InsertCommandType="StoredProcedure" 
                DeleteCommandType="StoredProcedure" 
                UpdateCommandType="Text">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_pages" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id" />
                    <asp:Parameter Name="id_pages" />
                    <asp:Parameter Name="name_pages" />
                    <asp:Parameter Name="text_pages" />
                    <asp:Parameter Name="menu_number" />
                    <asp:Parameter Name="menu_npp" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
</asp:Content>
