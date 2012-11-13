﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.Datos.Interfaces;
using IMSS_RMN.ViewModels;
using Newtonsoft.Json;

namespace IMSS_RMN
{
    public partial class Capturas : System.Web.UI.Page
    {
        private static IEstudio iEstudio = new FEstudio();
        private static IPacientes iPacientes = new FPacientes();
        private static IPresupuesto iPresupuesto = new FPresupuesto();
        private static IPrioridad iPrioridad = new FPrioridad();
        private static ITiposEstudios iTiposEstudios = new FTiposEstudios();

        [WebMethod]
        public static CapturasViewModel CargarViewModel()
        {
            CapturasViewModel cvm = new CapturasViewModel();
            try
            {
                cvm.Presupuesto = iPresupuesto.getPresupuesto();
                cvm.Prioridades = iPrioridad.getPrioridades();
                cvm.TipoEstudios = iTiposEstudios.getTiposEstudios();
            }
            catch { }

            return cvm;
        }

        [WebMethod]
        public static decimal GuardarEstudio(string pacienteJSON, string estudioJSON, string presupuestoJSON, string costo)
        {
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                int fk_afiliacion = iPacientes.agregar_paciente(paciente);
                if (fk_afiliacion > 0)
                {
                    clsEstudio estudio = JsonConvert.DeserializeObject<clsEstudio>(estudioJSON);
                    estudio.Fk_Afiliacion = fk_afiliacion.ToString();
                    int idEstudio = iEstudio.agregar_estudio(estudio);
                    if (idEstudio > 0)
                    {
                        clsPresupuesto presupuesto = JsonConvert.DeserializeObject<clsPresupuesto>(presupuestoJSON);
                        decimal nuevoMonto = iPresupuesto.actualizarPresupuesto(presupuesto, Convert.ToDecimal(costo));
                        if (nuevoMonto == 0.0M)
                        {
                            iEstudio.eliminar_estudio(idEstudio);
                            iPacientes.eliminar_paciente(fk_afiliacion);
                            
                        }
                        return nuevoMonto;
                    }
                    else
                    {
                        iPacientes.eliminar_paciente(fk_afiliacion);
                        return 0.0M;
                    }
                }
                return 0.0M;
            }
            catch (Exception)
            {
                return 0.0M;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}