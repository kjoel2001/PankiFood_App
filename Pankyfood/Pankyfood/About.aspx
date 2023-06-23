<%@ Page Title="Alimentos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Pankyfood.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>:</h2>
        <h3>Insertar Alimentos.</h3>
        <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="Txt_nombre" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="Label2" runat="server" Text="Descripcion: "></asp:Label>
        <asp:TextBox ID="Txt_descripcion" runat="server"></asp:TextBox>

    <br />
        <asp:Label ID="Label3" runat="server" Text="Precio: "></asp:Label>
        <asp:TextBox ID="Txt_precio" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="Button1_Click" />
    <br />
        <h3>Eliminar Alimentos.</h3>
        <asp:Label ID="Label4" runat="server" Text="Id: "></asp:Label>
        <asp:TextBox ID="Txt_id" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button2" runat="server" Text="Enviar" OnClick="Button2_Click" />
    <br />
        <h3>Actualizar Alimentos.</h3>
        <asp:Label ID="Label5" runat="server" Text="Id: "></asp:Label>
        <asp:TextBox ID="Txt_id2" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="Label6" runat="server" Text="nombre: "></asp:Label>
        <asp:TextBox ID="Txt_nom2" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="Label7" runat="server" Text="descripcion: "></asp:Label>
        <asp:TextBox ID="Txt_des2" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="Label8" runat="server" Text="Precio: "></asp:Label>
        <asp:TextBox ID="Txt_prec2" runat="server"></asp:TextBox>
    <br />
        <asp:Button ID="Button3" runat="server" Text="Enviar" OnClick="Button3_Click" />
    <br />
        <asp:GridView ID="GridViewAlimentos" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="50px" />
        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ItemStyle-Width="150px" />
        <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" ItemStyle-Width="250px" />
        <asp:BoundField DataField="PRECIO" HeaderText="Precio" ItemStyle-Width="100px" />
    </Columns>
    <HeaderStyle BackColor="#E0E0E0" />
        </asp:GridView>

    <br />
    </main>
</asp:Content>