var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [],Notifi=0, cc = 0; ;
//idRol = 2;
//idCentro = 1;
//idUser = 11;
jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:24,tipo:2,elegir:[4,5,6,7,12,13],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:9,operador:0,valor1:0,añadir:0},{colum:10,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + '}]",id:0,opSelect:6}]'];
selector[0] = $("#tablaConsultarOa"); 
datos[0] = {nombre: "consutarOa", worker: true, dat: true};
ajax(0, datos[0]);                 

var ob = new $.Luna("Producto virtual", $("#tablaListaChequeo"));
ob.Vivo("Producto virtual");
ob.TablaEspa(selector[0]);
ob.limpiarTabla(selector[0]);

$(document).on("click", ".btnDescargar", function () {
    location.href = "Archivos/" + this.id;
});

var rol = $("#vista").val() + 2;

$(document).on('click', '.btnEvaluar', function (e) {
    if (cc == 0) {
        Notifi=this.value;
        idVersion = this.id;  
        ob.setCons("Lista de chequeo");
        jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:12,tipo:2,elegir:[0,1,2,3],delimitador:"[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
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

$(document).on('click', '.btnclickca', function (e) {
    var con = $(this);
    $('#myModal').modal('hide');
    objeto = {url: "Equipo_Controller", Opcion: 4, name: "cuerpo", nomLista: "Nombrelista", listaSele: con.val(),iNo:Notifi};
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
    
}
