using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IMSS_RMN.Dominio;

namespace IMSS_RMN.Datos.Interfaces
{
    interface IPersona
    {
        bool GuardarPaciente(Persona p);
        bool EliminarPaciente(Persona p);
        List<Persona> GetPacientes();

        bool GuardarUsuario(Persona p);
        bool EliminarUsuario(Persona p);
        List<Persona> GetUsuarios();
    } 
}
