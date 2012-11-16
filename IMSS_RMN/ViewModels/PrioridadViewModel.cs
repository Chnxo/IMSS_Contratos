using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.ViewModels
{
    public class PrioridadViewModel
    {
        public PrioridadViewModel()
        {
            Prioridad = new clsPrioridad();
            Prioridades = new List<clsPrioridad>();
        }

        public clsPrioridad Prioridad { get; set; }
        public List<clsPrioridad> Prioridades { get; set; }
    }
}