<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageBlock2.ascx.cs" Inherits="rost.UC.ImageBlock2" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<div class="row mx-auto align-middle align-content-center align-items-center mt-3">
    <div class="btn btn-group">
    <asp:Repeater runat="server" ID="ListNumPages">
        <ItemTemplate>
            <asp:LinkButton ID="NPG" runat="server" CommandName="NumPage" CssClass="btn btn-outline-info" CommandArgument='<%#Eval("NP") %>' Text='<%#Eval("NP") %>' OnCommand="Unnamed_Click"></asp:LinkButton>

        </ItemTemplate>
    </asp:Repeater></div>
</div>

<div class="m-auto pb-5 pt-5">
    <div class="container-fluid">

        <div class="row pb-3" >

            <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
                <ItemTemplate>


                    <%--            <div class="col-2">--%>
                    <%--                <div class="card p-3">--%>
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2" style="overflow:hidden; height:225px;">
                                                        <cc1:HighslideImage ID="ImageItem" runat="server" CssClass="img-responsive img-thumbnail  img-fluid"
                                                            BorderWidth="0px" />
                                                        <cc1:HighslideManager ID="HighslideManager1" runat="server" FadeInOut="true">
                                                        </cc1:HighslideManager>

<%--                        <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="#">
                            <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" />
                        </asp:HyperLink>--%>

                    </div>
                    <%--            </div>--%>

                    <%--            <asp:Literal ID="NewRow" runat="server"></asp:Literal>--%>

                    <asp:Label ID="LabelItemBase_text" runat="server" Text='<%# Bind("base_text") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemId_images" runat="server" Text='<%# Bind("id_images") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelId_text" runat="server" Text='<%# Bind("id_text") %>' Visible="false"></asp:Label>
<%--                    <asp:Label ID="RowNum" runat="server" Visible="false" Text='<%# Bind("rownum") %>'></asp:Label>--%>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>













<%--<div class="col-12">
    <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl="~/shop.aspx" Style="overflow: hidden; height: 250px;">
        <h1 class="text-center">
            <asp:Label ID="LHeader" runat="server"></asp:Label></h1>
    </asp:HyperLink>
</div>
<div class="row col-12">
    <div class="col"></div>
    <div class="col-10">
        <div class="row">

            <asp:Repeater ID="Replist1" runat="server" OnItemDataBound="Replist1_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-12 col-md-3 col-lg-3 col-xl-3 mt-3">
                        <div class="card pb-3">
                            <div class="card-header text-left" style="color: #662583; font-weight: bold;">
                                <div class="float-left">
                                    <asp:Label ID="Label1" runat="server" Text='<%# (((Eval("WaitIn").ToString()=="True")&&(Eval("Balance").ToString()=="0"))?"Ожидает поступления":"В наличии") %>'></asp:Label>
                                </div>
                                <div class="float-right">
                                    <asp:Literal ID="ImgFilters" runat="server"></asp:Literal>
                                </div>

                            </div>

                            <div class="align-items-center align-content-center">
                                <asp:HyperLink ID="HyperLinkImg" runat="server" NavigateUrl='<%# "~/shop_desc.aspx?id="+Eval("id") %>' Style="overflow: hidden; height: 250px;">
                                    <asp:Image ID="ImageItem" ImageUrl="~/photoDB.ashx?" runat="server" CssClass="card-img-top" Style="width: 250px; height: 250px;" />
                                </asp:HyperLink>

                                <div class="card-body text-center" style="overflow: auto;">
                                    <p class="card-text">
                                        <asp:Label ID="LabelHeader_text" runat="server" Text='<%# Eval("prod_name") %>'></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="LabelDescription_text" runat="server" Text='<%# Eval("Produce") %>'></asp:Label>
                                    </p>
                                    <div class="card-text">
                                        <div class="row" style="overflow: auto">
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <asp:Label ID="LID1" runat="server" Text="Вес/Объем:" Style="font-size: smaller"></asp:Label></br>
                                                <asp:Label ID="TextBox3" runat="server" Text='<%# String.Format("{0:0.##}",Eval("WEIGHT"))+" "+Eval("WEIGHT_EI") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <asp:Label ID="Label2" runat="server" Text="Остаток: " Style="font-size: smaller"></asp:Label></br>
                                                <asp:Label ID="TextBoxBalance" runat="server" Text='<%# Eval("Balance").ToString()+" шт." %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <asp:Label ID="Label3" runat="server" Text="Цена:" Style="font-size: smaller"></asp:Label></br>
                                                <asp:Label ID="TextBox2" runat="server" Text='<%# String.Format("{0:0.##}",Eval("price"))+" руб." %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card-footer text-right text-success">
                                <div class="float-right">
                                    <asp:Literal ID="Abtn" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>

                    </div>
                    <asp:Literal ID="NewRow" runat="server"></asp:Literal>

                    <asp:Label ID="LabelItemItems" runat="server" Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelItemHave_img" runat="server" Text='<%# Bind("have_img") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelFilters" runat="server" Text='<%# Bind("AllowFilters") %>' Visible="false"></asp:Label>
                    <asp:Label ID="ID_item" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                    <asp:Label ID="LabelImageItems" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                    <asp:Label ID="RowNum" runat="server" Visible="false" Text='<%# Bind("rownum") %>'></asp:Label>
                    <asp:Label ID="LabelPrice" runat="server" Visible="false" Text='<%# Bind("price") %>'></asp:Label>
                    <asp:Label ID="LabelMaxCount" runat="server" Visible="false" Text='<%# Bind("balance") %>'></asp:Label>
                </ItemTemplate>

            </asp:Repeater>

        </div>
    </div>
    <div class="col"></div>
</div>



<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"></asp:SqlDataSource>
--%>

<asp:SqlDataSource ID="SqlDataSourceBaseText" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>"
    SelectCommand="BaseTextSelectPage" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="count_row" DefaultValue="1" />
        <asp:Parameter DefaultValue="2" Name="id_pages" />
        <asp:Parameter DefaultValue="2" Name="n" />
        <asp:Parameter DefaultValue="2" Name="m" />
    </SelectParameters>
</asp:SqlDataSource>

