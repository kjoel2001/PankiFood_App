<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pankyfood.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" id="tabLogin" data-toggle="tab" href="#login">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="tabRegister" data-toggle="tab" href="#register">Registrarse</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="login">
                        <h2>Iniciar Sesión</h2>
                        <div class="form-group">
                            <label for="txtUsername">Usuario</label>
                            <input type="text" id="txtUsername" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Contraseña</label>
                            <input type="password" id="txtPassword" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                        </div>
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="tab-pane fade" id="register">
                        <h2>Registrarse</h2>
                        <div class="form-group">
                            <label for="txtNewUsername">Nuevo Usuario</label>
                            <input type="text" id="txtNewUsername" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtNewPassword">Nueva Contraseña</label>
                            <input type="password" id="txtNewPassword" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnRegister" runat="server" Text="Registrarse" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                        </div>
                        <asp:Label ID="lblRegisterMessage" runat="server" CssClass="text-success"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Cambiar a la pestaña "Iniciar Sesión" al hacer clic en el enlace correspondiente
        document.getElementById("tabLogin").addEventListener("click", function (e) {
            e.preventDefault();
            document.getElementById("tabLogin").classList.add("active");
            document.getElementById("tabRegister").classList.remove("active");
            document.getElementById("login").classList.add("show", "active");
            document.getElementById("register").classList.remove("show", "active");
        });

        // Cambiar a la pestaña "Registrarse" al hacer clic en el enlace correspondiente
        document.getElementById("tabRegister").addEventListener("click", function (e) {
            e.preventDefault();
            document.getElementById("tabLogin").classList.remove("active");
            document.getElementById("tabRegister").classList.add("active");
            document.getElementById("login").classList.remove("show", "active");
            document.getElementById("register").classList.add("show", "active");
        });
    </script>
</asp:Content>
