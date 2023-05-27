using PankiFood.Procedimientos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace PankiFood {
    /// <summary>
    /// Summary description for Servicios_Puesto
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Servicios_Puesto : WebService {
        private CRUD_Puesto cRUD_Puesto;
        public Servicios_Puesto() {
            cRUD_Puesto = new CRUD_Puesto();
        }

        [WebMethod]
        public bool Crear_Puesto(int id, string nombre) {
            return cRUD_Puesto.Crear_Puesto(id, nombre);
        }

        [WebMethod]
        public string Seleccionar_Puesto(int id) {
            return cRUD_Puesto.Seleccionar_Puesto(id);
        }

        [WebMethod]
        public bool Actualizar_Puesto(int id, string nombre) {
            return cRUD_Puesto.Actualizar_Puesto(id, nombre);
        }

        [WebMethod]
        public bool Eliminar_Puesto(int id) {
            return cRUD_Puesto.Eliminar_Puesto(id);
        }
    }
}
