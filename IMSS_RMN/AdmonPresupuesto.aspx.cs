using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.ViewModels;
using Newtonsoft.Json;

namespace IMSS_RMN
{
    public partial class AdmonPresupuesto : System.Web.UI.Page
    {
        [WebMethod]
        public static PresupuestoViewModel CargarViewModel()
        {
            PresupuestoViewModel pvm = new PresupuestoViewModel();
            try
            {
                pvm.PresupuestoActual.Add(FPresupuesto.Instancia().getPresupuesto());
            }
            catch { }
            return pvm;
        }

        [WebMethod]
        public static bool GuardarPresupuesto(string presupuestoJSON)
        {
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}