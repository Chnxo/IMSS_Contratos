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
            ko.applyBindings(viewModel);
        },
        error: function (error) {
        }
    });
});