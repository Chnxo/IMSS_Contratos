using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.Dominio
{
    public class Paciente : Persona
    {
        private int afiliacion;

        public Paciente()
        {
        }

        public Paciente(int afiliacion, string apellido, string correo, DateTime cumpleanios, string direccion, string nombre, string telefono)
            : base(apellido, correo, cumpleanios, direccion, nombre, telefono)
        {
            this.afiliacion = afiliacion;
        }

        public int Afiliacion
        {
            get { return afiliacion; }
            set { afiliacion = value; }
        }
    }
}