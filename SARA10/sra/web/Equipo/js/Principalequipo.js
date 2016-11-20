$(document).on('ready', function () {
    var idLista = 0;
    var idVersion = 0;
    var casoUso = "Notificaciones";
    console.log("Vivo??EquipoPrincipal");

    $(document).on('click', 'btnnotofica', function (e) {
        console.log(this);
    });

    $('.menu li').click(function (e) {
        objeto = {url: "Equipo_Controller", Opcion: this.value, name: 'cuerpo'};
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
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

