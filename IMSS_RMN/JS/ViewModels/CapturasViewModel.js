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
            viewModel = new CapturasViewModel(viewModelJS);
            ko.applyBindings(viewModel);
        },
        error: function (error) {
            alert("D:");
        }
    });
});

CapturasViewModel = function (jsonModel) {
    var self = jsonModel || {};
    self = ko.mapping.fromJS(self);

    self.GuardarPaciente = function () {
        var paciente = ko.mapping.toJS(self.Paciente);
        $.ajax({
            type: "POST",
            url: "Capturas.aspx/GuardarPaciente",
            data: "{'pacienteJSON':'" + ko.mapping.toJSON(paciente) + "'}",
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                alert(":D");
            },
            error: function (error) {
                alert("D:");
            }
        });
    };

    return self
}