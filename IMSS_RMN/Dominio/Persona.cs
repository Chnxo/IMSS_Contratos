using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMSS_RMN.Dominio
{
    public class Persona
    {
        private string apellido = string.Empty;
        private string correo = string.Empty;
        private DateTime cumpleanios;
        private string direccion = string.Empty;
        private int id;
        private string nombre = string.Empty;
        private string telefono = string.Empty;

        public Persona()
        {
        }

        public Persona(string apellido, string correo, DateTime cumpleanios, string direccion, string nombre, string telefono)
        {
            this.apellido = apellido;
            this.correo = correo;
            this.cumpleanios = cumpleanios;
            this.direccion = direccion;
            this.nombre = nombre;
            this.telefono = telefono;
        }

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public DateTime Cumpleanios
        {
            get { return cumpleanios; }
            set { cumpleanios = value; }
        }

        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
    }
}