var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "AdmonPresupuesto.aspx/CargarViewModel",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            viewModelJS = data.d;
            viewModel = ko.mapping.fromJS(viewModelJS);

            //Helpers
            viewModel.Accion = ko.observable("Agregar Presupuesto");
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


var GuardarPresupuesto = function () {
    if (!viewModel.Editando()) {
        
    }

    var presupuesto = ko.mapping.toJS(viewModel);
    $.ajax({
        type: "POST",
        url: "AdmonPresupuesto.aspx/GuardarPresupuesto",
        data: "{'presupuestoJSON':'" + ko.mapping.toJSON(presupuesto) + "}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d) {
                viewModel.alertMessage("Presupuesto agregado correctamente.");
                $('#alertModal').modal('show');
            } else {
                viewModel.alertMessage("Presupuesto no agregado.");
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.alertMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};