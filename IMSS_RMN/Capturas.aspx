<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="Capturas.aspx.cs" Inherits="IMSS_RMN.Capturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        label
        {
            display: block;
        }
        .validationMessage
        {
            color: Red;
        }
        .customMessage
        {
            color: Orange;
        }
        ​</style>
    <h4 class="centrado">
        Control de pacientes con subrogación de estudio de Resonacia Magnética Nuclear</h4>
    <div>
        <div class="form-horizontal">
            <div class="row-fluid">
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Núm. Contrato</label>
                        <div class="controls">
                            <asp:TextBox ID="numContrato" runat="server" class="input-mini"></asp:TextBox>
                        </div>
                    </h2>
                </div>
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Presupuesto</label>
                        <div class="controls">
                            <asp:TextBox ID="presupuesto" runat="server" class="input-medium"></asp:TextBox>
                        </div>
                    </h2>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Fecha de Solicitud</label>
                        <div class="controls">
                            <asp:TextBox ID="fechaSolicitud" runat="server" class="input-medium"></asp:TextBox>
                        </div>
                    </h2>
                </div>
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Fecha de Realización</label>
                        <div class="controls">
                            <asp:TextBox ID="fechaRealizacion" runat="server" class="input-medium"></asp:TextBox>
                        </div>
                    </h2>
                </div>
            </div>
            <div class="span6 offset3">
                <h2>
                    <label class="control-label">
                        Nombre del Paciente</label>
                    <div class="controls">
                        <asp:TextBox data-bind="value: Paciente.Nombre" ID="nombrePaciente" runat="server"
                            class="input-medium"></asp:TextBox>
                        <%--<span class="validationMessage" style="display:none;"></span>--%>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Apellido Paterno</label>
                    <div class="controls">
                        <asp:TextBox data-bind="value: Paciente.Ape_pat" ID="apellidoPaterno" runat="server"
                            class="input-medium"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Fecha de Materno</label>
                    <div class="controls">
                        <asp:TextBox data-bind="value: Paciente.Ape_mat" ID="apellidoMaterno" runat="server"
                            class="input-medium"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Afiliación</label>
                    <div class="controls">
                        <asp:TextBox data-bind="value: Paciente.Afiliacion" ID="afiliacion" runat="server"
                            class="input-medium"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Agregado</label>
                    <div class="controls">
                        <asp:TextBox ID="agregado" runat="server" class="input-medium"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Número de Teléfono</label>
                    <div class="controls">
                        <asp:TextBox data-bind="value: Paciente.Num_tel" ID="numeroTelefono" runat="server"
                            class="input-medium"></asp:TextBox>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Tipo de Estudio</label>
                    <div class="controls">
                        <asp:DropDownList ID="tipoEstudio" runat="server" class="input-xlarge">
                            <asp:ListItem>Extremidades Simple y Contrastada</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Prioridad del Estudio</label>
                    <div class="controls">
                        <asp:DropDownList ID="prioridadEstudio" runat="server" class="input-medium">
                            <asp:ListItem>Urgente</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Observaciones</label>
                    <div class="controls">
                        <textarea rows="3" class="input-large"></textarea>
                    </div>
                </h2>
                <h2 class="centrado">
                    <asp:Button ID="agregar" runat="server" Text="Agregar Datos del Estudio" class="btn btn-primary"
                        data-bind="click: GuardarPaciente" />
                    <asp:Button ID="modificar" runat="server" Text="Modificar Datos" class="btn" />
                    <asp:Button ID="Button1" runat="server" Text="Test Get All" class="btn" 
                        data-bind="click: TestGA"/>
                </h2>
            </div>
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
    <script src="JS/ViewModels/CapturasViewModel.js" type="text/javascript"></script>
</asp:Content>