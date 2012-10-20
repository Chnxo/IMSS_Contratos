using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de clsCalidad
/// </summary>
public class clsPrioridad
{
    private int pri_id;
    private string cal_Nombre;

    #region *Campos Encapsulado*

    public int Pri_id
    {
        get { return pri_id; }
        set { pri_id = value; }
    }
    public string Cal_Nombre
    {
        get { return cal_Nombre; }
        set { cal_Nombre = value; }
    }
    #endregion

    #region *Constructores de la clase Calidad*
    public clsPrioridad()
    {
    }

	public clsPrioridad(string cal_Nombre)
	{
        this.cal_Nombre = cal_Nombre;
    }

    public clsPrioridad(int pri_id, string cal_Nombre)
    {
        this.pri_id = pri_id;
        this.cal_Nombre = cal_Nombre;
    }

    #endregion
}