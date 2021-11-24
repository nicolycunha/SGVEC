<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/dashboard.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>SGVEC | Dashboard</title>
</head>



<body>
    <div class="flex-dashboard">
        <aside>
            <div class="sidebar-title">
                <img src="../Images/logo.png" alt="SGVEC" />
            </div>
            <div class="menu">
                <ul>
                    <li class="selected">
                        <a href="/View/Dashboard">
                            <img src="/Images/Dashboard/casa.png" alt="Ícone de Dashboard pela icons8" />
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Storage">
                            <img src="../Images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Supplier">
                            <img src="../Images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Employee">
                            <img src="../Images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Product">
                            <img src="../Images/Dashboard/codbarras.png" alt="Ícone de Produto pela icons8" />
                            Produtos
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/TypeProduct">
                            <img src="../Images/Dashboard/tipoproduto.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </li>
                    <li>
                        <a>
                            <img src="/images/Dashboard/shopify.png" alt="Ícone de Vendas pela icons8" />
                            Vendas                           
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="/View/Screen/Sales_Insert">Inclusão de Vendas
                                </a>
                            </li>
                            <li>
                                <a href="/View/Screen/Sales">Consulta de Vendas
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <footer class="footer">
                    <a href="/View/Manual" class="manual" download="Manual.pdf">
                        <img src="../Images/Dashboard/info.png" alt="Ícone de Manual de informações pela icons8" />
                        <span>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</span>
                    </a>
                </footer>
            </div>
        </aside>

        <main>
            <header>
                <span>Dashboard</span>
                <a href="/Login" class="logout">
                    <img src="../Images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    sair
                </a>
            </header>

            <div class="conteudo">
                <h4>Seja bem vindo(a)
                   <asp:Label runat="server" ID="lblNomeFunc">Nome do Usuário</asp:Label>
                </h4>
                <br />

                <div class="p-3 col-md-12">
                    <div class="row">
                        <div class="col-md-8">
                            <canvas id="myChart_Product"></canvas>
                        </div>
                        <div class="row col-md-4">
                            <div class="row">
                                <div class="col-md-5">
                                    <img src="../Images/Dashboard/graph.png" width="80px" />
                                </div>
                                <div class="col-md-7">
                                    <asp:Label runat="server" Font-Bold="true" Text="Total de Vendas"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" Font-Bold="true" Text="$"></asp:Label>
                                    <asp:Label runat="server" ID="lblVlTotalSales"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <img src="../Images/Dashboard/graph.png" width="80px" />
                                </div>
                                <div class="col-md-7">
                                    <asp:Label runat="server" Font-Bold="true" Text="Total de Produtos"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" Font-Bold="true" Text="$"></asp:Label>
                                    <asp:Label runat="server" ID="lblVlTotalProd"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        var _data = <%=GetDataProduct()%>;
                        var _labels = <%=GetNameProduct()%>;

                        const labels_Product = _labels;

                        const data_Product = {
                            labels: labels_Product,
                            datasets: [{
                                label: 'Produtos',
                                backgroundColor: 'rgb(78, 32, 169, 0.75)',
                                borderColor: 'rgb(78, 32, 169, 0.75)',
                                data: _data,
                            }]
                        };

                        const config_Product = {
                            type: 'bar',
                            data: data_Product,
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'Total de produtos',
                                        padding: {
                                            top: 10,
                                            bottom: 30
                                        }
                                    },
                                }
                            }
                        };

                        var myChart_Product = new Chart(
                            document.getElementById('myChart_Product'),
                            config_Product
                        );
                    </script>
                </div>
                <br />
                <br />
                <div class="p-3 col-md-10">
                    <canvas id="myChart_Sales"></canvas>

                    <script>
                        var _data = <%=GetDataSales()%>;

                        const labels_Sales = [
                            'Janeiro',
                            'Fevereiro',
                            'Março',
                            'Abril',
                            'Maio',
                            'Junho',
                            'Julho',
                            'Agosto',
                            'Setembro',
                            'Outubro',
                            'Novembro',
                            'Dezembro'
                        ];

                        const data_Sales = {
                            labels: labels_Sales,
                            datasets: [{
                                label: 'Vendas',
                                backgroundColor: 'rgb(78, 32, 169, 0.75)',
                                borderColor: 'rgb(78, 32, 169, 0.75)',
                                data: _data
                            }]
                        };

                        const config_Sales = {
                            type: 'line',
                            data: data_Sales,
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'Total de vendas por mês',
                                        padding: {
                                            top: 5,
                                            bottom: 30
                                        }
                                    }
                                }
                            }
                        };

                        var myChart_Sales = new Chart(
                            document.getElementById('myChart_Sales'),
                            config_Sales
                        );
                    </script>
                </div>
            </div>
        </main>
    </div>

</body>
</html>
