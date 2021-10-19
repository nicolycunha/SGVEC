<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="SGVEC.View.Screen.Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
   
    <link href="../../Styles/supplier.css" rel="stylesheet" />
    <link href="../../Styles/forms.css" rel="stylesheet" />
    <title>SGVEC | Fornecedor</title>
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
                        <a href="/View/Screen/Storage">
                            <img src="/images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </li>
                    <li class="selected">
                        <a href="/View/Screen/Supplier">
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
                <span>Fornecedor</span>
                <a href="/Login" class="logout">
                    <img src="/images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
                    sair
                </a>
            </header>

            <div class="conteudo">
                <form id="form1" runat="server">
                    <div class="container shadow bg-white p-3">
                        <div class="col-md-12">
                            <div class="row clearfix">
                                <br />
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtCode" type="text" placeholder="Código" MaxLength="5"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtRazao" type="text" runat="server" placeholder="Razão Social" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCNPJ" type="text" runat="server" placeholder="CNPJ" MaxLength="14"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn btn-primary" BorderStyle="Solid" OnClick="btnSearch_Click" />
                                </div>
                            </div>

                            <br />
                            <div class="row clearfix">
                                <asp:GridView CssClass="col-md-12" ID="gvSupplier" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double" BorderWidth="2px" CellPadding="5" GridLines="Horizontal">                                    
                                    <HeaderStyle BackColor="#4A3C8C" ForeColor="#F7F7F7" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField DataField="COD_FORNEC" HeaderText="Código" />
                                        <asp:BoundField DataField="RAZAO_SOCIAL" HeaderText="Razão Social" />
                                        <asp:BoundField DataField="CNPJ_FORNEC" HeaderText="CNPJ" />
                                        <asp:BoundField DataField="TEL_FORNEC" HeaderText="Telefone" />
                                        <asp:TemplateField HeaderText="-">
                                            <ItemTemplate>         
                                                <asp:LinkButton ID="lnkSelect" Text="Selecionar" runat="server" CommandArgument='<%# Eval("COD_FORNEC") %>' OnClick="gvSupplier_SelectedIndexChanged"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <br />
                        <div class="row clearfix">
                            <div class="col-md-2">
                                <button id="btnSearchSupplier" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#supplierModal">Consultar</button>
                            </div>
                            <div class="col-md-2">
                                <button id="btnInsertSupplier" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#supplierModal">Incluir</button>
                            </div>
                            <div class="col-md-2">
                                <button id="btnUpdateSupplier" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#supplierModal">Alterar</button>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnDeleteSupplier" runat="server" Text="Deletar" CssClass="btn btn-danger" BorderStyle="Solid" OnClick="btnSendDelete_Click" />
                            </div>
                        </div>
                        <br />
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div id="divAlertDanger" style="display:none" class="alert alert-danger alert-dismissible">
                                    <asp:Label runat="server" id="lblError"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div id="divAlertSucess" style="display:none" class="alert alert-success alert-dismissible">
                                    <asp:Label runat="server" id="lblSucess"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="supplierModal" tabindex="-1" aria-labelledby="lblSupplierModal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Fornecedor</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row clearfix">
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCodSupplier" disabled="true" CssClass="form-control" type="text" MaxLength="4" placeholder="Código"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtRazaoSupplier" CssClass="form-control is-invalid" type="text" MaxLength="100" placeholder="Razão Social"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCNPJSupplier" CssClass="form-control is-invalid" type="text" MaxLength="18" placeholder="CNPJ"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNumTel" CssClass="form-control is-invalid" Enabled="false" type="text" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">                                        
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtEndecSupplier" CssClass="form-control is-invalid" Enabled="false" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNumSupplier" CssClass="form-control is-invalid" Enabled="false" type="text" MaxLength="4" placeholder="Número"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtBairroSupplier" CssClass="form-control is-invalid" Enabled="false" type="date" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCEPSupplier" CssClass="form-control is-invalid" Enabled="false" type="date" MaxLength="9" placeholder="CEP"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCidadeSupplier" CssClass="form-control" Enabled="false" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtUFSupplier" CssClass="form-control" Enabled="false" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-2">
                                            <button id="btnClearComponents" type="button" class="btn btn-primary">Limpar</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server">Fechar</button>
                                    <asp:Button ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success" BorderStyle="Solid" OnClick="btnSendSave_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../../Scripts/Screen/Supplier.js"></script>
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
