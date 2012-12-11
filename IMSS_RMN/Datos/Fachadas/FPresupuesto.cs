using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FPresupuesto : IPresupuesto
    {
        private static FPresupuesto fpresupuesto = new FPresupuesto();

        private FPresupuesto()
        {

        }

        public static FPresupuesto Instancia()
        {
            return fpresupuesto;
        }

        public decimal actualizarPresupuesto(clsPresupuesto presupuesto, decimal costo)
        {
            try
            {
                object[] presupuestoACT = new object[2];
                //presupuestoACT[0] = presupuesto.ID;
                //presupuestoACT[1] = costo;

                return Convert.ToDecimal(SqlHelper.ExecuteScalar(SqlHelper.connString, "actualizarPresupuesto", presupuestoACT));
            }
            catch (Exception)
            {
                return 0.0M;
            }
        }

        public bool agregar_presupuesto(clsPresupuesto pre)
        {
            try
            {
                object[] presupuesto = new object[4];
                presupuesto[0] = pre.MontoOriginal;
                presupuesto[1] = pre.FechaInicio;
                presupuesto[2] = pre.FechaFin;
                presupuesto[3] = pre.Concepto;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_presupuesto_RMN", presupuesto);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }

        public bool eliminar_presupuesto(int clave_pre)
        {
            try
            {
                object id = clave_pre;
                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "eli_presupuesto", id);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public clsPresupuesto getPresupuesto()
        {
            clsPresupuesto presupuesto = new clsPresupuesto();
                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "getPresupuesto").Tables[0];

                presupuesto.Pre_ID = Convert.ToInt32(dt.Rows[0]["Pre_Id"]);
                presupuesto.MontoOriginal = Convert.ToDouble(dt.Rows[0]["montoOriginal"]);
                presupuesto.MontoActual = Convert.ToDouble(dt.Rows[0]["montoActual"]);
                presupuesto.FechaInicio = FormatearFecha(Convert.ToDateTime(dt.Rows[0]["fechaInicio"]));
                presupuesto.FechaFin = FormatearFecha(Convert.ToDateTime(dt.Rows[0]["fechaFin"]));
                presupuesto.Concepto = Convert.ToString(dt.Rows[0]["concepto"]);
            
            return presupuesto;
        }

        /// <summary>
        /// Le da el formato deseado a la fecha.
        /// </summary>
        /// <param name="fecha">Fecha a formatear</param>
        /// <returns></returns>
        private string FormatearFecha(DateTime fecha)
        {
            IsoDateTimeConverter formato = new IsoDateTimeConverter();
            formato.DateTimeFormat = "MM-dd-yyyy";
            
            string fechaInicio = JsonConvert.SerializeObject(fecha, formato);

            return JsonConvert.DeserializeObject(fechaInicio).ToString();
        }

        public List<clsPresupuesto> getPresupuestos()
        {
            throw new NotImplementedException();
        }

        public bool modificar_presupuesto(clsPresupuesto pres)
        {
            try
            {
                object[] presupuesto = new object[4];
                presupuesto[0] = pres.Pre_ID;
                presupuesto[1] = pres.FechaInicio;
                presupuesto[2] = pres.FechaFin;
                presupuesto[3] = pres.Concepto;

                SqlHelper.ExecuteDataset(SqlHelper.connString, "mod_presupuesto", presupuesto);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}