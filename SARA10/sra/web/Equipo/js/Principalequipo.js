$(document).on('ready', function () {
    console.log("Vivo??EquipoPrincipal");
    selector = $("#tablaNotificacion");
    var objet = {opcion: 5, nombre: "Lista", url: "Crud_Controller", tabla: "12", datos: [""], elegir: ["0", "1", "2", "3"],
        delimitador: "[{'colum':'5','operador':'0' ,'valor1':2}]", id: 0, opSelect: 6};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("ModificarListaDeChequeo" + $("#vista").val());
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);

    $(document).on('click','btnnotofica',function(e){
       console.log(this); 
    });
    
    $('.menu li').click(function (e) {
        objeto = {url: "Equipo_Controller", Opcion: this.value, name: 'cuerpo', vista: $("#vista").val()};
        obtenerP(objeto);
    });

    function obtenerP(datos) {
        console.log(datos);
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                res(json, datos.name, datos.vista);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
            }
        });
    }
    function res(body, select, vista) {
        switch (select) {
            case"cuerpo":
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                var cabeza = ("<input id='equipo' value='" + vista + "' type='hidden'>");
                $("#header").append(cabeza);
                break;
        }
    }
});

