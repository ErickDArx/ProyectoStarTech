using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoStarTech.ETL
{
    public class clsCarrito
    {
        public int codigoCarrito { get; set; }
        public string codigoProducto { get; set; }
        public string nombreProducto { get; set; }
        public int cantidadDisponible { get; set; }
        public long precioProducto { get; set; }
        public string imagenUrl { get; set; }
        public string idUsuario { get; set; }
        public IEnumerable<Carrito> ConsultarCarrito { get; set; }
    }
}