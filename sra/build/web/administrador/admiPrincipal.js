$(document).on('ready', function () {
    var objeto = {Opcion: 3};
    obtenerDatos(objeto);
    function obtenerDatos(datos) {
        $.ajax({
            url: 'funcionariocontroller',
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
            table = $("#tablaAdmi").dataTable().fnAddData([
                json[i].Nom_Funcionario,
                json[i].Cargo,
                json[i].Id_Area_Centro,
                json[i].Id_Estado,
                "<button class='btn btn-danger'>Desabilitar</button>"
            ]);
        }
    }
    $("#tablaAdmi").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ funcionarios",
            info: "Se encontaron _TOTAL_ funcionarios",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ningun funcionario",
            search: "Buscar:"
        }
    });
});
