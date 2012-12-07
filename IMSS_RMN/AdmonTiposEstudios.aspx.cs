using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.ViewModels;
using IMSS_RMN.Datos.Fachadas;
using Newtonsoft.Json;

namespace IMSS_RMN
{
    public partial class AdmonTiposEstudios : System.Web.UI.Page
    {
        [WebMethod]
        public static TiposEstudioViewModel CargarViewModel()
        {
            TiposEstudioViewModel tevm = new TiposEstudioViewModel();
            try
            {
                tevm.TipoEstudios = FTiposEstudios.Instancia().getTiposEstudios();
            }
            catch { }
            return tevm;
        }

        [WebMethod]
        public static object GuardarTipoEstudio(string tipoEstudioJSON)
        {
            clsTipoEstudio tipoEstudio = JsonConvert.DeserializeObject<clsTipoEstudio>(tipoEstudioJSON);
            if (FTiposEstudios.Instancia().guardar_tipo_estudio(tipoEstudio))
            {
                return (new { valid = true, tiposEstudios = FTiposEstudios.Instancia().getTiposEstudios() });
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