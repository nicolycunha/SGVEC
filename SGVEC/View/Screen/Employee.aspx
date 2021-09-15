<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SGVEC.View.Screen.WebForm1" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../../Styles/master.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <title>SGVEC | Funcionários</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <br />
            <asp:TextBox runat="server" ID="txtCode" type="number" placeholder="Código"></asp:TextBox>

            <asp:TextBox ID="txtName" type="text" runat="server" placeholder="Nome"></asp:TextBox>

            <asp:TextBox ID="txtCPF" type="text" runat="server" placeholder="CPF"></asp:TextBox>
        </div>

        <asp:Button ID="btnSearch" runat="server" Text="Pesquisar" CssClass="btn btn-secondary btn-lg mt-2 ml-2" BorderStyle="Solid" OnClick="btnSearch_Click" />
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

        <br />
        <!-- Botão que irá abrir o modal -->
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalEmployee">Consultar</button>
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalEmployee">Cadastrar</button>
        <button type="button" class="btn btn-success btn-lg mt-2 ml-2" data-toggle="modal" data-target="#ModalEmployee">Alterar</button>
        <button type="button" class="btn btn-danger btn-lg mt-2 ml-2">Deletar</button>
        <!-- Modal -->
        <div id="ModalEmployee" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Conteúdo do modal-->
                <div class="modal-content">
                    <!-- Cabeçalho do modal -->
                    <div class="modal-header">
                        <h4 class="modal-title">Funcionário</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Corpo do modal -->
                    <div class="modal-body">
                        <asp:TextBox runat="server" ID="txtCodFunc" type="number" MaxLength="5" placeholder="Código"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtCpfFunc" type="number" MaxLength="14" placeholder="CPF"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtNomeFunc" type="text" MaxLength="50" placeholder="Nome"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtRGFunc" type="number" MaxLength="12" placeholder="RG"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtDtNascFunc" type="date" placeholder="Data Nascimento"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtTelFunc" type="number" MaxLength="15" placeholder="Telefone"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtCelFunc" type="number" MaxLength="15" placeholder="Celular"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtEnderecoFunc" type="text" MaxLength="100" placeholder="Endereço"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtNumEndecFunc" type="number" MaxLength="5" placeholder="Número Endec."></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtBairroFunc" type="text" MaxLength="50" placeholder="Bairro"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtCepFunc" type="number" MaxLength="9" placeholder="CEP"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtCidadeFunc" type="text" MaxLength="50" placeholder="Cidade"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtUFFunc" type="text" MaxLength="2" placeholder="UF"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtEmailFunc" type="number" MaxLength="50" placeholder="Email"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtSenhaFunc" type="number" MaxLength="20" placeholder="Senha"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtDtDeslig" type="number" placeholder="Data Desligamento"></asp:TextBox>
                        <asp:DropDownList ID="ddlCodCargo" runat="server" DataTextField="NOME_CARGO"></asp:DropDownList>                        
                        <%--<asp:TextBox runat="server" ID="txtCodCargo" type="number" MaxLength="5" placeholder="Código"></asp:TextBox>--%>
                    </div>

                    <!-- Rodapé do modal-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <asp:Button ID="btnComplete" runat="server" Text="Concluir" OnClick="btnComplete_Click" />
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
