$(document).on('ready', function () {
    var casoUso = "Notificaciones";
    objeto = {url: "Equipo_Controller", Opcion: 2, name: 'cuerpo'};
    casoUso = "Consultar productos virtuales";
    obtenerP(objeto);

    $(document).on('click', '.Notify', function (e) {
        var objeto = {url: "Equipo_Controller", Opcion: 2, name: 'cuerpo'};
        casoUso = "Consultar productos virtuales";
        obtenerP(objeto);
    });
    $('.menu li').click(function (e) {
        objeto = {url: "Equipo_Controller", Opcion: this.value, name: 'cuerpo'};
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
        if (this.value == 2) {
            casoUso = "Consultar productos virtuales";
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
                res(json, datos.name, datos.vista);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
    function res(body, select, vista) {
        switch (select) {
            case"cuerpo":
                $("#CasoNombre").text(casoUso);
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                var cabeza = ("<input id='equipo' value='" + vista + "' type='hidden'>");
                $("#header").append(cabeza);
                break;
        }
    }
});

