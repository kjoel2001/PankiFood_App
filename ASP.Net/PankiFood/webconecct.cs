using System;
using System.Web;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client;

namespace web5
{


    public class webconecct : System.Web.Services.WebService
    {
        private Procedimientostelefono prc = new Procedimientostelefono();

        [WebMethod]
        public string PruebaConexion()
        {
            string result;

            try
            {
                // Crear una instancia de la clase ObtenerConexion
                ObtenerConexion obtenerConexion = new ObtenerConexion();

                // Obtener la conexión
                OracleConnection conexion = obtenerConexion.conn();

                // Abrir la conexión
                conexion.Open();
                result = "Conexión exitosa";

                // Cerrar la conexión
                conexion.Close();
            }
            catch (Exception ex)
            {
                result = "Error al conectar: " + ex.Message;
            }

            return result;
        }


        [WebMethod]
        public string Read_telefonos()
        {
            return prc.get_telefonos();
        }

        [WebMethod]
        public string Insertar_Telefono(string telefono)
        {
            prc.InsertTelefono(telefono);
            return "Telefono insertado";
        }

        [WebMethod]
        public string Actualizar_Telefono(int id, string telefono)
        {
            prc.ActualizarTelefono(id, telefono);
            return "telefono actulizado";
        }

        [WebMethod]
        public string Eliminar_Telefono(int id)
        {
            prc.EliminarTelefono(id);
            return "telefono eliminado";
        }


    }
}
