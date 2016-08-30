$(document).on('ready', function () {
    var objeto = {Opcion: 3, nombre: "tabla"};
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
                console.log(json);
                cargarTabla(json,datos.nombre);
            },
            error: function () {
                alert("Disculpa, pero existe un error :/");
            }
        });
    }
    function cargarTabla(json, nom) {
        switch (nom) {
            case "tabla":
                for (var i = 0; i < json.length; i++) {
                    table = $("#tablaAdmi").dataTable().fnAddData([
                        json[i].Nom_Funcionario,
                        json[i].Cargo,
                        json[i].Id_Area_Centro,
                        json[i].Id_Estado,
                        "<button id='" + json[i].Id_Funcionario + "' class='botonclick btn btn-danger'>Desabilitar</button>"
                    ]);
                }
                break;
            case "eli":
                console.log(json);
                alert("Su registro fue" +json);
                break;
        }

    }
    $(document).on('click', '.botonclick', function (e) {
        console.log(this.id);
        
        var objeto = {Opcion:4,nombre:"eli",Id_Fun:this.id}
        obtenerDatos(objeto);
    });
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
