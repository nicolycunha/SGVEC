<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
   
    <link href="../../Styles/employee.css" rel="stylesheet" />
     <link href="../../Styles/forms.css" rel="stylesheet" />
    <title>SGVEC | Funcionário</title>
</head>
<body>
    <div class="flex-dashboard">
        <aside>
            <div class="sidebar-title">
                <img src="/Images/logo.png" alt="SGVEC" />
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
                            <img src="/Images/Dashboard/openbox.png" alt="Ícone de Estoque pela icons8" />
                            Estoque
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Supplier">
                            <img src="/Images/Dashboard/fornecedor.png" alt="Ícone de Fornecedor pela icons8" />
                            Fornecedor
                        </a>
                    </li>
                    <li class="selected">
                        <a href="/View/Screen/Employee">
                            <img src="/Images/Dashboard/businessman.png" alt="Ícone de Funcionários pela icons8" />
                            Funcionários
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Product">
                            <img src="/Images/Dashboard/codbarras.png" alt="Ícone de Produto pela icons8" />
                            Produtos
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/TypeProduct">
                            <img src="/Images/Dashboard/tipoproduto.png" alt="Ícone de Tipo de Produto pela icons8" />
                            Tipo de produto
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Sales">
                            <img src="/Images/Dashboard/shopify.png" alt="Ícone de Vendas pela icons8" />
                            Vendas
                        </a>
                    </li>
                    <li>
                        <a href="/View/Screen/Report">
                            <img src="/Images/Dashboard/relatorio.png" alt="Ícone de Relatórios pela icons8" />
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
                <span>Funcionário</span>
                <a href="/Login" class="logout">
                    <img src="/Images/Dashboard/sair.png" alt="Ícone de Sair pela icons8" />
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
                                        <asp:TextBox ID="txtName" type="text" runat="server" placeholder="Nome" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCPF" type="text" runat="server" placeholder="CPF" MaxLength="14"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn btn-primary" BorderStyle="Solid" OnClick="btnSearch_Click" />
                                </div>
                            </div>

                            <br />
                            <div class="row clearfix">
                                <asp:GridView CssClass="col-md-12" ID="gvEmployee" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double" BorderWidth="2px" CellPadding="5" GridLines="Horizontal">                                    
                                    <HeaderStyle BackColor="#4A3C8C" ForeColor="#F7F7F7" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField DataField="COD_FUNC" HeaderText="Código" />
                                        <asp:BoundField DataField="NOME_FUNC" HeaderText="Nome" />
                                        <asp:BoundField DataField="CPF_FUNC" HeaderText="CPF" />
                                        <asp:BoundField DataField="RG_FUNC" HeaderText="RG" />
                                        <asp:BoundField DataField="DATA_NASC_FUNC" HeaderText="Data Nasc." />
                                        <asp:BoundField DataField="TELEFONE_FUNC" HeaderText="Telefone" />
                                        <asp:BoundField DataField="CELULAR_FUNC" HeaderText="Celular" />
                                        <asp:BoundField DataField="DATA_DESLIGAMENTO" HeaderText="Data Deslig." />
                                        <asp:TemplateField HeaderText="-">
                                            <ItemTemplate>         
                                                <asp:LinkButton ID="lnkSelect" Text="Selecionar" runat="server" CommandArgument='<%# Eval("COD_FUNC") %>' OnClick="gvEmployee_SelectedIndexChanged"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <br />
                        <div class="row clearfix">
                            <div class="col-md-2">
                                <button id="btnSearchEmployee" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#employeeModal">Consultar</button>
                            </div>
                            <div class="col-md-2">
                                <button id="btnInsertEmployee" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#employeeModal">Incluir</button>
                            </div>
                            <div class="col-md-2">
                                <button id="btnUpdateEmployee" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#employeeModal">Alterar</button>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnDeleteEmployee" runat="server" Text="Deletar" CssClass="btn btn-danger" BorderStyle="Solid" OnClick="btnSendDelete_Click" />
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
                    <div class="modal fade" id="employeeModal" tabindex="-1" aria-labelledby="lblEmployeeModal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" >Funcionário</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row clearfix">
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCodEmployee" disabled="true" CssClass="form-control" type="text" MaxLength="5" placeholder="Código"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNomeEmployee" CssClass="form-control is-invalid" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCpfEmployee" CssClass="form-control is-invalid" type="text" MaxLength="14" placeholder="CPF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtRGEmployee" CssClass="form-control is-invalid" Enabled="false" type="text" MaxLength="12" placeholder="RG"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtDtNascEmployee" CssClass="form-control is-invalid" Enabled="false" type="date" MaxLength="10" placeholder="Data Nascimento"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlCargoEmployee" Enabled="false" runat="server" DataTextField="NOME_CARGO"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtTelEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCelEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="15" placeholder="Celular"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtEnderecoEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNumEndecEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="5" placeholder="Número"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtBairroEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCepEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="9" placeholder="CEP"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCidadeEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtUFEmployee" CssClass="form-control" Enabled="false" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtEmailEmployee" CssClass="form-control is-invalid" Enabled="false" type="email" MaxLength="50" placeholder="Email"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtSenhaEmployee" CssClass="form-control is-invalid" Enabled="false" type="password" MaxLength="20" placeholder="Senha"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtDtDeslig" CssClass="form-control" Enabled="false" type="date" MaxLength="10" placeholder="Data Desligamento"></asp:TextBox>
                                            </div>
                                        </div>
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
    <script src="../../Scripts/Screen/Employee.js"></script>
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
