using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ProyectoStarTech.Controllers
{
    public class CarritoController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            using (var contextoBD = new StarTechEntities ())
             {
                    var datos = (from x in contextoBD.Carrito
                             select x).ToList();

                    return View("Index", datos);
             }
        }

    }
}