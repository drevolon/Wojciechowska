<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="callback2.ascx.cs" Inherits="rost.UC.callback2" %>
<%--<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>

<%@ Register assembly="Recaptcha" namespace="Recaptcha" tagprefix="recaptcha" %>
<link href="../dist/css/bootstrap.min.css" rel="stylesheet" />--%>
<div class="col-12">
<div class="card m-auto">

    <div class="card-body">

        <h5 class="card-title">Обратная связь
        </h5>
        <label for="TextBoxName">Имя</label>

        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control " TextMode="SingleLine"></asp:TextBox>
        <label for="TextBoxName">Если Вы хотите чтобы Вам ответили, укажите email</label>

        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
        <label for="TextBoxName">Текст</label>

        <asp:TextBox ID="TextBoxPost_data" runat="server" CssClass="form-control" Height="200px" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Label ID="LabelForCapcha" runat="server"></asp:Label>
        <asp:TextBox ID="TextCapcha" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Введите правильный ответ"></asp:TextBox>
        <asp:Button ID="ButtonSend" Text="Отправить" runat="server" CssClass="btn btn-primary "
            OnClick="ButtonSend_Click" /><br />
        <asp:Label ID="LabelError" runat="server"></asp:Label>

        <asp:HiddenField ID="qq" runat="server" />

    </div>

</div></div>


<%--<div id="Div1" class="col-md-12" style="border-bottom: dotted 1px #ffffff;
    padding: 0px 5px 10px 5px; font-family:Verdana; font-size:14px; color:white">
    <ul style=" padding:0px; margin:0px; list-style:none;  font-size:12px; font-weight:normal; color:White">
        <li style="font-size:16px; font-weight:bold; color:Black"></li>
        <li style=" text-align:left; color:Black">
            
        </li>
        <li style=" text-align:left; color:Black">
            
        </li>
        <li style=" text-align:left; color:Black">
            
        </li>
        
        <li>
            <%--<div class="g-recaptcha" data-sitekey="6Le8mCUUAAAAAEJHsfchmpTETJ16HcNHt0AH75Bo"></div>


            <div style="width:208px; overflow:auto">

            <%--<recaptcha:RecaptchaControl
                 ID="RecaptchaControl1"
                 runat="server"
                 PublicKey="6Le8mCUUAAAAAEJHsfchmpTETJ16HcNHt0AH75Bo"      
                 PrivateKey="6Le8mCUUAAAAAI1XyCzOt3mQolBaUdoRmeT4ZQQa" Width="108px"  />

            </div>


        </li>
        <li>
            
        </li>
        
        <li style=" text-align:right; color:black;">
            
            
        </li>
    </ul>
    
</div>--%>
<asp:SqlDataSource ID="SqlDataSourceCallback" runat="server" 
    ConnectionString="<%$ ConnectionStrings:rostConnectionString %>" 
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