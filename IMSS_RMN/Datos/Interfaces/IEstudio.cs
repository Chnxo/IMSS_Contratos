using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface IEstudio
    {
        int agregar_estudio(clsEstudio est);

        List<clsEstudio> allEstudios();

        void eliminar_estudio(int ID);

        List<clsEstudio> getEstudios();

        void modificar_estudio(clsEstudio estu);
    }
}