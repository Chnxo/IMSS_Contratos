using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface ISesion
    {
        bool Identificar(Usuario us);
        void Loguear();
    }
}
