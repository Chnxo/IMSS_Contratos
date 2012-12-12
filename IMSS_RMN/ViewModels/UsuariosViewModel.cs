using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.ViewModels
{
    public class UsuariosViewModel
    {
        public UsuariosViewModel()
        {
            Usuario = new Usuario();
            Usuarios = new List<Usuario>();
        }

        public Usuario Usuario { get; set; }
        public List<Usuario> Usuarios { get; set; }
    }
}