$(document).on('ready', function () {
    console.log("Vivo??coordinador");
    var casoUso = "Consultar estadisticas";
    $('.menu li').click(function (e) {
        objeto = {url: "coordinador_Controller", Opcion: this.value, name: 'cuerpo', vista: $("#vista").val()};
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
        obtenerP(objeto);
    });
    function obtenerP(datos) {
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



