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
                pvm.HayPresupuestoActual = true;
            }
            catch { }
            return pvm;
        }

        [WebMethod]
        public static object GuardarPresupuesto(string presupuestoJSON)
        {
            clsPresupuesto presupuesto = JsonConvert.DeserializeObject<clsPresupuesto>(presupuestoJSON);
            presupuesto.MontoActual = presupuesto.MontoOriginal;
            if (FPresupuesto.Instancia().agregar_presupuesto(presupuesto))
            {
                return (new { valid = true, presupuesto = FPresupuesto.Instancia().getPresupuesto() });
            }
            else
            {
                return (new { valid = false, message = "Error" });
            }
            
        }

        [WebMethod]
        public static object EditarPresupuesto(string presupuestoJSON)
        {
            clsPresupuesto presupuesto = JsonConvert.DeserializeObject<clsPresupuesto>(presupuestoJSON);
            if (FPresupuesto.Instancia().modificar_presupuesto(presupuesto))
            {
                return (new { valid = true, presupuesto = FPresupuesto.Instancia().getPresupuesto() });
            }
            else
            {
                return (new { valid = false, message = "Error" });
            }
        }

        [WebMethod]
        public static object EliminarPresupuesto(string id)
        {
            if (FPresupuesto.Instancia().eliminar_presupuesto(Convert.ToInt32(id)))
            {
                return (new { valid = true });
            }
            else
            {
                return (new { valid = false });
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}