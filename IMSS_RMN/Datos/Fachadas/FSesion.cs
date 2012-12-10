using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FSesion : ISesion
    {
        private static FSesion fsesion = new FSesion();

        private FSesion()
        {

        }

        public static FSesion Instancia()
        {
            return fsesion;
        }

        public bool Identificar(Usuario us)
        {
            throw new NotImplementedException();
        }

        public void Loguear()
        {
            throw new NotImplementedException();
        }
    }
}