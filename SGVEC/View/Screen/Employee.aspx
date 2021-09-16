<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.WebForm1" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../../Styles/employee.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <title>SGVEC | Funcionários</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container rounded">
            <div class="col-md-12">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Início</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-search-tab" data-bs-toggle="pill" data-bs-target="#pills-search" type="button" role="tab" aria-controls="pills-search" aria-selected="false">Funcionário</button>
                    </li>
                </ul>

                <div class="tab-content" id="pills-tabContent">
                    <!------ Tab Início -------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <div class="row clearfix">
                            <br />
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtCode" type="number" placeholder="Código" MaxLength="5"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <asp:TextBox ID="txtName" type="text" runat="server" placeholder="Nome" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox ID="txtCPF" type="text" runat="server" placeholder="CPF" MaxLength="14"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn-btnSearch" BorderStyle="Solid" OnClick="btnSearch_Click" />
                            </div>
                        </div>

                        <br />
                        <br />

                        <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="COD_FUNC" HeaderText="Código" />
                                <asp:BoundField DataField="NOME_FUNC" HeaderText="Nome" />
                                <asp:BoundField DataField="CPF_FUNC" HeaderText="CPF" />
                                <asp:BoundField DataField="RG_FUNC" HeaderText="RG" />
                                <asp:BoundField DataField="DATA_NASC_FUNC" HeaderText="Data Nascimento" />
                                <asp:BoundField DataField="TELEFONE_FUNC" HeaderText="Telefone" />
                                <asp:BoundField DataField="CELULAR_FUNC" HeaderText="Celular" />
                                <asp:BoundField DataField="DATA_DESLIGAMENTO" HeaderText="Data de Desligamento" />
                            </Columns>
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        </asp:GridView>

                        <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="#865fc5">Registro não encontrado!</asp:Label>
                    </div>

                    <!------ Tab Funcionário -------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="pills-search" role="tabpanel" aria-labelledby="pills-search-tab">
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchCodFunc" type="number" MaxLength="5" placeholder="Código"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchNomeFunc" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchCpfFunc" type="number" MaxLength="14" placeholder="CPF"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchRGFunc" type="number" MaxLength="12" placeholder="RG"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchDtNascFunc" type="date" placeholder="Data Nascimento"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchTelFunc" type="number" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchCelFunc" type="number" MaxLength="15" placeholder="Celular"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchEnderecoFunc" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchNumEndecFunc" type="number" MaxLength="5" placeholder="Número Endec."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchBairroFunc" type="text" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchCepFunc" type="number" MaxLength="9" placeholder="CEP"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchCidadeFunc" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchUFFunc" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchEmailFunc" type="number" MaxLength="50" placeholder="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchSenhaFunc" type="number" MaxLength="20" placeholder="Senha"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtSearchDtDeslig" type="number" placeholder="Data Desligamento"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlSearchCargoFunc" runat="server" DataTextField="NOME_CARGO"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-2">
                                <asp:Button ID="btnSendSearch" runat="server" Text="Consultar" CssClass="btn-primary" BorderStyle="Solid" OnClick="btnSendSearch_Click" />
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnSendInsert" runat="server" Text="Incluir" CssClass="btn-primary" BorderStyle="Solid" OnClick="btnSendInsert_Click" />
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnSendUpdate" runat="server" Text="Alterar" CssClass="btn-primary" BorderStyle="Solid" OnClick="btnSendUpdate_Click" />
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnSendDelete" runat="server" Text="Excluir" CssClass="btn-danger" BorderStyle="Solid" OnClick="btnSendDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="row">
                </div>
            </footer>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
