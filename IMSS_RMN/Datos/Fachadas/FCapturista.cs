﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FCapturista:ICapturista
    {
        private static FCapturista fcapturista = new FCapturista();

        private FCapturista()
        {

        }

        public static FCapturista Insatancia()
        {
            return fcapturista;
        }

        public void agregar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }

        public List<Capturista> allCapturistas()
        {
            throw new NotImplementedException();
        }

        public void modificar_capturista(Capturista cap)
        {
            throw new NotImplementedException();
        }
    }
}