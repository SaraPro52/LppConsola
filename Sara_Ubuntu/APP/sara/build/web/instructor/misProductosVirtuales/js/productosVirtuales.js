$(document).ready(function () {
    var ob = new $.Luna("Productos virtuales", null);
    ob.Vivo("Mis productos");
    var jso = [], selector = [], datos = [], hilo = [], data = [];

    jso[0] = ['Version_Controller','[{opcion:4,idUser:'+idUser+'}]'];
    selector[0] = $("#tablaMisProductos");
    datos[0] = {nombre: "Misproductos"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            //alert(data[0]);
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
        };
    }
});

