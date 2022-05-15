<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListBlock.ascx.cs" Inherits="rost.UC.ListBlock" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
    <ItemTemplate>

        <div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3 mb-4">
            <div class="card text-white bg-info" id="services_block">
                <div class="card-body">
                    <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" ForeColor="White">

                        <div class="icon"><i class="glyphicon glyphicon-thumbs-up" style="float:left;"></i></div>
                        <div><asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("header_text") %>' Visible="true" CssClass="text"></asp:Label></div>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>

       <%-- <div class="card mb-3" id="services_block">
            <div class="row no-gutters">
                <div class="col-md-2">
                    <div class="icon"><i class="glyphicon glyphicon-thumbs-up"></i></div>
                </div>
                <div class="col-md-10">
                    <div class="card-body">
                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#" ForeColor="White">
                        <p class="card-text"><asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("header_text") %>' Visible="true" CssClass="text"></asp:Label></p>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>--%>

    </ItemTemplate>
</asp:Repeater>

<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="SliderSelect" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="0" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
    </SelectParameters>
</asp:SqlDataSource>

