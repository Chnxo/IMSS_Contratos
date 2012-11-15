using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using System.Data;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FEstudio : IEstudio
    {
        private static FEstudio festudio = new FEstudio();

        private FEstudio()
        {
                
        }

        public static FEstudio Instancia()
        {
            return festudio;
        }

        public int agregar_estudio(clsEstudio est)
        {
            try
            {
                object[] estudio = new object[6];
                estudio[0] = est.Fecha_sol;
                estudio[1] = est.Fecha_rea;
                estudio[2] = est.Observacion;
                estudio[3] = est.Fk_tipo_id;
                estudio[4] = est.Fk_pri_id;
                estudio[5] = est.Fk_Afiliacion;

                return Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.connString, "agr_est_RMN", estudio));
                //SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_est_RMN", estudio);
                //return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public List<clsEstudio> allEstudios()
        {
            List<clsEstudio> estudios = new List<clsEstudio>();
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "all_estudios_RMN").Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                clsEstudio estudio = new clsEstudio();
                estudio.Fecha_sol = dt.Rows[i]["Est_Fecha_sol"].ToString();
                estudio.Fecha_rea = dt.Rows[i]["Est_Fecha_rea"].ToString();
                estudio.Observacion = dt.Rows[i]["Est_Observaciones"].ToString();
                estudio.Fk_tipo_id = Convert.ToInt32(dt.Rows[i]["Fk_Tipo_Id"]);
                estudio.Fk_pri_id = Convert.ToInt32(dt.Rows[i]["Fk_Pri_Id"]);
                estudio.Fk_Afiliacion = dt.Rows[i]["Fk_Pac_Afiliacion"].ToString();
                estudios.Add(estudio);
            }

            return estudios;
        }

        public List<clsEstudio> getEstudios()
        {
            throw new NotImplementedException();
        }

        public void modificar_estudio(clsEstudio estu)
        {
            throw new NotImplementedException();
        }


        public void eliminar_estudio(int ID)
        {
            throw new NotImplementedException();
        }
    }
}