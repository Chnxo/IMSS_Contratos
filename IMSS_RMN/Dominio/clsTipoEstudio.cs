using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de clsTipoEstudio
/// </summary>
public class clsTipoEstudio
{
    private int id_tip_est;
    private string tip_est_nombre;
    private decimal costo;

    #region *Campos Encapsulados*

    public int Id_tip_est
    {
        get { return id_tip_est; }
        set { id_tip_est = value; }
    }

    public string Tip_est_nombre
    {
        get { return tip_est_nombre; }
        set { tip_est_nombre = value; }
    }
    public decimal Costo
    {
        get { return costo; }
        set { costo = value; }
    }

    #endregion

    #region *Constructores*
    public clsTipoEstudio()
	{
	}

    public clsTipoEstudio(int id_tip_est, string tip_est_nombre, decimal costo) 
    {
        this.id_tip_est = id_tip_est;
        this.tip_est_nombre = tip_est_nombre;
        this.costo = costo;
    }

    public clsTipoEstudio(string tip_est_nombre,decimal costo)
    {
        this.tip_est_nombre = tip_est_nombre;
        this.costo = costo;
    }

    public clsTipoEstudio(string tip_est_nombre)
    {
        this.tip_est_nombre = tip_est_nombre;
    }

    #endregion
}