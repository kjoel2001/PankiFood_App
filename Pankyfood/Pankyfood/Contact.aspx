<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Pankyfood.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div class="container">
            <h2 id="title">Tabla Alimento<%: Title %>.</h2>
            <br />
            <h3>Alimentos.</h3>
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="Label5" runat="server" Text="Id: "></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="Txt_id2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="Label6" runat="server" Text="nombre: "></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="Txt_nom2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="Label7" runat="server" Text="descripcion: "></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="Txt_des2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="Label8" runat="server" Text="Precio: "></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="Txt_prec2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="Button3" runat="server" Text="Enviar" OnClick="Button3_Click" CssClass="btn btn-primary" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-secondary" />
                </div>
            </div>
            <br />
            <asp:GridView ID="GridViewAlimentos" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="50px" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" ItemStyle-Width="250px" />
                    <asp:BoundField DataField="PRECIO" HeaderText="Precio" ItemStyle-Width="100px" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-primary btn-sm" />
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#E0E0E0" />
            </asp:GridView>
            <asp:Button ID="btnLogout" runat="server" Text="Cerrar sesión" OnClick="btnLogout_Click" />

        </div>
    </main>
</asp:Content>
