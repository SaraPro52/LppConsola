$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("Habilitar Producto");

    $(document).on('click', '.btnclick', function (e) {
        jso[1] = ['ProductoVirtual_Controller', '[{opcion: 4,info:[],arrayFun:[],arrayTemas:[],archivoNom:[],aprobacion:[' + idUser + ',' + this.id + ']}]'];
        selector[1] = $("#tablaAprobar");
        ob.limpiarTabla(selector[1]);
        datos[1] = {nombre: "btn", worker: true};
        ajax(1, datos[1]);
    });
    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:9,datos:[""],actualizar:"",elegir:[0,1,2],delimitador:"[{colum:4,operador:0,valor1:' + idCentro + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#tablaAprobar");
    ob.TablaEspa(selector[0]);
    datos[0] = {nombre: "Habilitar", worker: true};
    ajax(0, datos[0]);

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
            jso[2] = ['Crud_Controller', '[{opcion:5,tabla:9,datos:[""],actualizar:"",elegir:[0,1,2],delimitador:"[{colum:4,operador:0,valor1:' + idCentro + '}]",id:0,opSelect:6}]'];
            selector[2] = $("#tablaAprobar");
            ajax(2, datos[0]);
        } else if (i == 2) {
            var men = "";
            nombre = "producto";
            if (jso[2].length == jso[0].length) {
                men = nombre + " fue habilitado correctamente.";
            } else {
                men = "No se a podido habilitar a " + nombre + ".";
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
});

