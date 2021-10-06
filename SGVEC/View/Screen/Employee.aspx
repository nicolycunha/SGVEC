<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.WebForm1" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <link href="../../Styles/employee.css" rel="stylesheet" />
    <title>SGVEC | Funcionários</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container shadow bg-white p-3">
            <div class="col-md-12">
                <div class="row clearfix">
                    <br />
                    <div class="col-md-2">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtCode" type="number" placeholder="Código" MaxLength="5"></asp:TextBox>
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
                        <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn-btnSearch" BorderStyle="Solid" OnClick="btnSearch_Click" />
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

                <div class="row clearfix">
                    <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="#ff0000"></asp:Label>
                </div>
            </div>

            <br />
            <div class="row clearfix">
                <!-- Button trigger modal -->
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
                <asp:Label ID="lblValue" runat="server" Text="0" Visible="false"></asp:Label>
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
                                        <asp:TextBox runat="server" ID="txtCodFunc" type="number" MaxLength="5" placeholder="Código"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtNomeFunc" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtCpfFunc" type="text" MaxLength="14" placeholder="CPF"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtRGFunc" Enabled="false" type="text" MaxLength="12" placeholder="RG"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtDtNascFunc" Enabled="false" type="date" placeholder="Data Nascimento"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCargoFunc" Enabled="false" runat="server" DataTextField="NOME_CARGO"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtTelFunc" Enabled="false" type="number" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtCelFunc" Enabled="false" type="number" MaxLength="15" placeholder="Celular"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtEnderecoFunc" Enabled="false" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtNumEndecFunc" Enabled="false" type="number" MaxLength="5" placeholder="Número"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtBairroFunc" Enabled="false" type="text" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtCepFunc" Enabled="false" type="number" MaxLength="9" placeholder="CEP"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtCidadeFunc" Enabled="false" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtUFFunc" Enabled="false" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtEmailFunc" Enabled="false" type="email" MaxLength="50" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtSenhaFunc" Enabled="false" type="password" MaxLength="20" placeholder="Senha"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" ID="txtDtDeslig" Enabled="false" type="date" placeholder="Data Desligamento"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button id="btnClearComponents" type="button" class="btn btn-primary" >Limpar</button>                                    
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div>
                                    <asp:Label runat="server" ID="lblErrorModal" Visible="false" ForeColor="#ff0000"></asp:Label>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lblSucess" Visible="false" ForeColor="#00cc00"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Fechar</button>
                            <asp:Button ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success" BorderStyle="Solid" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <footer>
            <p>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</p>
        </footer>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../../Scripts/Screen/Config.js"></script>
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
