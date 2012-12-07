var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "AdmonTiposEstudios.aspx/CargarViewModel",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            viewModelJS = data.d;
            viewModel = ko.mapping.fromJS(viewModelJS);

            //Helpers
            viewModel.Accion = ko.observable("Agregar Tipo de Estudio");
            viewModel.Editando = ko.observable(false);
            viewModel.Eliminando = ko.observable(false);
            viewModel.modalMessage = ko.observable();
            viewModel.alertMessage = ko.observable();
            viewModel.alertSuccess = ko.observable(false);

            ko.applyBindings(viewModel);
        },
        error: function (error) {
        }
    });
});

var GuardarTipoEstudio = function () {
    if (!viewModel.Editando()) {
        viewModel.TipoEstudio.Id_tip_est(-1);
    }

    var tipoEstudio = ko.mapping.toJS(viewModel.TipoEstudio);
    $.ajax({
        type: "POST",
        url: "AdmonTiposEstudios.aspx/GuardarTipoEstudio",
        data: "{'tipoEstudioJSON':'" + ko.mapping.toJSON(tipoEstudio) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                var tiposEstudiosJS = data.d.tiposEstudios;
                viewModel.TipoEstudios(ko.mapping.fromJS(tiposEstudiosJS));
                if (viewModel.Editando()) {
                    viewModel.modalMessage("Tipo de Estudio modificado correctamente.");
                } else {
                    viewModel.modalMessage("Tipo de Estudio guardado correctamente.");
                }
                Cancelar();
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var EditarTipoEstudio = function (TipoEstudio) {
    viewModel.Editando(true);
    viewModel.Accion("Guardar Cambios");
    viewModel.TipoEstudio.Tip_est_nombre(TipoEstudio.Tip_est_nombre());
    viewModel.TipoEstudio.Costo(TipoEstudio.Costo());
};

var Cancelar = function () {
    if (viewModel.Editando()) {
        viewModel.TipoEstudio.Tip_est_nombre("");
        viewModel.TipoEstudio.Costo(0);
        viewModel.Editando(false);
        viewModel.Accion("Agregar Tipo de Estudio");
    }
    viewModel.TipoEstudio.Id_tip_est(-1);
};