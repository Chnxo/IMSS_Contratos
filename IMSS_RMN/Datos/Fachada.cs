using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.Datos
{
    public class Fachada:IDatos
    {
        #region Area RMN

        #region *Métodos de la clase Estudio*
        public void agregar_estudio(clsEstudio est)
        {
            throw new NotImplementedException();
        }

        public void modificar_estudio(clsEstudio estu)
        {
            throw new NotImplementedException();
        }

        public List<clsEstudio> getEstudios()
        {
            throw new NotImplementedException();
        }

        public List<clsEstudio> allEstudios()
        {
            throw new NotImplementedException();
        }

        #endregion

        #region *Métodos de la clase Presupuesto*
        public void agregar_presupuesto(clsPresupuesto pre)
        {
            throw new NotImplementedException();
        }

        public void modificar_presupuesto(clsPresupuesto pres)
        {
            throw new NotImplementedException();
        }

        public void eliminar_presupuesto(int clave_pre)
        {
            throw new NotImplementedException();
        }

        public List<clsPresupuesto> getPresupuestos()
        {
            throw new NotImplementedException();
        }

        #endregion

        #region *Métodos de la clase Prioridad*
        

        public void agregar_Prioridad(clsPrioridad pri)
        {
            throw new NotImplementedException();
        }

        public void modificar_prioridad(clsPrioridad prio)
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

        #endregion

        #region *Métodos de la clase Tipos de Estudios*
        

        public void agregar_tipo_estudio(clsTipoEstudio nTipo)
        {
            throw new NotImplementedException();
        }

        public void modificar_tipo_estudio(clsTipoEstudio tp)
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

        #endregion

        #region *Métodos de la classe Paciente*
        

        public void agregar_paciente(clsPaciente pac)
        {
            throw new NotImplementedException();
        }

        public void modificar_paciente(clsPaciente paci)
        {
            throw new NotImplementedException();
        }

        public List<clsPaciente> allPacientes()
        {
            throw new NotImplementedException();
        }

        #endregion

        #endregion

        #region Usuarios

        #region Administrador

        public void agregar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }

        public void modificar_administrador(Administrador adm)
        {
            throw new NotImplementedException();
        }

        public List<Administrador> allAdministradores()
        {
            throw new NotImplementedException();
        }

        #endregion

        #region Capturista

        public void agregar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }

        public void modificar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }

        public List<Capturista> allCapturistas()
        {
            throw new NotImplementedException();
        }

        #endregion

        #endregion
    }
}