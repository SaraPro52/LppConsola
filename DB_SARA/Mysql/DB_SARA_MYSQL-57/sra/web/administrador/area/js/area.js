$(document).on('ready', function () {
    console.log("Vivo?");
    var objeto = {Opcion: 3};
    obtenerDatos(objeto);
    $("#btnArea").on('click', function () {
        var objeto = {
            Opcion: 1,
            Nombrea: $("#areaC").val(),
            Lider: $("#areaL").val()
        };
        $("#tablaarea").remove();
        obtenerDatos(objeto);
        $("#areaC").val("");
        $("#areaL").val("");
    });
    
    $("#tablaarea").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ areas",
            info: "Se encontaron _TOTAL_ areas",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ninguna area",
            search: "Buscar:"
        }
    });
    function obtenerDatos(datos) {
        $.ajax({
            url: 'areacontroller',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                cargarTabla(json);
            },
            error: function () {
                alert("Disculpa, pero existe un error :/");
            }
        });
    }
    function cargarTabla(json) {
        for (var i = 0; i < json.length; i++) {
            table = $("#tablaarea").dataTable().fnAddData([
                json[i].Id_Area,
                json[i].Lider_Area,
                json[i].Nom_Area,
                "<button class='btn btn-success'>modificar</button>",
                "<button class='btn btn-danger'>eliminar</button>"
            ]);
        }
    }
    $("#tablalista").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ areas",
            info: "Se encontaron _TOTAL_ areas",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ninguna areas",
            search: "Buscar:"
        }
    });
});
