$(document).on('ready',function() {
    console.log("Vivo?");
    var objeto = {Opcion: 3};
    obtenerDatos(objeto);
    function CargarTabla(estados) {
        if (estados != "") {
            var modificar;
            var eliminar;
            for (var i = 0; i < estados.length; i++) {
                modificar = "<td><button type='button'id='modificar" + estados[i].Id_Estado + "'><span'>M</button></span></td>";
                eliminar = "<td><button type='button'  id='eliminar" + estados[i].Id_Estado + "'><span '>E</button></span></td>";
                $('#tabla tbody').append('<tr class="child" id="a" ><td class="qw">' + estados[i].Id_Estado + '</td><td>' + estados[i].Nom_Estado + '</td>' + modificar + eliminar + ' </tr>');
            }
        } else {
            $('#tabla tbody').append('<tr class="child"><td> No hay </td><td>ningun estado</td></tr>');
        }
    }
    $("#btnEstado").on('click', function () {
        var o = {
            Opcion: 1,
            estado: $("#EstadoC").val()
        };
        $(".child").remove();
        obtenerDatos(o);
        $("#EstadoC").val("");
    });

    $('.qw').on('click',function () {
        var evento = jQuery(this).attr("id");
        alert("Click en " + evento);
    });

    function obtenerDatos(datos) {
        $.ajax({
            url: 'EstadoController',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
            console.log("Peticion completa con respuesta " + json);
                CargarTabla(json);
            },
            error: function () {
                console.log("Disculpa, pero existe un error :/");
            }
        });
    }
});