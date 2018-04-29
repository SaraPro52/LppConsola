var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [], Notifi = 0, cc = 0;
//idRol = 2;
//idCentro = 1;
//idUser = 11;
var ob = new $.Luna("Producto virtual", $("#tablaListaChequeo"));
ob.Vivo("Producto virtualess");

$("#divLista").hide();
//----
//jso[0] = ['EvaluacionGeneral_Controller','[{opcion:3,elegir:[4,5,6,7,11],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:10,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:9,operador:0,valor1:0}]",opt:1}]'];
//-----
//-------Consulta Notificaciones
    jso[0] = ['Notificaciones_Controller','[{opcion:3,parametros:['+ idUser + ',' + idRol + ',0]}]'];
//----------
selector[0] = $("#tablaConsultarOa");
datos[0] = {nombre: "consutarOa", dat: true};
ajax(0, datos[0]);
ob.TablaEspa(selector[0]);
ob.limpiarTabla(selector[0]);


var rol = $("#vista").val() + 2;

$(document).on('click', '.btnEvaluar', function (e) {
    if (cc == 0) {
        Notifi = this.value;
        idVersion = this.id;
        ob.setCons("Lista de chequeo");
        jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:12,tipo:2,elegir:[0,1,2,3],delimitador:"[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
        selector[1] = $("#tablaListaChequeo");
        datos[1] = {nombre: "ConsultarLista"};
        ob.TablaEspa(selector[1]);
        $("#tabla").hide();
        $("#divLista").show();
        
        ajax(1, datos[1]);
    }
    cc++;
});

$(document).on('click', '.btnclickca', function (e) {
    var con = $(this);
    idLista = con.val();
    jso[2] = ['Equipo_Controller', '[{opcion:4,ti:'+$("#tis").text()+'}]'];
    datos[2] = {nombre:"btn",caso: "Evaluacion de productos virtuales", nomLista: "Nombrelista", listaSele: this.id};
    ajax(2);
});



function ajax(i, datos) {
    hilo[i] = new Worker("js/worker.js");
    hilo[i].postMessage(jso[i]);
    hilo[i].onmessage = function (event) {
        data[i] = event.data;
       // alert(data[i]);
        ob.cargarTabla(data[i], selector[i], datos);
        hilo[i].terminate();
        peticionCompleta(i);
    };
}
function peticionCompleta(i) {
    if (i == 2) {
        $("#CasoNombre").text(datos[i].caso);
        $("#cuerpo").empty();
        $("#cuerpo").append(data[i]);
        console.log(datos[i]);
        var dat1 =    datos[i].listaSele;
        var dat = dat1.split("$$");
        $("#Nombrelista").text(dat[0]);
        $("#DesLista").text(dat[1]);
        $("#FechaLista").text(dat[2]);
    }
}
