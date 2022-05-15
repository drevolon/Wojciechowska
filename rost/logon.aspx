<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logon.aspx.cs" Inherits="rost.logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/glyphicon.css" rel="stylesheet" />
    <link href="Content/shop_header_logon.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <%--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">--%>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="../dist/js/bootstrap.min.js"></script>
    <script src="../dist/js/bootstrap.bundle.js"></script>
    <link href="css/jqcart.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.3.min.js"></script>

</head>
<body class="login-page">
    <form id="form1" runat="server">
        <main>
<div class="login-block">
<img src="Images/logon_user.png" alt="Scanfcode" />
<h1>Введите свои данные</h1>

<div class="form-group">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-user ti-user"></i></span>
<%--<input type="text" class="" >--%>
    <asp:TextBox ID="UsernameTextbox" runat="server" placeholder="Ваш логин" CssClass="form-control"></asp:TextBox>
</div>
</div>
 
<hr class="hr-xs">
 
<div class="form-group">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-lock ti-unlock"></i></span>
<%--<input type="password" class="form-control" placeholder="Ваш суперпароль">--%>
    <asp:TextBox ID="PasswordTextbox" runat="server" placeholder="Ваш пароль" CssClass="form-control"></asp:TextBox>
</div>
</div>
 
<%--<button class="" type="submit"></button>--%>
    <asp:Button ID="ButtonLogon" runat="server" Text="ВОЙТИ НА САЙТ" CssClass="btn btn-primary btn-block" OnClick="ButtonLogon_Click" />
    <div class="login-footer">
        <asp:Label ID="LabelInfo" runat="server" CssClass="text-danger"></asp:Label>
    </div>
<%--<div class="login-footer">
<h6>или войдите с помощью</h6>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
</ul>
</div>--%>
 

</div>
 
<%--<div class="login-links">
<p class="text-center">Еще нету аккаунта? <a class="txt-brand" href="user-login.html"><font color=#29aafe>Регистрируйся</font></a></p>
</div>--%>
 
</main>
    </form>
</body>
</html>
