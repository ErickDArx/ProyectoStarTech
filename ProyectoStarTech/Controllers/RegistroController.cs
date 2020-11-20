using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;

namespace ProyectoStarTech.Controllers
{
    public class RegistroController : Controller
    {
        private StarTechEntities db = new  StarTechEntities();
        // GET: Registro

        public ActionResult RegistroUsuario()
        {
            return View();
        }


         [HttpPost]
         [ValidateAntiForgeryToken]
         public ActionResult RegistroUsuario(Usuario user)
        {
            if (ModelState.IsValid)
            {
                db.Usuario.Add(user);
                db.SaveChanges();
                return RedirectToAction("InicioSesion","Sesion");
            }

            return View();
        }

    }
}