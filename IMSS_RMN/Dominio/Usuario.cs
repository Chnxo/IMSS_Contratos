using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Usuario
    {
        private int _id = 0;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _nombre = string.Empty;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _contrasena = string.Empty;
        public string Contrasena
        {
            get { return _contrasena; }
            set { _contrasena = value; }
        }

        private string _correo = string.Empty;
        public string Correo
        {
            get { return _correo; }
            set { _correo = value; }
        }

        public Usuario() { }

        public Usuario(int id, string nombre, string contrasena, string correo)
        {
            _id = id;
            _nombre = nombre;
            _contrasena = contrasena;
            _correo = correo;
        }
    }