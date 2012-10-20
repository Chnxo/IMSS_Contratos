using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Capturista:Usuario
    {
        private bool _status;
        public bool Status
        {
            get { return _status; }
            set { _status = value; }
        }

        public Capturista()
        {

        }

        public Capturista(int id, string nombre, string contrasena, string correo, bool status)
            : base(id, nombre, contrasena, correo)
        {
            _status = status;
        }

    }