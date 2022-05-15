<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="PagesSmallForText.aspx.cs" Inherits="rost.PagesSmallForText" %>


<%@ Register Src="~/UC/UniversalTextBlocksNew.ascx" TagPrefix="uc1" TagName="UniversalTextBlocksNew" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
    <div class="container-fluid" id="blokNew3" style="background-color: #fff">

        

        <uc1:UniversalTextBlocksNew runat="server" id="UniversalTextBlocksNew" CountNews="0" TypeNews="-1" ShowBorder="true" PosPhoto="left"  />


    </div>
    </div>


</asp:Content>
