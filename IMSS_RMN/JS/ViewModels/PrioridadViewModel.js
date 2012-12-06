var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "AdmonPrioridades.aspx/CargarViewModel",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            viewModelJS = data.d;
            viewModel = ko.mapping.fromJS(viewModelJS);

            //Helpers
            viewModel.Accion = ko.observable("Agregar Prioridad");
            viewModel.Editando = ko.observable(false);
            viewModel.Eliminando = ko.observable(false);
            viewModel.modalMessage = ko.observable();
            viewModel.alertMessage = ko.observable();
            viewModel.alertSuccess = ko.observable(false);

            ko.applyBindings(viewModel);
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
});

var GuardarPrioridad = function () {
    if (!viewModel.Editando()) {
        viewModel.Prioridad.Pri_id(-1);
    }

    var prioridad = ko.mapping.toJS(viewModel.Prioridad);
    $.ajax({
        type: "POST",
        url: "AdmonPrioridades.aspx/GuardarPrioridad",
        data: "{'prioridadJSON':'" + ko.mapping.toJSON(prioridad) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                var prioridadesJS = data.d.prioridades;
                viewModel.Prioridades(ko.mapping.fromJS(prioridadesJS));
                if (viewModel.Editando()) {
                    viewModel.modalMessage("Prioridad modificada correctamente.");
                } else {
                    viewModel.modalMessage("Prioridad agregada correctamente.");
                }
                Cancelar();
                $('#alertModal').modal('show');
            } else {
                viewModel.modalMessage(data.d.message);
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var EditarPrioridad = function (Prioridad) {
    viewModel.Editando(true);
    viewModel.Accion("Guardar Cambios");
    viewModel.Prioridad.Cal_Nombre(Prioridad.Cal_Nombre());
    viewModel.Prioridad.Pri_id(Prioridad.Pri_id());
};

var ConfirmacionEliminarPrioridad = function (Prioridad) {
    viewModel.Eliminando(true);
    viewModel.Prioridad.Pri_id(Prioridad.Pri_id());
    viewModel.modalMessage("Esta seguro que desea eliminar esta prioridad?");
    $('#alertModal').modal('show');
};

var EliminarPrioridad = function () {
    $.ajax({
        type: "POST",
        url: "AdmonPrioridades.aspx/EliminarPrioridad",
        data: "{'clave':'" + viewModel.Prioridad.Pri_id() + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                var prioridadesJS = data.d.prioridades;
                viewModel.Prioridades(ko.mapping.fromJS(prioridadesJS));
                viewModel.alertMessage("Prioridad eliminada correctamente.");
                viewModel.alertSuccess(true);
                viewModel.Prioridad.Pri_id(-1);
                viewModel.Eliminando(false);
            }
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var Cancelar = function () {
    if (viewModel.Editando()) {
        viewModel.Prioridad.Cal_Nombre("");
        viewModel.Editando(false);
        viewModel.Accion("Agregar Prioridad");
    }
    viewModel.Prioridad.Pri_id(-1);
};

var hideModal = function () {
    viewModel.alertSuccess(false);
    viewModel.Eliminando(false);
};