$(document).on('ready', function () {
    console.log("Vivo??AdminiPricipal");

    objeto = {url: "Administrador_Controller", Opcion: 1, name: 'cuerpo', vista: $("#vista").val()};
    obtenerP(objeto);
    var casoUso = "Dehabilitar Funcionarios";
    $(document).on('click', '.Notify', function (e) {
        if (this.id == "verMasNotificaciones") {
            var objeto = {url: "Administrador_Controller", Opcion: 1, name: 'cuerpo'};
            casoUso = "Dehabilitar Funcionarios";
            obtenerP(objeto);
         }
    });



    $('.menu li').click(function (e) {
        objeto = {url: "Administrador_Controller", Opcion: this.value, name: 'cuerpo', vista: $("#vista").val()};
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
        obtenerP(objeto);
        if(this.value==6){
           console.log($('#recordatorio'));
            $('#recordatorio').show();
            $('#formCambiarContra').hide();
        }
        
        
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
                var cabeza = ("<input id='Admi' value='" + vista + "' type='hiden'>");
                $("#header").append(cabeza);
                break;
        }
    }
});



