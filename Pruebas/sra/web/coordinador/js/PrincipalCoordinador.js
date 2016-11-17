$(document).on('ready', function () {
    console.log("Vivo??coordinador");
    $('.menu li').click(function (e) {
        console.log(this);
        objeto = {url: "coordinador_Controller", Opcion: this.value, name: 'cuerpo', vista: $("#vista").val()};
        console.log(objeto);
        obtenerP(objeto);
    });
    function obtenerP(datos) {
        console.log(datos.url);
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
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                var cabeza = ("<input id='equipo' value='" + vista + "' type='hidden'>");
                $("#header").append(cabeza);
                break;
        }
    }
});



