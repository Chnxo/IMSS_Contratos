using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos;
using Newtonsoft.Json;
using IMSS_RMN.Datos.Fachadas;

namespace IMSS_RMN
{
    public partial class AdmonPresupuesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static clsPresupuesto CargarViewModel()
        {
            return new clsPresupuesto();
        }

        [WebMethod]
        public static bool GuardarPresupuesto(string presupuestoJSON)
        {
            try
            {
                clsPresupuesto presupuesto = JsonConvert.DeserializeObject<clsPresupuesto>(presupuestoJSON);
                //Fachada fachada = Fachada.getFachada();
                FPresupuesto.Instancia().agregar_presupuesto(presupuesto);//fachada.agregar_presupuesto(presupuesto);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}