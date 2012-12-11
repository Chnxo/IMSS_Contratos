using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.ViewModels
{
    public class PresupuestoViewModel
    {
        public PresupuestoViewModel()
        {
            PresupuestoNuevo = new clsPresupuesto();
            PresupuestoActual = new List<clsPresupuesto>();
            HayPresupuestoActual = false;
        }

        public clsPresupuesto PresupuestoNuevo { get; set; }
        public List<clsPresupuesto> PresupuestoActual { get; set; }
        public bool HayPresupuestoActual { get; set; }
    }
}