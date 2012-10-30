using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.ViewModels
{
    public class CapturasViewModel
    {
        public CapturasViewModel()
        {
            Paciente = new clsPaciente();
            Presupuesto = new clsPresupuesto();
        }

        public clsPaciente Paciente { get; set; }
        public clsPresupuesto Presupuesto { get; set; }
    }
}