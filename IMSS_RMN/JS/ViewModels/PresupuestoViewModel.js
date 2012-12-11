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
            $('#fi').datepicker();
            $('#ff').datepicker();
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
});

function FormatearPresupuesto(num) {
    try {
        var p = num.toFixed(2).split(".");
        return "$" + p[0].split("").reverse().reduce(function (acc, num, i, orig) {
            return num + (i && !(i % 3) ? "," : "") + acc;
        }, "") + "." + p[1];
    } catch (e) {

    }
    
}

var GuardarPresupuesto = function () {     
    //datapicker desactiva el binding...
    viewModel.PresupuestoNuevo.FechaInicio(document.getElementById("fechaI").value);
    viewModel.PresupuestoNuevo.FechaFin(document.getElementById("fechaF").value);

    var presupuesto = ko.mapping.toJS(viewModel.PresupuestoNuevo);
    $.ajax({
        type: "POST",
        url: "AdmonPresupuesto.aspx/GuardarPresupuesto",
        data: "{'presupuestoJSON':'" + ko.mapping.toJSON(presupuesto) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                var presupuestoJS = data.d.presupuesto;
                viewModel.PresupuestoActual.push(ko.mapping.fromJS(presupuestoJS));
                viewModel.HayPresupuestoActual(true);                         
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

var Editar = function (presupuesto) {
    viewModel.PresupuestoNuevo.Pre_ID(presupuesto.Pre_ID());
    //datapicker desactiva el binding...
    document.getElementById("fechaI").value = presupuesto.FechaInicio();
    document.getElementById("fechaF").value = presupuesto.FechaFin()

    viewModel.PresupuestoNuevo.MontoOriginal(presupuesto.MontoOriginal());
    viewModel.PresupuestoNuevo.Concepto(presupuesto.Concepto());
    viewModel.Editando(true);
};

var EditarPresupuesto = function () {
    //datapicker desactiva el binding...
    viewModel.PresupuestoNuevo.FechaInicio(document.getElementById("fechaI").value);
    viewModel.PresupuestoNuevo.FechaFin(document.getElementById("fechaF").value);

    var presupuesto = ko.mapping.toJS(viewModel.PresupuestoNuevo);

    $.ajax({
        type: "POST",
        url: "AdmonPresupuesto.aspx/EditarPresupuesto",
        data: "{'presupuestoJSON':'" + ko.mapping.toJSON(presupuesto) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                var presupuestoJS = data.d.presupuesto;
                viewModel.PresupuestoActual.pop();
                viewModel.PresupuestoActual.push(ko.mapping.fromJS(presupuestoJS));
                Cancelar();
                viewModel.alertMessage("Presupuesto modificado correctamente.");
                $('#alertModal').modal('show');
            } else {
                viewModel.alertMessage("Presupuesto no modificado.");
                $('#alertModal').modal('show');
            }
        },
        error: function (error) {
            viewModel.alertMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var Eliminar = function (Presupuesto) {
    viewModel.Eliminando(true);
    viewModel.PresupuestoNuevo.Pre_ID(Presupuesto.Pre_ID());
    viewModel.modalMessage("Esta seguro que desea eliminar el presupuesto?");
    $('#alertModal').modal('show');
};

var EliminarPresupuesto = function () {
    $.ajax({
        type: "POST",
        url: "AdmonPresupuesto.aspx/EliminarPresupuesto",
        data: "{'id':'" + viewModel.PresupuestoNuevo.Pre_ID() + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d.valid) {
                viewModel.PresupuestoActual.pop();
                viewModel.alertMessage("Presupuesto eliminado correctamente.");
                viewModel.alertSuccess(true);
                viewModel.PresupuestoNuevo.Pre_ID(-1);
                viewModel.Eliminando(false);
                viewModel.HayPresupuestoActual(false);
            }
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
};

var Cancelar = function () {
    document.getElementById("fechaI").value = "";
    document.getElementById("fechaF").value = "";
    viewModel.PresupuestoNuevo.MontoOriginal(0);
    viewModel.PresupuestoNuevo.Concepto("");
    viewModel.Editando(false);
};

var hideModal = function () {
    viewModel.alertSuccess(false);
    viewModel.Eliminando(false);
};