<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="Capturas.aspx.cs" Inherits="IMSS_RMN.Capturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                            <input type="text" class="input-mini" />
                        </div>
                    </h2>
                </div>
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Presupuesto</label>
                        <div class="controls">
                            <input type="text" class="input-medium" />
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
                            <input type="text" class="input-medium" />
                        </div>
                    </h2>
                </div>
                <div class="span6">
                    <h2>
                        <label class="control-label">
                            Fecha de Realización</label>
                        <div class="controls">
                            <input type="text" class="input-medium" />
                        </div>
                    </h2>
                </div>
            </div>
            <div class="span6 offset3">
                <h2>
                    <label class="control-label">
                        Nombre del Paciente</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Apellido Paterno</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Fecha de Materno</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Afiliación</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Agregado</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Número de Teléfono</label>
                    <div class="controls">
                        <input type="text" class="input-medium" />
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Tipo de Estudio</label>
                    <div class="controls">
                        <select class="input-large">
                            <option>Extremidades Simple y Contrastada</option>
                        </select>
                    </div>
                </h2>
                <h2>
                    <label class="control-label">
                        Fecha de Solicitud</label>
                    <div class="controls">
                        <select class="input-large">
                            <option>Urgente</option>
                        </select>
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
                    <button class="btn btn-success">
                        Agregar Datos del Estudio</button>
                    <button class="btn">
                        Modificar Datos</button>
                </h2>
            </div>
        </div>
    </div>
</asp:Content>