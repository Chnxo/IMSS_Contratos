<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPresupuesto.aspx.cs" Inherits="IMSS_RMN.AdmonPresupuesto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Administración del Presupuesto</h4>
    <div class="form-horizontal">
        <div class="span8 offset2">
            <table class="table table-striped table-bordered">
                <thead class="centrado">
                    <tr>
                        <th>
                            Fecha Inicio
                        </th>
                        <th>
                            Fecha Finalización
                        </th>
                        <th>
                            Monto Original
                        </th>
                        <th>
                            Monto Actual
                        </th>
                        <th>
                            Concepto
                        </th>
                        <th>
                            
                        </th>
                    </tr>
                </thead>
                <tbody class="centrado" data-bind="foreach: PresupuestoActual">
                    <tr>
                        <td data-bind="text: FechaInicio"></td>
                        <td data-bind="text: FechaFin"></td>
                        <td data-bind="text: MontoOriginal"></td>
                        <td data-bind="text: MontoActual"></td>
                        <td data-bind="text: Concepto"></td>
                        <td>
                        <a href="#" data-bind="click: EditarTipoEstudio"><i class="icon-pencil"></i></a>
                        <a href="#" data-bind="click: ConfirmarEliminarTipoEstudio"><i class="icon-remove"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <%-- Modal Alert --%>
    <div id="alertModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header centrado">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;</button>
            <h3 id="myModalLabel">
                Mensaje</h3>
        </div>
        <div class="modal-body">
            <p class="centrado" data-bind="text: alertMessage">
            </p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">
                OK</button>
        </div>
    </div>
    <script src="JS/ViewModels/PresupuestoViewModel.js" type="text/javascript"></script>
</asp:Content>