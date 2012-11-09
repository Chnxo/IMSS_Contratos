using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMSS_RMN.Datos.Interfaces
{
    public interface IPacientes
    {
        int agregar_paciente(clsPaciente pac);

        List<clsPaciente> allPacientes();

        bool eliminar_paciente(int id);

        void modificar_paciente(clsPaciente paci);
    }
}