var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "Capturas.aspx/CargarViewModel",
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
            alert("D:");
        }
    });
});

var GuardarPaciente = function () {
    var paciente = ko.mapping.toJS(viewModel.Paciente);
    $.ajax({
        type: "POST",
        url: "Capturas.aspx/GuardarPaciente",
        data: "{'pacienteJSON':'" + ko.mapping.toJSON(paciente) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d) {
                viewModel.alertMessage("Usuario agregado correctamente.");
                $('#alertModal').modal('show');
            } else {
                viewModel.alertMessage("Usuario no agregado.");
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.alertMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var TestGA = function () {
    $.ajax({
        type: "POST",
        url: "Capturas.aspx/TestGetAll",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            alert("chancho pancho");
        },
        error: function (error) {
        }
    });
};