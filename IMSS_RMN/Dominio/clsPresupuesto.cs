using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de clsPresupuesto
/// </summary>
public class clsPresupuesto
{
    private int num_pres;
    private int partida;
    private int num_contrato;
    private string concepto;
    private int ano;
    private decimal monto;
    private string vigencia;

    
    

    #region *Campos Encapsulados*

    public int Num_pres
    {
        get { return num_pres; }
        set { num_pres = value; }
    }

    public int Partida
    {
        get { return partida; }
        set { partida = value; }
    }

    public int Num_contrato
    {
        get { return num_contrato; }
        set { num_contrato = value; }
    }

    public string Concepto
    {
        get { return concepto; }
        set { concepto = value; }
    }
   
    public int Ano
    {
        get { return ano; }
        set { ano = value; }
    } 

    public decimal Monto
    {
        get { return monto; }
        set { monto = value; }
    }

    public string Vigencia
    {
        get { return vigencia; }
        set { vigencia = value; }
    }

    #endregion

    #region *Constructores*

    public clsPresupuesto()
	{
	}

    public clsPresupuesto(int num_pres, int partida, int num_contrato, string concepto, int ano, decimal monto)
    {
        this.num_pres = num_pres;
        this.partida = partida;
        this.num_contrato = num_contrato;
        this.concepto = concepto;
        this.ano = ano;
        this.monto = monto;
    }

    public clsPresupuesto(int partida, int num_contrato, string concepto, int ano, decimal monto,string vigencia)
    {
        this.partida = partida;
        this.num_contrato = num_contrato;
        this.concepto = concepto;
        this.ano = ano;
        this.monto = monto;
        this.vigencia = vigencia;
    }
    public clsPresupuesto(decimal monto)
    {
        this.monto = monto;
    }

    public clsPresupuesto(int ano,decimal monto)
    {
        this.ano = ano;
        this.monto = monto;
    }

    #endregion
}