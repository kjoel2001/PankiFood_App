using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using Oracle.DataAccess.Client;

namespace PankiFood
{
    public class ObtenerConexion
    {
        public ObtenerConexion()
        {

        }
        public OracleConnection conn()
        {
            string oradb = "DATA SOURCE = localhost:1521 / xe; PERSIST SECURITY INFO = True; USER ID = PankiFood; PASSWORD = admin";
            OracleConnection conexion = new OracleConnection(oradb);
            return conexion;
        }

        /*
        string connectionString = "Data Source=Oracle8i;Integrated Security=yes";
        string queryString = "SELECT * FROM table_name";
    using (OracleConnection connection = new OracleConnection(connectionString))
    {
        OracleCommand command = new OracleCommand(queryString, connection);
    connection.Open();
        OracleDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Console.WriteLine(reader[0].ToString());
        }
reader.Close();
    }

        */
    }
}