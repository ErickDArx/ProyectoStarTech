function cerrarSesion() {
    alert('hola');
    $.ajax({

        type: "POST",
        url: "/Sesion/CerrarSesion",
        data: {
        },
        cache: false,
        dataType: 'json',
        success: function (data) {
            location.href = "InicioSesion"
        },
        error: function (data) {

        }

    });



}