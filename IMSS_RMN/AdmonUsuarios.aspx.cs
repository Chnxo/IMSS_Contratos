using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.Dominio;
using IMSS_RMN.ViewModels;

namespace IMSS_RMN
{
    public partial class AdmonUsuarios : System.Web.UI.Page
    {
        [WebMethod]
        public static UsuariosViewModel CargarViewModel()
        {
            UsuariosViewModel uvm = new UsuariosViewModel();
            try
            {
                uvm.Usuarios = FUsuario.Instancia().GetUsuarios();
            }
            catch { }
            return uvm;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}