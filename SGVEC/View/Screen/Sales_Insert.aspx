<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales_Insert.aspx.cs" Inherits="SGVEC.View.Screen.Sales_Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <link href="../../Styles/dashboard.css" rel="stylesheet" />
    <link href="../../Styles/forms.css" rel="stylesheet" />
    <title>SGVEC | Cadastro de Vendas</title>
</head>
<body>
    <div class="flex-dashboard">
        <aside>
            <div class="sidebar-title">
                <img src="/images/logo.png" alt="SGVEC" />
            </div>
            <div class="menu">
                <ul>
                    <li>
                        <a href="/View/Dashboard">
                            <img src="/Images/Dashboard/casa.png" alt="Ícone de Dashboard pela icons8" />
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Storage">
                            <img src="/images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Supplier">
                            <img src="/images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Sales">
                            <img src="/images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Product">
                            <img src="/images/Dashboard/codbarras.png" alt="Ícone de Produto pela icons8" />
                            Produtos
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/TypeProduct">
                            <img src="/images/Dashboard/tipoproduto.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </li>
                    <li class="selected">
                        <a href="/View/Screen/Sales">
                            <img src="/images/Dashboard/shopify.png" alt="Ícone de Vendas pela icons8" />
                            Vendas
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Report">
                            <img src="/images/Dashboard/relatorio.png" alt="Ícone de Relatórios pela icons8" />
                            Relatórios
                        </a>
                    </li>
                </ul>
                <footer class="footer">
                    <a href="/View/Manual" class="manual">
                        <img src="/images/Dashboard/info.png" alt="Ícone de Manual de informações pela icons8" />
                        <span>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</span>
                    </a>
                </footer>
            </div>
        </aside>

        <main>
            <header>
                <span>Vendas</span>
                <a href="/Login" class="logout">
                    <img src="/images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    sair
                </a>
            </header>

            <div class="conteudo">
                <form id="form1" runat="server">
                    <div class="container shadow bg-white p-3">
                        <div class="row clearfix">
                            <div class="col-md-8">
                                <div class="input-group">
                                    <asp:TextBox ID="txtNomeCliSales" type="text" runat="server" placeholder="Nome Cliente" MaxLength="14"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox ID="txtCpfCliSales" type="text" runat="server" placeholder="CPF Cliente" MaxLength="14"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row clearfix">
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlFuncSales" Enabled="false" runat="server" DataTextField="NOME_FUNC" CssClass="form-select"></asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox ID="txtDtSales" type="date" Enabled="false" runat="server" placeholder="Data da Venda" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="col-md-12">
                            <div class="row clearfix form-space">
                                <asp:GridView CssClass="col-md-12" ID="gvProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double" BorderWidth="2px" CellPadding="5" GridLines="Horizontal">
                                    <HeaderStyle BackColor="#b8a6dd" ForeColor="#000" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField DataField="COD_PROD_VENDA" HeaderText="Código" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                        <asp:BoundField DataField="QUANTIDADE_PROD" HeaderText="Quantidade Produto" />
                                        <asp:BoundField DataField="VALOR_UNITARIO_PROD" HeaderText="Valor Unitário" />
                                        <asp:BoundField DataField="FK_COD_PRODUTO" HeaderText="Código Produto" />
                                        <asp:TemplateField HeaderText="-">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkSelect" Text="Selecionar" runat="server" CommandArgument='<%# Eval("COD_PROD_VENDA") %>' OnClick="gvProducts_SelectedIndexChanged"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlTipoPagSales" runat="server" DataTextField="NOME_TIPO_PAG" CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtNumParcSales" Enabled="false" type="text" runat="server" placeholder="Número Parcelas" MaxLength="2"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtValParcSales" Enabled="false" type="text" runat="server" placeholder="Valor Parcelas" MaxLength="14"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtDescontoSales" type="text" runat="server" placeholder="Desconto" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtTotalSales" Enabled="false" type="text" runat="server" placeholder="Total da Venda" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="botoes-forms">
                            <button id="btnInsertProd" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#product_Modal">Inserir Produto</button>

                            <asp:Button ID="btnRemoveProd" runat="server" Text="Remover Produto" CssClass="btn btn-outline-danger" BorderStyle="Solid" OnClick="btnRemove_Click" />

                            <asp:Button ID="btnInsertSales" runat="server" Text="Finalizar Venda" CssClass="btn btn-outline-primary" BorderStyle="Solid" OnClick="btnSendInsertSales_Click" />
                        </div>
                        <br />

                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div id="divAlertDanger" style="display: none" class="alert alert-danger alert-dismissible">
                                    <asp:Label runat="server" ID="lblError"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div id="divAlertSucess" style="display: none" class="alert alert-success alert-dismissible">
                                    <asp:Label runat="server" ID="lblSucess"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="product_Modal" tabindex="-1" aria-labelledby="lblProductModal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Produtos da Venda</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <div class="row clearfix form-space">
                                        <div class="col-md-5">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtCodProduct" type="text" runat="server" placeholder="Código Barras" MaxLength="10"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtNomeProduct" type="text" runat="server" placeholder="Nome Produto" MaxLength="50"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtQuantProduct" type="text" runat="server" placeholder="Quantidade" MaxLength="4"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <div class="col-footer">
                                        <button id="btnClearComponentsModal" type="button" class="btn btn-primary float-left">Limpar</button>
                                    </div>
                                    <div class="col-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server">Fechar</button>

                                        <asp:Button ID="btnAdd" runat="server" Text="Adicionar" CssClass="btn btn-success" BorderStyle="Solid" OnClick="btnAdd_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/Screen/Sales_Insert.js"></script>
</body>
</html>
