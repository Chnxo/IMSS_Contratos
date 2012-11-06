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

namespace IMSS_RMN
{
    public partial class Capturas : System.Web.UI.Page
    {
        [WebMethod]
        public static CapturasViewModel CargarViewModel()
        {
            Fachada fachada = Fachada.getFachada();
            CapturasViewModel cvm = new CapturasViewModel();
            try
            {
                cvm.Prioridades = fachada.getPrioridades();
                cvm.TipoEstudios = fachada.getTiposEstudios();
            }
            catch { }
            
            return cvm;
        }

        [WebMethod]
        public static bool GuardarEstudio(string pacienteJSON, string estudioJSON)
        {
            Fachada fachada = Fachada.getFachada();
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                int fk_afiliacion = fachada.agregar_paciente(paciente);
                if (fk_afiliacion != 0)
                {
                    clsEstudio estudio = JsonConvert.DeserializeObject<clsEstudio>(estudioJSON);
                    estudio.Fk_Afiliacion = fk_afiliacion.ToString();
                    if (fachada.agregar_estudio(estudio))
                    {
                        return true;
                    }
                    else
                    {
                        fachada.eliminar_paciente(paciente);
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