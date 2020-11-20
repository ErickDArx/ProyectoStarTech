using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoStarTech.Controllers
{
    public class CompraController : Controller
    {
        // GET: Compra
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult guardarCompra()
        {
            int idUsuario = int.Parse(Session["idUsuario"].ToString());
            using (var contextoBD = new StarTechEntities())
            {
                contextoBD.ComprasProc(idUsuario);
                contextoBD.SaveChanges();
                
            }
            return View();
        }
    }
}