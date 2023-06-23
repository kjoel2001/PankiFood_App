using System.Linq;
using System.Web;
using System.Web.Services;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using Newtonsoft.Json;


namespace PankiFood
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]


    public class WebService1 : System.Web.Services.WebService
    {
        private
            Procedimientos prc;
        public WebService1()
        {
            prc = new Procedimientos();
        }
        [WebMethod]
        public string Insertar_Alimento(string Nombre, string Descripcion, float Precio)
        {
            prc.Insertar_Alimento_proc(Nombre, Descripcion, Precio);
            return "Producto insertado";
        }
        [WebMethod]
        public string Listado_Alimento()
        {
            string Tabla = "Alimento";
            return prc.Select_ali(Tabla);
        }
        [WebMethod]
        public string Eliminar_Alimento(int Id) 
        { 
            prc.Eliminar_Alimento_proc(Id);
            return "Producto eliminado";
        }
        [WebMethod]
        public string Actualizar_Alimento(int Id, string Nombre, string Descripcion, float Precio)
        {
            prc.Actualizar_Producto_proc(Id, Nombre, Descripcion, Precio);
            return "Producto actulizado";
        }

    }
}