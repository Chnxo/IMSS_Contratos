using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

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
                presupuestoACT[0] = presupuesto.ID;
                presupuestoACT[1] = costo;

                return Convert.ToDecimal(SqlHelper.ExecuteScalar(SqlHelper.connString, "actualizarPresupuesto", presupuestoACT));
            }
            catch (Exception)
            {
                return 0.0M;
            }
        }

        public void agregar_presupuesto(clsPresupuesto pre)
        {
            object[] presupuesto = new object[5];
            presupuesto[0] = pre.Partida;
            presupuesto[1] = pre.Num_contrato;
            presupuesto[2] = pre.Concepto;
            presupuesto[3] = pre.Ano;
            presupuesto[4] = pre.Monto;
            presupuesto[5] = pre.Vigencia;

            SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_presupuesto_RMN", presupuesto);
        }

        public void eliminar_presupuesto(int clave_pre)
        {
            throw new NotImplementedException();
        }

        public clsPresupuesto getPresupuesto()
        {
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "getPresupuesto").Tables[0];

            clsPresupuesto presupuesto = new clsPresupuesto();
            presupuesto.ID = Convert.ToInt32(dt.Rows[0]["Pre_Id"]);
            presupuesto.Num_contrato = Convert.ToInt32(dt.Rows[0]["Pre_num_contrato"]);
            presupuesto.Monto = Convert.ToDecimal(dt.Rows[0]["Pre_Monto"]);

            return presupuesto;
        }

        public List<clsPresupuesto> getPresupuestos()
        {
            throw new NotImplementedException();
        }

        public void modificar_presupuesto(clsPresupuesto pres)
        {
            throw new NotImplementedException();
        }
    }
}