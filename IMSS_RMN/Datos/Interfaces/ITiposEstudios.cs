using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface ITiposEstudios
    {
        bool guardar_tipo_estudio(clsTipoEstudio nTipo);

        bool eliminar_tipo_Estudio(int clave_tip_est);

        List<clsTipoEstudio> getTiposEstudios();

        void modificar_tipo_estudio(clsTipoEstudio tp);
    }
}