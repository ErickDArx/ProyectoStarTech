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
            using (var contextoBD = new StarTechEntities())
            {

                var datos = (from x in contextoBD.carrito
                             select x).ToList();

                return View("Index", datos);
            }
        }

        [HttpGet]
        public ActionResult Compra()
        {
            using (var contextoBD = new StarTechEntities())
            {

                var datos = (from x in contextoBD.Compra
                             select x).ToList();
                return View("Compra", datos);
            }
        }


        public ActionResult guardarCarrito(string codigoProducto,
            int cantidadComprar, string nombreProducto, decimal precioProducto)
        {
            int idUsuario = int.Parse(Session["idUsuario"].ToString());
            string id = codigoProducto;
            using (var contextoBD = new StarTechEntities())
            {

                var insercion = new carrito()
                {
                    codigoProducto = id,
                    idUsuario = idUsuario,
                    cantidadComprar = cantidadComprar,
                    nombreProducto = nombreProducto,
                    precioProducto = precioProducto

                };

                contextoBD.carrito.Add(insercion);
                contextoBD.SaveChanges();

            }
            return View();
        }

        public ActionResult eliminarCarrito(string codigoProducto)
        {
            int idUsuario = int.Parse(Session["idUsuario"].ToString());

            using (var contextoBD = new StarTechEntities())
            {
                var datos = (from x in contextoBD.carrito
                             where x.codigoProducto == codigoProducto
                             where x.idUsuario == idUsuario
                             select x).ToList();
                contextoBD.carrito.RemoveRange(datos);
                contextoBD.SaveChanges();
            };




            return View("Carrito", "Index");
        }


        public ActionResult comprarCarrito(string codigoProducto)
        {

            int idUsuario = int.Parse(Session["idUsuario"].ToString());
            string id = codigoProducto;
            using (var contextoBD = new StarTechEntities())
            {

                var comprar = new Compra()
                {
                    codigoProducto = id,
                    idUsuario = idUsuario
                };

                contextoBD.Compra.Add(comprar);
                contextoBD.SaveChanges();

            }

            return View("Carrito", "Compra");
        }

    }
}