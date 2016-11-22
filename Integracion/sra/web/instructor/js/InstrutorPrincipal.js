$(document).on('ready', function () {

    $(document).on('click', '.Notify', function (e) {
        if (this.id == "verMasNotificaciones") {
            var objeto = {url: "Instrutor_Controller", Opcion: 3, name: 'cuerpo'};
            casoUso = "Notificaciones P.V";
            obtenerP(objeto);
        }
    });

    var casoUso = "Notificaciones producto virtual";
    console.log("Vivo??Instrutor");
    var objeto = {url: "Instrutor_Controller", Opcion: 3, name: 'cuerpo'};
    obtenerP(objeto);
    $('.menu li').click(function (e) {
        var objeto = {url: "Instrutor_Controller", Opcion: this.value, name: 'cuerpo'};
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
        if (this.value == 3) {
            casoUso = casoUso + " producto virtual";
        }
        obtenerP(objeto);

    });
    function obtenerP(datos) {
        console.log(datos);
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                res(json, datos.name);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus + errorThrown + " Disculpa.");
            }
        });
    }
    function res(body, select) {
        switch (select) {
            case"cuerpo":
                $("#CasoNombre").text(casoUso);
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                break;
        }
    }
});





