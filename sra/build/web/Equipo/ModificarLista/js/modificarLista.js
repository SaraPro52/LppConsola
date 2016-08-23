$(document).on('ready', function () {
    console.log("Vivo??ModificarLista");
    var objeto = {Opcion: 3, nombre: "lista", url: "listachequeo", tipo: 1}
    obtenerDatos(objeto);
    function cargarTabla(Datos, selector) {
        switch (selector) {
            case "item":
                break;
            case "lista":
                if (Datos != "") {
                    for (var i = 0; i < Datos.length; i++) {
//                       
                        var  label = ('<td><button class="btn btn-info">Modificar</buttont></td>');
                        var  elemento = $('<tr class="child" id="'+Datos[i].Id_Lista_Chequeo+'" ><td class="qw">' + Datos[i].Id_Lista_Chequeo + '</td><td>' + Datos[i].Nom_Lista_Chequeo + '</td><td>' + Datos[i].Des_Lista_Chequeo + '</td><td>' + Datos[i].Fecha_Creacion+'</td>'+label+'</tr>');
                        //elemento.append(label);    
                        $('#tablalista tbody').append(elemento);
                    }
                } else {
                    $('#tablaItems tbody').append('<tr class="child"><td> No hay </td><td>ningun Item</td></tr>');
                }
                break;
        }
    }
    $("#tablaItems tbody").on('click', "tr", function () {
        if ($("#Descripcion").val() == "") {
            alert("Campos vacios =/");
        } else {
            var objeto = {Opcion: "1", nombre: "tabla", url: "itemcontroller", tipo: 1, descripcion: $("#Descripcion").val()}
            $(".child").remove();
            obtenerDatos(objeto);
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
});

// var btn = $('<button>Modificar</button>');
//                        btn.on('click', function () {
//                            alert("evento");
//                            alert('El valor es: ' + $(this).data('val'));
//                        });
//                        
//                        label.append(btn); 
//    });
//    $("#btnItem").on('click', function () {

//    var table = $('#tablalista').DataTable({
//        "processing": true,
//        "serverSide": true,
//        "ajax": {
//            "url": "/sra/alistacontroller",
//            "type": "POST"
//        },
//        "columns": [
//            {"data": "Id_Lista_Chequeo"},
//            {"data": "Nom_Lista_Chequeo"},
//            {"data": "Des_Lista_Chequeo"},
//            {"data": "Fecha_Creacion"},
//            {
//                "defaultContent": "<button>Click!</button>"
//            }]
//    });
//var table;
//$('#tablalista tbody').on('click', 'button', function () {
//    var data = table.row($(this).parents('tr').data());
//    alert( data[0] +"'s salary is: "+ data[ 2 ] );
//});
//    
//    
//    function cargarTabla(json) {
//        for (var i = 0; i < json.length; i++) {
//            table = $("#tablalista").dataTable().fnAddData([
//                json[i].Id_Lista_Chequeo,
//                json[i].Nom_Lista_Chequeo,
//                json[i].Des_Lista_Chequeo,
//                json[i].Fecha_Creacion,
//                "<button>modificar</button>"
//            ]);
//        }
//}
//

