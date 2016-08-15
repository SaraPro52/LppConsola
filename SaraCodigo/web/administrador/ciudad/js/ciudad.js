$(document).on('ready', function () {
    alert("Vivo??");
    var objeto = {Opcion: 3};
    obtenerObejto(objeto);
    function CargarTabla(ciudad) {
        if (ciudad != "") {
            var modificar;
            var eliminar;
            for (var i = 0; i < ciudad.length; i++) {
                modificar = "<td><button type='button'id='modificar" + ciudad[i].Id_Ciudad + "'><span'>M</button></span></td>";
                eliminar = "<td><button type='button'  id='eliminar" + ciudad[i].Id_Ciudad + "'><span '>E</button></span></td>";
                $('#tabla tbody').append('<tr class="child"><td>' + ciudad[i].Id_Ciudad + '</td><td>' + ciudad[i].Nom_Ciudad + '</td>' + modificar + eliminar + ' </tr>');
            }
        } else {
            $('#tabla tbody').append('<tr class="child"><td> No hay </td><td>ningun estado</td></tr>');
        }
    }
    $("#btnEstado").on('click', function () {
        var objeto = {
            Opcion: 1,
            ciudad: $("#Ciudad").val()
        };
        $(".child").remove();
        obtenerObejto(objeto);
        $("#Ciudad").val("");
    });
    $(".child").on('click', function () {
        var evento = jQuery(this).attr("id");
        alert("Envento " + evento);
    });
    function obtenerObejto(objeto) {
        $.ajax({
            url: "ciudadcontroller",
            type: 'POST',
            async: true,
            cache: false,
            datatype: "json",
            data: objeto,
            success: function (json) {
                CargarTabla(json);
            },
            error: function (request, status, error) {
                alert("Disculpa, Pero existe un error"+request.responseText);
            }
        });
    }
});
