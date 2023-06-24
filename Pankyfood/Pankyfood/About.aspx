<%@ Page Title="Alimentos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Pankyfood.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div class="container">
            <h2 id="title"><%: Title %>:</h2>
            <h3>Insertar Alimentos.</h3>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_nombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Descripción:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_descripcion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Precio:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_precio" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="Button1_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <h3>Eliminar Alimentos.</h3>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Id:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_id" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="Button2" runat="server" Text="Enviar" OnClick="Button2_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <h3>Actualizar Alimentos.</h3>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Id:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_id2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_nom2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Descripción:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_des2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Precio:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="Txt_prec2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <asp:Button ID="Button3" runat="server" Text="Enviar" OnClick="Button3_Click" CssClass="btn btn-primary" />
                </div>
            </div>

        </div>
    </main>
</asp:Content>
