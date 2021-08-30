<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SGVEC.View.Dashboard" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %>Seja bem vindo(a) <label id="lblNomeFunc">Nome do Usuário</label></h3>    
    <br />
    <label style="color:red">Funcionário</label>
    <br />
    <asp:ImageButton ID="ImageButton1" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="ImageButton1_Click" />
</asp:Content>
