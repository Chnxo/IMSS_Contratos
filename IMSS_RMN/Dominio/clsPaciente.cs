using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Paciente
/// </summary>
public class clsPaciente
{
    private string afiliacion;
    private string ape_pat;
    private string ape_mat;
    private string nombre;
    private string num_tel;

    

    public string Afiliacion
    {
        get { return afiliacion; }
        set { afiliacion = value; }
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

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    public string Num_tel
    {
        get { return num_tel; }
        set { num_tel = value; }
    }


	public clsPaciente()
	{
	}

    public clsPaciente(string afiliacion,string ape_pat,string ape_mat, string nombre,string num_tel)
    {
        this.afiliacion = afiliacion;
        this.ape_pat = ape_pat;
        this.ape_mat = ape_mat;
        this.nombre = nombre;
        this.num_tel = num_tel;
    }
}