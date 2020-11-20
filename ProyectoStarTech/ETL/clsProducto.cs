using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

    

namespace ProyectoStarTech.ETL
{
    public class clsProducto
    {

        public string codigoProducto { get; set; }
        public string nombreProducto{ get; set; }
        public int cantidadDisponible { get; set; }
        public long precioProducto { get; set; }
        public string imagenUrl { get; set; }
        public IEnumerable<productos> ConsultarProductos { get; set; }
    }
}