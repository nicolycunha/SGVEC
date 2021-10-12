<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <link href="../../Styles/employee.css" rel="stylesheet" />
    <title>SGVEC | Funcionário</title>

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
                    <li>
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
            </div>
        </aside>

        <main>
            <header>
                <span>Funcionário</span>
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
                                <asp:GridView CssClass="col-md-12" ID="gvEmployee" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
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
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkSelect" Text="Selecionar" runat="server" CommandArgument='<%# Eval("COD_FUNC") %>' OnClick="gvEmployee_SelectedIndexChanged"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedRowStyle BackColor="#00ccff" ForeColor="#F7F7F7" Font-Bold="True" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
                                <asp:Button ID="btnDeleteEmployee" runat="server" Text="Deletar" CssClass="btn btn-danger" BorderStyle="Solid" />
                            </div>
                        </div>
                        <br />
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div id="divAlertDanger" style="display:none" class="alert alert-danger alert-dismissible">
                                    <asp:Label runat="server" id="lblError"></asp:Label>
                                </div>

                                <div id="divAlertSucess" style="display:none" class="alert alert-sucess alert-dismissible">
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
                                    <h5 class="modal-title" id="exampleModalLabel">Funcionário</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCodFunc" CssClass="form-control" type="text" MaxLength="5" placeholder="Código"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNomeFunc" CssClass="form-control is-invalid" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCpfFunc" CssClass="form-control is-invalid" type="text" MaxLength="14" placeholder="CPF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtRGFunc" CssClass="form-control is-invalid" Enabled="false" type="text" MaxLength="12" placeholder="RG"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtDtNascFunc" CssClass="form-control is-invalid" Enabled="false" type="date" MaxLength="10" placeholder="Data Nascimento"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlCargoFunc" Enabled="false" runat="server" DataTextField="NOME_CARGO"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtTelFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCelFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="15" placeholder="Celular"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtEnderecoFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtNumEndecFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="5" placeholder="Número"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtBairroFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCepFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="9" placeholder="CEP"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCidadeFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtUFFunc" CssClass="form-control" Enabled="false" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtEmailFunc" CssClass="form-control is-invalid" Enabled="false" type="email" MaxLength="50" placeholder="Email"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtSenhaFunc" CssClass="form-control is-invalid" Enabled="false" type="password" MaxLength="20" placeholder="Senha"></asp:TextBox>
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

                    <hr />
                    <footer class="footer">
                        <a href="/View/Manual" class="manual">
                            <img src="/images/Dashboard/info.png" alt="Ícone de Manual de informações pela icons8" />
                            <span>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</span>
                        </a>
                    </footer>
                </form>
            </div>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../../Scripts/Screen/Config.js"></script>
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
