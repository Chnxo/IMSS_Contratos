using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface IPrioridad
    {
        bool agregar_Prioridad(clsPrioridad pri);

        bool eliminar_prioridad(int clave_pri);

        List<clsPrioridad> getPrioridades();

        void modificar_prioridad(clsPrioridad prio);
    }
}