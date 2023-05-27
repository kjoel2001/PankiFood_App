using Newtonsoft.Json;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PankiFood.Procedimientos
{
    public class CRUD_Puesto
    {
        private ObtenerConexion obtenerConexion;

        public CRUD_Puesto() {
            obtenerConexion = new ObtenerConexion();
        }

        public bool Crear_Puesto(int id, string nombre) {
            bool result = false;

            OracleConnection oracleConnection = obtenerConexion.conn();
            oracleConnection.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oracleConnection;

            cmd.CommandText = "Crear_Puesto";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("puesto_id", OracleDbType.Int32).Value = id;
            cmd.Parameters.Add("puesto_nombre", OracleDbType.Varchar2, 20).Value = nombre;
            cmd.Parameters.Add("result", OracleDbType.Boolean).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            try {
                result = (cmd.Parameters["result"].Value.ToString() == "True");
            }
            catch (Exception ex) {
                result = false;
            }

            oracleConnection.Close();

            return result;
        }
        
        public string Seleccionar_Puesto(int id) {
            string json = "";

            OracleConnection oracleConnection = obtenerConexion.conn();
            oracleConnection.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oracleConnection;

            cmd.CommandText = "Seleccionar_Puesto";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("puesto_id", OracleDbType.Int32).Value = id; 
            cmd.Parameters.Add("puesto_nombre", OracleDbType.Varchar2, 20).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            try {
                var puesto_nombre = cmd.Parameters["puesto_nombre"].Value.ToString();
                var puesto = new {
                    puesto_id = id,
                    puesto_nombre = puesto_nombre
                };
                json = JsonConvert.SerializeObject(puesto);
            }
            catch (Exception ex) {
                json = ex.ToString();
            }

            oracleConnection.Close();
            return json;
        }

        public bool Actualizar_Puesto(int id, string nombre) {
            bool result = false;

            OracleConnection oracleConnection = obtenerConexion.conn();
            oracleConnection.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oracleConnection;

            cmd.CommandText = "Actualizar_Puesto";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("puesto_id", OracleDbType.Int32).Value = id;
            cmd.Parameters.Add("puesto_nombre", OracleDbType.Varchar2, 20).Value = nombre;
            cmd.Parameters.Add("result", OracleDbType.Boolean).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            try {
                result = (cmd.Parameters["result"].Value.ToString() == "True");
            }
            catch (Exception ex) {
                result = false;
            }

            oracleConnection.Close();

            return result;
        }

        public bool Eliminar_Puesto(int id) {
            bool result = false;

            OracleConnection oracleConnection = obtenerConexion.conn();
            oracleConnection.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = oracleConnection;

            cmd.CommandText = "Eliminar_Puesto";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("puesto_id", OracleDbType.Int32).Value = id;
            cmd.Parameters.Add("result", OracleDbType.Boolean).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            try {
                result = (cmd.Parameters["result"].Value.ToString() == "True");
            }
            catch (Exception ex) {
                result = false;
            }

            oracleConnection.Close();

            return result;
        }
    }
}