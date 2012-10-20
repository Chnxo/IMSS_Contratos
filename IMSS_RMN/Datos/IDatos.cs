using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de IDatos
/// </summary>
public interface IDatos
{
    #region *Estudios RMN*
    void agregar_estudio(clsEstudio est);
    void modificar_estudio(clsEstudio estu);
    List<clsEstudio>getEstudios();
    List<clsEstudio> allEstudios();
    #endregion

    #region *Presupuestos RMN*
    void agregar_presupuesto(clsPresupuesto pre);
    void modificar_presupuesto(clsPresupuesto pres);
    void eliminar_presupuesto(int clave_pre);
    List<clsPresupuesto> getPresupuestos();
    #endregion

    #region *Prioridad RMN*
    void agregar_Prioridad(clsPrioridad pri);
    void modificar_prioridad(clsPrioridad prio);
    void eliminar_prioridad(int clave_pri);
    List<clsPrioridad> getPrioridades();
    #endregion

    #region *Tipos Estudios RMN*
    void agregar_tipo_estudio(clsTipoEstudio nTipo);
    void modificar_tipo_estudio(clsTipoEstudio tp);
    void eliminar_tipo_Estudio(int clave_tip_est);
    List<clsTipoEstudio> getTiposEstudios();
    
    #endregion

    #region *Pacientes RMN*
    void agregar_paciente(clsPaciente pac);
    void modificar_paciente(clsPaciente paci);
    List<clsPaciente> allPacientes();
    #endregion
}