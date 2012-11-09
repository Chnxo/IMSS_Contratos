using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FPacientes:IPacientes
    {
        public int agregar_paciente(clsPaciente pac)
        {
            try
            {
                object[] paciente = new object[5];
                paciente[0] = pac.Afiliacion;
                paciente[1] = pac.Ape_pat;
                paciente[2] = pac.Ape_mat;
                paciente[3] = pac.Nombre;
                paciente[4] = pac.Num_tel;

                return Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.connString, "agr_pac_RMN", paciente));
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public List<clsPaciente> allPacientes()
        {
            throw new NotImplementedException();
        }

        public bool eliminar_paciente(int id)
        {
            throw new NotImplementedException();
        }

        public void modificar_paciente(clsPaciente paci)
        {
            throw new NotImplementedException();
        }
    }
}