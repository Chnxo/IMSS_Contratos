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
            Presupuesto = new clsPresupuesto();
            Presupuestos = new List<clsPresupuesto>();
        }

        public clsPresupuesto Presupuesto { get; set; }
        public List<clsPresupuesto> Presupuestos { get; set; }
    }
}