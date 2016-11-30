$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrayAreas = [], arrayTemas = [], men ="",estado="";
    var ob = new $.Luna("Select", $("#SelecCentro"));
    $(".Mult").hide();
    ob.Vivo("Programa");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:5,tipo:1,elegir:[0,2],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#SelecCentro");
    datos[0] = {nombre: "Select", worker: true};
    ajax(0, datos[0]);
    $("#SelecCentro").change(function () {
        $(".Mult").show();
        if ($("#SelecCentro").val() != "A0") {
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:[0,1],\n\
                delimitador:"[{colum:2,operador:0,valor1:' + $("#SelecCentro").val() + '}]",id:0,opSelect:6}]'];
            selector[1] = $("#MultAreas");
            datos[1] = {nombre: "MultiSelect", worker: true};
            ajax(1, datos[1]);
        }
    });

    $("#MultAreas").multiSelect({
        afterSelect: function (valor) {
            arrayAreas.push(valor);
        },
        afterDeselect: function (val) {
            var buscando = $.inArray(val, arrayTemas);
            arrayAreas.splice(buscando, 1);
        }
    });
    $("#MultTemas").multiSelect({
        afterSelect: function (valor) {
            arrayTemas.push(valor);
        },
        afterDeselect: function (val) {
            var buscando = $.inArray(val, arrayTemas);
            arrayTemas.splice(buscando, 1);
        }
    });

    $("#btnPrograma").click(function () {
        men = $("#nomPro").val();
        jso[3] = ['FormacionPro_Controller', '[{opcion:1,datos:["","' + $("#nomPro").val() + '","' + $("#nivel").val() + '"],areas:[' + arrayAreas + '],temas:[' + arrayTemas + ']}]'];
        datos[3] = {nombre: "btn", worker: true};
        ajax(3, datos[3]);
    });

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
    function peticionCompleta(i, datos) {
        if (i == 1) {
            $(".Mult").show();
        } else if (i == 0) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:27,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#MultTemas");
            datos[2] = {nombre: "MultiSelect", worker: true};
            ajax(2, datos[2]);
        } else if (i == 3) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El programa " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen;
            }
            $.notify(men, estado);
        }
    }
});