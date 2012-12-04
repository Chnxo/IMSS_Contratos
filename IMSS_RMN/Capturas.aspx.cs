using System;
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
        [WebMethod]
        public static CapturasViewModel CargarViewModel()
        {
            CapturasViewModel cvm = new CapturasViewModel();
            try
            {
                cvm.Presupuesto = FPresupuesto.Instancia().getPresupuesto();
                cvm.Prioridades = FPrioridad.Instancia().getPrioridades();
                cvm.TipoEstudios = FTiposEstudios.Instancia().getTiposEstudios();
            }
            catch { }

            return cvm;
        }

        [WebMethod]
        public static decimal GuardarEstudio(string pacienteJSON, string estudioJSON, string presupuestoJSON, string costo)
        {
            decimal MontoActual = FPresupuesto.Instancia().getPresupuesto().Monto;
            
            //Valida si hay presupuesto para el estudio
            if (MontoActual < Convert.ToDecimal(costo))
            {
                return 0.0M;
            }
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                int fk_afiliacion = FPacientes.Instancia().agregar_paciente(paciente);
                
                //valida si se agrego el paciente
                if (fk_afiliacion > 0)
                {
                    clsEstudio estudio = JsonConvert.DeserializeObject<clsEstudio>(estudioJSON);
                    estudio.Fk_Afiliacion = fk_afiliacion.ToString();
                    int idEstudio = FEstudio.Instancia().agregar_estudio(estudio);

                    //valida si se agrego el estudio
                    if (idEstudio > 0)
                    {
                        clsPresupuesto presupuesto = JsonConvert.DeserializeObject<clsPresupuesto>(presupuestoJSON);
                        decimal nuevoMonto = FPresupuesto.Instancia().actualizarPresupuesto(presupuesto, Convert.ToDecimal(costo));

                        //valida si se actualizo el presupuesto
                        if (nuevoMonto == 0.0M)
                        {
                            FEstudio.Instancia().eliminar_estudio(idEstudio);
                            FPacientes.Instancia().eliminar_paciente(fk_afiliacion);
                        }
                        return nuevoMonto;
                    }
                    else
                    {
                        FPacientes.Instancia().eliminar_paciente(fk_afiliacion);
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