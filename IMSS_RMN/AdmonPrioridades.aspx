<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPrioridades.aspx.cs" Inherits="IMSS_RMN.AdmonPrioridades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Formulario para la Administración de la Prioridad</h4>
    <div class="form-horizontal">
        <div class="span6 offset3">
            <table class="table table-striped table-bordered">
                <thead class="centrado">
                    <tr>
                        <th colspan="2">
                            Nombre
                        </th>
                    </tr>
                </thead>
                <tbody class="centrado">
                    <!-- ko foreach: Prioridades -->
                    <tr>
                        <td data-bind="text: Cal_Nombre">
                        </td>
                        <td>
                            <icon class="icon-pencil"></icon>
                            <icon class="icon-remove"></icon>
                        </td>
                    </tr>
                    <!-- /ko -->
                </tbody>
            </table>
            <h2 class="centrado">
                <asp:Button ID="btnAgregarPrioridad" runat="server" Text="Agregar Nueva Prioridad"
                    class="btn btn-primary" />
            </h2>
            <%--<h2>
                <label class="control-label">
                    Nombre</label>
                <div class="controls">
                    <asp:TextBox ID="txtPartida" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2 class="centrado">
                <asp:Button ID="btnAgregarPrioridad" runat="server" Text="Agregar Nueva Prioridad"
                    class="btn btn-primary" />
            </h2>--%>
        </div>
    </div>
    <script src="JS/ViewModels/PrioridadViewModel.js" type="text/javascript"></script>
</asp:Content>