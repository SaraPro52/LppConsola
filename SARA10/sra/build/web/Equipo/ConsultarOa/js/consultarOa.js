
//la variable vista debe ser cambieada

var vista = $("#vista").val();
var objet = {opcion: 5, url: "Crud_Controller", nombre: "consutarOa", tabla: "17", datos: [""], elegir: ["4", "5", "6"],
    delimitador: "[{colum:2, operador:0, valor1:" + idRol + "}]", id: 0, opSelect: 6};

var selector = $("#tablaConsultarOa");
var ob = new $.Luna("Producto virtual", selector);
ob.Vivo("Producto virtual" + $("#vista").val());
ob.TablaEspa(selector);
ob.limpiarTabla(selector);
ob.ajax(objet, selector); 
var rol = $("#vista").val() + 2; 
$(document).on('click', '.btnEvaluar', function (e) {
    console.log(this.id);
    idVersion = this.id;
    $('#myModal').modal('show');
    selector = $("#tablaListaChequeo");
    var objet = {opcion: 5, nombre: "ConsultarLista", url: "Crud_Controller", tabla: "12", datos: [""], elegir: ["0", "1", "2", "3"],
        delimitador: "[{colum:5,operador:0 ,valor1:" + idRol + "}]", id: 0, opSelect: 6};
    ob.setCons("Lista de chequeo");
    ob.TablaEspa(selector);
    ob.limpiarTabla(selector);
    ob.ajax(objet, selector);  
});


$('#myModal').modal('hide');
$(document).on('click', '.btnclick', function (e) {
    switch (this.value) {
        case "E":
            console.log("Evaluar");
            break;
        case "C":
            console.log("Elegir Lista");
            break;
    }
});
$(document).on('click', '.btnclickca', function (e) {
    var con = $(this);
    $('#myModal').modal('hide');
    objeto = {url: "Equipo_Controller", Opcion: 0, name: "cuerpo", nomLista: "Nombrelista", listaSele: con.val()};
    console.log(objeto);
    idLista = con.val();
    obtenerP(objeto);
});

function obtenerP(datos) {
    $.ajax({
        url: datos.url,
        type: 'POST',
        async: true,
        cache: false,
        datatype: 'json',
        data: datos,
        success: function (json) {
            res(json, datos);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Disculpa, pero existe un error :/" + textStatus + errorThrown);
        }
    });
}
function res(body, datos) {
    switch (datos.name) {
        case"cuerpo":
            $("#cuerpo").empty();
            $("#cuerpo").append(body);
            $("#Nombrelista").val(datos.nomLista);
            $("#listaSelec").val(datos.listaSele);
            var cabeza = ("<input id='equipo' value='" + datos.vista + "' type='hidden'>");//cambiar las variables que estan en
            //los impusts y ponerlos en una variable global
            $("#header").append(cabeza);
            break;
        case 'cabeza':
            $("#header").empty();
            $("#header").append(body);
            break;
        case 'pies':
            $("#footer").empty();
            $("#footer").append(body);
            break;
        case 'home':
            //$("#cuerpo").append(body);
            break;
    }
}


