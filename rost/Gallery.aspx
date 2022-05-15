<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="rost.Gallery" %>


<%@ Register Src="~/UC/ImageBlock2.ascx" TagPrefix="uc1" TagName="ImageBlock2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
    <div class="container-fluid" id="blokNew3" style="background-color: #fff">

        <uc1:ImageBlock2 runat="server" id="ImageBlock2" CountNews="0" TypeNews="8" PagingNews="18" WidthImage="300" HeighImage="200" />

    </div>
    </div>


</asp:Content>
