using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;
using Oracle.ManagedDataAccess.Client;
using Pankyfood.ServiceReference1;
using System.Web.Security;

namespace Pankyfood
{
    public partial class Login : System.Web.UI.Page
    {
        WebService1SoapClient conexion = new WebService1SoapClient();

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Value.Trim();
            string password = txtPassword.Value.Trim();

            if (ValidateUser(username, password))
            {
                // Establecer el estado de autenticación del usuario
                FormsAuthentication.SetAuthCookie(username, false);

                // Inicio de sesión exitoso, redirige al usuario a la página principal
                Response.Redirect("Contact.aspx");
            }
            else
            {
                // Las credenciales son inválidas, muestra un mensaje de error
                lblErrorMessage.Text = "Nombre de usuario o contraseña incorrectos.";
                lblErrorMessage.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario ya ha iniciado sesión
            if (IsUserLoggedIn())
            {
                Response.Redirect("Contact.aspx"); // Redirigir a la página principal si el usuario ya está autenticado
            }
        }

        private bool IsUserLoggedIn()
        {
            return HttpContext.Current.User.Identity.IsAuthenticated;
        }

        private bool ValidateUser(string username, string password)
        {
            string connectionString = "DATA SOURCE=localhost:1521/xe;PERSIST SECURITY INFO=True;USER ID=PankiFood;PASSWORD=admin";

            using (OracleConnection con = new OracleConnection(connectionString))
            {
                using (OracleCommand cmd = new OracleCommand("SELECT COUNT(*) FROM Usuario WHERE Nombre = :username AND Contrasena = :password", con))
                {
                    cmd.Parameters.Add("username", OracleDbType.Varchar2).Value = username;
                    cmd.Parameters.Add("password", OracleDbType.Varchar2).Value = password;

                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();

                    return count > 0;
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string nombre = txtNewUsername.Value.Trim();
            string contrasena = txtNewPassword.Value.Trim();
            try
            {
                string resultado = conexion.AgregarUsuario(nombre, contrasena);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + resultado + "');", true);
            }
            catch (Exception ex)
            {
                string mensaje = ex.Message;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut(); // Invalidar la cookie de autenticación
            Response.Redirect("Login.aspx"); // Redirigir a la página de inicio de sesión
        }
    }
}
