$(document).on('ready', function () {
    console.log("Vivo?");
    var objeto = {Opcion: 3};
    obtenerDatos(objeto);
    function CargarTabla(areas) {
        if (areas != "") {
            var modificar;
            var eliminar;
            for (var i = 0; i < areas.length; i++) {
                modificar = "<td><button type='button'id='modificar" + areas[i].Id_Area + "'><span >M</button></span></td>";
                eliminar = "<td><button type='button'id='eliminar" + areas[i].Id_Area + "'><span >E</button></span></td>";
                $('#tabla tbody').append('<tr class="child"><td>' + areas[i].Id_Area + '</td><td>' + areas[i].Nom_Area + '</td><td>' + areas[i].Lider_Area + '</td>' + modificar + eliminar + ' </tr>');
            }
        } else {
            $('#tabla tbody').append('<tr class="child"><td> No hay </td><td>ninguna area</td></tr>');
        }
    }

    $("#btnArea").on('click', function () {
        var o = {
            Opcion: 1,
            Nombrea: $("#areaC").val(),
            Lider: $("#areaL").val()
        };
        $(".child").remove();
        obtenerDatos(o);
        $("#areaC").val("");
        $("#areaL").val("");
    });

    $('.child').on('click',function () {
        var evento = jQuery(this).attr("id");
        alert("Click en " + evento);
    });

    function obtenerDatos(datos) {
        $.ajax({
            url: 'areacontronller',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                CargarTabla(json);
            },
            error: function () {
                alert("Disculpa, pero existe un error :/");
            }
        });
    }
});
