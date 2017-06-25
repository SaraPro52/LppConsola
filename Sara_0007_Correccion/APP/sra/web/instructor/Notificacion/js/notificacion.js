var ob = new $.Luna("Productos virtuales", $("#tablaNotificacion"));
ob.Vivo("NotifiacionesInstrutor1");
var jso = [], selector = [], datos = [], hilo = [], data = [];
//-------cambio
//jso[0] = ['EvaluacionGeneral_Controller','[{opcion:3,elegir:[4,5,6,7,11],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:10,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:9,operador:6,valor1:\'0,1\'}]",opt:1}]'];
//-------cambio
//-------Consulta Notificaciones
  jso[0] = ['Notificaciones_Controller','[{opcion:1,parametros:['+ idUser + ',' + idRol + ',0]}]'];
//----------
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "Notificacion"};
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

