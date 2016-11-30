var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("CorrecionInstrutor");
jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:2,elegir:[4,5,6],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:9,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:10,operador:0,valor1:2,añadir:0},{colum:8,operador:0,valor1:0}]",id:0,opSelect:6};]'];
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "correcion", worker: true};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);
$(document).on('click', 'btnCorrecion', function (e) {
    console.log(this);
    jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:2,elegir:[4,5,6],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:9,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:10,operador:0,valor1:2,añadir:0},{colum:8,operador:0,valor1:0}]",id:0,opSelect:6};]'];
    selector[1] = $("#tablaNotificacion");
    datos[1] = {nombre: "correcion", worker: true};
    ob.limpiarTabla(selector[1]);
    ajax(1, datos[1]);
});

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

    }
}