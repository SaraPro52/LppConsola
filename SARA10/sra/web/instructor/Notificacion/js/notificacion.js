var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("NotifiacionesInstrutor");
$("#ccNoti").empty();
var jso = [], selector = [], datos = [], hilo = [], data = [];
jso[0] = ['Crud_Controller1', '[{opcion:5,tabla:17,datos:[],actualizar:"",elegir:[4,5,6],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:8,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:9,operador:0,valor1:3}]",id:0,opSelect:6};]'];
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "Notificacion", worker: true};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);
function ajax(i, datos) {
    hilo[i] = new Worker("js/worker.js");
    hilo[i].postMessage(jso[i]);
    hilo[i].onmessage = function (event) {
        data[i] = event.data;
        ob.cargarTabla(data[i], selector[i], datos);
        hilo[i].terminate();
    };
}

