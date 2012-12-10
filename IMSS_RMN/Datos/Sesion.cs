using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.Datos
{
    public class Sesion
    {
        private static Sesion sesion = new Sesion();

        private Sesion()
        {

        }

        public Sesion Instancia()
        {
            return sesion;
        }

        public bool Validar(Usuario us)
        {
            return false;
        }
    }
}