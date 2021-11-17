<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="SGVEC.View.Screen.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <link href="../../Styles/dashboard.css" rel="stylesheet" />
    <link href="../../Styles/forms.css" rel="stylesheet" />
    <title>SGVEC | Produtos</title>
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
                        <a href="/View/Screen/Product">
                            <img src="/images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Employee">
                            <img src="/images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </li>
                    <li class="selected">
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
                    <li>
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
                <span>Produto</span>
                <a href="/Login" class="logout">
                    <img src="/images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    sair
                </a>
            </header>

            <div class="conteudo">
                <form id="form1" runat="server">
                    <div class="container shadow bg-white p-3">
                        <div class="row clearfix form-space">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtCode" type="text" placeholder="Código de Barras" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <asp:TextBox ID="txtName" type="text" runat="server" placeholder="Nome" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn btn-outline-primary btn-sm" BorderStyle="Solid" OnClick="btnSearch_Click" />
                            </div>
                        </div>

                        <div class="row clearfix form-space">
                            <asp:GridView CssClass="col-md-12" ID="gvProduct" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double" BorderWidth="2px" CellPadding="5" GridLines="Horizontal">
                                <HeaderStyle BackColor="#4A3C8C" ForeColor="#ffffff" />
                                <AlternatingRowStyle BackColor="#000000" />
                                <Columns>
                                    <asp:BoundField DataField="COD_BARRAS" HeaderText="Código" />
                                    <asp:BoundField DataField="NOME_PROD" HeaderText="Nome do Produto" />
                                    <asp:BoundField DataField="MARCA_PROD" HeaderText="Marca" />
                                    <asp:BoundField DataField="PRECO_PROD" HeaderText="Preço" />
                                    <asp:BoundField DataField="DATA_CAD_PROD" HeaderText="Data de Cadastro" />
                                    <asp:TemplateField HeaderText="-">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkSelect" Text="Selecionar" runat="server" CommandArgument='<%# Eval("COD_BARRAS") %>' OnClick="gvProduct_SelectedIndexChanged"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="botoes-forms">
                            <button id="btnSearchProduct" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#productModal">Consultar</button>

                            <button id="btnInsertProduct" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#productModal">Incluir</button>

                            <button id="btnUpdateProduct" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#productModal">Alterar</button>
                        </div>
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
                    <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="lblProductModal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Produto</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            Cód. Barras
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCodBarrasProduct" disabled="true" CssClass="form-control" type="text" MaxLength="10" placeholder="Código de Barras"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            Nome 
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNomeProduct" CssClass="form-control is-invalid" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Marca
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtMarcaProduct" CssClass="form-control is-invalid" type="text" MaxLength="208" placeholder="Marca"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            Preço
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtPrecoProduct" CssClass="form-control is-invalid" type="text" MaxLength="10" placeholder="Preço"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Custo
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCustoProduct" CssClass="form-control" Enabled="false" type="text" MaxLength="6" placeholder="Custo"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Data Cadastro
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtDtCadProduct" CssClass="form-control" Enabled="false" type="date" MaxLength="6" placeholder="Data de Cadastro"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Qtde
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtQuantidadeProduct" CssClass="form-control" Enabled="false" type="text" MaxLength="5" placeholder="Quantidade"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-6">
                                            Descrição
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtDescProduct" CssClass="form-control" Enabled="false" type="text" MaxLength="50" TextMode="MultiLine" Height="100" placeholder="Descrição"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            Tipo de Produto
                                            <asp:DropDownList ID="ddlTipoProduct" runat="server" DataTextField="NOME_TIPO_PROD" CssClass="form-select"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            Fornecedor
                                            <asp:DropDownList ID="ddlFornecProduct" runat="server" DataTextField="RAZAO_SOCIAL" CssClass="form-select"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <div class="col-footer">
                                        <button id="btnClearComponents" type="button" class="btn btn-primary">Limpar</button>
                                    </div>
                                    <div class="col-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server">Fechar</button>
                                        <asp:Button ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success" BorderStyle="Solid" OnClick="btnSendSave_Click" />
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
    <script src="../../Scripts/Screen/Product.js"></script>
</body>
</html>
