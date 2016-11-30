$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "";
    var c = 0;
    var ob = new $.Luna("Area", $("#tablaarea"));
    ob.Vivo("Area");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1,2],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#tablaarea");
    datos[0] = {nombre: "Area", worker: true};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    var men = "";
    $("#btnArea").on('click', function () {
        jso[1] = ['FormacionPro_Controller', '[{opcion:2,tabla:2,delimitador:[],datos:["",' + $("#areaC").val() + ',' + $("#areaL").val() + '],idC:' + $("#CentroFormacion").val() + '}]'];
        selector[1] = $("#tablaarea");
        datos[1] = {nombre: "btn", worker: true};
        men = $("#areaC").val();
        ajax(1, datos[1]);
    });
    $(document).on('click', '.botonArea', function (e) {
        switch (this.value) {
            case "m":
                selector = $("#selecAreafun");
                ob.ajax(objet, selector);
                console.log("DinamicoM" + this.id);
                break;
        }
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
        if (i == 0) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:[2,3],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#CentroFormacion");
            datos[2] = {nombre: "Select", worker: true};
            ajax(2, datos[2]);
        }
        if (i == 1) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men="La area "+ men +" "+daMen[1];
            } else {
                estado = ("error");
                men=daMen;
            }
            $.notify(men, estado);
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1,2],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#tablaarea");
            datos[2] = {nombre: "Area", worker: true};
            ob.limpiarTabla(selector[2]);
            ajax(2, datos[2]);
        }
    }
});