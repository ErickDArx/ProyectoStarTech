using System.Web.Mvc;

namespace ProyectoStarTech.Controllers
{
    public class RegistroController : Controller
    {
        private StarTechEntities db = new StarTechEntities();
        // GET: Registro

        public ActionResult RegistroUsuario()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RegistroUsuario(usuario user)
        {
            if (ModelState.IsValid)
            {
                if (user.nombre != null)
                {

                db.usuario.Add(user);
                db.SaveChanges();
                    Response.Write("<script>alert('Usuario agregado.')</script>");
                    return RedirectToAction("InicioSesion", "Sesion");

                }
                else{
                    Response.Write("<script>alert('Por favor ingrese un correo válido.')</script>");
                }

            }


            return View();
        }

    }
}