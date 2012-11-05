using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace IMSS_RMN.Datos
{
    public sealed class Fachada : IDatos
    {
        private static string connString = "Data Source=pse020\\sqlexpress;Initial Catalog=IMSS_CSC;Integrated Security=True";
        private static Fachada laFachada = new Fachada();

        //private static string connString = "Data Source=EMELITH-HP;Initial Catalog=EjemploIMSS;Integrated Security=True";

        public Fachada()
        {
        }

        public static Fachada getFachada()
        {
            return laFachada;
        }

        #region Area RMN

        #region *Métodos de la clase Estudio*

        public bool agregar_estudio(clsEstudio est)
        {
            try
            {
                object[] estudio = new object[5];
                estudio[0] = est.Fecha_sol;
                estudio[1] = est.Fecha_rea;
                estudio[2] = est.Observacion;
                estudio[3] = est.Fk_tipo_id;
                estudio[4] = est.Fk_pri_id;
                estudio[5] = est.Fk_Afiliacion;

                SqlHelper.ExecuteNonQuery(connString, "agr_est_RMN", estudio);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }

        public List<clsEstudio> allEstudios()
        {
            List<clsEstudio> estudios = new List<clsEstudio>();
            DataTable dt = SqlHelper.ExecuteDataset(connString, "all_estudios_RMN").Tables[0];
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                clsEstudio estu = new clsEstudio();
                estu.Fecha_sol = dt.Rows[i]["Est_Fecha_sol"].ToString();
                estu.Fecha_rea = dt.Rows[i]["Est_Fecha_rea"].ToString();
                estu.Observacion = dt.Rows[i]["Est_Observaciones"].ToString();
                estu.Fk_tipo_id = Convert.ToInt32(dt.Rows[i]["Fk_Tipo_Id"]);
                estu.Fk_pri_id = Convert.ToInt32(dt.Rows[i]["Fk_Pri_Id"]);
                estu.Fk_Afiliacion = dt.Rows[i]["Fk_Pac_Afiliacion"].ToString();
                estudios.Add(estu);
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

        #endregion *Métodos de la clase Estudio*

        #region *Métodos de la clase Presupuesto*

        public void agregar_presupuesto(clsPresupuesto pre)
        {
            object[] presupuesto = new object[5];
            presupuesto[0] = pre.Partida;
            presupuesto[1] = pre.Num_contrato;
            presupuesto[2] = pre.Concepto;
            presupuesto[3] = pre.Ano;
            presupuesto[4] = pre.Monto;
            presupuesto[5] = pre.Vigencia;

            SqlHelper.ExecuteNonQuery(connString, "agr_presupuesto_RMN", presupuesto);
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

        #endregion *Métodos de la clase Presupuesto*

        #region *Métodos de la clase Prioridad*

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
            throw new NotImplementedException();
        }

        public void modificar_prioridad(clsPrioridad prio)
        {
            throw new NotImplementedException();
        }

        #endregion *Métodos de la clase Prioridad*

        #region *Métodos de la clase Tipos de Estudios*

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
            throw new NotImplementedException();
        }

        public void modificar_tipo_estudio(clsTipoEstudio tp)
        {
            throw new NotImplementedException();
        }

        #endregion *Métodos de la clase Tipos de Estudios*

        #region *Métodos de la classe Paciente*

        public bool agregar_paciente(clsPaciente pac)
        {
            try
            {
                object[] paciente = new object[5];
                paciente[0] = pac.Afiliacion;
                paciente[1] = pac.Ape_pat;
                paciente[2] = pac.Ape_mat;
                paciente[3] = pac.Nombre;
                paciente[4] = pac.Num_tel;

                SqlHelper.ExecuteNonQuery(connString, "agr_pac_RMN", paciente);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }

        public bool eliminar_paciente(clsPaciente pac)
        {
            throw new NotImplementedException();
        }

        public List<clsPaciente> allPacientes()
        {
            throw new NotImplementedException();
        }

        public void modificar_paciente(clsPaciente paci)
        {
            throw new NotImplementedException();
        }

        #endregion *Métodos de la classe Paciente*

        #endregion Area RMN

        #region Usuarios

        #region Administrador

        public void agregar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }

        public List<Administrador> allAdministradores()
        {
            throw new NotImplementedException();
        }

        public void modificar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }

        #endregion Administrador

        #region Capturista

        public void agregar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }

        public List<Capturista> allCapturistas()
        {
            throw new NotImplementedException();
        }

        public void modificar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }

        #endregion Capturista

        #endregion Usuarios
    }
}