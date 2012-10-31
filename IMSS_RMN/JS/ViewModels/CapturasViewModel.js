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

    self.alertMessage = ko.observable("");

    //Validaciones
    ko.validation.init();

//    ko.validation.rules.pattern.message = 'Invalid.';

    ko.validation.configure({
        registerExtenders: true,
        messagesOnModified: true,
        insertMessages: true,
        parseInputAttributes: true,
        messageTemplate: null
    });

    self.Paciente.Nombre = ko.observable().extend({ required: true });

    self.errors = ko.validation.group(self);

    self.GuardarPaciente = function () {
        if (self.errors().length == 0) {
            self.errors.showAllMessages();
            var paciente = ko.mapping.toJS(self.Paciente);
            $.ajax({
                type: "POST",
                url: "Capturas.aspx/GuardarPaciente",
                data: "{'pacienteJSON':'" + ko.mapping.toJSON(paciente) + "'}",
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    if (data.d) {
                        self.alertMessage("Usuario agregado correctamente.");
                        $('#alertModal').modal('show');
                    } else {
                        self.alertMessage("Usuario no agregado.");
                        $('#alertModal').modal('show');
                    }
                },
                error: function (error) {
                    self.alertMessage("No se pudo establecer conexión con el servidor.");
                    $('#alertModal').modal('show');
                }
            });
        } else {
            self.errors.showAllMessages();
        }
    };

    return self
}