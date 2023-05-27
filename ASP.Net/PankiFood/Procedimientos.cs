using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using Newtonsoft.Json;


namespace PankiFood
{
    public class Procedimientos
    {
        private
            ObtenerConexion gc;
        public Procedimientos()
        {
            gc=new ObtenerConexion();
        }
        public void Insertar_Alimento_proc(string nombre, string descripcion, float precio)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Varchar2;
            parametro1.Value = nombre;

            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Varchar2;
            parametro2.Value = descripcion;

            OracleParameter parametro3 = new OracleParameter();
            parametro3.OracleDbType = OracleDbType.Decimal;
            parametro3.Value = precio;


            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "INSERT_ALIMENTO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("NOMBREP", OracleDbType.Varchar2).Value = parametro1.Value;
            comando.Parameters.Add("DESCRIPCIONP", OracleDbType.Varchar2).Value = parametro2.Value;
            comando.Parameters.Add("PRECIOP", OracleDbType.Decimal).Value = parametro3.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }

        public string Select_ali(string Tabla)
        {
            OracleConnection conn = gc.conn();
            conn.Open();

            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT * FROM " + Tabla;
            cmd.CommandType = System.Data.CommandType.Text;


            DataSet ds = new DataSet();
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.Fill(ds);

            return JsonConvert.SerializeObject(ds, Newtonsoft.Json.Formatting.Indented);

        }

        public void Eliminar_Alimento_proc(int id)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = id;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ELIMINAR_ALIMENTO";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("ALIMENTOID", OracleDbType.Int32).Value = parametro1.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }

        public void Actualizar_Producto_proc(int id, string nombre, string descripcion, float precio)
        {
            OracleConnection c = gc.conn();
            c.Open();

            OracleParameter parametro1 = new OracleParameter();
            parametro1.OracleDbType = OracleDbType.Int32;
            parametro1.Value = id;

            OracleParameter parametro2 = new OracleParameter();
            parametro2.OracleDbType = OracleDbType.Varchar2;
            parametro2.Value = nombre;

            OracleParameter parametro3 = new OracleParameter();
            parametro3.OracleDbType = OracleDbType.Varchar2;
            parametro3.Value = descripcion;

            OracleParameter parametro4 = new OracleParameter();
            parametro4.OracleDbType = OracleDbType.Decimal;
            parametro4.Value = precio;

            OracleCommand comando = new OracleCommand();
            comando.Connection = c;

            comando.CommandText = "ActualizarAlimento";
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.Add("p_Id", OracleDbType.Int32).Value = parametro1.Value;
            comando.Parameters.Add("p_Nombre", OracleDbType.Varchar2).Value = parametro2.Value;
            comando.Parameters.Add("p_Descripcion", OracleDbType.Varchar2).Value = parametro3.Value;
            comando.Parameters.Add("p_Precio", OracleDbType.Decimal).Value = parametro4.Value;
            comando.ExecuteNonQuery();

            c.Dispose();
        }

    }
}
