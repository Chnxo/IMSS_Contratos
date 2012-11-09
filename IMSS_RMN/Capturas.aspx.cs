using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos;
using IMSS_RMN.ViewModels;
using Newtonsoft.Json;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN
{
    public partial class Capturas : System.Web.UI.Page
    {
        static IPrioridad iPrioridad;
        static ITiposEstudios iTiposEstudios;
        static IPacientes iPacientes;
        static IEstudio iEstudio;

        [WebMethod]
        public static CapturasViewModel CargarViewModel()
        {
            Conexion fachada = Conexion.getFachada();
            CapturasViewModel cvm = new CapturasViewModel();
            try
            {
                cvm.Prioridades = iPrioridad.getPrioridades();
                cvm.TipoEstudios = iTiposEstudios.getTiposEstudios();
            }
            catch { }
            
            return cvm;
        }

        [WebMethod]
        public static bool GuardarEstudio(string pacienteJSON, string estudioJSON)
        {
            //Conexion fachada = Conexion.getFachada();
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                int fk_afiliacion = iPacientes.agregar_paciente(paciente);
                if (fk_afiliacion > 0)
                {
                    clsEstudio estudio = JsonConvert.DeserializeObject<clsEstudio>(estudioJSON);
                    estudio.Fk_Afiliacion = fk_afiliacion.ToString();
                    if (iEstudio.agregar_estudio(estudio))
                    {
                        return true;
                    }
                    else
                    {
                        iPacientes.eliminar_paciente(fk_afiliacion);
                        return false;
                    }
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}