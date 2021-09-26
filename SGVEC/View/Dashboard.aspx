<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<<<<<<< HEAD
    <link href="/Styles/dashboard.css" rel="stylesheet" />
    <link href="/Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />


    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
=======
    <link href="../Scripts/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
>>>>>>> d5b6e3ec3a8a764e685e39a531a71d511d20adde

    <link href="../Styles/dashboard.css" rel="stylesheet" />
    <title>SGVEC | Dashboard</title>
</head>

<body>
<<<<<<< HEAD

    <div class="container-principal">
        <div class="navbar"></div>

        <div class="sidebar">
            <img src="../images/Dashboard/SGVEC_Logo.png" alt="SGVEC Logo" class="logo" />
            <div class="menu">
                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Employee#" class="menu-icon">
                            <img src="../images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Sales#" class="menu-icon">
                            <img src="../images/Dashboard/shopify.png" alt="Ícone de Vendas pela icons8" />
                            Vendas
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Storege#" class="menu-icon">
                            <img src="../images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Product#" class="menu-icon">
                            <img src="../images/Dashboard/codbarras.png" alt="Ícone de Produto pela icons8" />
                            Produtos
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/TypeProduct#" class="menu-icon">
                            <img src="../images/Dashboard/openbox.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Supplier#" class="menu-icon">
                            <img src="../images/Dashboard/openbox.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Report#" class="menu-icon">
                            <img src="../images/Dashboard/openbox.png" alt="Ícone de Relatórios pela icons8" />
                            Relatórios
                        </a>
                    </div>
                </div>

            </div>
        </div>

        <div class="conteudo">
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
                            <asp:ImageButton ID="imgButtonEmployee" Enabled="true" runat="server" ImageUrl="~/images/Dashboard/businessman.png" OnClick="imgButtonEmployee_Click" />
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


        </div>
    </div>


=======
    <form id="form1" runat="server">
        <div class="card shadow bg-white p-4">

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">SGVEC</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#corNavbar01" aria-controls="corNavbar01" aria-expanded="false" aria-label="Alterna navegação">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="corNavbar01">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">&nbsp;&nbsp;<asp:ImageButton ID="btnButtonHome" Enabled="true" Width="40px" CssClass="btnButtonHome" runat="server" ImageUrl="~/images/Dashboard/casa_1.png" />
                            <a class="nav-link">Home</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgButtonEmployee" Enabled="true" Width="40px" runat="server" ImageUrl="~/images/Dashboard/employee_1.png" OnClick="imgButtonEmployee_Click" />
                            <a class="nav-link">Funcionário</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgButtonTypeProduct" Enabled="true" Width="40px" runat="server" ImageUrl="~/images/Dashboard/produto_2.png" OnClick="imgButtonEmployee_Click" />
                            <a class="nav-link">Tipo de Produto</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgButtonProduct" Width="40px" runat="server" ImageUrl="~/images/Dashboard/produto_1.png" OnClick="imgButtonProduct_Click" />
                            <a class="nav-link">Produtos</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButtonSupplier" Width="40px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSupplier_Click" />
                            <a class="nav-link">Fornecedor</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;<asp:ImageButton ID="imgButtonStorege" Width="40px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonStorege_Click" />
                            <a class="nav-link">Estoque</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;<asp:ImageButton ID="imgButtonSales" Width="40px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSales_Click" />
                            <a class="nav-link">Vendas</a>
                        </li>
                        <li class="nav-item">&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgButtonReport" Width="40px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonReport_Click" />
                            <a class="nav-link">Relatórios</a>
                        </li>
                        <li class="nav-item">
                            <asp:Button ID="btnExit" runat="server" Text="Sair" CssClass="btn-primary" OnClick="btnExit_Click" />
                        </li>
                    </ul>
                </div>
            </nav>

            <br />
            <div class="row">
                <div class="col-md-10">
                    <h3>Seja bem vindo(a)
                    <asp:Label runat="server" ID="lblNomeFunc">Nome do Usuário</asp:Label></h3>
                </div>
            </div>
        </div>
    </form>
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
>>>>>>> d5b6e3ec3a8a764e685e39a531a71d511d20adde
</body>
</html>
