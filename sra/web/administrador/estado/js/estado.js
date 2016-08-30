$(document).on('ready', function () {
    console.log("Vivo?");    
    var objeto= {Opcion:3, tipo:1}
    obtenerDatos(objeto);
    function cargarTabla(json) {
        for (var i = 0; i < json.length; i++) {
            table = $("#tablaestado").dataTable().fnAddData([
                json[i].Id_Estado,
                json[i].Nom_Estado,
                "<button class='btn btn-success'>Modificar</button>",
                "<button class='btn btn-danger'>Eliminar</button>"
            ]);
        }
    }
    $("#btnEstado").on('click', function () {
        var o = {
            Opcion: 1,
            estado: $("#EstadoC").val(),
            tipo: "2"
        };
        $(".child").remove();
        obtenerDatos(o);
        $("#EstadoC").val("");
    });
    function obtenerDatos(datos) {
        $.ajax({
            url: 'estadocontroller',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log("Peticion completa con respuesta " + json);
                cargarTabla(json);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
    $("#tablaestado").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ Estados",
            info: "Se encontaron _TOTAL_ Estados",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ningun estado",
            search: "Buscar:"
        }
    });
});