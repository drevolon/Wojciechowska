<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseShopFilter.ascx.cs" Inherits="shop_health.UC.BaseShopFilter" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>


<asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSourceBaseFilter" >
    <Columns>

        <asp:TemplateField SortExpression="id" ShowHeader="false">
            <ItemTemplate>
            <div class="media-body">
                <asp:CheckBox id="CHBX" runat="server"  AutoPostBack="True" Text='<%# Bind("Name_filter") %>' OnCheckedChanged="ButtonAccept_Click"></asp:CheckBox>
                <asp:DropDownList id="DDL" runat="server"></asp:DropDownList>
            </div>
            </ItemTemplate>
        </asp:TemplateField>
        

        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="LabelYesNo" runat="server" Text='<%# Bind("TypeFilter") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="LabelList" runat="server" Text='<%# Bind("ListSelect") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        

    </Columns>
</asp:GridView>
<div class="btn btn-group">
<asp:Button ID="ButtonAccept" Text="Установить" runat="server" OnClick="ButtonAccept_Click" CssClass="btn btn-default" Visible="false" />
 <asp:Button ID="ButtonClear" Text="Убрать фильтр" runat="server" OnClick="ButtonClear_Click" CssClass="btn btn-default" />
</div>
 
<asp:SqlDataSource ID="SqlDataSourceBaseFilter" runat="server" ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>"
    SelectCommand="Select id,npp,Name_Filter,TypeFilter,ListSelect from dbo.ShopFilters" SelectCommandType="Text">
</asp:SqlDataSource>
