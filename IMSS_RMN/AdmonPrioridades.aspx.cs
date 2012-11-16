using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.ViewModels;

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

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}