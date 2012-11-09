using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface IAdministrador
    {
        void agregar_administrador(Administrador adm);

        List<Administrador> allAdministradores();

        void modificar_administrador(Administrador adm);
    }
}