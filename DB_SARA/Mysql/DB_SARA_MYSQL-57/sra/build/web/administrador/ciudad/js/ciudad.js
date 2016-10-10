$(document).on('ready', function () {
    var objeto = {Opcion: 3};
    obtenerObejto(objeto);
    $(document).on('click', '.btn', function (e) {
        var objeto;
        switch (this.value) {
            case "m":
                objeto = {Opcion: 2, id: this.id}
                break;
            case "e":
                objeto = {Opcion: 4, id: this.id}
                break;
        }
        obtenerDatos(objeto);
    });
    function cargarTabla(json) {
        for (var i = 0; i < json.length; i++) {
            table = $("#tablaCiudad").dataTable().fnAddData([
                json[i].Id_Ciudad,
                json[i].Nom_Ciudad,
                "<button class='btn btn-success'>modificar</button>",
                "<button class='btn btn-danger'>eliminar</button>"
            ]);
        }
    }
    $("#btnEstado").on('click', function () {
        var objeto = {
            Opcion: 1,
            ciudad: $("#Ciudad").val()
            
        };
        obtenerObejto(objeto);
        $("#Ciudad").val("");
    });
    function obtenerObejto(objeto) {
        $.ajax({
            url: "ciudadController",
            type: 'POST',
            async: true,
            cache: false,
            datatype: "json",
            data: objeto,
            success: function (json) {
                cargarTabla(json);
            },
            error: function (request, status, error) {
                alert("Disculpa, Pero existe un error" + request.responseText);
            }
        });
    }
    $("#tablaCiudad").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ ciudades",
            info: "Se encontaron _TOTAL_ ciudades",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ninguna ciudad",
            search: "Buscar:"
        }
    });
});
//46 lineas  a nivel noob bueno cargar datos a lo bastardo