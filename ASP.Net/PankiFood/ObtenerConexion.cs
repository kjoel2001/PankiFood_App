﻿using System;
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
    }
}