function obtenerUsuario() {

    var correo = document.getElementById('correo').value;
    $.ajax({

        type: "POST",
        url: "/Sesion/CargarUsuario",
        data: {
            correo: correo
        },
        cache: false,
        dataType: 'json',
        success: function (data) {
            location.href = "MostrarInformacion"
        },
        error: function (data) {

        }

    });
}
