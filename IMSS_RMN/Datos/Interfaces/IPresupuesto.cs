using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface IPresupuesto
    {
        bool agregar_presupuesto(clsPresupuesto pre);

        bool eliminar_presupuesto(int clave_pre);

        decimal actualizarPresupuesto(clsPresupuesto presupuesto, decimal costo);

        clsPresupuesto getPresupuesto();

        List<clsPresupuesto> getPresupuestos();

        bool modificar_presupuesto(clsPresupuesto pres);
    }
}