<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonUsuarios.aspx.cs" Inherits="IMSS_RMN.AdmonUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Administración de Usuarios</h4>
    <div class="form-horizontal">
        <div class="span8 offset2">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Contraseña</th>
                        <th>Nivel</th>
                        <th>Activo</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody data-bind="foreach: Usuarios">
                    <tr>
                        <td data-bind="text: User"></td>
                        <td data-bind="text: Contrasenia"></td>
                        <td data-bind="text: Lvl"></td>
                        <td data-bind="text: Activo"></td>
                        <td>
                        <a href="#"><i class="icon-pencil"></i></a>
                        <a href="#"><i class="icon-remove"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script src="JS/ViewModels/UsuariosViewModel.js" type="text/javascript"></script>
</asp:Content>