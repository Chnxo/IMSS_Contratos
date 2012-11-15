using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FAdministrador:IAdministrador
    {
        private static FAdministrador fadministrador = new FAdministrador();
        
        private FAdministrador()
        {

        }

        public static FAdministrador Instancia()
        {
            return fadministrador;
        }

        public void agregar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }

        public List<Administrador> allAdministradores()
        {
            throw new NotImplementedException();
        }

        public void modificar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }
    }
}