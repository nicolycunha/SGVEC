<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap-grid.min.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <title>SGVEC | Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card shadow bg-white p-4">
            <br />
            <div class="row">
                <div class="col-md-10">
                    <h3><%: Title %>Seja bem vindo(a)
                    <asp:Label runat="server" ID="lblNomeFunc">Nome do Usuário</asp:Label></h3>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnExit" runat="server" Text="Sair" CssClass="btn-primary" OnClick="btnExit_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonEmployee" Enabled="true" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonEmployee_Click" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonTypeProduct" Enabled="true" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonEmployee_Click" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonProduct" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonProduct_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:ImageButton ID="ImageButtonSupplier" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSupplier_Click" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonStorege" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonStorege_Click" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonSales" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSales_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:ImageButton ID="imgButtonReport" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonReport_Click" />
                </div>
            </div>
        </div>
    </form>
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</p>
    </footer>
</body>
</html>
