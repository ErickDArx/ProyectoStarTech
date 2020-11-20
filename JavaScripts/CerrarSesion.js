function cerrarSesion() {
    $.ajax({

        type: "POST",
        url: "/Sesion/CerrarSesion",
        data: {
        },
        cache: false,
        dataType: 'json',
        success: function (data) {
            location.href = "https://localhost:44355/Sesion/InicioSesion"
        },
        error: function (data) {

        }

    });



}