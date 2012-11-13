using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Descripción breve de Estudio
/// </summary>
public class clsEstudio
{
    private int num_est;
    private string fecha_sol;
    private string fecha_rea;
    private string observacion;
    private int fk_tipo_id;
    private int fk_pri_id;
    private string fk_afiliacion;
    private int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    #region *Campos Encapsulados*

    public int Num_est
    {
       get { return num_est; }
       set { num_est = value; }
    }

    public string Fecha_sol
    {
        get { return fecha_sol; }
        set { fecha_sol = value; }
    }

    public string Fecha_rea
    {
        get { return fecha_rea; }
        set { fecha_rea = value; }
    }

    public string Observacion
    {
        get { return observacion; }
        set { observacion = value; }
    }

    public int Fk_tipo_id
    {
        get { return fk_tipo_id; }
        set { fk_tipo_id = value; }
    }

    public int Fk_pri_id
    {
        get { return fk_pri_id; }
        set { fk_pri_id = value; }
    }

    public string Fk_Afiliacion
    {
        get { return fk_afiliacion; }
        set { fk_afiliacion = value; }
    }


    # endregion

    #region --- Para una consulta ----
    private string ape_pat;
    private string ape_mat;
    private string nom_pac;
    private string tip_est;
    private decimal costo;
    private string prior;
    private string agregado;

    public string Agregado
    {
        get { return agregado; }
        set { agregado = value; }
    }

    public string Prior
    {
        get { return prior; }
        set { prior = value; }
    }
    public decimal Costo
    {
        get { return costo; }
        set { costo = value; }
    }
    public string Tip_est
    {
        get { return tip_est; }
        set { tip_est = value; }
    }
    public string Nom_pac
    {
        get { return nom_pac; }
        set { nom_pac = value; }
    }

    public string Ape_pat
    {
        get { return ape_pat; }
        set { ape_pat = value; }
    }


    public string Ape_mat
    {
        get { return ape_mat; }
        set { ape_mat = value; }
    }

    #endregion

    public clsEstudio()
	{
	}

    public clsEstudio(int num_est) 
    {
        this.num_est = num_est;
    }

    public clsEstudio(string fecha_sol,string fecha_rea,string observacion,int fk_tipo_id,int fk_pri_id,string fk_afiliacion)    
    {
        this.fecha_sol = fecha_sol;
        this.fecha_rea = fecha_rea;
        this.observacion = observacion;
        this.fk_tipo_id = fk_tipo_id;
        this.fk_pri_id = fk_pri_id;
        this.fk_afiliacion = fk_afiliacion;
    }

    public clsEstudio(int num_est,string fecha_sol, string fecha_rea, string observacion, int fk_tipo_id, int fk_pri_id, string fk_afiliacion)
    {
        this.num_est = num_est;
        this.fecha_sol = fecha_sol;
        this.fecha_rea = fecha_rea;
        this.observacion = observacion;
        this.fk_tipo_id = fk_tipo_id;
        this.fk_pri_id = fk_pri_id;
        this.fk_afiliacion = fk_afiliacion;
    }

    public clsEstudio(int num_est,string fecha_sol, string fecha_rea, string fk_afiliacion,string ape_pat,string ape_mat,string nom_pac,string tip_est,decimal costo,string prior,string agregado, string observacion)
    {
        this.num_est = num_est;
        this.fecha_sol = fecha_sol;
        this.fecha_rea = fecha_rea;
        this.fk_afiliacion=fk_afiliacion;
        this.ape_pat = ape_pat;
        this.ape_mat = ape_mat;
        this.nom_pac=nom_pac;
        this.tip_est=tip_est;
        this.costo=costo;
        this.prior=prior;
        this.agregado=agregado;
        this.observacion = observacion;
    }

   
}