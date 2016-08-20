$(document).on('ready', function () {
    console.log("Vivo??");
    var objeto = {Opcion: "3", tipo: 1}
    obtenerDatos(objeto);
        
        $("checkbox").on('click',function(){
            var evento = jQuery(this).attr("id");
            alert("e "+evento);
        });
                
    $("#btn").on('click', function () {
        if ($("#Descripcion").val() == "") {
            alert("Campo vacio =/");
        } else {
            var objeto = {Opcion: "1", tipo: 1, descripcion: $("#Descripcion").val()}
            obtenerDatos(objeto);
        }
    });
    function select(items) {
        var nombre;
        var desc;
        for (var i = 0; i < items.length; i++) {
            nombre = "<input class='a' type='checkbox' id='" + items[i].Des_Item_Lista + "' value='1'>";
            desc = "<textarea rows='2' cols='30'>" + items[i].Des_Item_Lista + "</textarea>";
            $("#contenedor").append("<div class='panel-body col-md-12' id=" + items[i].Id_Item_Lista + ">" + nombre + desc + "</div>");
        }
    }
    function obtenerDatos(datos) {
        $.ajax({
            url: 'listachequeo',
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log("Peticion completa con respuesta " + json);
                select(json);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
});
