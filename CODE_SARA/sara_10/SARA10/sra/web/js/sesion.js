$(document).on('ready', function () {
    objeto = {url: 'masterpage', Opcion: 0, name: 'cabeza'}
    //obtenerP(objeto);
    //objeto = {url: 'masterpage', Opcion: 1, name: 'pies'}
    //obtenerP(objeto);
    //objeto = {url: 'masterpage', Opcion: 2, name: 'home'}
    //obtenerP(objeto);
    $(document).on('click', 'li .btntt', function (e) {
        objeto = {url: 'sesion_controller', Opcion: this.value, name: 'cue'};
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
                //  console.log("Peticion completa con respuesta " + json);
                res(json, datos.name);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
    function res(body, select) {
        switch (select) {
            case"cue":
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                break;
            case 'cabeza':
                $("#header").empty();
                $("#header").append(body);
                break;
            case 'pies':
                $("#footer").empty();
                $("#footer").append(body);
                break;
            case 'home':
                //$("#cuerpo").append(body);
                break;
        }
    }
});

