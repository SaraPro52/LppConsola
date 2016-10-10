$(document).on('ready', function () {
    console.log("Vivo??Lista de chequeo");
    
    var objeto = {Opcion: "3", nombre: "tabla", url: "itemcontroller", tipo: 1}
    obtenerDatos(objeto);
    $("#btnItem").on('click', function () {
        if ($("#Descripcion").val() == "") {
            alert("Campos vacios =/");
        } else {
            var objeto = {Opcion: "1", nombre: "tabla", url: "itemcontroller", tipo: 1, descripcion: $("#Descripcion").val()}
            obtenerDatos(objeto);
        }
    });
    
    function respuesta(Datos, selector) {
        switch (selector) {
            case "btnGuardado":
                if (Datos = "false") {
                    alert("Error al registar la lista");
                } else if (Datos = "true") {
                    alert("La lista fue Registrada");
                }
                break;
            case "tabla":
                console.log(Datos);
                if (Datos != "") {
                    for (var i = 0; i < Datos.length; i++) {
                        Datos[i].Id_Item_Lista
                        Datos[i].Des_Item_Lista
                        table = $("#tablaItems").dataTable().fnAddData([
                            Datos[i].Id_Item_Lista,
                            Datos[i].Des_Item_Lista,
                            ("<input type='checkbox' value='" + Datos[i].Id_Item_Lista + "'>")
                        ]);
                    }
                } else {
                    $('#tablaItems tbody').append('<tr class="child"><td> No hay </td><td>ningun Item</td></tr>');
                }
                break;
        }
    }
    $("#BtnLista").on('click', function () {
        var r = arra();
        var objeto = {
            Opcion: 1,
            nombre: "btnGuardado",
            url: "listachequeo",
            nombreL: $("#NombreL").val(),
            tipoLista: $("#tipoLis").val(),
            descripcion: $("#DescripcionL").val(),
            array: JSON.stringify(r),
            funcionario: "2"
        }
        obtenerDatos(objeto);
        console.log(r);
    });
    function arra() {
        var array = [];
        $("input:checkbox:checked").each(
                function () {
                    array.push($(this).val());
                }
        );
        return array;
    }
    function obtenerDatos(datos) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                //console.log("Peticion completa con respuesta " + json);
                respuesta(json, datos.nombre);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
        $("#tablaItems").DataTable({
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
    var d = new Date();
    var fecha = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
    $("#calen").val(fecha);
});