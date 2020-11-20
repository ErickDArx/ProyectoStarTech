using Microsoft.Ajax.Utilities;
using System;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoStarTech.Controllers
{
    public class IndexController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            /*
            if (Session["correo"] != null)
            {
                string correo = Session["correo"].ToString();

                using (var bd = new StarTechEntities1())
                {
                    var Datos2 = (from a in bd.Usuario
                                 where a.correo == correo
                                 select a).FirstOrDefault();

                    var datos = (from variable in bd.productos
                                 select variable).ToList();

                    

                    return View("Index", datos);
                }
            }*/


                using (var contextoBD = new StarTechEntities())
            {
                var datos = (from variable in contextoBD.productos
                             select variable).ToList();

                return View("Index",datos);
            }


        }

       

        public ActionResult cargarCodigo(string codigoProducto)
        {

            Session["codigoProducto"] = codigoProducto;
            
            return Json(String.Empty, JsonRequestBehavior.AllowGet);
        }

        

        [HttpGet]
        public ActionResult VerInformacion()
        {

            string codigoProducto = Session["codigoProducto"].ToString();

            using (var bd = new StarTechEntities())
            {
                var Datos = (from a in bd.productos
                             where a.codigoProducto == codigoProducto
                             select a).FirstOrDefault();

                return View("verInformacion", Datos);
            }

        }
    }
}
