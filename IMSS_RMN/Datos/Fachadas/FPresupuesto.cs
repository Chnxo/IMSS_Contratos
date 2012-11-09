using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FPresupuesto : IPresupuesto
    {
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