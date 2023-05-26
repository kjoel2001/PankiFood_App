using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace PankiFood
{
    /// <summary>
    /// Summary description for Procedimientos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Procedimientos : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            string data = "";

            string connectionString = "DATA SOURCE = localhost:1521 / xe; PERSIST SECURITY INFO = True; USER ID = PankiFood; PASSWORD = admin";
            string queryString = "SELECT * FROM Cliente";
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                OracleCommand command = new OracleCommand(queryString, connection);
                connection.Open();
                OracleDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    data += reader[1].ToString();
                }
                reader.Close();
            }

            return data;
        }
    }
}
