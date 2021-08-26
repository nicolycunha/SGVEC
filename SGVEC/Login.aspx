<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGVEC.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/login.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/9abeffea05.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">

                <div class="col">
                    <img src="images/undraw_Login.svg" class="img-fluid login-image" alt="Login" />
                </div>

                <div class="col">
                    <%--   <ul class="nav justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Registrar</a>
                            </li>
                        </ul>--%>
                    <div class="form-login">
                        <h4 class="text-center title-page">Login</h4>

                        <div class="input-group">
                            <i class="fas fa-envelope"></i>
                            <asp:TextBox ID="txtLogin" type="text" runat="server" placeholder="Email"></asp:TextBox>
                        </div>

                        <div class="input-group">
                            <i class="fas fa-lock"></i>
                            <asp:TextBox ID="txtPassword" type="password" runat="server" placeholder="Senha"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <div>
                                <asp:CheckBox ID="chkRemember" runat="server" CssClass="check"></asp:CheckBox>
                                <asp:Label Text="Lembrar senha" runat="server" />
                            </div>

                            <a href="#">Esqueceu a senha?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="ENTRAR" OnClick="btnLogin_Click" CssClass="btn-login" BorderStyle="Solid" />


                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

