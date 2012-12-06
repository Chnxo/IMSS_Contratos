using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.ViewModels;
using Newtonsoft.Json;

namespace IMSS_RMN
{
    public partial class AdmonPrioridades : System.Web.UI.Page
    {
        [WebMethod]
        public static PrioridadViewModel CargarViewModel()
        {
            PrioridadViewModel pvm = new PrioridadViewModel();
            try
            {
                pvm.Prioridades = FPrioridad.Instancia().getPrioridades();
            }
            catch { }

            return pvm;
        }

        [WebMethod]
        public static object EliminarPrioridad(string clave)
        {
            if (FPrioridad.Instancia().eliminar_prioridad(Convert.ToInt32(clave)))
            {
                return (new { valid = true, prioridades = FPrioridad.Instancia().getPrioridades() });
            }
            else
            {
                return (new { valid = false });
            }
        }

        [WebMethod]
        public static object GuardarPrioridad(string prioridadJSON)
        {
            clsPrioridad prioridad = JsonConvert.DeserializeObject<clsPrioridad>(prioridadJSON);
            if (FPrioridad.Instancia().agregar_Prioridad(prioridad))
            {
                return (new { valid = true, prioridades = FPrioridad.Instancia().getPrioridades() });
            }
            else
            {
                return (new { valid = false, message = "Error :(" });
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}