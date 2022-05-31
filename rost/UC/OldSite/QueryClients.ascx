<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryClients.ascx.cs" Inherits="Войцеховская.UC.QueryClients" %>

<section class="take_services2 d-flex">
<div class="container-fluid" id="block3" style="background-color: #585858; padding: 40px 0px 40px 0px; color: white;">
    <div class="row mx-auto align-middle align-content-center align-items-center">
        <div class="col-12">
            <h1 class="take_services2_header text-center">Заявка получение услуги</h1>
        </div>

        
    </div>
    <div class="row mx-auto align-middle align-content-center align-items-start" style="margin-top: 20px;">
        <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 d-flex justify-content-center">
            <asp:TextBox runat="server" CssClass="form-control-lg form-control mt-sm-2 " ID="ClientName" placeholder="Введите ваше имя"  />
            
        </div>
        <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 text-center mt-sm-2 d-flex justify-content-center">
            <asp:TextBox runat="server" CssClass="form-control-lg form-control" ID="ClientPhone" placeholder="Введите номер телефона"  />
        </div>
        <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 text-center mt-sm-2 d-flex justify-content-center">
            <asp:TextBox runat="server" CssClass="form-control-lg form-control" ID="ClientComments" placeholder="Комментарий (при необходимости)"  />
        </div>
        <div class="col-sm-12 col-md-3  col-lg-3 col-xl-3 text-center mt-sm-2 d-flex justify-content-center">
            <asp:Button runat="server" CssClass="btn btn-outline-light btn-lg" ID="submitBtn" Text="Получить услугу" OnClick="submitBtn_Click"  />
        </div>
        <div class="card-footer text-center" style="font-size:20px;">
            <asp:Label ID="InfoReq" runat="server"></asp:Label>
        </div>
    </div>
    
    <div class="row">
        <div class=" d-flex justify-content-center">
            <asp:CheckBox runat="server" ID="pesonalInfo" AutoPostBack="false" Checked="true" />
            <asp:Label runat="server" CssClass="form-check-label" for="pesonalInfo" Style="font-size: 15px;">
                    Согласен на обработку <a href="../personal.html" target="_blank"><span class="link">персональных данных</span></a></asp:Label>
        </div>
    </div>
    
</div>
    </section>