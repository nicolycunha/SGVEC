<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SGVEC.View.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Scripts/bootstrap-5.0.2-dist/css/bootstrap-grid.min.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <title>SGVEC | Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3><%: Title %>Seja bem vindo(a)
                <label id="lblNomeFunc">Nome do Usuário</label></h3>
        </div>
        <div>
            <asp:ImageButton ID="imgButtonEmployee" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonEmployee_Click" />
            <asp:ImageButton ID="imgButtonTypeProduct" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonTypeProduct_Click" />
            <asp:ImageButton ID="imgButtonProduct" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonProduct_Click" />
            <asp:ImageButton ID="ImageButtonSupplier" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSupplier_Click" />
            <asp:ImageButton ID="imgButtonStorege" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonStorege_Click" />
            <asp:ImageButton ID="imgButtonSales" Width="200px" runat="server" ImageUrl="~/images/Dashboard/funcionario.png" OnClick="imgButtonSales_Click" />
        </div>
    </form>
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - SGVEC - Sistema Gerenciador de Vendas e Estoque</p>
    </footer>
</body>
</html>
