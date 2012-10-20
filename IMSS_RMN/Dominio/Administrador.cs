using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
    public class Administrador:Usuario
    {
        private int _nivel = 0;
        public int Nivel
        {
            get { return _nivel; }
            set { _nivel = value; }
        }

        public Administrador() { }

        public Administrador(int id, string nombre, string contrasena, string correo, int nivel)
            : base(id, nombre, contrasena, correo)
        {
            _nivel = nivel;
        }

    }