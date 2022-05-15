<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="PagesFind.aspx.cs" Inherits="rost.PagesFind" %>

<%@ Register Src="~/UC/UniversalTextFind.ascx" TagPrefix="uc1" TagName="UniversalText" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
    <div class="container-fluid" id="blokNew3" style="background-color: #fff">

        <uc1:UniversalText runat="server" ID="UniversalText2" CountNews="0" TypeNews="1" ShowBorder="true" PosPhoto="left"/>
    </div>
    </div>


</asp:Content>
