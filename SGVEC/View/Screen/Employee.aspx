<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.WebForm1" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../../Styles/master.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <title>SGVEC | Funcionário</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <br />
            <asp:TextBox runat="server" ID="txtCode" type="number" placeholder="Código"></asp:TextBox>

            <asp:TextBox ID="txtName" type="text" runat="server" placeholder="Nome"></asp:TextBox>

            <asp:TextBox ID="txtCPF" type="text" runat="server" placeholder="CPF"></asp:TextBox>
        </div>

        <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn btn-secondary btn-lg mt-2 ml-2" BorderStyle="Solid" />
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
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

        <br />
        <!-- Botão que irá abrir o modal -->
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalSelect">Consultar</button>
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalInsert">Cadastrar</button>
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalUpdate">Alterar</button>
        <button type="button" class="btn btn-danger btn-lg mt-2 ml-2">Deletar</button>

        <!-- Modal -->
        <div id="ModalSelect" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Conteúdo do modal-->
                <div class="modal-content">
                    <!-- Cabeçalho do modal -->
                    <div class="modal-header">
                        <h4 class="modal-title">Consultar Funcionário</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Corpo do modal -->
                    <div class="modal-body">
                        <p>Conteúdo no corpo do modal.</p>
                        <p>Aqui você pode inserir todo o conteúdo necessário.</p>
                    </div>

                    <!-- Rodapé do modal-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <asp:Button ID="btnSelect" runat="server" Text="Button" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div id="ModalInsert" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Conteúdo do modal-->
                <div class="modal-content">
                    <!-- Cabeçalho do modal -->
                    <div class="modal-header">
                        <h4 class="modal-title">Título do modal</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Corpo do modal -->
                    <div class="modal-body">
                        <p>Conteúdo no corpo do modal.</p>
                        <p>Aqui você pode inserir todo o conteúdo necessário.</p>
                    </div>

                    <!-- Rodapé do modal-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div id="ModalUpdate" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Conteúdo do modal-->
                <div class="modal-content">
                    <!-- Cabeçalho do modal -->
                    <div class="modal-header">
                        <h4 class="modal-title">Título do modal</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Corpo do modal -->
                    <div class="modal-body">
                        <p>Conteúdo no corpo do modal.</p>
                        <p>Aqui você pode inserir todo o conteúdo necessário.</p>
                    </div>

                    <!-- Rodapé do modal-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
