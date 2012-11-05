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
            CapturasViewModel cvm = new CapturasViewModel();
            return cvm;
        }

        [WebMethod]
        public static bool GuardarEstudio(string pacienteJSON, string estudioJSON)
        {
            Fachada fachada = Fachada.getFachada();
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                if (fachada.agregar_paciente(paciente))
                {
                    clsEstudio estudio = JsonConvert.DeserializeObject<clsEstudio>(estudioJSON);
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

        [WebMethod]
        public static void TestGetAll()
        {
            Fachada fachada = Fachada.getFachada();
            fachada.allEstudios();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}