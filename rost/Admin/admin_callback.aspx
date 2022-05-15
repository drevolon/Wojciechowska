<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="admin_callback.aspx.cs" Inherits="rost.Admin.admin_callback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="panel panel-success">
        <div class="panel-heading">
            Обратная связь
        </div>
        <div class="panel-body">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table table-bordered table-striped table-condensed table-hover" HeaderStyle-CssClass="table info" PagerStyle-BackColor="Info" PagerStyle-Font-Size="Large" PagerStyle-BorderWidth="1" PagerStyle-BorderColor="Blue" PagerStyle-BorderStyle="Dashed"
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_callback"
                DataSourceID="SqlDataSourceCallback"
                OnRowDataBound="GridView1_RowDataBound">
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
                    
                    <asp:BoundField DataField="id_callback" HeaderText="№"
                        SortExpression="id_callback" InsertVisible="False" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Статус" SortExpression="status">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBoxEditStatus" runat="server" Checked='<%# Bind("status") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxItemStatus" runat="server" Checked='<%# Bind("status") %>' Visible="false" />
                            <asp:Label ID="LabelItemStatus" runat="server" CssClass="glyphicon glyphicon-alert"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="post_data" HeaderText="Обращение" ReadOnly="True" SortExpression="post_data" />
                    <asp:BoundField DataField="fio" HeaderText="ФИО" SortExpression="fio" ReadOnly="True" />
                    <asp:BoundField DataField="email" HeaderText="Email"
                        SortExpression="email" ReadOnly="True" />
                    <asp:BoundField DataField="date_post" HeaderText="Дата"
                        SortExpression="date_post" ReadOnly="True" />
                    <asp:BoundField DataField="comments" HeaderText="Комментарий" SortExpression="comments" ControlStyle-CssClass="form-control" >
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="operator" HeaderText="Оператор" ReadOnly="True" SortExpression="operator" />
                </Columns>
                  <EditRowStyle CssClass="table warning" />

<HeaderStyle CssClass="table info"></HeaderStyle>

<PagerStyle BackColor="Info" BorderColor="Blue" BorderWidth="1px" BorderStyle="Dashed" Font-Size="Large"></PagerStyle>
            </asp:GridView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCallback" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
        DeleteCommand="DELETE FROM Callback WHERE (id_callback = @id_callback)" SelectCommand="SELECT id_callback, fio, email, post_data, date_post, status, operator, comments FROM Callback ORDER BY id_callback DESC"
        UpdateCommand="UPDATE Callback SET status = @status, comments = @comments WHERE (id_callback = @id_callback)">
        <DeleteParameters>
            <asp:Parameter Name="id_callback" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="status" />
            <asp:Parameter Name="comments" />
            <asp:Parameter Name="id_callback" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
