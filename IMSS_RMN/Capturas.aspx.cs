using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IMSS_RMN.Datos;

namespace IMSS_RMN
{
    public partial class Capturas : System.Web.UI.Page
    {
        private Fachada fac = new Fachada();

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            try
            {
                clsPaciente paciente = new clsPaciente(afiliacion.Text, apellidoPaterno.Text, apellidoMaterno.Text, nombrePaciente.Text, numeroTelefono.Text);
                fac.agregar_paciente(paciente);
            }
            catch (Exception)
            {
                
            }
            
        }
    }
}