﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/dashboard.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>SGVEC | Dashboard</title>
</head>



<body>
    <div class="flex-dashboard">
        <aside>
            <div class="sidebar-title">
                <img src="../images/logo.png" alt="SGVEC" />
            </div>
            <div class="menu">
                <ul>
                    <li>
                        <a href="/View/Screen/Storage">
                            <img src="../images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Supplier">
                            <img src="../images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Employee">
                            <img src="../images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Product">
                            <img src="../images/Dashboard/codbarras.png" alt="Ícone de Produto pela icons8" />
                            Produtos
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/TypeProduct">
                            <img src="../images/Dashboard/tipoproduto.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Sales">
                            <img src="../images/Dashboard/shopify.png" alt="Ícone de Vendas pela icons8" />
                            Vendas
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Report">
                            <img src="../images/Dashboard/relatorio.png" alt="Ícone de Relatórios pela icons8" />
                            Relatórios
                        </a>
                    </li>
                </ul>
                 <footer class="footer">
                    <a href="/View/Manual" class="manual">
                        <img src="../images/Dashboard/info.png" alt="Ícone de Manual de informações pela icons8" />
                        <span>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</span> 
                    </a>
                </footer>
            </div>
        </aside>

        <main>
            <header>
                <a href="#">Dashboard</a>
                <a href="/Login" class="logout">
                    <img src="../images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    sair
                </a>
            </header>

            <div class="conteudo">
                <h4>Seja bem vindo(a)
                   <asp:Label runat="server" ID="lblNomeFunc">Nome do Usuário</asp:Label>
                </h4>

                <div class="card p-4 col-md-4">
                    <canvas id="myChart"></canvas>

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
                                backgroundColor: 'rgb(78, 32, 169)',
                                borderColor: 'rgb(78, 32, 169)',
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
            </div>
        </main>
    </div>

</body>
</html>
