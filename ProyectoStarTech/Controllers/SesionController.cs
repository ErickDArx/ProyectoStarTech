using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoStarTech.Controllers
{
    public class SesionController : Controller
    {
        private StarTechEntities db = new StarTechEntities();
        // GET: Sesion
        public ActionResult InicioSesion()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult InicioSesion(Usuario user)
        {
            if (ModelState.IsValid)
            {
                var details = (from userlist in db.Usuario
                               where userlist.correo == user.correo && userlist.contraseña == user.contraseña
                               select new
                               {
                                   userlist.correo,
                                   userlist.contraseña
                               }).ToList();
                if (details.FirstOrDefault() != null)
                {
                    
                    System.Web.HttpContext.Current.Session["correo"] = details.FirstOrDefault().correo;
                    
                    Session["contraseña"] = details.FirstOrDefault().contraseña;

                    if(Session["correo"] == null)
                    {
                        Response.Write("<script>alert('Por favor ingrese un correo válido.')</script>");
                    }
                    else
                    {
                        return RedirectToAction("MostrarInformacion", "Sesion");
                        //deberia redirigir a inicio, pero ya con la cuenta validada
                        //return RedirectToAction("Index", "Index", new { area = "" });
                    }

                }
                else
                {
                    ModelState.AddModelError("", "Credenciales Inválidas");
                }
            }

            return View();
        }

        public ActionResult CargarUsuario(string correo)
        {

            Session["correo"] = correo;

            return Json(String.Empty, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult MostrarInformacion()
        {

            if(Session["correo"] == null)
            {
                return RedirectToAction("InicioSesion");
            }

            string correo = Session["correo"].ToString();

            using (var bd = new StarTechEntities())
            {
                var Datos = (from a in bd.Usuario
                             where a.correo == correo
                             select a).FirstOrDefault();

                return View("MostrarInformacion", Datos);
            }

        }

        public ActionResult CerrarSesion()
        {
            Session.Abandon();
            Session.Clear();
            return Json(String.Empty, JsonRequestBehavior.AllowGet);
        }

    }
}