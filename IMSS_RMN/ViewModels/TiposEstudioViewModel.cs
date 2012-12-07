using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.ViewModels
{
    public class TiposEstudioViewModel
    {
        public TiposEstudioViewModel()
        {
            TipoEstudio = new clsTipoEstudio();
            TipoEstudios = new List<clsTipoEstudio>();
        }

        public clsTipoEstudio TipoEstudio { get; set; }
        public List<clsTipoEstudio> TipoEstudios { get; set; }
    }
}