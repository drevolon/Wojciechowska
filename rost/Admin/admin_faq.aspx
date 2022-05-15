<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_faq.aspx.cs" Inherits="rost.admin_faq" MasterPageFile="~/Admin/SiteAdmin.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">

        <div class="card mt-3">
            <div class="card-header text-right">
                <h4>ВОПРОС-ОТВЕТ</h4>
            </div>
            <div class="card-body">

                <div class="row">

                    <div class="col-4">
                        <div class="form-group">
                            <asp:Label ID="Label37" runat="server" Text="Вопрос"></asp:Label>
                            <asp:TextBox ID="TextBoxQ" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Ответ"></asp:Label>
                            <asp:TextBox ID="TextBoxA" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="btn-group mb-2">
                            <asp:Button ID="ButtonAddFAQ" runat="server" OnClick="ButtonAddFAQ_Click" Text="Добавить" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFAQ" DataKeyNames="id" CssClass="table table-bordered table-hover">
                        <Columns>
                            <asp:CommandField DeleteText="Удалить" EditText="Изменить" ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Вопрос" SortExpression="question">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxGQ" runat="server" Text='<%# Bind("question") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelGQ" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ответ" SortExpression="answer">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxGA" runat="server" TextMode="MultiLine" Text='<%# Bind("answer") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelGA" runat="server" Text='<%# Bind("answer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="table-info" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>


        


    <asp:SqlDataSource ID="SqlDataSourceFAQ" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" SelectCommand="SELECT [id], [question],[answer] FROM [faq]" UpdateCommand="Update faq set question=@question, answer=@answer where id=@id" DeleteCommand="delete from faq where id=@id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="question" />
            <asp:Parameter Name="answer" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
