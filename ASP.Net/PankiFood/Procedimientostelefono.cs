using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Newtonsoft.Json;

namespace web5
{
    public class Procedimientostelefono
    {

        public ObtenerConexion gc = new ObtenerConexion();

        public Procedimientostelefono()
        {

        }



        public string get_telefonos()
        {
            OracleConnection conn = gc.conn();
            conn.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT * FROM telefono" ;
            cmd.CommandType = System.Data.CommandType.Text;


            DataSet ds = new DataSet();
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.Fill(ds);

            return JsonConvert.SerializeObject(ds, Newtonsoft.Json.Formatting.Indented);

        }

        public void InsertTelefono(string numero)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Varchar2;
            parametro1.Value = numero;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "CREARNUEVOTELEFONO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("p_numero", OracleDbType.Varchar2).Value = parametro1.Value;

            comando.ExecuteNonQuery();

            c.Dispose();
        }

        public void ActualizarTelefono(int id, string numero)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = id;

            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Varchar2;
            parametro2.Value = numero;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ACTUALIZARTELEFONO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("p_id", OracleDbType.Int32).Value = parametro1.Value;
            comando.Parameters.Add("p_numero", OracleDbType.Varchar2).Value = parametro2.Value;

            comando.ExecuteNonQuery();

            c.Dispose();
        }


        public void EliminarTelefono(int id)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = id;


            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ELIMINARTELEFONO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("p_id", OracleDbType.Int32).Value = parametro1.Value;

            comando.ExecuteNonQuery();

            c.Dispose();
        }

    }
}
