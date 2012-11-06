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
            TipoEstudios = new List<clsTipoEstudio>();
            Prioridades = new List<clsPrioridad>();
        }

        public clsPaciente Paciente { get; set; }
        public clsPresupuesto Presupuesto { get; set; }
        public clsEstudio Estudio { get; set; }
        public List<clsTipoEstudio> TipoEstudios { get; set; }
        public List<clsPrioridad> Prioridades { get; set; }
    }
}