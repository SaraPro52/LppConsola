var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [];
jso[0] = ['Crud_Controller', '[{opcion:5,tabla:24,datos:[],elegir:[4,5,6,10],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:8,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + '}]",id:0,opSelect:6}]'];
selector[0] = $("#tablaConsultarOa");
datos[0] = {nombre: "consutarOa", worker: true, dat: true};
ajax(0, datos[0]);

var ob = new $.Luna("Producto virtual", selector[0]);
ob.Vivo("Producto virtual");
ob.TablaEspa(selector[0]);
ob.limpiarTabla(selector[0]);

$(document).on("click", ".btnDescargar", function () {
    location.href = "Archivos/" + this.id;
});

var rol = $("#vista").val() + 2;
var cc = 0;
$(document).on('click', '.btnEvaluar', function (e) {

    if (cc == 0) {
        idVersion = this.id;
        ob.setCons("Lista de chequeo");
        jso[1] = ['Crud_Controller', '[{opcion:5,tabla:12,datos:[],elegir:[0,1,2,3],delimitador:"[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
        selector[1] = $("#tablaListaChequeo");
        datos[1] = {nombre: "ConsultarLista", worker: true};
        ob.TablaEspa(selector[1]);
        ob.limpiarTabla(selector[1]);
        ajax(1, datos[1]);
    }
    $('#myModal').modal('show');
    cc++;

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
    objeto = {url: "Equipo_Controller", Opcion: 4, name: "cuerpo", nomLista: "Nombrelista", listaSele: con.val()};
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

function ajax(i, datos) {
    hilo[i] = new Worker("js/worker.js");
    hilo[i].postMessage(jso[i]);
    hilo[i].onmessage = function (event) {
        data[i] = event.data;
        ob.cargarTabla(data[i], selector[i], datos);
        hilo[i].terminate();
        peticionCompleta(i);
    };
}
function peticionCompleta(i) {
    if (i == 1) {
        jso[2] = ['Crud_Controller', '[{opcion:5,tabla:11,datos:[],actualizar:[],delimitador:[],elegir:[0,1,3,5,6],id:0,opSelect:4}]'];
        selector[2] = $("#tablaAdmi");
        datos[2] = {nombre: "consutarOa", worker: true, dat: false};
        ajax(2, datos[2]);
    } else if (i == 2) {
        var men = "";
        if (data[2].length < data[0].length) {
            men = "fue deshabilitado correctamente.";
        } else if (data[2].length == data[0].length) {
            men = "No se a podido deshabilitado a  .";
        }
        $.notify({
            icon: 'ti-gift',
            message: men + "."
        }, {
            type: 'success',
            timer: 4000
        });
    }
}
