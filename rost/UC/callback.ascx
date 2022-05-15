<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="callback.ascx.cs" Inherits="shop_health.UC.callback" %>
<%--<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>

<%@ Register assembly="Recaptcha" namespace="Recaptcha" tagprefix="recaptcha" %>--%>

<div id="Div1" class="col-md-12" style="border-bottom: dotted 1px #ffffff;
    padding: 0px 5px 10px 5px; font-family:Verdana; font-size:14px; color:white">
    <ul style=" padding:0px; margin:0px; list-style:none;  font-size:12px; font-weight:normal; color:White">
        <li style="font-size:16px; font-weight:bold; color:Black">Обратная связь</li>
        <li style=" text-align:left; color:Black">
            Имя
            <asp:TextBox ID="TextBoxName" runat="server" CssClass="col-md-12" TextMode=SingleLine></asp:TextBox>
        </li>
        <li style=" text-align:left; color:Black">
            Если Вы хотите чтобы Вам ответили, укажите email
            <asp:TextBox ID="TextBoxEmail" runat="server"  CssClass="col-md-12" TextMode=SingleLine></asp:TextBox>
        </li>
        <li style=" text-align:left; color:Black">
            Текст
            <asp:TextBox ID="TextBoxPost_data" runat="server" CssClass="col-md-12" Height="200px" TextMode="MultiLine"></asp:TextBox>
        </li>
        
        <li>
            <%--<div class="g-recaptcha" data-sitekey="6Le8mCUUAAAAAEJHsfchmpTETJ16HcNHt0AH75Bo"></div>--%>


            <div style="width:208px; overflow:auto">

            <%--<recaptcha:RecaptchaControl
                 ID="RecaptchaControl1"
                 runat="server"
                 PublicKey="6Le8mCUUAAAAAEJHsfchmpTETJ16HcNHt0AH75Bo"      
                 PrivateKey="6Le8mCUUAAAAAI1XyCzOt3mQolBaUdoRmeT4ZQQa" Width="108px"  />--%>

            </div>


        </li>
        <li>
            <asp:Label ID="LabelError" runat="server" ></asp:Label>
        </li>
        
        <li style=" text-align:right; color:black;">
            
            <asp:Button ID="ButtonSend" Text="Отправить" runat="server"  CssClass="btn btn-default"
                onclick="ButtonSend_Click" />
        </li>
    </ul>
    
</div>
<asp:SqlDataSource ID="SqlDataSourceCallback" runat="server" 
    ConnectionString="<%$ ConnectionStrings:shop_healthConnectionString %>" 
    DeleteCommand="DELETE FROM Callback WHERE (id_callback = @id_callback)" 
    InsertCommand="INSERT INTO Callback(fio, email, post_data, date_post, status, operator, comments) VALUES (@fio, @email, @post_data, @date_post, @status, @operator, @comments)" 
    oninserting="SqlDataSourceCallback_Inserting" 
    SelectCommand="SELECT id_callback, fio, email, post_data, date_post, operator, comments, status FROM Callback" 
    
    UpdateCommand="UPDATE Callback SET post_data = @post_data, email = @email, fio = @fio, date_post = @date_post, status = @status, operator = @operator, comments = @comments WHERE (id_callback = @id_callback)">
    <DeleteParameters>
        <asp:Parameter Name="id_callback" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="fio" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="post_data" />
        <asp:Parameter Name="date_post" />
        <asp:Parameter Name="status" />
        <asp:Parameter Name="operator" />
        <asp:Parameter Name="comments" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="post_data" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="fio" />
        <asp:Parameter Name="date_post" />
        <asp:Parameter Name="status" />
        <asp:Parameter Name="operator" />
        <asp:Parameter Name="comments" />
        <asp:Parameter Name="id_callback" />
    </UpdateParameters>
</asp:SqlDataSource>