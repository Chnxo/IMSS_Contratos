using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos.Fachadas;
using IMSS_RMN.Dominio;

namespace IMSS_RMN
{
    public partial class Login : System.Web.UI.Page
    {
        //[WebMethod]
        //public void IniciarSesion(string usuarioJSON)
        //{
        //    Session.Add("username",
        //}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario us = new Usuario(txtUsuario.Text,txtContra.Text);
            if (FSesion.Instancia().Identificar(us))
            {
                Session.Add("usuario", us);

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}