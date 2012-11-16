<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPresupuesto.aspx.cs" Inherits="IMSS_RMN.AdmonPresupuesto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Formulario para la Administración del Presupuesto</h4>
    <div class="form-horizontal">
        <div class="span6 offset3">
            <h2>
                <label class="control-label">
                    Partida</label>
                <div class="controls">
                    <asp:TextBox data-bind="value: Partida" ID="txtPartida" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Núm. Contrato</label>
                <div class="controls">
                    <asp:TextBox data-bind="value: Num_contrato" ID="txtNumContrato" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Concepto</label>
                <div class="controls">
                    <textarea data-bind="value: Concepto" rows="3" class="input-large"></textarea>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Vigencia del Contrato</label>
                <div class="controls">
                    <asp:TextBox data-bind="value: Vigencia" ID="TextBox3" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Fecha</label>
                <div class="controls">
                    <asp:TextBox data-bind="value: Ano" ID="TextBox4" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Monto</label>
                <div class="controls">
                    <asp:TextBox data-bind="value: Monto" ID="TextBox5" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2 class="centrado">
                <asp:Button ID="btnAgregarPres" runat="server" Text="Agregar Nuevo Presupuesto" class="btn btn-primary" data-bind="click: GuardarPresupuesto" />
            </h2>
        </div>
    </div>
    <%-- Modal Alert --%>
    <div id="alertModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header centrado">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;</button>
            <h3 id="myModalLabel">
                Mensaje</h3>
        </div>
        <div class="modal-body">
            <p class="centrado" data-bind="text: alertMessage">
            </p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">
                OK</button>
        </div>
    </div>
    <script src="JS/ViewModels/PresupuestoViewModel.js" type="text/javascript"></script>
</asp:Content>