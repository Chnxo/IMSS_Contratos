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
        public void agregar_tipo_estudio(clsTipoEstudio nTipo)
        {
            throw new NotImplementedException();
        }

        public void eliminar_tipo_Estudio(int clave_tip_est)
        {
            throw new NotImplementedException();
        }

        public List<clsTipoEstudio> getTiposEstudios()
        {
            List<clsTipoEstudio> tipoEstudios = new List<clsTipoEstudio>();
            DataTable dt = SqlHelper.ExecuteDataset(Conexion.connString, "all_tip_est_RMN").Tables[0];
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