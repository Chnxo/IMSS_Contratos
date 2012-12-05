<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPrioridades.aspx.cs" Inherits="IMSS_RMN.AdmonPrioridades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="centrado">
        Administración de la Prioridad</h4>
    <div class="form-horizontal">
        <div class="span6 offset3">
            <table class="table table-striped table-bordered">
                <thead class="centrado">
                    <tr>
                        <th colspan="2">
                            Nombre
                        </th>
                    </tr>
                </thead>
                <tbody class="centrado">
                    <!-- ko foreach: Prioridades -->
                    <tr>
                        <td data-bind="text: Cal_Nombre">
                        </td>
                        <td>
                            <i class="icon-pencil"></i>
                            <i class="icon-remove"></i>
                        </td>
                    </tr>
                    <!-- /ko -->
                </tbody>
            </table>
            <h2 class="centrado">
                <asp:Button ID="btnAgregarPrioridad" runat="server" Text="Agregar Nueva Prioridad"
                    class="btn btn-primary" />
            </h2>
        </div>
    </div>
    <script src="JS/ViewModels/PrioridadViewModel.js" type="text/javascript"></script>
</asp:Content>