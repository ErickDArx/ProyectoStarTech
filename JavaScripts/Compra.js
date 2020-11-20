function guardarcarrito(codigoProducto, cantidadDisponible, nombreProducto, precioProducto) {

    id = codigoProducto;
    disponible = parseInt(cantidadDisponible);
    cantidadComprar = document.getElementById("cantidad").value;

    if (cantidadComprar == 0 || cantidadComprar<0) {
        alert("No ingreso una cantidad exacta");
    } else if (cantidadComprar > disponible) {
        alert("La cantidad es limitada")
    } 
    else {
        alert("El producto " + nombreProducto +" Se ha añadido exitosamente en el carrito")
        $.ajax({

            type: "POST",
            url: "/Carrito/guardarCarrito",
            data: {
                codigoProducto: codigoProducto,
                cantidadComprar: cantidadComprar,
                nombreProducto: nombreProducto,
                precioProducto: precioProducto
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                location.href = "Index/verInformacion"

            },
            error: function (data) {

            }

        });
    }



}

function calcularCompra(precioProducto, cantidadComprar) {

    var precio = parseFloat(precioProducto);

    cantidad = precio * cantidadComprar;
    var subtotal = cantidad;
    subtotal + subtotal;
    var iva = 0.13 * cantidad;
    var total = subtotal + iva;

    document.getElementById("txtSubtotal").value = "₡" + subtotal;
    document.getElementById("txtIva").value = "₡" + Math.trunc(iva).toFixed(2);
    document.getElementById("txtTotal").value = "₡"+total;

}

subtotal = 0;
iva = 0;
total = 0;
precio_multiplicado = 0;

function DatosCarrito(cantidadComprar,
    precioProducto) {
    var precio = parseFloat(precioProducto);


    if (precioProducto == null) {
        precioProducto = 0;
    }
    if (cantidadComprar == null) {
        cantidadComprar = 0;
    }

    precio_multiplicado = parseFloat(precioProducto) * parseFloat(cantidadComprar);

    subtotal = subtotal + precio_multiplicado;
    iva = subtotal * 0.13;
    total = subtotal + iva;



    document.getElementById("txtSubtotal").value = "₡" + Number(subtotal);
    document.getElementById("txtIva").value = "₡" + Number(iva);
    document.getElementById("txtTotal").value = "₡" + Number(total);
    var boton = document.getElementById("calculo");


}

function eliminarCarrito(codigoProducto) {

    id = codigoProducto;
        $.ajax({

            type: "POST",
            url: "/Carrito/eliminarCarrito",
            data: {
                codigoProducto: codigoProducto
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                location.href = "Carrito/Index"

            },
            error: function (data) {

            }

        });

}

function comprarCarrito(codigoProducto) {

    id = codigoProducto;
    $.ajax({
        type: "POST",
        url: "/Carrito/comprarCarrito",
        data: {
            codigoProducto: codigoProducto
        },
        cache: false,
        dataType: 'json',
        success: function (data) {
            location.href = "Carrito/Compra"

        },
        error: function (data) {

        }

    });
    alert("La compra fue exitosa, puede borrar el producto de su lista de carrito");
}