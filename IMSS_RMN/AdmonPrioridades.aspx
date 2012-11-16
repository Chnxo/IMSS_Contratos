<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPrioridades.aspx.cs" Inherits="IMSS_RMN.AdmonPrioridades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado" >
        Formulario para la Administración de la Prioridad</h4>
    <div class="form-horizontal">
        <div class="span6 offset3">
            <h2>
                <label class="control-label">
                    Nombre</label>
                <div class="controls">
                    <asp:TextBox ID="txtPartida" runat="server" class="input-medium"></asp:TextBox>
                </div>
            </h2>
            <h2 class="centrado">
                <asp:Button ID="btnAgregarPrioridad" runat="server" Text="Agregar Nueva Prioridad"
                    class="btn btn-primary" />
            </h2>
        </div>
    </div>
</asp:Content>