<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="AboutCompany.aspx.cs" Inherits="rost.AboutCompany" %>

<%@ Register Src="~/UC/OneTextBlocks.ascx" TagPrefix="uc1" TagName="OneTextBlocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="DivFilter" runat="server">
        <div class="container-fluid  pt-3 pb-5" id="blok2.1" style="background-color: #d9fbfd">
            <div class="row">
                
                <uc1:OneTextBlocks runat="server" ID="OneTextBlocks" PagingNews="4" CountNews="0" TypeNews="-1" ShowBorder="true" PosPhoto="left" HeaderNews="" />
            </div>
        </div>
    </div>

</asp:Content>
