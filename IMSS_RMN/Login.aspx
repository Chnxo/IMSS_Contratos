<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="IMSS_RMN.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <div class="span6 offset3">
            <h2>
                <label class="control-label">
                    Usuario</label>
                <div class="controls">
                    <asp:TextBox ID="txtUsuario" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Contraseña</label>
                <div class="controls">
                    <asp:TextBox ID="txtContra" runat="server" class="input-medium" TextMode="Password"></asp:TextBox>
                </div>
            </h2>
            <h2 class="centrado">
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" class="btn btn-primary" />
            </h2>
        </div>
    </div>
</asp:Content>