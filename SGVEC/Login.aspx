<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGVEC.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/login.css" rel="stylesheet" />
    <link href="Scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="Scripts/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9abeffea05.js"></script>

    <title>SGVEC - Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">

                <div class="col">
                    <img src="images/undraw_Login.svg" class="img-fluid login-image" alt="Login" />
                </div>

                <div class="col">
                    <div class="form-login">
                        <h4 class="text-center title-page">Login</h4>

                        <div class="input-group">
                            <i class="fas fa-envelope"></i>
                            <asp:TextBox ID="txtLogin" type="email" runat="server" placeholder="Email"></asp:TextBox>
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
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
