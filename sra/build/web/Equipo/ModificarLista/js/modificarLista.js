$(document).on('ready', function () {
    console.log("Vivo??ModificarLista");
    $("#tablaItems").hide();
    var objeto = {Opcion: 3, nombre: "lista", url: "listachequeo", tipo: 1}
    obtenerDatos(objeto);
    $("#tablalista").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ listas",
            info: "Se encontaron _TOTAL_ listas",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ninguna listas",
            search: "Buscar:"
        }
    });
    $("#tablaItem").DataTable({
        language: {
            paginate: {
                first: "Primera",
                previous: "Anterior",
                next: "Siguiente",
                last: "Anterior"
            },
            lengthMenu: "Mostrar _MENU_ items",
            info: "Se encontaron _TOTAL_ items",
            loadingRecords: "Cargando...",
            emptyTable: "No hay ninguna item",
            search: "Buscar:"
        }
    });
    function obtenerDatos(datos) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log("Peticion completa con respuesta " + json);
                cargarTabla(json, datos.nombre);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
    function cargarTabla(json, selector) {
        switch (selector) {
            case "itemlis":
                for (var i = 0; i < json.length; i++) {
                    json[i].Id_Item_Lista
                    json[i].Des_Item_Lista
                    table = $("#tablaItem").dataTable().fnAddData([
                        json[i].Id_Item_Lista,
                        json[i].Des_Item_Lista,
                        ("<input type='checkbox' value='" + json[i].Id_Item_Lista + "'>")
                    ]);
                }
                break;
            case "lista":
                for (var i = 0; i < json.length; i++) {
                    var listaO = new Array(
                            json[i].Nom_Lista_Chequeo,
                            json[i].Des_Lista_Chequeo,
                            json[i].Fecha_Creacion
                            );
                    table = $("#tablalista").dataTable().fnAddData([
                        json[i].Id_Lista_Chequeo,
                        json[i].Nom_Lista_Chequeo,
                        json[i].Des_Lista_Chequeo,
                        json[i].Fecha_Creacion,
                        ("<button class='botonclick btn btn-success' id='" + json[i].Id_Lista_Chequeo + "' value='" + listaO + "'>modificar</button>")
                    ]);
                }
                break;
        }
    }
    $("#btnItem").on('click', function () {
        if ($("#Descripcion").val() == "") {
            alert("Campos vacios =/");
        } else {
            var objeto = {Opcion: "1", nombre: "itemlis", url: "itemcontroller", tipo: 1, descripcion: $("#Descripcion").val()}
            obtenerDatos(objeto);
        }
    });
    $(document).on('click', '.botonclick', function (e) {
        var valor = (this.value);
        var ids = (this.id);
        var datos = valor.split(",");
        $("#NombreL").val(datos[0]);
        $("#DescripcionL").val(datos[1]);
        $("#calen").val(datos[2] + datos[3]);
        $("#tabla").hide();
        $("#tablaItems").show();
        var objeto = {Opcion: "3", nombre: "itemlis", url: "itemcontroller", tipo: 1};
        obtenerDatos(objeto);
    });
});