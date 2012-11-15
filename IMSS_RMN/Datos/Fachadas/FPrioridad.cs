using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using System.Data;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FPrioridad:IPrioridad
    {
        private static FPrioridad fprioridad = new FPrioridad();

        private FPrioridad()
        {

        }

        public static FPrioridad Instancia()
        {
            return fprioridad;
        }

        public void agregar_Prioridad(clsPrioridad pri)
        {
            throw new NotImplementedException();
        }

        public void eliminar_prioridad(int clave_pri)
        {
            throw new NotImplementedException();
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