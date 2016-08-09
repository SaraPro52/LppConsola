$(document).ready(function () {
    console.log("Vivo??");
    var objeto = {
        Opcion: 3,
        selector:2,
    };
    obtenerDatos(objeto);
    function cargarDatos(respuesta) {
        var selector = $("#campoCentro");  
        AddOption(respuesta, selector);
        var selector = $("#campoArea");
        AddOption(respuesta, selector);
        var selector = $("#campoEstado");
        AddOption(respuesta, selector);
        var selector = $("#cargo");
        AddOption(respuesta, selector);
    }

    function AddOption(Datos, Selector) {
        for (var i = 0; i < Datos.length; i++) {
            Selector.append($('<option>', {
                value:Datos[i].Id_Estado,
                text: Datos[i].Nom_Estado
            }));
        }
    }
    function obtenerDatos(datos) {
        $.ajax({
            url: 'coordinadorcontroller',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log("Peticion completa con respuesta "+ json );
                cargarDatos(json);
            },
            error: function () {
                console.log("Disculpa, pero existe un error :/");
            },
            complete: function () {
                console.log("El evento fue relizado...");
            }
        });
    }

});