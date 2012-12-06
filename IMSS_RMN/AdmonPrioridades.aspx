<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPrioridades.aspx.cs" Inherits="IMSS_RMN.AdmonPrioridades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Administración de Prioridades</h4>
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
                <tbody class="centrado" data-bind="foreach: Prioridades">
                    <tr>
                        <td data-bind="text: Cal_Nombre">
                        </td>
                        <td>
                            <a href="#" data-bind="click: EditarPrioridad"><i class="icon-pencil"></i></a><a
                                href="#" data-bind="click: ConfirmacionEliminarPrioridad"><i class="icon-remove"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <h2>
                <label class="control-label">
                    Nombre Prioridad</label>
                <div class="controls">
                    <asp:TextBox ID="Nom_Prioridad" runat="server" class="input-medium" data-bind="value: Prioridad.Cal_Nombre"></asp:TextBox>
                </div>
                <h2 class="centrado">
                    <asp:Button ID="btnAgregarPrioridad" runat="server" data-bind="value: Accion, click: GuardarPrioridad" class="btn btn-primary" />
                    <!-- ko if: Editando -->
                    <asp:Button ID="Button1" runat="server" Text="Cancelar" class="btn" data-bind="click: Cancelar" />
                    <!-- /ko -->
                </h2>
            </h2>
        </div>
    </div>
    <div id="alertModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" data-bind="event: { hidden: hideModal }">
        <div class="modal-header centrado">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;</button>
            <h3 id="myModalLabel">
                Mensaje</h3>
        </div>
        <div class="modal-body">
            <p class="centrado" data-bind="text: modalMessage">
            </p>
            <!-- ko if: alertSuccess -->
            <div class="alert alert-success">            
            <button id="alertSuccess" type="button" class="close" data-dismiss="alert">x</button>
                <p class="centrado" data-bind="text: alertMessage"></p>
            </div>
            <!-- /ko -->
        </div>
        <div class="modal-footer">
            <!-- ko if: Eliminando -->
            <button class="btn btn-primary" data-bind="click: EliminarPrioridad" aria-hidden="true">
                Si</button>
                <button class="btn" data-dismiss="modal" aria-hidden="true" data-bind="click: Cancelar">
                No</button>
            <!-- /ko -->
            <!-- ko if: !Eliminando() -->
            <button class="btn" data-dismiss="modal" aria-hidden="true">
                Ok</button>
            <!-- /ko -->
        </div>
    </div>
    <script src="JS/ViewModels/PrioridadViewModel.js" type="text/javascript"></script>
</asp:Content>