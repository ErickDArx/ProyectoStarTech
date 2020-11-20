function verInfo(codigoProducto) {
    $.ajax({

        type: "POST",
        url: "/Index/CargarCodigo",
        data: {
            codigoProducto: codigoProducto
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
