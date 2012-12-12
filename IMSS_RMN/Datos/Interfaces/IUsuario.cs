using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.Datos.Interfaces
{
    interface IUsuario
    {
        bool GuardarUsuario(Usuario p);
        bool EliminarUsuario(Usuario p);
        List<Usuario> GetUsuarios();
    }
}
