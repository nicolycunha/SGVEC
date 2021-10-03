<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/dashboard.css" rel="stylesheet" />
    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Scripts/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>SGVEC | Dashboard</title>
</head>

<body>
    <div class="container-principal">
        <div class="navbar">
            <div class="flex-d flex-column-reverse">
                <a href="http://localhost:52149/Login#" class="menu-icon">
                    <img src="../images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    Sair
                </a>
            </div>

        </div>

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
                            <img src="../images/Dashboard/tipoproduto.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Supplier#" class="menu-icon">
                            <img src="../images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="menu-item">
                        <a href="http://localhost:52149/View/Screen/Report#" class="menu-icon">
                            <img src="../images/Dashboard/relatorio.png" alt="Ícone de Relatórios pela icons8" />
                            Relatórios
                        </a>
                    </div>
                </div>

            </div>
        </div>

        <div class="conteudo">
            <form id="form1" runat="server">
                <div class="card shadow bg-white p-4 col-md-11">
                    <div class="row">
                        <div class="col-md-10">
                            <h3>Seja bem vindo(a)
                                <asp:Label runat="server" ID="lblNomeFunc">Nome do Usuário</asp:Label></h3>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <canvas id="myChart"></canvas>
                    </div>

                    <script>
                        const labels = [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                        ];

                        const data = {
                            labels: labels,
                            datasets: [{
                                label: 'My First dataset',
                                backgroundColor: 'rgb(255, 99, 132)',
                                borderColor: 'rgb(255, 99, 132)',
                                data: [0, 10, 5, 2, 20, 30, 45],
                            }]
                        };

                        const config = {
                            type: 'line',
                            data: data,
                            options: {}
                        };

                        var myChart = new Chart(
                            document.getElementById('myChart'),
                            config
                        );
                    </script>


                </div>
            </form>
        </div>
        <footer class="row footer">
            <p>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</p>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
