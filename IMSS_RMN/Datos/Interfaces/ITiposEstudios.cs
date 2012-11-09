using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface ITiposEstudios
    {
        void agregar_tipo_estudio(clsTipoEstudio nTipo);

        void eliminar_tipo_Estudio(int clave_tip_est);

        List<clsTipoEstudio> getTiposEstudios();

        void modificar_tipo_estudio(clsTipoEstudio tp);
    }
}