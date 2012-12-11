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
                        <td data-bind="text: FechaInicio">
                        </td>
                        <td data-bind="text: FechaFin">
                        </td>
                        <td data-bind="text: FormatearPresupuesto(MontoOriginal())">
                        </td>
                        <td data-bind="text: FormatearPresupuesto(MontoActual())">
                        </td>
                        <td data-bind="text: Concepto">
                        </td>
                        <td>
                            <a href="#" data-bind="click: Editar"><i class="icon-pencil"></i></a><a href="#" data-bind="click: Eliminar"><i class="icon-remove"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="form-horizontal">
            <div class="span6 offset3">
                <h2>
                    <label class="control-label">
                        Fecha Inicio</label>
                    <div class="controls">
                        <div class="input-prepend date" id="fi" data-date="" data-date-format="mm/dd/yyyy">
                            <span class="add-on pull-left"><i class="icon-calendar"></i></span>
                            <input type="text" id="fechaI" class="input-medium" readonly />
                        </div>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Fecha Fin</label>
                    <div class="controls">
                        <div class="input-prepend date" id="ff" data-date="" data-date-format="mm/dd/yyyy">
                            <span class="add-on pull-left"><i class="icon-calendar"></i></span>
                            <input type="text" id="fechaF" class="input-medium" readonly />
                        </div>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Monto</label>
                    <div class="controls">
                        <asp:TextBox ID="monto" runat="server" class="input-medium" data-bind="value: PresupuestoNuevo.MontoOriginal, enable: !Editando()"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Concepto</label>
                    <div class="controls">
                        <textarea rows="3" class="input-large" data-bind="value: PresupuestoNuevo.Concepto"></textarea>
                    </div>
                </h2>
                <h2 class="centrado">
                    <!-- ko if: !HayPresupuestoActual() -->
                    <button class="btn btn-primary" data-bind="click: GuardarPresupuesto">
                        <i class="icon-ok icon-white"></i> Agregar Presupuesto</button>
                    <!-- /ko -->
                    <!-- ko if: Editando -->
                    <button class="btn btn-primary" data-bind="click: EditarPresupuesto">
                        <i class="icon-ok icon-white"></i> Modificar Presupuesto</button>
                    <asp:Button ID="Button1" runat="server" Text="Cancelar" class="btn" data-bind="click: Cancelar" />
                    <!-- /ko -->
                </h2>
            </div>
        </div>
    </div>
    <%-- Modal Alert --%>
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
            <button class="btn btn-primary" data-bind="click: EliminarPresupuesto" aria-hidden="true">
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
    <script src="JS/ViewModels/PresupuestoViewModel.js" type="text/javascript"></script>
</asp:Content>