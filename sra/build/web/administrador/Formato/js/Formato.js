$(document).on('ready', function () {
    console.log("Vivo?");
    var objeto = {Opcion: 1};
    obtenerDatos(objeto);
    $("#btnformato").on('click', function () {
        var objeto = {
            Opcion: 1,
            nombre: $("#formato").val(),
            descripcin: $("#descripcion").val()
        };
        var tabla = $("#tablaformato").DataTable();
        tabla
                .clear()
                .draw();
        $("#formato").val("");
        $("#descripcion").val("");
        obtenerDatos(objeto);
    });
    $("#tablaformato").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ formato",
            "infoFiltered": "(filtrada a partir de  _MAX_ registro)",
            info: "Se encontaron _TOTAL_ formatos",
            loadingRecords: "Cargando...",
            "zeroRecords": "Ningun formato encontradoa:/",
            emptyTable: "No hay ningun formato",
            search: "Buscar:"
        }
        
    });
    function obtenerDatos(datos) {
        $.ajax({
            url: 'FormatoController',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                cargarTabla(json);
            },
            error: function () {
                alert("Disculpa, pero existe un error al cargar datos del servidor :/");
            }
        });
    }
    $(document).on('click', '.botonclick', function (e) {
        alert(this.value +" "+this.id);
        switch (this.value){
            case "m":
                objeto={Opcion:2,id:this.id};
                break;
            case "e":
                objeto={Opcion:4,id:this.id};
                break;
        }
        //obtenerDatos(objeto);
    });
    function cargarTabla(json) {
        for (var i = 0; i < json.length; i++) {
            table = $("#tablaformato").dataTable().fnAddData([
                i+1,
                json[i].Nom_Formato,
                json[i].Des_Formato,
                "<button id='"+json[i].Id_Formato+"' class='btn btn-success botonclick'value='m' >modificar</button>",
                "<button id='"+json[i].Id_Formato+"' class='btn btn-danger botonclick' value='e'>eliminar</button>"
            ]);
        }
    }
});
