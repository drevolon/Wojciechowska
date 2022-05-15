<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FAQ.ascx.cs" Inherits="rost.UC.FAQ" %>
<div class="container-fluid" id="FAQ">
    <div class="row mx-auto align-middle align-content-center align-items-center text text-center">
        <div class="col-12" style="margin-bottom:40px;">
            <h1>Ответы на вопросы</h1>
        </div>
        
    </div>
    <div class="row mx-auto align-middle align-content-center align-items-center">
        <div class="col-12">
            <asp:DataList ID="Datalist1" runat="server" DataKeyField="id" RepeatColumns="1" RepeatDirection="Horizontal" DataSourceID="SqlDataSourceFAQ">
                <ItemTemplate>
                    <div class="panel">
                        <div class="panel-heading" role="tab" id='<%# "heading"+Eval("num").ToString() %>' >
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#offen_question" href='<%# "#collapseQuestion"+Eval("num").ToString() %>' style="color: #4c4c4c;" aria-expanded="false" aria-controls="collapseQuestion">
                                    <img src="Images/icon_plus.png" class='<%# "img_icon_plus"+Eval("num").ToString() %> pr-4' />
                                    <img src="Images/icon_minus.png" class='<%# "img_icon_minus"+Eval("num").ToString() %> pr-4' style="display: none;" />
                                    <%# Eval("question").ToString() %>
                                </a>
                            </h4>
                        </div>
                        <div id='<%# "collapseQuestion"+Eval("num").ToString() %>' class="panel-collapse collapse" style="margin-right:20px;">
                            <div class="panel-body">
                                <%# Eval("answer").ToString() %>
                            </div>
                        </div>
                    </div>
                    
                </ItemTemplate>
            </asp:DataList>


            <asp:DataList ID="Datalist2" runat="server" DataKeyField="id" RepeatColumns="1" RepeatDirection="Horizontal" DataSourceID="SqlDataSourceFAQ">
                <ItemTemplate>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('<%# "#collapseQuestion"+Eval("num").ToString() %>').on('show.bs.collapse', function () {

                    $('<%# ".img_icon_plus"+Eval("num").ToString() %>').hide();
                    $('<%# ".img_icon_minus"+Eval("num").ToString() %>').show();
                });
                $('<%# "#collapseQuestion"+Eval("num").ToString() %>').on('hide.bs.collapse', function () {

                            $('<%# ".img_icon_plus"+Eval("num").ToString() %>').show();
                  $('<%# ".img_icon_minus"+Eval("num").ToString() %>').hide();
                        });
                        });

                    </script>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</div>
<asp:SqlDataSource ID="SqlDataSourceFAQ" runat="server" ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" SelectCommand="select row_number() over(order by id) num, id, question, answer from faq"></asp:SqlDataSource>
