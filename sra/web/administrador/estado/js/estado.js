$(document).on('ready', function () {
    console.log("Vivo??Estados");
    var objeto = {Opcion: 3}
    obtenerDatos(objeto);
    function cargarTabla(json) {
        for (var i = 0; i < json.length; i++) {
                table = $("#tablaestado").dataTable().fnAddData([
                    i,
                    json[i].Nom_Estado,
                    json[i].Id_Tipo_Estado,
                    "<button value='m' id='"+json[i].Id_Estado+"' class='btn btn-success'>Modificar</button>",
                    "<button value='e' id='"+json[i].Id_Estado+"' class='btn btn-danger'>Eliminar</button>"
                ]);
        }
    }
    $(document).on('click', '.btn', function (e) {
        var objeto;
        switch (this.value){
            case "m":
                 objeto ={Opcion:2,id:this.id}
                break;
            case "e":
                objeto ={Opcion:4,id:this.id}
                break;
        }  
        obtenerDatos(objeto);
    });
    $("#btnEstado").on('click', function () {
        var o = {
            Opcion: 1,
            estado: $("#EstadoC").val(),
            tipo: $("#tipo").val()
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