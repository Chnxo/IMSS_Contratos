using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface ICapturista
    {
        void agregar_capturista(Capturista cap);

        List<Capturista> allCapturistas();

        void modificar_capturista(Capturista cap);
    }
}