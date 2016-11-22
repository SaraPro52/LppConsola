$(document).on('ready', function () {
    $("#btnI").click(function(){
        
    });    
    $(document).on('click', 'li .btntt', function (e) {
        objeto = {url: $("#controller").val(), Opcion: this.value, name: 'cuerpo', vista: $("#vista").val()};
        console.log(objeto);
        //obtenerP(objeto);
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

