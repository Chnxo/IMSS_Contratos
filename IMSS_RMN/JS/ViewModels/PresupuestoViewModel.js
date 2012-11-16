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

            viewModel.alertMessage = ko.observable("");
            ko.applyBindings(viewModel);
        },
        error: function (error) {
        }
    });
});


var GuardarPresupuesto = function () {
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