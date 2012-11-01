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
        public static bool GuardarPaciente(string pacienteJSON)
        {
            try
            {
                clsPaciente paciente = JsonConvert.DeserializeObject<clsPaciente>(pacienteJSON);
                Fachada fachada = Fachada.getFachada();
                fachada.agregar_paciente(paciente);
                return true;
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