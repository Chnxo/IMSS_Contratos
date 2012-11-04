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
            Estudio = new clsEstudio();
            TipoEstudio = new clsTipoEstudio();
            Prioridad = new clsPrioridad();
        }

        public clsPaciente Paciente { get; set; }
        public clsPresupuesto Presupuesto { get; set; }
        public clsEstudio Estudio { get; set; }
        public clsTipoEstudio TipoEstudio { get; set; }
        public clsPrioridad Prioridad { get; set; }
    }
}