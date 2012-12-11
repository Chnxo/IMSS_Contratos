using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de clsPresupuesto
/// </summary>
public class clsPresupuesto
{
    private string concepto;
    private string fechaFin;
    private string fechaInicio;
    private double montoActual;
    private double montoOriginal;
    private int pre_ID;

    public string Concepto
    {
        get { return concepto; }
        set { concepto = value; }
    }

    public string FechaFin
    {
        get { return fechaFin; }
        set { fechaFin = value; }
    }

    public string FechaInicio
    {
        get { return fechaInicio; }
        set { fechaInicio = value; }
    }

    public double MontoActual
    {
        get { return montoActual; }
        set { montoActual = value; }
    }

    public double MontoOriginal
    {
        get { return montoOriginal; }
        set { montoOriginal = value; }
    }

    public int Pre_ID
    {
        get { return pre_ID; }
        set { pre_ID = value; }
    }
}