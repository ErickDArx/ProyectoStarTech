function guardarCompra() {

}

function alert1() {
    alert("Debe iniciar sesión para poder comprar.");
}

function alert2() {
    alert("Gracias por su compra.");
}


function calcularCompra(precio) {
    subtotal = 0;
    iva = 0;
    total = 0;

    subtotal = subtotal + parseFloat(precio);
    iva = precio * 0.13;
    total = subtotal + iva;


    document.getElementById("txtSubtotal").value = subtotal;
    document.getElementById("txtIva").value = iva;
    document.getElementById("txtTotal").value = total;

}