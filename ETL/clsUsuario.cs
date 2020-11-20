using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoStarTech.ETL
{
    public class clsUsuario
    {
        public string correo { get; set; }
        public string contraseña { get; set; }
        public IEnumerable<usuario> ConsultarProductos { get; set; }
    }
}