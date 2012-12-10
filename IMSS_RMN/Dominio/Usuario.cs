using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.Dominio
{
    public enum Nivel
    {
        Capturista, AdminLVL1
    }

    public class Usuario : Persona
    {
        private bool activo;
        private string contrasenia = string.Empty;
        private Nivel lvl;
        private string user = string.Empty;

        public Usuario()
        {
        }

        public Usuario(string user, string contrasenia)
        {
            this.user = user;
            this.contrasenia = contrasenia;
        }

        public Usuario(bool activo, string contrasenia, Nivel lvl, string user, string apellido, string correo, DateTime cumpleanios, string direccion, string nombre, string telefono)
            : base(apellido, correo, cumpleanios, direccion, nombre, telefono)
        {
            this.activo = activo;
            this.contrasenia = contrasenia;
            this.lvl = lvl;
            this.user = user;
        }

        public bool Activo
        {
            get { return activo; }
            set { activo = value; }
        }

        public string Contrasenia
        {
            get { return contrasenia; }
            set { contrasenia = value; }
        }

        public Nivel Lvl
        {
            get { return lvl; }
            set { lvl = value; }
        }

        public string User
        {
            get { return user; }
            set { user = value; }
        }
    }
}