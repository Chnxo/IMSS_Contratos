using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMSS_RMN.Datos.Interfaces;
using IMSS_RMN.Dominio;
using System.Data;

namespace IMSS_RMN.Datos.Fachadas
{
    public class FUsuario : IUsuario
    {
        private static FUsuario fusuario = new FUsuario();

        private FUsuario()
        {

        }

        public static FUsuario Instancia()
        {
            return fusuario;
        }

        public bool EliminarUsuario(Usuario p)
        {
            throw new NotImplementedException();
        }

        public List<Usuario> GetUsuarios()
        {
            List<Usuario> usuarios = new List<Usuario>();
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.connString, "getUsuarios").Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Usuario usuario = new Usuario();
                usuario.Id = Convert.ToInt32(dt.Rows[i]["ID"]);
                usuario.Nombre = Convert.ToString(dt.Rows[i]["Nombre"]);
                usuario.Apellido = Convert.ToString(dt.Rows[i]["Apellido"]);
                usuario.Direccion = Convert.ToString(dt.Rows[i]["Direccion"]);
                usuario.Telefono = Convert.ToString(dt.Rows[i]["Telefono"]);
                usuario.Correo = Convert.ToString(dt.Rows[i]["Correo"]);
                usuario.Contrasenia = Convert.ToString(dt.Rows[i]["Contrasenia"]);
                usuario.Lvl = Convert.ToString(dt.Rows[i]["Nivel"]) == "0" ? Nivel.Capturista : Nivel.AdminLVL1;
                usuario.Activo = Convert.ToBoolean(dt.Rows[i]["Activo"]);
                usuario.User = Convert.ToString(dt.Rows[i]["Usuario"]);

                usuarios.Add(usuario);
            }

            return usuarios;
        }

        public bool GuardarUsuario(Usuario p)
        {
            throw new NotImplementedException();
        }
    }
}