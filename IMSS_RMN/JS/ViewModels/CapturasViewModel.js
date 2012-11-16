var viewModelJS;
var viewModel;

$(function () {
    //    $('#fSolicitud').datepicker();
    $('#fSolicitud').datepicker();
    $('#fRealizacion').datepicker();
    $.ajax({
        type: "POST",
        url: "Capturas.aspx/CargarViewModel",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            viewModelJS = data.d;
            viewModel = ko.mapping.fromJS(viewModelJS);

            // Helpers
            viewModel.alertMessage = ko.observable("");
            viewModel.TipoEstudio = ko.observable();
            viewModel.Prioridad = ko.observable();

            ko.applyBindings(viewModel);
        },
        error: function (error) {
        }
    });
});

var GuardarEstudio = function () {
    var paciente = ko.mapping.toJS(viewModel.Paciente);
    var estudio = ko.mapping.toJS(viewModel.Estudio);
    var presupuesto = ko.mapping.toJS(viewModel.Presupuesto);
    estudio.Fk_pri_id = viewModel.Prioridad().Pri_id();
    estudio.Fk_tipo_id = viewModel.TipoEstudio().Id_tip_est();
    $.ajax({
        type: "POST",
        url: "Capturas.aspx/GuardarEstudio",
        data: "{'pacienteJSON':'" + ko.mapping.toJSON(paciente) + "', 'estudioJSON':'" + ko.mapping.toJSON(estudio) + "', 'presupuestoJSON':'" + ko.mapping.toJSON(presupuesto) + "', 'costo':'" + viewModel.TipoEstudio().Costo() + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d > 0) {
                LimpiarCampos();
                viewModel.Presupuesto.Monto(data.d);
                viewModel.alertMessage("Estudio agregado correctamente.");
                $('#alertModal').modal('show');
            } else {
                viewModel.alertMessage("Estudio no agregado.");
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.alertMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var LimpiarCampos = function () {
    viewModel.Estudio.Fecha_sol("");
    viewModel.Estudio.Fecha_rea("");
    viewModel.Paciente.Nombre("");
    viewModel.Paciente.Ape_pat("");
    viewModel.Paciente.Ape_mat("");
    viewModel.Paciente.Afiliacion("");
    // falta Agregado
    viewModel.Paciente.Num_tel("");
    viewModel.TipoEstudio(undefined);
    viewModel.Prioridad(undefined);
    viewModel.Estudio.Observacion("");
};