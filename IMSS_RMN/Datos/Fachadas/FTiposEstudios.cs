using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using System.Data;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FTiposEstudios:ITiposEstudios
    {
        private static FTiposEstudios ftiposestudios = new FTiposEstudios();

        private FTiposEstudios()
        {

        }

        public static FTiposEstudios Instancia()
        {
            return ftiposestudios;
        }

        public bool guardar_tipo_estudio(clsTipoEstudio nTipo)
        {
            try
            {
                object[] tipoEstudio = new object[3];
                tipoEstudio[0] = nTipo.Id_tip_est;
                tipoEstudio[1] = nTipo.Tip_est_nombre;
                tipoEstudio[2] = nTipo.Costo;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_tip_est_RMN", tipoEstudio);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool eliminar_tipo_Estudio(int clave_tip_est)
        {
            try
            {
                object clave = clave_tip_est;
                SqlHelper.ExecuteNonQuery(SqlHelper.connString,"eli_tipo_est_RMN",clave);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<clsTipoEstudio> getTiposEstudios()
        {
            List<clsTipoEstudio> tipoEstudios = new List<clsTipoEstudio>();
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "all_tip_est_RMN").Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                clsTipoEstudio tipoEstudio = new clsTipoEstudio();
                tipoEstudio.Id_tip_est = Convert.ToInt32(dt.Rows[i]["Tip_Est_Id"]);
                tipoEstudio.Tip_est_nombre = dt.Rows[i]["Tip_Est_Nombre"].ToString();
                tipoEstudio.Costo = Convert.ToDecimal(dt.Rows[i]["Tip_Est_Costo"]);
                tipoEstudios.Add(tipoEstudio);
            }
            return tipoEstudios;
        }

        public void modificar_tipo_estudio(clsTipoEstudio tp)
        {
            throw new NotImplementedException();
        }
    }
}