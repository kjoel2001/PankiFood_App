using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Pankyfood
{
    public partial class Contact : Page
    {
        ServiceReference1.WebService1SoapClient conexion = new ServiceReference1.WebService1SoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario está autenticado
            if (!User.Identity.IsAuthenticated)
            {
                // El usuario no ha iniciado sesión, redirigir a la página de inicio de sesión
                Response.Redirect("Login.aspx");
            }
            else
            {
                // El usuario ha iniciado sesión, continuar con el procesamiento de la página

               
            }
            if (!IsPostBack)
            {

                string json = conexion.Listado_Alimento();


                DataTable dt = JObject.Parse(json)["Table"].ToObject<DataTable>();


                GridViewAlimentos.DataSource = dt;
                GridViewAlimentos.DataBind();
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string idText = Txt_id2.Text;
            string nombre = Txt_nom2.Text;
            string descripcion = Txt_des2.Text;
            float precio = (float)System.Convert.ToSingle(Txt_prec2.Text);

            if (string.IsNullOrEmpty(idText))
            {
                try
                {
                    string resultado = conexion.Insertar_Alimento(nombre, descripcion, precio);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);

                    
                    string json = conexion.Listado_Alimento();
                    DataTable dt = JObject.Parse(json)["Table"].ToObject<DataTable>();
                    GridViewAlimentos.DataSource = dt;
                    GridViewAlimentos.DataBind();
                }
                catch (Exception ex)
                {
                    string mensaje = ex.Message;
                }
            }
            else
            {
               
                int id = Convert.ToInt32(idText);

                try
                {
                    string resultado = conexion.Actualizar_Alimento(id, nombre, descripcion, precio);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);

                    
                    string json = conexion.Listado_Alimento();
                    DataTable dt = JObject.Parse(json)["Table"].ToObject<DataTable>();
                    GridViewAlimentos.DataSource = dt;
                    GridViewAlimentos.DataBind();
                }
                catch (Exception ex)
                {
                    string mensaje = ex.Message;
                }
            }
        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Button btnEditar = (Button)sender;
            GridViewRow row = (GridViewRow)btnEditar.NamingContainer;

            
            int id = Convert.ToInt32(GridViewAlimentos.DataKeys[row.RowIndex].Value);
            
            string nombre = row.Cells[1].Text;
            string descripcion = row.Cells[2].Text;
            float precio = Convert.ToSingle(row.Cells[3].Text);

            
            Txt_id2.Text = id.ToString();
            Txt_nom2.Text = nombre;
            Txt_des2.Text = descripcion;
            Txt_prec2.Text = precio.ToString();
        }


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            GridViewRow row = (GridViewRow)btnEliminar.NamingContainer;

            
            int id = Convert.ToInt32(GridViewAlimentos.DataKeys[row.RowIndex].Value);

            
            string resultado = conexion.Eliminar_Alimento(id);

            
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);

            
            string json = conexion.Listado_Alimento();
            DataTable dt = JObject.Parse(json)["Table"].ToObject<DataTable>();
            GridViewAlimentos.DataSource = dt;
            GridViewAlimentos.DataBind();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            
            Txt_id2.Text = string.Empty;
            Txt_nom2.Text = string.Empty;
            Txt_des2.Text = string.Empty;
            Txt_prec2.Text = string.Empty;
            
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Cerrar sesión del usuario
            FormsAuthentication.SignOut();

            // Redirigir al inicio de sesión o a otra página de tu elección
            Response.Redirect("Login.aspx");
        }
    }

}
