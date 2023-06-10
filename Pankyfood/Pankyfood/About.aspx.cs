using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pankyfood
{
    public partial class About : Page
    {
        ServiceReference1.WebService1SoapClient conexion = new ServiceReference1.WebService1SoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre= Txt_nombre.Text;
            string descripcion= Txt_descripcion.Text;
            float precio= (float)System.Convert.ToSingle(Txt_precio.Text);
            try
            {
                string resultado = conexion.Insertar_Alimento(nombre, descripcion, precio);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);
            }
            catch (Exception ex) {
                string mensaje = ex.Message;

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = (int)System.Convert.ToSingle(Txt_id.Text);

            try
            {
                string resultado = conexion.Eliminar_Alimento(id);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);
            }
            catch (Exception ex)
            {
                string mensaje = ex.Message;

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int id = (int)System.Convert.ToSingle(Txt_id2.Text);
            string nombre = Txt_nom2.Text;
            string descripcion = Txt_des2.Text;
            float precio = (float)System.Convert.ToSingle(Txt_prec2.Text);
            try
            {
                string resultado = conexion.Actualizar_Alimento(id,nombre,descripcion,precio);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);
            }
            catch (Exception ex)
            {
                string mensaje = ex.Message;

            }
        }
    }
}