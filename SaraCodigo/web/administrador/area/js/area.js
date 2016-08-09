$(document).ready(function () {
    console.log("Vivo?");
    var objeto = {
        Opcion: 3
    };
    obtenerDatos(objeto);
    function CargarTabla(areas) {
        if (areas != "") {
            var modificar;
            var eliminar;
            for (var i = 0; i < areas.length; i++) {
                modificar = "<td><button type='button'id='modificar" + areas[i].Id_Estado + "'><span  class='glyphicon glyphicon-plus'></button></span></td>";
                eliminar = "<td><button type='button'id='eliminar" + areas[i].Id_Estado + "'><span  class='glyphicon glyphicon-minus'></button></span></td>";
                $('#tabla tbody').append('<tr class="child"><td>' + areas[i].Id_Estado + '</td><td>' + areas[i].Nom_Estado + '</td>' + modificar + eliminar + ' </tr>');
            }
        } else {
            $('#tabla tbody').append('<tr class="child"><td> No hay </td><td>ninguna area</td></tr>');
        }
    }
    $('td button').click(function () {
        var evento = jQuery(this).attr("id");
        console.log("Click en " + evento);
    });

    function obtenerDatos(datos) {
        $.ajax({
            url: ' areacontronller',
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
            },
            complete: function () {
                //console.log("El evento fue relizado...");
            }
        });
    }
});
