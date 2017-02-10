var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("NotifiacionesInstrutor1");
var jso = [], selector = [], datos = [], hilo = [], data = [];
jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:37,tipo:2,elegir:[4,5,6,7,8,9],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},colum:12,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:13,operador:6,valor1:\'2,3\',añadir:0},{colum:11,operador:0,valor1:0}]",id:0,opSelect:6}]'];
selector[0] = $("#tablaNotificacion");                                                                                                                                                                                                                  //Modificado
datos[0] = {nombre: "Notificacion", worker: true};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);
//Tambien se pasa como parametro el id de la notificacion
function ajax(i, datos) {
    hilo[i] = new Worker("js/worker.js");
    hilo[i].postMessage(jso[i]);
    hilo[i].onmessage = function (event) {
        data[i] = event.data;
        ob.cargarTabla(data[i], selector[i], datos);
        hilo[i].terminate();
    };
}

