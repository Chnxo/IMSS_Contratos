using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FPrioridad : IPrioridad
    {
        private static FPrioridad fprioridad = new FPrioridad();

        private FPrioridad()
        {
        }

        public static FPrioridad Instancia()
        {
            return fprioridad;
        }

        public bool agregar_Prioridad(clsPrioridad pri)
        {
            try
            {
                object[] prioridad = new object[2];
                prioridad[0] = pri.Pri_id;
                prioridad[1] = pri.Cal_Nombre;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_tip_Prioridad_RMN", prioridad);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool eliminar_prioridad(int clave_pri)
        {
            try
            {
                object clave = clave_pri;
                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "eli_prioridad_RMN", clave);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<clsPrioridad> getPrioridades()
        {
            List<clsPrioridad> prioridades = new List<clsPrioridad>();
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "all_tip_prioridad_RMN").Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                clsPrioridad prioridad = new clsPrioridad();
                prioridad.Pri_id = Convert.ToInt32(dt.Rows[i]["Pri_Id"]);
                prioridad.Cal_Nombre = dt.Rows[i]["Pri_Nombre"].ToString();
                prioridades.Add(prioridad);
            }
            return prioridades;
        }

        public void modificar_prioridad(clsPrioridad prio)
        {
            throw new NotImplementedException();
        }
    }
}