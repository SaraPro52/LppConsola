$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "";
    var ob = new $.Luna("Producto(s) Virtual(es)", selector);
    ob.Vivo("Habilitar Producto1");
    $("#ccNoti").empty();
    //jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:9,tipo:2,elegir:[0,1,2],delimitador:"[{colum:4,operador:0,valor1:' + idCentro + '}]",id:0,opSelect:6}]'];
    
    //-------Consulta Notificaciones
        jso[0] = ['Notificaciones_Controller','[{opcion:4,parametros:['+ idUser + ',' + idRol + ',0]}]'];
    //----------
    selector[0] = $("#tablaAprobar");
    ob.TablaEspa(selector[0]);
    datos[0] = {nombre: "Habilitar"};
    ajax(0, datos[0]);
    $(document).on('click', '.btnclickHabilitar', function (e) {
        jso[1] = ['ProductoVirtual_Controller', '[{opcion: 4,info:[],arrayFun:[],arrayTemas:[],archivoNom:[],aprobacion:[' + idUser + ',' + this.id + ']}]'];
        selector[1] = $("#tablaAprobar");
        ob.limpiarTabla(selector[1]);
        datos[1] = {nombre: "btn"};
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
            var daMen = data[i].split("$$");
            var men = "";
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El producto fue " + daMen[1];
            } else {
                estado = ("error");
                men = "El producto fue " + daMen[1];
            }
            $.notify(men, estado);
            jso[0] =  ['Notificaciones_Controller','[{opcion:4,parametros:['+ idUser + ',' + idRol + ',0]}]'];
            selector[0] = $("#tablaAprobar");
            datos[0] = {nombre: "Habilitar"};
            ajax(0, datos[0]);
        }
    }
});


