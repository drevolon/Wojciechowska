<%@ Page Title="" Language="C#" MasterPageFile="~/Boot4.Master" AutoEventWireup="true" CodeBehind="FormCallBack.aspx.cs" Inherits="rost.FromCallBack" %>

<%@ Register Src="~/UC/callback2.ascx" TagPrefix="uc1" TagName="callback2" %>
<%@ Register Src="~/UC/FAQ.ascx" TagPrefix="uc2" TagName="FAQ" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="DivFilter" runat="server" style="background-color: #d9fbfd">
        <div class="container">
            <div class="container-fluid pt-3 pb-3" id="blok2.1">
                <div class="row">
                    <%--           <uc1:callback runat="server" ID="callback1"  />--%>
                    <uc1:callback2 runat="server" ID="callback2" />
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" id="blok5.1">
        <div class="row">
            <uc2:FAQ runat="server" ID="FAQ1" />
        </div>
    </div>

</asp:Content>
