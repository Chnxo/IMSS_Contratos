<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true" CodeBehind="ReportesTiposEstudios.aspx.cs" Inherits="IMSS_RMN.ReportesTiposEstudios" %>

<%--<%@ Page Title="" Language="C#" MasterPageFile="~/MP_Principal.Master" AutoEventWireup="true"
    CodeBehind="AdmonPresupuesto.aspx.cs" Inherits="IMSS_RMN.AdmonPresupuesto" %>--%>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>
        <center> <asp:Button ID="bntRepTiposEst" runat="server" 
            Text="Ver todos los tipos de Estudios" onclick="bntRepTiposEst_Click" class="btn"/>
        <asp:Button ID="btnRepDesaparece" runat="server" Text="Ocultar Reporte" 
            onclick="btnRepDesaparece_Click" class="btn" /></center>
        </h2>

        <h2>
        <center><CR:CrystalReportViewer ID="ReporteEstudios" runat="server" 
        AutoDataBind="True" GroupTreeImagesFolderUrl="" 
        ReportSourceID="Crs1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="1104px" Visible="False" />

        <CR:CrystalReportSource ID="Crs1" runat="server">
        <Report FileName="Reportes\ReporteEstudios.rpt">
        </Report>
        </CR:CrystalReportSource></center>
        </h2>

    </div>
</asp:Content>
